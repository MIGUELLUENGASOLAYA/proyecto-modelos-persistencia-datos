-- ============================================================
-- ALMACÉN DE DATOS - MODELO ESTRELLA
-- Proyecto Final - Entrega 2
-- Modelos y Persistencia de Datos 2026
-- Base de datos: datawarehouse (PostgreSQL)
-- ============================================================

-- ============================================================
-- DIMENSIONES
-- ============================================================

-- Dimensión Tiempo
-- Se genera a partir de las fechas de órdenes y llamadas.
-- Permite analizar ventas y llamadas por año, mes, trimestre, día.
CREATE TABLE dim_tiempo (
    tiempo_key SERIAL PRIMARY KEY,
    fecha DATE NOT NULL UNIQUE,
    anio INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    nombre_mes VARCHAR(20) NOT NULL,
    trimestre INTEGER NOT NULL,
    dia INTEGER NOT NULL,
    dia_semana INTEGER NOT NULL,
    nombre_dia VARCHAR(20) NOT NULL
);

-- Dimensión Cliente
-- Se nutre de classicmodels.customers y customerservice.cs_customers.
-- Integra información de contacto, dirección y datos comerciales.
CREATE TABLE dim_cliente (
    cliente_key SERIAL PRIMARY KEY,
    customer_number INTEGER NOT NULL UNIQUE,
    customer_name VARCHAR(50),
    contact_last_name VARCHAR(50),
    contact_first_name VARCHAR(50),
    phone VARCHAR(50),
    address_line1 VARCHAR(50),
    address_line2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(15),
    country VARCHAR(50),
    credit_limit DECIMAL(10,2),
    sales_rep_employee_number INTEGER
);

-- Dimensión Producto
-- Se nutre de classicmodels.products, productlines y cs_products.
-- Integra catálogo completo con precios y categoría.
CREATE TABLE dim_producto (
    producto_key SERIAL PRIMARY KEY,
    product_code VARCHAR(15) NOT NULL UNIQUE,
    product_name VARCHAR(70),
    product_line VARCHAR(50),
    product_scale VARCHAR(10),
    product_vendor VARCHAR(50),
    product_description TEXT,
    quantity_in_stock INTEGER,
    buy_price DECIMAL(10,2),
    msrp DECIMAL(10,2)
);

-- Dimensión Empleado
-- Se nutre de classicmodels.employees y customerservice.cs_employees.
-- Incluye empleados de ventas y del call center.
CREATE TABLE dim_empleado (
    empleado_key SERIAL PRIMARY KEY,
    employee_number INTEGER NOT NULL UNIQUE,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    email VARCHAR(100),
    job_title VARCHAR(50),
    office_code VARCHAR(10),
    reports_to INTEGER,
    fuente VARCHAR(50)
);

-- Dimensión Oficina
-- Se nutre de classicmodels.offices.
-- Permite analizar ventas por ubicación geográfica de la oficina.
CREATE TABLE dim_oficina (
    oficina_key SERIAL PRIMARY KEY,
    office_code VARCHAR(10) NOT NULL UNIQUE,
    city VARCHAR(50),
    phone VARCHAR(50),
    address_line1 VARCHAR(50),
    address_line2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(15),
    territory VARCHAR(10)
);

-- ============================================================
-- TABLAS DE HECHOS
-- ============================================================

-- Hecho Ventas
-- Cada registro es una línea de detalle de una orden de compra.
-- Se nutre de classicmodels.orders + orderdetails.
-- Medidas: cantidad_ordenada, precio_unitario, monto_linea.
CREATE TABLE fact_ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_key INTEGER NOT NULL REFERENCES dim_cliente(cliente_key),
    producto_key INTEGER NOT NULL REFERENCES dim_producto(producto_key),
    empleado_key INTEGER REFERENCES dim_empleado(empleado_key),
    oficina_key INTEGER REFERENCES dim_oficina(oficina_key),
    tiempo_key INTEGER NOT NULL REFERENCES dim_tiempo(tiempo_key),
    numero_orden INTEGER NOT NULL,
    estado_orden VARCHAR(15) NOT NULL,
    fecha_orden DATE NOT NULL,
    fecha_requerida DATE,
    fecha_envio DATE,
    cantidad_ordenada INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    monto_linea DECIMAL(10,2) NOT NULL,
    numero_linea INTEGER
);

-- Hecho Llamadas
-- Cada registro es una llamada al call center.
-- Se nutre de customerservice.cs_customer_calls.
-- Medidas: cantidad_llamadas (siempre 1, para sumar).
CREATE TABLE fact_llamadas (
    llamada_id SERIAL PRIMARY KEY,
    cliente_key INTEGER NOT NULL REFERENCES dim_cliente(cliente_key),
    producto_key INTEGER NOT NULL REFERENCES dim_producto(producto_key),
    empleado_key INTEGER NOT NULL REFERENCES dim_empleado(empleado_key),
    tiempo_key INTEGER NOT NULL REFERENCES dim_tiempo(tiempo_key),
    texto_llamada VARCHAR(200),
    cantidad_llamadas INTEGER NOT NULL DEFAULT 1
);
