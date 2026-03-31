"""
ETL - Actualización del Repositorio de Metadatos con el Almacén de Datos
Proyecto Final - Entrega 2 - Modelos y Persistencia de Datos 2026
Pontificia Universidad Javeriana

Este script agrega al repositorio de metadatos existente los metadatos
técnicos y de negocio del almacén de datos (datawarehouse), incluyendo
las tablas de hechos y dimensiones.

IMPORTANTE: Ejecutar DESPUÉS del etl_metadata.py de la Entrega 1.
"""

import psycopg2

# ============================================================
# CONFIGURACIÓN
# ============================================================
POSTGRES_DW_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,                   # <<< VERIFICAR PUERTO
    'user': 'postgres',
    'password': 'admin1998',        # <<< CAMBIAR
    'dbname': 'datawarehouse'
}

POSTGRES_REPO_CONFIG = {
    'host': '127.0.0.1',
    'port': 5433,                   # <<< VERIFICAR PUERTO
    'user': 'postgres',
    'password': 'admin1998',        # <<< CAMBIAR
    'dbname': 'metadata_repository'
}


# ============================================================
# PASO 1: EXTRAER METADATOS DEL DATAWAREHOUSE
# ============================================================
def extract_dw_metadata():
    print("=" * 60)
    print("EXTRACT: Conectando a datawarehouse...")
    print("=" * 60)

    conn = psycopg2.connect(**POSTGRES_DW_CONFIG)
    cursor = conn.cursor()

    # Extraer tablas con conteo de filas
    cursor.execute("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
    """)
    tables_raw = cursor.fetchall()

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
        if col['character_maximum_length']:
            col['column_type'] = f"{col['data_type']}({col['character_maximum_length']})"
        else:
            col['column_type'] = col['data_type']
        columns.append(col)

    print(f"  -> Columnas encontradas: {len(columns)}")

    # Extraer PKs
    cursor.execute("""
        SELECT kcu.table_name, kcu.column_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'public'
          AND tc.constraint_type = 'PRIMARY KEY'
    """)
    primary_keys = set()
    for (table_name, column_name) in cursor.fetchall():
        primary_keys.add((table_name, column_name))

    # Extraer FKs
    cursor.execute("""
        SELECT kcu.table_name, kcu.column_name,
               ccu.table_name AS ref_table, ccu.column_name AS ref_column
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        JOIN information_schema.constraint_column_usage ccu
          ON tc.constraint_name = ccu.constraint_name
        WHERE tc.table_schema = 'public'
          AND tc.constraint_type = 'FOREIGN KEY'
    """)
    foreign_keys = {}
    for (table_name, column_name, ref_table, ref_column) in cursor.fetchall():
        foreign_keys[(table_name, column_name)] = (ref_table, ref_column)

    print(f"  -> Primary keys: {len(primary_keys)}")
    print(f"  -> Foreign keys: {len(foreign_keys)}")

    cursor.close()
    conn.close()

    return tables, columns, primary_keys, foreign_keys


# ============================================================
# PASO 2: CARGAR METADATOS TÉCNICOS AL REPOSITORIO
# ============================================================
def load_dw_technical_metadata(tables, columns, primary_keys, foreign_keys):
    print("=" * 60)
    print("LOAD: Cargando metadatos técnicos del datawarehouse...")
    print("=" * 60)

    conn = psycopg2.connect(**POSTGRES_REPO_CONFIG)
    cursor = conn.cursor()

    # Verificar si ya existe el datasource datawarehouse
    cursor.execute("SELECT datasource_id FROM datasource WHERE datasource_name = 'datawarehouse'")
    result = cursor.fetchone()

    if result:
        dw_ds_id = result[0]
        print(f"  -> Datasource datawarehouse ya existe (ID={dw_ds_id}), limpiando datos previos...")
        # Limpiar tablas y columnas previas del DW
        cursor.execute("""
            DELETE FROM semantic_lineage WHERE column_id IN (
                SELECT column_id FROM metadata_column WHERE table_id IN (
                    SELECT table_id FROM metadata_table WHERE datasource_id = %s
                )
            )
        """, (dw_ds_id,))
        cursor.execute("""
            DELETE FROM metadata_column WHERE table_id IN (
                SELECT table_id FROM metadata_table WHERE datasource_id = %s
            )
        """, (dw_ds_id,))
        cursor.execute("DELETE FROM metadata_table WHERE datasource_id = %s", (dw_ds_id,))
    else:
        cursor.execute("""
            INSERT INTO datasource (datasource_name, database_type, host, port, description)
            VALUES (%s, %s, %s, %s, %s) RETURNING datasource_id
        """, ('datawarehouse', 'PostgreSQL', '127.0.0.1', 5432,
              'Almacén de datos con modelo estrella: 2 tablas de hechos (ventas y llamadas) y 5 dimensiones (tiempo, cliente, producto, empleado, oficina)'))
        dw_ds_id = cursor.fetchone()[0]
        print(f"  -> Datasource datawarehouse creado (ID={dw_ds_id})")

    # Cargar tablas
    table_ids = {}
    for table in tables:
        cursor.execute("""
            INSERT INTO metadata_table (datasource_id, table_name, row_count, description)
            VALUES (%s, %s, %s, %s) RETURNING table_id
        """, (dw_ds_id, table['table_name'], table['row_count'],
              get_table_description(table['table_name'])))
        table_ids[table['table_name']] = cursor.fetchone()[0]
    print(f"  -> {len(table_ids)} tablas cargadas")

    # Cargar columnas
    col_count = 0
    for col in columns:
        table_id = table_ids.get(col['table_name'])
        if not table_id:
            continue

        is_pk = (col['table_name'], col['column_name']) in primary_keys
        fk_key = (col['table_name'], col['column_name'])
        is_fk = fk_key in foreign_keys
        ref_table = foreign_keys[fk_key][0] if is_fk else None
        ref_column = foreign_keys[fk_key][1] if is_fk else None

        cursor.execute("""
            INSERT INTO metadata_column (table_id, column_name, data_type, column_type,
                is_nullable, is_primary_key, is_foreign_key, referenced_table,
                referenced_column, ordinal_position)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (table_id, col['column_name'], col['data_type'], col['column_type'],
              col['is_nullable'], is_pk, is_fk, ref_table, ref_column,
              col['ordinal_position']))
        col_count += 1

    print(f"  -> {col_count} columnas cargadas")
    conn.commit()
    cursor.close()
    conn.close()


def get_table_description(table_name):
    """Retorna la descripción de negocio de cada tabla del almacén."""
    descriptions = {
        'dim_tiempo': 'Dimensión de tiempo. Permite analizar datos por año, mes, trimestre y día. Generada a partir de las fechas de órdenes y llamadas.',
        'dim_cliente': 'Dimensión de clientes. Integra datos de classicmodels.customers (nombre comercial, crédito) con customerservice.cs_customers (contacto, dirección).',
        'dim_producto': 'Dimensión de productos. Catálogo completo con línea de producto, precios y stock. Se nutre de classicmodels.products y productlines.',
        'dim_empleado': 'Dimensión de empleados. Integra representantes de ventas (classicmodels) y agentes del call center (customerservice). 53 empleados en total.',
        'dim_oficina': 'Dimensión de oficinas. Las 7 sucursales de la empresa con su ubicación y territorio comercial.',
        'fact_ventas': 'Tabla de hechos de ventas. Cada registro es una línea de detalle de una orden. Medidas: cantidad_ordenada, precio_unitario, monto_linea. 2,996 registros.',
        'fact_llamadas': 'Tabla de hechos de llamadas al call center. Cada registro es una llamada recibida. Medida: cantidad_llamadas. 108 registros.',
    }
    return descriptions.get(table_name, '')


# ============================================================
# PASO 3: CARGAR METADATOS DE NEGOCIO DEL ALMACÉN
# ============================================================
def load_dw_business_metadata():
    print("=" * 60)
    print("LOAD: Cargando metadatos de negocio del almacén...")
    print("=" * 60)

    conn = psycopg2.connect(**POSTGRES_REPO_CONFIG)
    cursor = conn.cursor()

    # Nuevas entidades de negocio para el almacén
    new_entities = [
        ('Hecho de Ventas', 'Registro de cada línea de venta con sus medidas: cantidad, precio unitario y monto total. Permite análisis de ventas por cliente, producto, empleado, oficina y tiempo.', 'Almacén de Datos'),
        ('Hecho de Llamadas', 'Registro de cada llamada al call center con la cantidad como medida. Permite análisis de llamadas por cliente, producto, empleado y tiempo.', 'Almacén de Datos'),
        ('Dimensión Tiempo', 'Perspectiva temporal para análisis. Incluye año, mes, trimestre, día de la semana. Compartida entre hechos de ventas y llamadas.', 'Almacén de Datos'),
        ('Dimensión Cliente', 'Perspectiva de clientes para análisis. Integra datos de ambas fuentes originales en una sola tabla consolidada.', 'Almacén de Datos'),
        ('Dimensión Producto', 'Perspectiva de productos para análisis. Incluye catálogo completo con línea, precios y stock.', 'Almacén de Datos'),
        ('Dimensión Empleado', 'Perspectiva de empleados para análisis. Integra representantes de ventas y agentes de call center.', 'Almacén de Datos'),
        ('Dimensión Oficina', 'Perspectiva geográfica para análisis. Permite analizar ventas por ubicación de oficina y territorio.', 'Almacén de Datos'),
    ]

    entity_ids = {}
    for name, description, domain in new_entities:
        # Verificar si ya existe
        cursor.execute("SELECT entity_id FROM business_entity WHERE entity_name = %s", (name,))
        result = cursor.fetchone()
        if result:
            entity_ids[name] = result[0]
        else:
            cursor.execute("""
                INSERT INTO business_entity (entity_name, description, data_domain)
                VALUES (%s, %s, %s) RETURNING entity_id
            """, (name, description, domain))
            entity_ids[name] = cursor.fetchone()[0]
    print(f"  -> {len(entity_ids)} entidades de negocio del almacén registradas")

    # Atributos de las nuevas entidades
    new_attributes = [
        # Hecho de Ventas
        ('Hecho de Ventas', 'Cantidad ordenada', 'Número de unidades del producto solicitadas en la línea de la orden'),
        ('Hecho de Ventas', 'Precio unitario', 'Precio por unidad del producto en esta línea de venta'),
        ('Hecho de Ventas', 'Monto de línea', 'Valor total de la línea: cantidad × precio unitario'),
        ('Hecho de Ventas', 'Número de orden', 'Identificador de la orden de compra'),
        ('Hecho de Ventas', 'Estado de orden', 'Estado actual: Shipped, Cancelled, In Process, etc.'),
        ('Hecho de Ventas', 'Fecha de orden', 'Fecha en que se realizó el pedido'),
        ('Hecho de Ventas', 'Fecha requerida', 'Fecha solicitada para la entrega'),
        ('Hecho de Ventas', 'Fecha de envío', 'Fecha en que se despachó la orden'),
        ('Hecho de Ventas', 'Número de línea', 'Número secuencial de la línea dentro de la orden'),
        # Hecho de Llamadas
        ('Hecho de Llamadas', 'Texto de llamada', 'Descripción o nota registrada durante la llamada'),
        ('Hecho de Llamadas', 'Cantidad de llamadas', 'Contador unitario (siempre 1) que permite sumar el total de llamadas'),
        # Dimensión Tiempo
        ('Dimensión Tiempo', 'Fecha', 'Fecha calendario en formato DATE'),
        ('Dimensión Tiempo', 'Año', 'Año de la fecha (ej: 2003, 2004, 2005)'),
        ('Dimensión Tiempo', 'Mes', 'Número del mes (1-12)'),
        ('Dimensión Tiempo', 'Nombre del mes', 'Nombre del mes en español (Enero, Febrero, ...)'),
        ('Dimensión Tiempo', 'Trimestre', 'Número del trimestre (1-4)'),
        ('Dimensión Tiempo', 'Día', 'Día del mes (1-31)'),
        ('Dimensión Tiempo', 'Día de la semana', 'Número del día de la semana (0=Lunes, 6=Domingo)'),
        ('Dimensión Tiempo', 'Nombre del día', 'Nombre del día en español (Lunes, Martes, ...)'),
        # Dimensión Cliente (ya existe en Entrega 1, solo referencia)
        # Dimensión Producto (ya existe en Entrega 1, solo referencia)
        # Dimensión Empleado
        ('Dimensión Empleado', 'Fuente', 'Indica de qué sistema proviene el empleado: classicmodels o customerservice'),
        # Dimensión Oficina
        ('Dimensión Oficina', 'Territorio', 'Región comercial asignada a la oficina: NA, EMEA, APAC o Japan'),
    ]

    attr_count = 0
    attribute_ids = {}
    for entity_name, attr_name, definition in new_attributes:
        entity_id = entity_ids.get(entity_name)
        if not entity_id:
            continue
        # Verificar si ya existe
        cursor.execute("""
            SELECT attribute_id FROM business_attribute
            WHERE entity_id = %s AND attribute_name = %s
        """, (entity_id, attr_name))
        result = cursor.fetchone()
        if result:
            attribute_ids[(entity_name, attr_name)] = result[0]
        else:
            cursor.execute("""
                INSERT INTO business_attribute (entity_id, attribute_name, definition)
                VALUES (%s, %s, %s) RETURNING attribute_id
            """, (entity_id, attr_name, definition))
            attribute_ids[(entity_name, attr_name)] = cursor.fetchone()[0]
            attr_count += 1
    print(f"  -> {attr_count} atributos nuevos registrados")

    # Linaje semántico para las tablas del almacén
    dw_lineage = [
        # fact_ventas
        ('fact_ventas', 'cantidad_ordenada', 'Hecho de Ventas', 'Cantidad ordenada'),
        ('fact_ventas', 'precio_unitario', 'Hecho de Ventas', 'Precio unitario'),
        ('fact_ventas', 'monto_linea', 'Hecho de Ventas', 'Monto de línea'),
        ('fact_ventas', 'numero_orden', 'Hecho de Ventas', 'Número de orden'),
        ('fact_ventas', 'estado_orden', 'Hecho de Ventas', 'Estado de orden'),
        ('fact_ventas', 'fecha_orden', 'Hecho de Ventas', 'Fecha de orden'),
        ('fact_ventas', 'fecha_requerida', 'Hecho de Ventas', 'Fecha requerida'),
        ('fact_ventas', 'fecha_envio', 'Hecho de Ventas', 'Fecha de envío'),
        ('fact_ventas', 'numero_linea', 'Hecho de Ventas', 'Número de línea'),
        # fact_llamadas
        ('fact_llamadas', 'texto_llamada', 'Hecho de Llamadas', 'Texto de llamada'),
        ('fact_llamadas', 'cantidad_llamadas', 'Hecho de Llamadas', 'Cantidad de llamadas'),
        # dim_tiempo
        ('dim_tiempo', 'fecha', 'Dimensión Tiempo', 'Fecha'),
        ('dim_tiempo', 'anio', 'Dimensión Tiempo', 'Año'),
        ('dim_tiempo', 'mes', 'Dimensión Tiempo', 'Mes'),
        ('dim_tiempo', 'nombre_mes', 'Dimensión Tiempo', 'Nombre del mes'),
        ('dim_tiempo', 'trimestre', 'Dimensión Tiempo', 'Trimestre'),
        ('dim_tiempo', 'dia', 'Dimensión Tiempo', 'Día'),
        ('dim_tiempo', 'dia_semana', 'Dimensión Tiempo', 'Día de la semana'),
        ('dim_tiempo', 'nombre_dia', 'Dimensión Tiempo', 'Nombre del día'),
        # dim_empleado.fuente
        ('dim_empleado', 'fuente', 'Dimensión Empleado', 'Fuente'),
        # dim_oficina.territory
        ('dim_oficina', 'territory', 'Dimensión Oficina', 'Territorio'),
    ]

    lineage_count = 0
    for table_name, column_name, entity_name, attr_name in dw_lineage:
        # Buscar column_id
        cursor.execute("""
            SELECT mc.column_id FROM metadata_column mc
            JOIN metadata_table mt ON mc.table_id = mt.table_id
            JOIN datasource d ON mt.datasource_id = d.datasource_id
            WHERE mt.table_name = %s AND mc.column_name = %s AND d.datasource_name = 'datawarehouse'
        """, (table_name, column_name))
        result = cursor.fetchone()
        if not result:
            print(f"  ADVERTENCIA: No se encontró {table_name}.{column_name}")
            continue
        column_id = result[0]

        attr_id = attribute_ids.get((entity_name, attr_name))
        if not attr_id:
            print(f"  ADVERTENCIA: No se encontró atributo {entity_name}.{attr_name}")
            continue

        # Verificar si ya existe
        cursor.execute("""
            SELECT lineage_id FROM semantic_lineage
            WHERE column_id = %s AND attribute_id = %s
        """, (column_id, attr_id))
        if not cursor.fetchone():
            cursor.execute("""
                INSERT INTO semantic_lineage (column_id, attribute_id)
                VALUES (%s, %s)
            """, (column_id, attr_id))
            lineage_count += 1

    print(f"  -> {lineage_count} conexiones de linaje registradas")

    conn.commit()
    cursor.close()
    conn.close()


# ============================================================
# EJECUCIÓN PRINCIPAL
# ============================================================
if __name__ == "__main__":
    print("\n" + "=" * 60)
    print("  ETL - METADATOS DEL ALMACÉN DE DATOS")
    print("  Proyecto Final - Entrega 2")
    print("=" * 60 + "\n")

    # Extraer metadatos técnicos del datawarehouse
    tables, columns, pks, fks = extract_dw_metadata()

    # Cargar metadatos técnicos al repositorio
    load_dw_technical_metadata(tables, columns, pks, fks)

    # Cargar metadatos de negocio
    load_dw_business_metadata()

    print("\n" + "=" * 60)
    print("  METADATOS DEL ALMACÉN ACTUALIZADOS")
    print("=" * 60)

    # Resumen
    conn = psycopg2.connect(**POSTGRES_REPO_CONFIG)
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM datasource")
    print(f"\n  Fuentes de datos: {cursor.fetchone()[0]}")
    cursor.execute("SELECT COUNT(*) FROM metadata_table")
    print(f"  Tablas registradas: {cursor.fetchone()[0]}")
    cursor.execute("SELECT COUNT(*) FROM metadata_column")
    print(f"  Columnas registradas: {cursor.fetchone()[0]}")
    cursor.execute("SELECT COUNT(*) FROM business_entity")
    print(f"  Entidades de negocio: {cursor.fetchone()[0]}")
    cursor.execute("SELECT COUNT(*) FROM business_attribute")
    print(f"  Atributos de negocio: {cursor.fetchone()[0]}")
    cursor.execute("SELECT COUNT(*) FROM semantic_lineage")
    print(f"  Conexiones de linaje: {cursor.fetchone()[0]}")
    cursor.close()
    conn.close()
