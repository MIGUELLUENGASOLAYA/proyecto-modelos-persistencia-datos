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

---

### Archivos del proyecto

#### Scripts SQL
| Archivo | Descripción |
|---------|-------------|
| `create_repository.sql` | DDL de las 6 tablas del repositorio de metadatos |
| `create_datawarehouse.sql` | DDL del modelo estrella (5 dimensiones + 2 hechos) |

#### Procesos ETL (Python)
| Archivo | Entrega | Descripción |
|---------|---------|-------------|
| `etl_metadata.py` | 1 | Extrae estructura de MySQL/PostgreSQL → metadata_repository |
| `etl_datawarehouse.py` | 2 | Extrae datos de negocio de ambas fuentes → datawarehouse |
| `etl_metadata_dw.py` | 2 | Extrae estructura del almacén → metadata_repository |

#### Backups
| Archivo | Descripción |
|---------|-------------|
| `datawarehouse_backup.sql` | Backup completo del almacén de datos |
| `metadata_repository_backup_v2.sql` | Backup del repositorio actualizado con metadatos del almacén |

#### Diagramas
| Archivo | Descripción |
|---------|-------------|
| `diagrama ER de classicmodels (MySQL).png` | Modelo ER de classicmodels (MySQL Workbench) |
| `diagrama ER de customerservice.png` | Modelo ER de customerservice (DBeaver) |
| `diagrama ER del datawarehouse.png` | Modelo estrella del almacén (DBeaver) |
| `diagrama ER del metadata_repository.png` | Modelo ER del repositorio de metadatos (DBeaver) |
| `diagrama_arquitectura_entrega1.svg` | Arquitectura de la solución - Entrega 1 |
| `diagrama_arquitectura_entrega2.svg` | Arquitectura de la solución - Entrega 2 |

#### Documentos
| Archivo | Descripción |
|---------|-------------|
| `Proyecto_Entrega1_Completo.docx` | Documento: Descubrimiento, Perfilamiento y Repositorio |
| `Proyecto_Entrega2_Completo.docx` | Documento: Almacén, ETLs, Metadatos y Reportes |

#### Reportes
| Archivo | Descripción |
|---------|-------------|
| `Reportes Power BI.pbix` | Dashboard con 5 reportes conectados al almacén |

---

### Modelo Estrella del Almacén
| Tabla | Tipo | Registros | Fuente |
|-------|------|-----------|--------|
| dim_tiempo | Dimensión | 591 | Ambas fuentes |
| dim_cliente | Dimensión | 122 | classicmodels |
| dim_producto | Dimensión | 110 | classicmodels |
| dim_empleado | Dimensión | 53 | Ambas fuentes |
| dim_oficina | Dimensión | 7 | classicmodels |
| fact_ventas | Hecho | 2,996 | classicmodels |
| fact_llamadas | Hecho | 108 | customerservice |

### Repositorio de Metadatos
| Tabla | Entrega 1 | Entrega 2 |
|-------|-----------|-----------|
| datasource (fuentes) | 2 | 3 |
| metadata_table (tablas) | 13 | 20 |
| metadata_column (columnas) | 85 | ~135 |
| business_entity (entidades) | 10 | 17 |
| business_attribute (atributos) | 66 | ~88 |
| semantic_lineage (linaje) | 85 | ~106 |

### Reportes de Power BI
| Reporte | Tipo | Hallazgo principal |
|---------|------|-------------------|
| KPIs ejecutivos | Tarjetas | Total Ventas: 9,604 mil - Total Órdenes: 326 - Total Llamadas: 108 |
| Ventas por país | Barras | USA lidera con 3,273 mil (34% del total) |
| Ventas por año | Líneas | Crecimiento del 36% de 2003 a 2004 |
| Ventas por línea de producto | Circular | Classic Cars domina con 40.13% |
| Llamadas por producto | Barras | Vintage Cars genera más llamadas (33) pese a ser 2° en ventas |

---

### Cómo ejecutar

#### Requisitos
- MySQL 8.0 con classicmodels cargada
- PostgreSQL 18
- Python 3.13
- Power BI Desktop

#### Pasos
```bash
# 1. Crear bases de datos en PostgreSQL
psql -U postgres -c "CREATE DATABASE customerservice;"
psql -U postgres -c "CREATE DATABASE metadata_repository;"
psql -U postgres -c "CREATE DATABASE datawarehouse;"

# 2. Cargar datos y estructuras
psql -U postgres -d customerservice -f customerservice.sql
psql -U postgres -d metadata_repository -f create_repository.sql
psql -U postgres -d datawarehouse -f create_datawarehouse.sql

# 3. Instalar dependencias Python
pip install mysql-connector-python psycopg2-binary

# 4. Ejecutar ETLs (editar passwords en cada archivo primero)
python etl_metadata.py
python etl_datawarehouse.py
python etl_metadata_dw.py

# 5. Abrir Reportes Power BI.pbix en Power BI Desktop
```

---

### Problemas de calidad resueltos
| Problema | Detectado en | Resuelto con |
|----------|-------------|--------------|
| Espacios en country ('Norway  ') | Entrega 1 - Perfilamiento | TRIM(country) en ETL 2 |
| Clientes sin representante (NULL) | Entrega 1 - Perfilamiento | LEFT JOIN en ETL 2 |
| Timestamp en llamadas | Entrega 1 - Perfilamiento | ::date en ETL 2 |
| Empleados duplicados entre fuentes | Entrega 1 - Perfilamiento | Set de deduplicación en ETL 2 |

### Referencias
- mysql-connector-python: https://dev.mysql.com/doc/connector-python/en/
- psycopg2: https://www.psycopg.org/docs/
- DB-API 2.0 (PEP 249): https://peps.python.org/pep-0249/
- Kimball, R. & Ross, M. (2013). The Data Warehouse Toolkit, 3rd Edition. Wiley.
- Common Warehouse Metamodel (CWM): https://www.omg.org/spec/CWM
