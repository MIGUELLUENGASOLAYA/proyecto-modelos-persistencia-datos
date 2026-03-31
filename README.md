# Proyecto Final - Modelos y Persistencia de Datos 2026
## Pontificia Universidad Javeriana - Departamento de Ingeniería de Sistemas

### Descripción
Solución de Inteligencia de Negocios que integra dos fuentes de datos 
(classicmodels en MySQL y customerservice en PostgreSQL) en un almacén 
de datos con modelo estrella, repositorio centralizado de metadatos 
y reportes de visualización en Power BI.

### Arquitectura
- **Fuentes:** classicmodels (MySQL 3306) + customerservice (PostgreSQL 5432)
- **Almacén:** datawarehouse (PostgreSQL) - Modelo estrella: 2 hechos + 5 dimensiones
- **Metadatos:** metadata_repository (PostgreSQL) - 3 fuentes, 20 tablas, 17 entidades
- **Visualización:** Power BI Desktop - 5 reportes

### Tecnologías
- MySQL 8.0
- PostgreSQL 18
- Python 3.13 (mysql-connector-python, psycopg2)
- Power BI Desktop
- DBeaver 26

### Archivos del proyecto

#### Entrega 1 - Repositorio de Metadatos
| Archivo | Descripción |
|---------|-------------|
| `create_repository.sql` | DDL de las 6 tablas del repositorio de metadatos |
| `etl_metadata.py` | ETL que carga metadatos técnicos y de negocio de ambas fuentes |

#### Entrega 2 - Almacén de Datos y Reportes BI
| Archivo | Descripción |
|---------|-------------|
| `create_datawarehouse.sql` | DDL del modelo estrella (5 dimensiones + 2 hechos) |
| `etl_datawarehouse.py` | ETL que carga datos reales de ambas fuentes al almacén |
| `etl_metadata_dw.py` | ETL que actualiza el repositorio con metadatos del almacén |

### Modelo Estrella
| Tabla | Tipo | Registros | Fuente |
|-------|------|-----------|--------|
| dim_tiempo | Dimensión | 591 | Ambas |
| dim_cliente | Dimensión | 122 | classicmodels |
| dim_producto | Dimensión | 110 | classicmodels |
| dim_empleado | Dimensión | 53 | Ambas |
| dim_oficina | Dimensión | 7 | classicmodels |
| fact_ventas | Hecho | 2,996 | classicmodels |
| fact_llamadas | Hecho | 108 | customerservice |

### Procesos ETL
1. **etl_metadata.py** → Extrae estructura de MySQL/PostgreSQL → metadata_repository
2. **etl_datawarehouse.py** → Extrae datos de negocio → datawarehouse
3. **etl_metadata_dw.py** → Extrae estructura del almacén → metadata_repository

### Cómo ejecutar
```bash
# 1. Crear bases de datos en PostgreSQL
psql -U postgres -c "CREATE DATABASE customerservice;"
psql -U postgres -c "CREATE DATABASE metadata_repository;"
psql -U postgres -c "CREATE DATABASE datawarehouse;"

# 2. Cargar estructuras
psql -U postgres -d customerservice -f customerservice.sql
psql -U postgres -d metadata_repository -f create_repository.sql
psql -U postgres -d datawarehouse -f create_datawarehouse.sql

# 3. Instalar dependencias Python
pip install mysql-connector-python psycopg2-binary

# 4. Ejecutar ETLs (editar passwords en cada archivo primero)
python etl_metadata.py
python etl_datawarehouse.py
python etl_metadata_dw.py
```
