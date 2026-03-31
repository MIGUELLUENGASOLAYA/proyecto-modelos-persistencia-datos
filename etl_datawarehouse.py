"""
ETL - Carga del Almacén de Datos (Data Warehouse)
Proyecto Final - Entrega 2 - Modelos y Persistencia de Datos 2026
Pontificia Universidad Javeriana

Este script extrae datos de las fuentes originales (classicmodels en MySQL
y customerservice en PostgreSQL), los transforma resolviendo problemas de
calidad encontrados en la Entrega 1, y los carga en el modelo estrella
del almacén de datos (datawarehouse en PostgreSQL).

Herramienta: Python 3.x
Librerías: mysql-connector-python, psycopg2-binary
"""

import mysql.connector
import psycopg2
from datetime import datetime

# ============================================================
# CONFIGURACIÓN DE CONEXIONES
# ============================================================
# >>> MODIFICAR ESTOS VALORES CON TUS CREDENCIALES <<<

MYSQL_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'admin1998',       # <<< CAMBIAR
    'database': 'classicmodels'
}

POSTGRES_CS_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,                   # <<< VERIFICAR PUERTO
    'user': 'postgres',
    'password': 'admin1998',        # <<< CAMBIAR
    'dbname': 'customerservice'
}

POSTGRES_DW_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,                   # <<< VERIFICAR PUERTO
    'user': 'postgres',
    'password': 'admin1998',        # <<< CAMBIAR
    'dbname': 'datawarehouse'
}


# ============================================================
# PASO 1: CARGAR DIMENSIÓN TIEMPO
# ============================================================
def cargar_dim_tiempo():
    """
    Genera la dimensión de tiempo a partir de todas las fechas
    que aparecen en órdenes (MySQL) y llamadas (PostgreSQL).
    """
    print("=" * 60)
    print("CARGANDO: dim_tiempo...")
    print("=" * 60)

    # Extraer fechas de MySQL (orders)
    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor()
    cursor_mysql.execute("""
        SELECT DISTINCT orderDate FROM orders
        UNION
        SELECT DISTINCT requiredDate FROM orders
        UNION
        SELECT DISTINCT shippedDate FROM orders WHERE shippedDate IS NOT NULL
    """)
    fechas_mysql = set()
    for (fecha,) in cursor_mysql.fetchall():
        if fecha:
            fechas_mysql.add(fecha)
    cursor_mysql.close()
    conn_mysql.close()

    # Extraer fechas de PostgreSQL (cs_customer_calls)
    conn_pg = psycopg2.connect(**POSTGRES_CS_CONFIG)
    cursor_pg = conn_pg.cursor()
    cursor_pg.execute("SELECT DISTINCT date::date FROM cs_customer_calls")
    fechas_pg = set()
    for (fecha,) in cursor_pg.fetchall():
        if fecha:
            fechas_pg.add(fecha)
    cursor_pg.close()
    conn_pg.close()

    # Unir todas las fechas
    todas_fechas = fechas_mysql | fechas_pg
    print(f"  -> Fechas únicas encontradas: {len(todas_fechas)}")

    # Nombres en español
    meses = {1:'Enero', 2:'Febrero', 3:'Marzo', 4:'Abril', 5:'Mayo', 6:'Junio',
             7:'Julio', 8:'Agosto', 9:'Septiembre', 10:'Octubre', 11:'Noviembre', 12:'Diciembre'}
    dias = {0:'Lunes', 1:'Martes', 2:'Miércoles', 3:'Jueves', 4:'Viernes', 5:'Sábado', 6:'Domingo'}

    # Cargar al DW
    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    for fecha in sorted(todas_fechas):
        anio = fecha.year
        mes = fecha.month
        dia = fecha.day
        trimestre = (mes - 1) // 3 + 1
        dia_semana = fecha.weekday()

        cursor_dw.execute("""
            INSERT INTO dim_tiempo (fecha, anio, mes, nombre_mes, trimestre, dia, dia_semana, nombre_dia)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (fecha) DO NOTHING
        """, (fecha, anio, mes, meses[mes], trimestre, dia, dia_semana, dias[dia_semana]))

    conn_dw.commit()

    # Obtener conteo
    cursor_dw.execute("SELECT COUNT(*) FROM dim_tiempo")
    count = cursor_dw.fetchone()[0]
    print(f"  -> Registros cargados en dim_tiempo: {count}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 2: CARGAR DIMENSIÓN CLIENTE
# ============================================================
def cargar_dim_cliente():
    """
    Integra datos de clientes de classicmodels.customers (tiene nombre
    comercial y crédito) con customerservice.cs_customers (tiene contacto
    y dirección). Se resuelven problemas de calidad: TRIM en country
    para eliminar espacios (ej: 'Norway  ').
    """
    print("=" * 60)
    print("CARGANDO: dim_cliente...")
    print("=" * 60)

    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor(dictionary=True)
    cursor_mysql.execute("""
        SELECT customerNumber, customerName, contactLastName, contactFirstName,
               phone, addressLine1, addressLine2, city, state, postalCode,
               TRIM(country) AS country, salesRepEmployeeNumber, creditLimit
        FROM customers
    """)
    clientes = cursor_mysql.fetchall()
    cursor_mysql.close()
    conn_mysql.close()

    print(f"  -> Clientes extraídos de MySQL: {len(clientes)}")
    print("  -> Calidad: Aplicado TRIM() a country para eliminar espacios")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    for c in clientes:
        cursor_dw.execute("""
            INSERT INTO dim_cliente (customer_number, customer_name, contact_last_name,
                contact_first_name, phone, address_line1, address_line2, city, state,
                postal_code, country, credit_limit, sales_rep_employee_number)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (customer_number) DO NOTHING
        """, (c['customerNumber'], c['customerName'], c['contactLastName'],
              c['contactFirstName'], c['phone'], c['addressLine1'], c['addressLine2'],
              c['city'], c['state'], c['postalCode'], c['country'],
              c['creditLimit'], c['salesRepEmployeeNumber']))

    conn_dw.commit()
    cursor_dw.execute("SELECT COUNT(*) FROM dim_cliente")
    count = cursor_dw.fetchone()[0]
    print(f"  -> Registros cargados en dim_cliente: {count}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 3: CARGAR DIMENSIÓN PRODUCTO
# ============================================================
def cargar_dim_producto():
    """
    Integra datos de classicmodels.products + productlines (tiene precios,
    stock y línea de producto) con cs_products (tiene descripción).
    Los productos son los mismos en ambas fuentes (mismos códigos).
    """
    print("=" * 60)
    print("CARGANDO: dim_producto...")
    print("=" * 60)

    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor(dictionary=True)
    cursor_mysql.execute("""
        SELECT p.productCode, p.productName, p.productLine, p.productScale,
               p.productVendor, p.productDescription, p.quantityInStock,
               p.buyPrice, p.MSRP
        FROM products p
    """)
    productos = cursor_mysql.fetchall()
    cursor_mysql.close()
    conn_mysql.close()

    print(f"  -> Productos extraídos de MySQL: {len(productos)}")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    for p in productos:
        cursor_dw.execute("""
            INSERT INTO dim_producto (product_code, product_name, product_line,
                product_scale, product_vendor, product_description,
                quantity_in_stock, buy_price, msrp)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (product_code) DO NOTHING
        """, (p['productCode'], p['productName'], p['productLine'],
              p['productScale'], p['productVendor'], p['productDescription'],
              p['quantityInStock'], p['buyPrice'], p['MSRP']))

    conn_dw.commit()
    cursor_dw.execute("SELECT COUNT(*) FROM dim_producto")
    count = cursor_dw.fetchone()[0]
    print(f"  -> Registros cargados en dim_producto: {count}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 4: CARGAR DIMENSIÓN EMPLEADO
# ============================================================
def cargar_dim_empleado():
    """
    Integra empleados de ventas (classicmodels.employees) con empleados
    del call center (customerservice.cs_employees). Los empleados de ventas
    tienen más información (cargo, oficina, jerarquía). Los del call center
    solo tienen nombre y email. Se marca la fuente de cada empleado.
    """
    print("=" * 60)
    print("CARGANDO: dim_empleado...")
    print("=" * 60)

    # Empleados de MySQL (ventas)
    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor(dictionary=True)
    cursor_mysql.execute("""
        SELECT employeeNumber, lastName, firstName, email, jobTitle,
               officeCode, reportsTo
        FROM employees
    """)
    empleados_mysql = cursor_mysql.fetchall()
    cursor_mysql.close()
    conn_mysql.close()
    print(f"  -> Empleados extraídos de MySQL: {len(empleados_mysql)}")

    # Empleados de PostgreSQL (call center)
    conn_pg = psycopg2.connect(**POSTGRES_CS_CONFIG)
    cursor_pg = conn_pg.cursor()
    cursor_pg.execute("SELECT employeenumber, lastname, firstname, email FROM cs_employees")
    empleados_pg = cursor_pg.fetchall()
    cursor_pg.close()
    conn_pg.close()
    print(f"  -> Empleados extraídos de PostgreSQL: {len(empleados_pg)}")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    # Cargar empleados de MySQL
    numeros_mysql = set()
    for e in empleados_mysql:
        numeros_mysql.add(e['employeeNumber'])
        cursor_dw.execute("""
            INSERT INTO dim_empleado (employee_number, last_name, first_name, email,
                job_title, office_code, reports_to, fuente)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (employee_number) DO NOTHING
        """, (e['employeeNumber'], e['lastName'], e['firstName'], e['email'],
              e['jobTitle'], e['officeCode'], e['reportsTo'], 'classicmodels'))

    # Cargar empleados de PostgreSQL que NO estén en MySQL
    nuevos_pg = 0
    for e in empleados_pg:
        if e[0] not in numeros_mysql:
            cursor_dw.execute("""
                INSERT INTO dim_empleado (employee_number, last_name, first_name, email,
                    job_title, office_code, reports_to, fuente)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                ON CONFLICT (employee_number) DO NOTHING
            """, (e[0], e[1], e[2], e[3], 'Call Center Agent', None, None, 'customerservice'))
            nuevos_pg += 1

    conn_dw.commit()
    cursor_dw.execute("SELECT COUNT(*) FROM dim_empleado")
    count = cursor_dw.fetchone()[0]
    print(f"  -> Empleados nuevos del call center: {nuevos_pg}")
    print(f"  -> Total registros en dim_empleado: {count}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 5: CARGAR DIMENSIÓN OFICINA
# ============================================================
def cargar_dim_oficina():
    """
    Se nutre de classicmodels.offices. Contiene las 7 oficinas
    de la empresa alrededor del mundo.
    """
    print("=" * 60)
    print("CARGANDO: dim_oficina...")
    print("=" * 60)

    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor(dictionary=True)
    cursor_mysql.execute("""
        SELECT officeCode, city, phone, addressLine1, addressLine2,
               state, country, postalCode, territory
        FROM offices
    """)
    oficinas = cursor_mysql.fetchall()
    cursor_mysql.close()
    conn_mysql.close()

    print(f"  -> Oficinas extraídas de MySQL: {len(oficinas)}")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    for o in oficinas:
        cursor_dw.execute("""
            INSERT INTO dim_oficina (office_code, city, phone, address_line1,
                address_line2, state, country, postal_code, territory)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (office_code) DO NOTHING
        """, (o['officeCode'], o['city'], o['phone'], o['addressLine1'],
              o['addressLine2'], o['state'], o['country'], o['postalCode'],
              o['territory']))

    conn_dw.commit()
    cursor_dw.execute("SELECT COUNT(*) FROM dim_oficina")
    count = cursor_dw.fetchone()[0]
    print(f"  -> Registros cargados en dim_oficina: {count}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 6: CARGAR HECHO VENTAS
# ============================================================
def cargar_fact_ventas():
    """
    Cada registro es una línea de detalle de una orden de compra.
    Se cruzan orders + orderdetails + customers + employees para
    obtener todas las foreign keys hacia las dimensiones.
    Se calcula monto_linea = quantityOrdered * priceEach.
    Se resuelve: clientes sin salesRep (NULL) se manejan con LEFT JOIN.
    """
    print("=" * 60)
    print("CARGANDO: fact_ventas...")
    print("=" * 60)

    conn_mysql = mysql.connector.connect(**MYSQL_CONFIG)
    cursor_mysql = conn_mysql.cursor(dictionary=True)
    cursor_mysql.execute("""
        SELECT o.orderNumber, o.orderDate, o.requiredDate, o.shippedDate,
               o.status, o.customerNumber,
               od.productCode, od.quantityOrdered, od.priceEach, od.orderLineNumber,
               c.salesRepEmployeeNumber,
               e.officeCode
        FROM orders o
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN customers c ON o.customerNumber = c.customerNumber
        LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
    """)
    ventas = cursor_mysql.fetchall()
    cursor_mysql.close()
    conn_mysql.close()

    print(f"  -> Líneas de venta extraídas de MySQL: {len(ventas)}")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    # Crear mapeos de dimensiones para buscar las keys
    cursor_dw.execute("SELECT cliente_key, customer_number FROM dim_cliente")
    map_cliente = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT producto_key, product_code FROM dim_producto")
    map_producto = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT empleado_key, employee_number FROM dim_empleado")
    map_empleado = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT oficina_key, office_code FROM dim_oficina")
    map_oficina = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT tiempo_key, fecha FROM dim_tiempo")
    map_tiempo = {row[1]: row[0] for row in cursor_dw.fetchall()}

    # Cargar hechos
    cargados = 0
    errores = 0
    for v in ventas:
        cliente_key = map_cliente.get(v['customerNumber'])
        producto_key = map_producto.get(v['productCode'])
        empleado_key = map_empleado.get(v['salesRepEmployeeNumber'])
        oficina_key = map_oficina.get(v['officeCode'])
        tiempo_key = map_tiempo.get(v['orderDate'])

        if not cliente_key or not producto_key or not tiempo_key:
            errores += 1
            continue

        monto_linea = round(float(v['quantityOrdered']) * float(v['priceEach']), 2)

        cursor_dw.execute("""
            INSERT INTO fact_ventas (cliente_key, producto_key, empleado_key,
                oficina_key, tiempo_key, numero_orden, estado_orden,
                fecha_orden, fecha_requerida, fecha_envio,
                cantidad_ordenada, precio_unitario, monto_linea, numero_linea)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (cliente_key, producto_key, empleado_key, oficina_key, tiempo_key,
              v['orderNumber'], v['status'], v['orderDate'], v['requiredDate'],
              v['shippedDate'], v['quantityOrdered'], float(v['priceEach']),
              monto_linea, v['orderLineNumber']))
        cargados += 1

    conn_dw.commit()
    print(f"  -> Registros cargados en fact_ventas: {cargados}")
    if errores > 0:
        print(f"  -> Registros omitidos por datos faltantes: {errores}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# PASO 7: CARGAR HECHO LLAMADAS
# ============================================================
def cargar_fact_llamadas():
    """
    Cada registro es una llamada al call center.
    Se extrae de customerservice.cs_customer_calls.
    Se resuelve: la fecha viene como timestamp, se convierte a date
    para buscar en dim_tiempo.
    """
    print("=" * 60)
    print("CARGANDO: fact_llamadas...")
    print("=" * 60)

    conn_pg = psycopg2.connect(**POSTGRES_CS_CONFIG)
    cursor_pg = conn_pg.cursor()
    cursor_pg.execute("""
        SELECT employeenumber, customernumber, productcode, text, date::date
        FROM cs_customer_calls
    """)
    llamadas = cursor_pg.fetchall()
    cursor_pg.close()
    conn_pg.close()

    print(f"  -> Llamadas extraídas de PostgreSQL: {len(llamadas)}")

    conn_dw = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor_dw = conn_dw.cursor()

    # Crear mapeos de dimensiones
    cursor_dw.execute("SELECT cliente_key, customer_number FROM dim_cliente")
    map_cliente = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT producto_key, product_code FROM dim_producto")
    map_producto = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT empleado_key, employee_number FROM dim_empleado")
    map_empleado = {row[1]: row[0] for row in cursor_dw.fetchall()}

    cursor_dw.execute("SELECT tiempo_key, fecha FROM dim_tiempo")
    map_tiempo = {row[1]: row[0] for row in cursor_dw.fetchall()}

    # Cargar hechos
    cargados = 0
    errores = 0
    for ll in llamadas:
        empleado_key = map_empleado.get(ll[0])
        cliente_key = map_cliente.get(ll[1])
        producto_key = map_producto.get(ll[2])
        tiempo_key = map_tiempo.get(ll[4])

        if not cliente_key or not producto_key or not empleado_key or not tiempo_key:
            errores += 1
            continue

        cursor_dw.execute("""
            INSERT INTO fact_llamadas (cliente_key, producto_key, empleado_key,
                tiempo_key, texto_llamada, cantidad_llamadas)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (cliente_key, producto_key, empleado_key, tiempo_key, ll[3], 1))
        cargados += 1

    conn_dw.commit()
    print(f"  -> Registros cargados en fact_llamadas: {cargados}")
    if errores > 0:
        print(f"  -> Registros omitidos por datos faltantes: {errores}")

    cursor_dw.close()
    conn_dw.close()


# ============================================================
# EJECUCIÓN PRINCIPAL
# ============================================================
if __name__ == "__main__":
    print("\n" + "=" * 60)
    print("  ETL - ALMACÉN DE DATOS (DATA WAREHOUSE)")
    print("  Proyecto Final - Entrega 2")
    print("=" * 60 + "\n")

    inicio = datetime.now()

    # Cargar dimensiones (primero, porque los hechos las necesitan)
    cargar_dim_tiempo()
    cargar_dim_cliente()
    cargar_dim_producto()
    cargar_dim_empleado()
    cargar_dim_oficina()

    # Cargar hechos
    cargar_fact_ventas()
    cargar_fact_llamadas()

    fin = datetime.now()
    duracion = (fin - inicio).total_seconds()

    print("\n" + "=" * 60)
    print("  ETL COMPLETADO EXITOSAMENTE")
    print(f"  Duración: {duracion:.2f} segundos")
    print("=" * 60)
    print(f"\nAlmacén de datos cargado en:")
    print(f"  Host: 127.0.0.1")
    print(f"  Puerto: 5432")
    print(f"  Base de datos: datawarehouse")
    print(f"  Usuario: postgres\n")
