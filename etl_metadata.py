"""
ETL - Proceso de carga automática de metadatos técnicos y de negocio
Proyecto Final - Modelos y Persistencia de Datos 2026
Pontificia Universidad Javeriana

Este script extrae los metadatos técnicos de las fuentes de datos
(classicmodels en MySQL y customerservice en PostgreSQL) consultando
el diccionario de datos (INFORMATION_SCHEMA) de cada motor, y los
carga en el repositorio de metadatos (metadata_repository en PostgreSQL).

Herramienta: Python 3.x
Librerías: mysql-connector-python, psycopg2-binary
"""

import mysql.connector
import psycopg2

# ============================================================
# CONFIGURACIÓN DE CONEXIONES
# ============================================================
# >>> MODIFICAR ESTOS VALORES CON TUS CREDENCIALES <<<

MYSQL_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'admin1998',   # <<< CAMBIAR
    'database': 'classicmodels'
}

POSTGRES_CS_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,
    'user': 'postgres',
    'password': 'admin1998',  # <<< CAMBIAR
    'dbname': 'customerservice'
}

POSTGRES_REPO_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,
    'user': 'postgres',
    'password': 'admin1998',  # <<< CAMBIAR
    'dbname': 'metadata_repository'
}


# ============================================================
# PASO 1: EXTRACT - Extraer metadatos de MySQL (classicmodels)
# ============================================================
def extract_mysql_metadata():
    """
    Se conecta a MySQL y consulta INFORMATION_SCHEMA para extraer:
    - Lista de tablas con su número de filas
    - Columnas de cada tabla con tipo de dato, nullabilidad y posición
    - Llaves primarias (COLUMN_KEY = 'PRI')
    - Llaves foráneas (REFERENCED_TABLE_NAME no es NULL)
    """
    print("=" * 60)
    print("EXTRACT: Conectando a MySQL (classicmodels)...")
    print("=" * 60)
    
    conn = mysql.connector.connect(**MYSQL_CONFIG)
    cursor = conn.cursor(dictionary=True)
    
    # Extraer tablas
    cursor.execute("""
        SELECT TABLE_NAME, TABLE_ROWS
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'classicmodels'
    """)
    tables = cursor.fetchall()
    print(f"  -> Tablas encontradas: {len(tables)}")
    for t in tables:
        print(f"     - {t['TABLE_NAME']} ({t['TABLE_ROWS']} filas)")
    
    # Extraer columnas
    cursor.execute("""
        SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_TYPE,
               IS_NULLABLE, COLUMN_KEY, ORDINAL_POSITION
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'classicmodels'
        ORDER BY TABLE_NAME, ORDINAL_POSITION
    """)
    columns = cursor.fetchall()
    print(f"  -> Columnas encontradas: {len(columns)}")
    
    # Extraer foreign keys
    cursor.execute("""
        SELECT TABLE_NAME, COLUMN_NAME,
               REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
        FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
        WHERE TABLE_SCHEMA = 'classicmodels'
          AND REFERENCED_TABLE_NAME IS NOT NULL
    """)
    foreign_keys = cursor.fetchall()
    print(f"  -> Foreign keys encontradas: {len(foreign_keys)}")
    
    cursor.close()
    conn.close()
    print("  -> Conexión MySQL cerrada.\n")
    
    return tables, columns, foreign_keys


# ============================================================
# PASO 2: EXTRACT - Extraer metadatos de PostgreSQL (customerservice)
# ============================================================
def extract_postgres_metadata():
    """
    Se conecta a PostgreSQL y consulta information_schema para extraer:
    - Lista de tablas del esquema public
    - Columnas con tipo de dato y longitud máxima
    - Llaves primarias y foráneas desde table_constraints
    """
    print("=" * 60)
    print("EXTRACT: Conectando a PostgreSQL (customerservice)...")
    print("=" * 60)
    
    conn = psycopg2.connect(**POSTGRES_CS_CONFIG)
    cursor = conn.cursor()
    
    # Extraer tablas
    cursor.execute("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
    """)
    tables_raw = cursor.fetchall()
    
    # Obtener conteo de filas para cada tabla
    tables = []
    for (table_name,) in tables_raw:
        cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
        count = cursor.fetchone()[0]
        tables.append({'table_name': table_name, 'row_count': count})
    
    print(f"  -> Tablas encontradas: {len(tables)}")
    for t in tables:
        print(f"     - {t['table_name']} ({t['row_count']} filas)")
    
    # Extraer columnas
    cursor.execute("""
        SELECT table_name, column_name, data_type,
               character_maximum_length, is_nullable, ordinal_position
        FROM information_schema.columns
        WHERE table_schema = 'public'
        ORDER BY table_name, ordinal_position
    """)
    columns_raw = cursor.fetchall()
    columns = []
    for row in columns_raw:
        col = {
            'table_name': row[0],
            'column_name': row[1],
            'data_type': row[2],
            'character_maximum_length': row[3],
            'is_nullable': row[4],
            'ordinal_position': row[5]
        }
        # Construir column_type similar a MySQL (ej: "character varying(50)")
        if col['character_maximum_length']:
            col['column_type'] = f"{col['data_type']}({col['character_maximum_length']})"
        else:
            col['column_type'] = col['data_type']
        columns.append(col)
    
    print(f"  -> Columnas encontradas: {len(columns)}")
    
    # Extraer primary keys
    cursor.execute("""
        SELECT kcu.table_name, kcu.column_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'public'
          AND tc.constraint_type = 'PRIMARY KEY'
    """)
    pk_raw = cursor.fetchall()
    primary_keys = set()
    for (table_name, column_name) in pk_raw:
        primary_keys.add((table_name, column_name))
    print(f"  -> Primary keys encontradas: {len(primary_keys)}")
    
    # Extraer foreign keys
    cursor.execute("""
        SELECT kcu.table_name, kcu.column_name,
               ccu.table_name AS referenced_table,
               ccu.column_name AS referenced_column
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        JOIN information_schema.constraint_column_usage ccu
          ON tc.constraint_name = ccu.constraint_name
        WHERE tc.table_schema = 'public'
          AND tc.constraint_type = 'FOREIGN KEY'
    """)
    fk_raw = cursor.fetchall()
    foreign_keys = {}
    for (table_name, column_name, ref_table, ref_column) in fk_raw:
        foreign_keys[(table_name, column_name)] = (ref_table, ref_column)
    print(f"  -> Foreign keys encontradas: {len(foreign_keys)}")
    
    cursor.close()
    conn.close()
    print("  -> Conexión PostgreSQL cerrada.\n")
    
    return tables, columns, primary_keys, foreign_keys


# ============================================================
# PASO 3: TRANSFORM + LOAD - Cargar metadatos técnicos al repositorio
# ============================================================
def load_technical_metadata(mysql_data, postgres_data):
    """
    Conecta al repositorio de metadatos y carga:
    1. Las fuentes de datos (datasource)
    2. Las tablas de cada fuente (metadata_table)
    3. Las columnas con sus propiedades (metadata_column)
    """
    print("=" * 60)
    print("TRANSFORM + LOAD: Cargando al repositorio de metadatos...")
    print("=" * 60)
    
    mysql_tables, mysql_columns, mysql_fks = mysql_data
    pg_tables, pg_columns, pg_pks, pg_fks = postgres_data
    
    conn = psycopg2.connect(**POSTGRES_REPO_CONFIG)
    cursor = conn.cursor()
    
    # Limpiar datos previos (para poder re-ejecutar el ETL)
    print("  -> Limpiando datos previos...")
    cursor.execute("DELETE FROM semantic_lineage")
    cursor.execute("DELETE FROM business_attribute")
    cursor.execute("DELETE FROM business_entity")
    cursor.execute("DELETE FROM metadata_column")
    cursor.execute("DELETE FROM metadata_table")
    cursor.execute("DELETE FROM datasource")
    # Reiniciar secuencias
    cursor.execute("ALTER SEQUENCE datasource_datasource_id_seq RESTART WITH 1")
    cursor.execute("ALTER SEQUENCE metadata_table_table_id_seq RESTART WITH 1")
    cursor.execute("ALTER SEQUENCE metadata_column_column_id_seq RESTART WITH 1")
    cursor.execute("ALTER SEQUENCE business_entity_entity_id_seq RESTART WITH 1")
    cursor.execute("ALTER SEQUENCE business_attribute_attribute_id_seq RESTART WITH 1")
    cursor.execute("ALTER SEQUENCE semantic_lineage_lineage_id_seq RESTART WITH 1")
    conn.commit()
    
    # --- Registrar fuentes de datos ---
    print("  -> Registrando fuentes de datos...")
    cursor.execute("""
        INSERT INTO datasource (datasource_name, database_type, host, port, description)
        VALUES (%s, %s, %s, %s, %s) RETURNING datasource_id
    """, ('classicmodels', 'MySQL', '127.0.0.1', 3306,
          'Base de datos de ordenes de compra, clientes, productos, representantes de ventas y pagos'))
    mysql_ds_id = cursor.fetchone()[0]
    
    cursor.execute("""
        INSERT INTO datasource (datasource_name, database_type, host, port, description)
        VALUES (%s, %s, %s, %s, %s) RETURNING datasource_id
    """, ('customerservice', 'PostgreSQL', '127.0.0.1', 5433,
          'Base de datos del call center con registro de llamadas, empleados y productos'))
    pg_ds_id = cursor.fetchone()[0]
    print(f"     classicmodels -> datasource_id = {mysql_ds_id}")
    print(f"     customerservice -> datasource_id = {pg_ds_id}")
    
    # --- Crear índice de FK de MySQL para búsqueda rápida ---
    mysql_fk_map = {}
    for fk in mysql_fks:
        key = (fk['TABLE_NAME'], fk['COLUMN_NAME'])
        mysql_fk_map[key] = (fk['REFERENCED_TABLE_NAME'], fk['REFERENCED_COLUMN_NAME'])
    
    # --- Cargar tablas y columnas de MySQL ---
    print("  -> Cargando tablas de classicmodels...")
    mysql_table_ids = {}
    for table in mysql_tables:
        cursor.execute("""
            INSERT INTO metadata_table (datasource_id, table_name, row_count)
            VALUES (%s, %s, %s) RETURNING table_id
        """, (mysql_ds_id, table['TABLE_NAME'], table['TABLE_ROWS']))
        table_id = cursor.fetchone()[0]
        mysql_table_ids[table['TABLE_NAME']] = table_id
    print(f"     {len(mysql_table_ids)} tablas cargadas")
    
    print("  -> Cargando columnas de classicmodels...")
    mysql_col_count = 0
    for col in mysql_columns:
        table_id = mysql_table_ids.get(col['TABLE_NAME'])
        if table_id is None:
            continue
        
        is_pk = (col['COLUMN_KEY'] == 'PRI')
        fk_key = (col['TABLE_NAME'], col['COLUMN_NAME'])
        is_fk = fk_key in mysql_fk_map
        ref_table = mysql_fk_map[fk_key][0] if is_fk else None
        ref_column = mysql_fk_map[fk_key][1] if is_fk else None
        
        cursor.execute("""
            INSERT INTO metadata_column 
            (table_id, column_name, data_type, column_type, is_nullable,
             is_primary_key, is_foreign_key, referenced_table, referenced_column, ordinal_position)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (table_id, col['COLUMN_NAME'], col['DATA_TYPE'], col['COLUMN_TYPE'],
              col['IS_NULLABLE'], is_pk, is_fk, ref_table, ref_column,
              col['ORDINAL_POSITION']))
        mysql_col_count += 1
    print(f"     {mysql_col_count} columnas cargadas")
    
    # --- Cargar tablas y columnas de PostgreSQL ---
    print("  -> Cargando tablas de customerservice...")
    pg_table_ids = {}
    for table in pg_tables:
        cursor.execute("""
            INSERT INTO metadata_table (datasource_id, table_name, row_count)
            VALUES (%s, %s, %s) RETURNING table_id
        """, (pg_ds_id, table['table_name'], table['row_count']))
        table_id = cursor.fetchone()[0]
        pg_table_ids[table['table_name']] = table_id
    print(f"     {len(pg_table_ids)} tablas cargadas")
    
    print("  -> Cargando columnas de customerservice...")
    pg_col_count = 0
    for col in pg_columns:
        table_id = pg_table_ids.get(col['table_name'])
        if table_id is None:
            continue
        
        is_pk = (col['table_name'], col['column_name']) in pg_pks
        fk_key = (col['table_name'], col['column_name'])
        is_fk = fk_key in pg_fks
        ref_table = pg_fks[fk_key][0] if is_fk else None
        ref_column = pg_fks[fk_key][1] if is_fk else None
        
        cursor.execute("""
            INSERT INTO metadata_column 
            (table_id, column_name, data_type, column_type, is_nullable,
             is_primary_key, is_foreign_key, referenced_table, referenced_column, ordinal_position)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (table_id, col['column_name'], col['data_type'], col['column_type'],
              col['is_nullable'], is_pk, is_fk, ref_table, ref_column,
              col['ordinal_position']))
        pg_col_count += 1
    print(f"     {pg_col_count} columnas cargadas")
    
    conn.commit()
    cursor.close()
    conn.close()
    print("  -> Metadatos técnicos cargados exitosamente.\n")


# ============================================================
# PASO 4: LOAD - Cargar metadatos de negocio (manual)
# ============================================================
def load_business_metadata():
    """
    Carga los metadatos de negocio en el repositorio:
    - Entidades de negocio con descripción y dominio
    - Atributos de cada entidad con su definición
    - Linaje semántico conectando columnas técnicas con atributos de negocio
    
    Estos datos se ingresan manualmente ya que representan el conocimiento
    del negocio que no se puede extraer automáticamente del diccionario de datos.
    """
    print("=" * 60)
    print("LOAD: Cargando metadatos de negocio...")
    print("=" * 60)
    
    conn = psycopg2.connect(**POSTGRES_REPO_CONFIG)
    cursor = conn.cursor()
    
    # --- Entidades de negocio ---
    entities = [
        ('Cliente', 'Persona u organización que compra productos de la empresa', 'Ventas y Servicio al Cliente'),
        ('Empleado', 'Persona que trabaja en la empresa como representante de ventas o en el call center', 'Recursos Humanos'),
        ('Producto', 'Modelo a escala vendido por la empresa (autos, motos, aviones, barcos, trenes)', 'Catálogo de Productos'),
        ('Orden de Compra', 'Pedido realizado por un cliente que contiene uno o más productos', 'Ventas'),
        ('Detalle de Orden', 'Línea individual dentro de una orden que especifica producto, cantidad y precio', 'Ventas'),
        ('Pago', 'Transacción de pago realizada por un cliente', 'Finanzas'),
        ('Oficina', 'Sucursal física de la empresa en una ciudad y país', 'Operaciones'),
        ('Línea de Producto', 'Categoría que agrupa productos similares (Classic Cars, Motorcycles, etc.)', 'Catálogo de Productos'),
        ('Llamada al Call Center', 'Registro de una llamada recibida en el centro de atención sobre un producto', 'Servicio al Cliente'),
        ('Producto por Cliente', 'Relación que indica qué productos tiene asociados cada cliente en servicio', 'Servicio al Cliente'),
    ]
    
    print("  -> Registrando entidades de negocio...")
    entity_ids = {}
    for name, description, domain in entities:
        cursor.execute("""
            INSERT INTO business_entity (entity_name, description, data_domain)
            VALUES (%s, %s, %s) RETURNING entity_id
        """, (name, description, domain))
        entity_ids[name] = cursor.fetchone()[0]
    print(f"     {len(entity_ids)} entidades registradas")
    
    # --- Atributos de negocio ---
    attributes = [
        # Cliente
        ('Cliente', 'Número de cliente', 'Identificador único del cliente en el sistema'),
        ('Cliente', 'Nombre del cliente', 'Razón social o nombre comercial del cliente'),
        ('Cliente', 'Apellido de contacto', 'Apellido de la persona de contacto del cliente'),
        ('Cliente', 'Nombre de contacto', 'Nombre de pila de la persona de contacto del cliente'),
        ('Cliente', 'Teléfono', 'Número telefónico de contacto del cliente'),
        ('Cliente', 'Dirección línea 1', 'Dirección principal del cliente'),
        ('Cliente', 'Dirección línea 2', 'Complemento de dirección (piso, suite, etc.)'),
        ('Cliente', 'Ciudad', 'Ciudad donde se ubica el cliente'),
        ('Cliente', 'Estado/Provincia', 'Estado o provincia del cliente'),
        ('Cliente', 'Código postal', 'Código postal del cliente'),
        ('Cliente', 'País', 'País donde se ubica el cliente'),
        ('Cliente', 'Representante de ventas', 'Número del empleado asignado como representante de ventas'),
        ('Cliente', 'Límite de crédito', 'Monto máximo de crédito otorgado al cliente'),
        # Empleado
        ('Empleado', 'Número de empleado', 'Identificador único del empleado'),
        ('Empleado', 'Apellido', 'Apellido del empleado'),
        ('Empleado', 'Nombre', 'Nombre de pila del empleado'),
        ('Empleado', 'Extensión', 'Extensión telefónica del empleado'),
        ('Empleado', 'Email', 'Correo electrónico corporativo del empleado'),
        ('Empleado', 'Código de oficina', 'Identificador de la oficina donde trabaja'),
        ('Empleado', 'Reporta a', 'Número del empleado superior jerárquico'),
        ('Empleado', 'Título del cargo', 'Cargo o puesto que ocupa el empleado'),
        # Producto
        ('Producto', 'Código de producto', 'Identificador único del producto'),
        ('Producto', 'Nombre del producto', 'Nombre descriptivo del modelo a escala'),
        ('Producto', 'Línea de producto', 'Categoría a la que pertenece el producto'),
        ('Producto', 'Escala del producto', 'Escala de reproducción del modelo (1:10, 1:18, etc.)'),
        ('Producto', 'Fabricante', 'Empresa que manufactura el modelo'),
        ('Producto', 'Descripción del producto', 'Descripción detallada del producto'),
        ('Producto', 'Cantidad en stock', 'Unidades disponibles en inventario'),
        ('Producto', 'Precio de compra', 'Costo de adquisición del producto'),
        ('Producto', 'Precio sugerido', 'Precio de venta sugerido al público (MSRP)'),
        # Orden de Compra
        ('Orden de Compra', 'Número de orden', 'Identificador único de la orden de compra'),
        ('Orden de Compra', 'Fecha de orden', 'Fecha en que se realizó el pedido'),
        ('Orden de Compra', 'Fecha requerida', 'Fecha solicitada para la entrega'),
        ('Orden de Compra', 'Fecha de envío', 'Fecha en que se despachó la orden'),
        ('Orden de Compra', 'Estado', 'Estado actual de la orden (Shipped, Cancelled, etc.)'),
        ('Orden de Compra', 'Comentarios', 'Observaciones adicionales sobre la orden'),
        ('Orden de Compra', 'Número de cliente', 'Cliente que realizó la orden'),
        # Detalle de Orden
        ('Detalle de Orden', 'Número de orden', 'Orden a la que pertenece este detalle'),
        ('Detalle de Orden', 'Código de producto', 'Producto incluido en la orden'),
        ('Detalle de Orden', 'Cantidad ordenada', 'Número de unidades solicitadas'),
        ('Detalle de Orden', 'Precio unitario', 'Precio por unidad del producto en esta orden'),
        ('Detalle de Orden', 'Número de línea', 'Número secuencial de la línea dentro de la orden'),
        # Pago
        ('Pago', 'Número de cliente', 'Cliente que realiza el pago'),
        ('Pago', 'Número de cheque', 'Identificador del instrumento de pago'),
        ('Pago', 'Fecha de pago', 'Fecha en que se realizó el pago'),
        ('Pago', 'Monto', 'Valor monetario del pago'),
        # Oficina
        ('Oficina', 'Código de oficina', 'Identificador único de la oficina'),
        ('Oficina', 'Ciudad', 'Ciudad donde se ubica la oficina'),
        ('Oficina', 'Teléfono', 'Número telefónico de la oficina'),
        ('Oficina', 'Dirección línea 1', 'Dirección principal de la oficina'),
        ('Oficina', 'Dirección línea 2', 'Complemento de dirección'),
        ('Oficina', 'Estado/Provincia', 'Estado o provincia'),
        ('Oficina', 'País', 'País donde se ubica la oficina'),
        ('Oficina', 'Código postal', 'Código postal de la oficina'),
        ('Oficina', 'Territorio', 'Región comercial (NA, EMEA, APAC, Japan)'),
        # Línea de Producto
        ('Línea de Producto', 'Nombre de línea', 'Nombre de la categoría de productos'),
        ('Línea de Producto', 'Descripción texto', 'Descripción en texto plano'),
        ('Línea de Producto', 'Descripción HTML', 'Descripción en formato HTML'),
        ('Línea de Producto', 'Imagen', 'Imagen representativa de la línea'),
        # Llamada al Call Center
        ('Llamada al Call Center', 'Número de empleado', 'Empleado que recibió la llamada'),
        ('Llamada al Call Center', 'Número de cliente', 'Cliente que realizó la llamada'),
        ('Llamada al Call Center', 'Código de producto', 'Producto sobre el cual es la llamada'),
        ('Llamada al Call Center', 'Texto', 'Descripción o nota de la llamada'),
        ('Llamada al Call Center', 'Fecha', 'Fecha y hora de la llamada'),
        # Producto por Cliente
        ('Producto por Cliente', 'Número de cliente', 'Cliente asociado'),
        ('Producto por Cliente', 'Código de producto', 'Producto asociado al cliente'),
    ]
    
    print("  -> Registrando atributos de negocio...")
    attribute_ids = {}
    for entity_name, attr_name, definition in attributes:
        entity_id = entity_ids[entity_name]
        cursor.execute("""
            INSERT INTO business_attribute (entity_id, attribute_name, definition)
            VALUES (%s, %s, %s) RETURNING attribute_id
        """, (entity_id, attr_name, definition))
        attr_id = cursor.fetchone()[0]
        attribute_ids[(entity_name, attr_name)] = attr_id
    print(f"     {len(attribute_ids)} atributos registrados")
    
    # --- Linaje semántico ---
    # Mapeo: (tabla, columna) -> (entidad, atributo)
    lineage_map = [
        # classicmodels.customers
        ('customers', 'customerNumber', 'Cliente', 'Número de cliente'),
        ('customers', 'customerName', 'Cliente', 'Nombre del cliente'),
        ('customers', 'contactLastName', 'Cliente', 'Apellido de contacto'),
        ('customers', 'contactFirstName', 'Cliente', 'Nombre de contacto'),
        ('customers', 'phone', 'Cliente', 'Teléfono'),
        ('customers', 'addressLine1', 'Cliente', 'Dirección línea 1'),
        ('customers', 'addressLine2', 'Cliente', 'Dirección línea 2'),
        ('customers', 'city', 'Cliente', 'Ciudad'),
        ('customers', 'state', 'Cliente', 'Estado/Provincia'),
        ('customers', 'postalCode', 'Cliente', 'Código postal'),
        ('customers', 'country', 'Cliente', 'País'),
        ('customers', 'salesRepEmployeeNumber', 'Cliente', 'Representante de ventas'),
        ('customers', 'creditLimit', 'Cliente', 'Límite de crédito'),
        # classicmodels.employees
        ('employees', 'employeeNumber', 'Empleado', 'Número de empleado'),
        ('employees', 'lastName', 'Empleado', 'Apellido'),
        ('employees', 'firstName', 'Empleado', 'Nombre'),
        ('employees', 'extension', 'Empleado', 'Extensión'),
        ('employees', 'email', 'Empleado', 'Email'),
        ('employees', 'officeCode', 'Empleado', 'Código de oficina'),
        ('employees', 'reportsTo', 'Empleado', 'Reporta a'),
        ('employees', 'jobTitle', 'Empleado', 'Título del cargo'),
        # classicmodels.products
        ('products', 'productCode', 'Producto', 'Código de producto'),
        ('products', 'productName', 'Producto', 'Nombre del producto'),
        ('products', 'productLine', 'Producto', 'Línea de producto'),
        ('products', 'productScale', 'Producto', 'Escala del producto'),
        ('products', 'productVendor', 'Producto', 'Fabricante'),
        ('products', 'productDescription', 'Producto', 'Descripción del producto'),
        ('products', 'quantityInStock', 'Producto', 'Cantidad en stock'),
        ('products', 'buyPrice', 'Producto', 'Precio de compra'),
        ('products', 'MSRP', 'Producto', 'Precio sugerido'),
        # classicmodels.orders
        ('orders', 'orderNumber', 'Orden de Compra', 'Número de orden'),
        ('orders', 'orderDate', 'Orden de Compra', 'Fecha de orden'),
        ('orders', 'requiredDate', 'Orden de Compra', 'Fecha requerida'),
        ('orders', 'shippedDate', 'Orden de Compra', 'Fecha de envío'),
        ('orders', 'status', 'Orden de Compra', 'Estado'),
        ('orders', 'comments', 'Orden de Compra', 'Comentarios'),
        ('orders', 'customerNumber', 'Orden de Compra', 'Número de cliente'),
        # classicmodels.orderdetails
        ('orderdetails', 'orderNumber', 'Detalle de Orden', 'Número de orden'),
        ('orderdetails', 'productCode', 'Detalle de Orden', 'Código de producto'),
        ('orderdetails', 'quantityOrdered', 'Detalle de Orden', 'Cantidad ordenada'),
        ('orderdetails', 'priceEach', 'Detalle de Orden', 'Precio unitario'),
        ('orderdetails', 'orderLineNumber', 'Detalle de Orden', 'Número de línea'),
        # classicmodels.payments
        ('payments', 'customerNumber', 'Pago', 'Número de cliente'),
        ('payments', 'checkNumber', 'Pago', 'Número de cheque'),
        ('payments', 'paymentDate', 'Pago', 'Fecha de pago'),
        ('payments', 'amount', 'Pago', 'Monto'),
        # classicmodels.offices
        ('offices', 'officeCode', 'Oficina', 'Código de oficina'),
        ('offices', 'city', 'Oficina', 'Ciudad'),
        ('offices', 'phone', 'Oficina', 'Teléfono'),
        ('offices', 'addressLine1', 'Oficina', 'Dirección línea 1'),
        ('offices', 'addressLine2', 'Oficina', 'Dirección línea 2'),
        ('offices', 'state', 'Oficina', 'Estado/Provincia'),
        ('offices', 'country', 'Oficina', 'País'),
        ('offices', 'postalCode', 'Oficina', 'Código postal'),
        ('offices', 'territory', 'Oficina', 'Territorio'),
        # classicmodels.productlines
        ('productlines', 'productLine', 'Línea de Producto', 'Nombre de línea'),
        ('productlines', 'textDescription', 'Línea de Producto', 'Descripción texto'),
        ('productlines', 'htmlDescription', 'Línea de Producto', 'Descripción HTML'),
        ('productlines', 'image', 'Línea de Producto', 'Imagen'),
        # customerservice.cs_customers
        ('cs_customers', 'customernumber', 'Cliente', 'Número de cliente'),
        ('cs_customers', 'contactlastname', 'Cliente', 'Apellido de contacto'),
        ('cs_customers', 'contactfirstname', 'Cliente', 'Nombre de contacto'),
        ('cs_customers', 'phone', 'Cliente', 'Teléfono'),
        ('cs_customers', 'addressline1', 'Cliente', 'Dirección línea 1'),
        ('cs_customers', 'addressline2', 'Cliente', 'Dirección línea 2'),
        ('cs_customers', 'city', 'Cliente', 'Ciudad'),
        ('cs_customers', 'state', 'Cliente', 'Estado/Provincia'),
        ('cs_customers', 'postalcode', 'Cliente', 'Código postal'),
        ('cs_customers', 'country', 'Cliente', 'País'),
        # customerservice.cs_employees
        ('cs_employees', 'employeenumber', 'Empleado', 'Número de empleado'),
        ('cs_employees', 'lastname', 'Empleado', 'Apellido'),
        ('cs_employees', 'firstname', 'Empleado', 'Nombre'),
        ('cs_employees', 'email', 'Empleado', 'Email'),
        # customerservice.cs_products
        ('cs_products', 'productcode', 'Producto', 'Código de producto'),
        ('cs_products', 'productname', 'Producto', 'Nombre del producto'),
        ('cs_products', 'productscale', 'Producto', 'Escala del producto'),
        ('cs_products', 'productvendor', 'Producto', 'Fabricante'),
        ('cs_products', 'productdescription', 'Producto', 'Descripción del producto'),
        # customerservice.cs_customer_calls
        ('cs_customer_calls', 'employeenumber', 'Llamada al Call Center', 'Número de empleado'),
        ('cs_customer_calls', 'customernumber', 'Llamada al Call Center', 'Número de cliente'),
        ('cs_customer_calls', 'productcode', 'Llamada al Call Center', 'Código de producto'),
        ('cs_customer_calls', 'text', 'Llamada al Call Center', 'Texto'),
        ('cs_customer_calls', 'date', 'Llamada al Call Center', 'Fecha'),
        # customerservice.cs_customer_products
        ('cs_customer_products', 'customernumber', 'Producto por Cliente', 'Número de cliente'),
        ('cs_customer_products', 'productcode', 'Producto por Cliente', 'Código de producto'),
    ]
    
    print("  -> Registrando linaje semántico...")
    lineage_count = 0
    for table_name, column_name, entity_name, attr_name in lineage_map:
        # Buscar el column_id
        cursor.execute("""
            SELECT mc.column_id
            FROM metadata_column mc
            JOIN metadata_table mt ON mc.table_id = mt.table_id
            WHERE mt.table_name = %s AND mc.column_name = %s
        """, (table_name, column_name))
        result = cursor.fetchone()
        if result is None:
            print(f"     ADVERTENCIA: No se encontró {table_name}.{column_name}")
            continue
        column_id = result[0]
        
        # Buscar el attribute_id
        attr_id = attribute_ids.get((entity_name, attr_name))
        if attr_id is None:
            print(f"     ADVERTENCIA: No se encontró atributo {entity_name}.{attr_name}")
            continue
        
        cursor.execute("""
            INSERT INTO semantic_lineage (column_id, attribute_id)
            VALUES (%s, %s)
        """, (column_id, attr_id))
        lineage_count += 1
    
    print(f"     {lineage_count} conexiones de linaje registradas")
    
    conn.commit()
    cursor.close()
    conn.close()
    print("  -> Metadatos de negocio cargados exitosamente.\n")


# ============================================================
# EJECUCIÓN PRINCIPAL
# ============================================================
if __name__ == "__main__":
    print("\n" + "=" * 60)
    print("  ETL - REPOSITORIO DE METADATOS")
    print("  Proyecto Final - Modelos y Persistencia de Datos")
    print("=" * 60 + "\n")
    
    # Paso 1: Extraer metadatos de MySQL
    mysql_data = extract_mysql_metadata()
    
    # Paso 2: Extraer metadatos de PostgreSQL
    postgres_data = extract_postgres_metadata()
    
    # Paso 3: Cargar metadatos técnicos al repositorio
    load_technical_metadata(mysql_data, postgres_data)
    
    # Paso 4: Cargar metadatos de negocio
    load_business_metadata()
    
    print("=" * 60)
    print("  ETL COMPLETADO EXITOSAMENTE")
    print("=" * 60)
    print(f"\nRepositorio de metadatos cargado en:")
    print(f"  Host: 127.0.0.1")
    print(f"  Puerto: 5433")
    print(f"  Base de datos: metadata_repository")
    print(f"  Usuario: postgres\n")
