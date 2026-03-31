--
-- PostgreSQL database dump
--

\restrict bwa2yxR2Xpsr0GDoBVYB2BQxTbujfwWDwNdwklSeBsz1B05GVh70BDsGmLSdHGQ

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: business_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_attribute (
    attribute_id integer NOT NULL,
    entity_id integer NOT NULL,
    attribute_name character varying(100) NOT NULL,
    definition character varying(500)
);


ALTER TABLE public.business_attribute OWNER TO postgres;

--
-- Name: business_attribute_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_attribute_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_attribute_attribute_id_seq OWNER TO postgres;

--
-- Name: business_attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_attribute_attribute_id_seq OWNED BY public.business_attribute.attribute_id;


--
-- Name: business_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_entity (
    entity_id integer NOT NULL,
    entity_name character varying(100) NOT NULL,
    description character varying(500),
    data_domain character varying(100)
);


ALTER TABLE public.business_entity OWNER TO postgres;

--
-- Name: business_entity_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_entity_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_entity_entity_id_seq OWNER TO postgres;

--
-- Name: business_entity_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_entity_entity_id_seq OWNED BY public.business_entity.entity_id;


--
-- Name: datasource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasource (
    datasource_id integer NOT NULL,
    datasource_name character varying(100) NOT NULL,
    database_type character varying(50) NOT NULL,
    host character varying(100),
    port integer,
    description character varying(500)
);


ALTER TABLE public.datasource OWNER TO postgres;

--
-- Name: datasource_datasource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasource_datasource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datasource_datasource_id_seq OWNER TO postgres;

--
-- Name: datasource_datasource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasource_datasource_id_seq OWNED BY public.datasource.datasource_id;


--
-- Name: metadata_column; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metadata_column (
    column_id integer NOT NULL,
    table_id integer NOT NULL,
    column_name character varying(100) NOT NULL,
    data_type character varying(100),
    column_type character varying(100),
    is_nullable character varying(3),
    is_primary_key boolean DEFAULT false,
    is_foreign_key boolean DEFAULT false,
    referenced_table character varying(100),
    referenced_column character varying(100),
    ordinal_position integer
);


ALTER TABLE public.metadata_column OWNER TO postgres;

--
-- Name: metadata_column_column_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metadata_column_column_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metadata_column_column_id_seq OWNER TO postgres;

--
-- Name: metadata_column_column_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metadata_column_column_id_seq OWNED BY public.metadata_column.column_id;


--
-- Name: metadata_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metadata_table (
    table_id integer NOT NULL,
    datasource_id integer NOT NULL,
    table_name character varying(100) NOT NULL,
    row_count integer,
    description character varying(500)
);


ALTER TABLE public.metadata_table OWNER TO postgres;

--
-- Name: metadata_table_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metadata_table_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metadata_table_table_id_seq OWNER TO postgres;

--
-- Name: metadata_table_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metadata_table_table_id_seq OWNED BY public.metadata_table.table_id;


--
-- Name: semantic_lineage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semantic_lineage (
    lineage_id integer NOT NULL,
    column_id integer NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.semantic_lineage OWNER TO postgres;

--
-- Name: semantic_lineage_lineage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semantic_lineage_lineage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semantic_lineage_lineage_id_seq OWNER TO postgres;

--
-- Name: semantic_lineage_lineage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semantic_lineage_lineage_id_seq OWNED BY public.semantic_lineage.lineage_id;


--
-- Name: business_attribute attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_attribute ALTER COLUMN attribute_id SET DEFAULT nextval('public.business_attribute_attribute_id_seq'::regclass);


--
-- Name: business_entity entity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_entity ALTER COLUMN entity_id SET DEFAULT nextval('public.business_entity_entity_id_seq'::regclass);


--
-- Name: datasource datasource_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasource ALTER COLUMN datasource_id SET DEFAULT nextval('public.datasource_datasource_id_seq'::regclass);


--
-- Name: metadata_column column_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_column ALTER COLUMN column_id SET DEFAULT nextval('public.metadata_column_column_id_seq'::regclass);


--
-- Name: metadata_table table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_table ALTER COLUMN table_id SET DEFAULT nextval('public.metadata_table_table_id_seq'::regclass);


--
-- Name: semantic_lineage lineage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semantic_lineage ALTER COLUMN lineage_id SET DEFAULT nextval('public.semantic_lineage_lineage_id_seq'::regclass);


--
-- Data for Name: business_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_attribute (attribute_id, entity_id, attribute_name, definition) FROM stdin;
1	1	Número de cliente	Identificador único del cliente en el sistema
2	1	Nombre del cliente	Razón social o nombre comercial del cliente
3	1	Apellido de contacto	Apellido de la persona de contacto del cliente
4	1	Nombre de contacto	Nombre de pila de la persona de contacto del cliente
5	1	Teléfono	Número telefónico de contacto del cliente
6	1	Dirección línea 1	Dirección principal del cliente
7	1	Dirección línea 2	Complemento de dirección (piso, suite, etc.)
8	1	Ciudad	Ciudad donde se ubica el cliente
9	1	Estado/Provincia	Estado o provincia del cliente
10	1	Código postal	Código postal del cliente
11	1	País	País donde se ubica el cliente
12	1	Representante de ventas	Número del empleado asignado como representante de ventas
13	1	Límite de crédito	Monto máximo de crédito otorgado al cliente
14	2	Número de empleado	Identificador único del empleado
15	2	Apellido	Apellido del empleado
16	2	Nombre	Nombre de pila del empleado
17	2	Extensión	Extensión telefónica del empleado
18	2	Email	Correo electrónico corporativo del empleado
19	2	Código de oficina	Identificador de la oficina donde trabaja
20	2	Reporta a	Número del empleado superior jerárquico
21	2	Título del cargo	Cargo o puesto que ocupa el empleado
22	3	Código de producto	Identificador único del producto
23	3	Nombre del producto	Nombre descriptivo del modelo a escala
24	3	Línea de producto	Categoría a la que pertenece el producto
25	3	Escala del producto	Escala de reproducción del modelo (1:10, 1:18, etc.)
26	3	Fabricante	Empresa que manufactura el modelo
27	3	Descripción del producto	Descripción detallada del producto
28	3	Cantidad en stock	Unidades disponibles en inventario
29	3	Precio de compra	Costo de adquisición del producto
30	3	Precio sugerido	Precio de venta sugerido al público (MSRP)
31	4	Número de orden	Identificador único de la orden de compra
32	4	Fecha de orden	Fecha en que se realizó el pedido
33	4	Fecha requerida	Fecha solicitada para la entrega
34	4	Fecha de envío	Fecha en que se despachó la orden
35	4	Estado	Estado actual de la orden (Shipped, Cancelled, etc.)
36	4	Comentarios	Observaciones adicionales sobre la orden
37	4	Número de cliente	Cliente que realizó la orden
38	5	Número de orden	Orden a la que pertenece este detalle
39	5	Código de producto	Producto incluido en la orden
40	5	Cantidad ordenada	Número de unidades solicitadas
41	5	Precio unitario	Precio por unidad del producto en esta orden
42	5	Número de línea	Número secuencial de la línea dentro de la orden
43	6	Número de cliente	Cliente que realiza el pago
44	6	Número de cheque	Identificador del instrumento de pago
45	6	Fecha de pago	Fecha en que se realizó el pago
46	6	Monto	Valor monetario del pago
47	7	Código de oficina	Identificador único de la oficina
48	7	Ciudad	Ciudad donde se ubica la oficina
49	7	Teléfono	Número telefónico de la oficina
50	7	Dirección línea 1	Dirección principal de la oficina
51	7	Dirección línea 2	Complemento de dirección
52	7	Estado/Provincia	Estado o provincia
53	7	País	País donde se ubica la oficina
54	7	Código postal	Código postal de la oficina
55	7	Territorio	Región comercial (NA, EMEA, APAC, Japan)
56	8	Nombre de línea	Nombre de la categoría de productos
57	8	Descripción texto	Descripción en texto plano
58	8	Descripción HTML	Descripción en formato HTML
59	8	Imagen	Imagen representativa de la línea
60	9	Número de empleado	Empleado que recibió la llamada
61	9	Número de cliente	Cliente que realizó la llamada
62	9	Código de producto	Producto sobre el cual es la llamada
63	9	Texto	Descripción o nota de la llamada
64	9	Fecha	Fecha y hora de la llamada
65	10	Número de cliente	Cliente asociado
66	10	Código de producto	Producto asociado al cliente
67	11	Cantidad ordenada	Número de unidades del producto solicitadas en la línea de la orden
68	11	Precio unitario	Precio por unidad del producto en esta línea de venta
69	11	Monto de línea	Valor total de la línea: cantidad × precio unitario
70	11	Número de orden	Identificador de la orden de compra
71	11	Estado de orden	Estado actual: Shipped, Cancelled, In Process, etc.
72	11	Fecha de orden	Fecha en que se realizó el pedido
73	11	Fecha requerida	Fecha solicitada para la entrega
74	11	Fecha de envío	Fecha en que se despachó la orden
75	11	Número de línea	Número secuencial de la línea dentro de la orden
76	12	Texto de llamada	Descripción o nota registrada durante la llamada
77	12	Cantidad de llamadas	Contador unitario (siempre 1) que permite sumar el total de llamadas
78	13	Fecha	Fecha calendario en formato DATE
79	13	Año	Año de la fecha (ej: 2003, 2004, 2005)
80	13	Mes	Número del mes (1-12)
81	13	Nombre del mes	Nombre del mes en español (Enero, Febrero, ...)
82	13	Trimestre	Número del trimestre (1-4)
83	13	Día	Día del mes (1-31)
84	13	Día de la semana	Número del día de la semana (0=Lunes, 6=Domingo)
85	13	Nombre del día	Nombre del día en español (Lunes, Martes, ...)
86	16	Fuente	Indica de qué sistema proviene el empleado: classicmodels o customerservice
87	17	Territorio	Región comercial asignada a la oficina: NA, EMEA, APAC o Japan
\.


--
-- Data for Name: business_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_entity (entity_id, entity_name, description, data_domain) FROM stdin;
1	Cliente	Persona u organización que compra productos de la empresa	Ventas y Servicio al Cliente
2	Empleado	Persona que trabaja en la empresa como representante de ventas o en el call center	Recursos Humanos
3	Producto	Modelo a escala vendido por la empresa (autos, motos, aviones, barcos, trenes)	Catálogo de Productos
4	Orden de Compra	Pedido realizado por un cliente que contiene uno o más productos	Ventas
5	Detalle de Orden	Línea individual dentro de una orden que especifica producto, cantidad y precio	Ventas
6	Pago	Transacción de pago realizada por un cliente	Finanzas
7	Oficina	Sucursal física de la empresa en una ciudad y país	Operaciones
8	Línea de Producto	Categoría que agrupa productos similares (Classic Cars, Motorcycles, etc.)	Catálogo de Productos
9	Llamada al Call Center	Registro de una llamada recibida en el centro de atención sobre un producto	Servicio al Cliente
10	Producto por Cliente	Relación que indica qué productos tiene asociados cada cliente en servicio	Servicio al Cliente
11	Hecho de Ventas	Registro de cada línea de venta con sus medidas: cantidad, precio unitario y monto total. Permite análisis de ventas por cliente, producto, empleado, oficina y tiempo.	Almacén de Datos
12	Hecho de Llamadas	Registro de cada llamada al call center con la cantidad como medida. Permite análisis de llamadas por cliente, producto, empleado y tiempo.	Almacén de Datos
13	Dimensión Tiempo	Perspectiva temporal para análisis. Incluye año, mes, trimestre, día de la semana. Compartida entre hechos de ventas y llamadas.	Almacén de Datos
14	Dimensión Cliente	Perspectiva de clientes para análisis. Integra datos de ambas fuentes originales en una sola tabla consolidada.	Almacén de Datos
15	Dimensión Producto	Perspectiva de productos para análisis. Incluye catálogo completo con línea, precios y stock.	Almacén de Datos
16	Dimensión Empleado	Perspectiva de empleados para análisis. Integra representantes de ventas y agentes de call center.	Almacén de Datos
17	Dimensión Oficina	Perspectiva geográfica para análisis. Permite analizar ventas por ubicación de oficina y territorio.	Almacén de Datos
\.


--
-- Data for Name: datasource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datasource (datasource_id, datasource_name, database_type, host, port, description) FROM stdin;
1	classicmodels	MySQL	127.0.0.1	3306	Base de datos de ordenes de compra, clientes, productos, representantes de ventas y pagos
2	customerservice	PostgreSQL	127.0.0.1	5433	Base de datos del call center con registro de llamadas, empleados y productos
3	datawarehouse	PostgreSQL	127.0.0.1	5432	Almacén de datos con modelo estrella: 2 tablas de hechos (ventas y llamadas) y 5 dimensiones (tiempo, cliente, producto, empleado, oficina)
\.


--
-- Data for Name: metadata_column; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metadata_column (column_id, table_id, column_name, data_type, column_type, is_nullable, is_primary_key, is_foreign_key, referenced_table, referenced_column, ordinal_position) FROM stdin;
1	1	customerNumber	int	int	NO	t	f	\N	\N	1
2	1	customerName	varchar	varchar(50)	NO	f	f	\N	\N	2
3	1	contactLastName	varchar	varchar(50)	NO	f	f	\N	\N	3
4	1	contactFirstName	varchar	varchar(50)	NO	f	f	\N	\N	4
5	1	phone	varchar	varchar(50)	NO	f	f	\N	\N	5
6	1	addressLine1	varchar	varchar(50)	NO	f	f	\N	\N	6
7	1	addressLine2	varchar	varchar(50)	YES	f	f	\N	\N	7
8	1	city	varchar	varchar(50)	NO	f	f	\N	\N	8
9	1	state	varchar	varchar(50)	YES	f	f	\N	\N	9
10	1	postalCode	varchar	varchar(15)	YES	f	f	\N	\N	10
11	1	country	varchar	varchar(50)	NO	f	f	\N	\N	11
12	1	salesRepEmployeeNumber	int	int	YES	f	t	employees	employeeNumber	12
13	1	creditLimit	decimal	decimal(10,2)	YES	f	f	\N	\N	13
14	2	employeeNumber	int	int	NO	t	f	\N	\N	1
15	2	lastName	varchar	varchar(50)	NO	f	f	\N	\N	2
16	2	firstName	varchar	varchar(50)	NO	f	f	\N	\N	3
17	2	extension	varchar	varchar(10)	NO	f	f	\N	\N	4
18	2	email	varchar	varchar(100)	NO	f	f	\N	\N	5
19	2	officeCode	varchar	varchar(10)	NO	f	t	offices	officeCode	6
20	2	reportsTo	int	int	YES	f	t	employees	employeeNumber	7
21	2	jobTitle	varchar	varchar(50)	NO	f	f	\N	\N	8
22	3	officeCode	varchar	varchar(10)	NO	t	f	\N	\N	1
23	3	city	varchar	varchar(50)	NO	f	f	\N	\N	2
24	3	phone	varchar	varchar(50)	NO	f	f	\N	\N	3
25	3	addressLine1	varchar	varchar(50)	NO	f	f	\N	\N	4
26	3	addressLine2	varchar	varchar(50)	YES	f	f	\N	\N	5
27	3	state	varchar	varchar(50)	YES	f	f	\N	\N	6
28	3	country	varchar	varchar(50)	NO	f	f	\N	\N	7
29	3	postalCode	varchar	varchar(15)	NO	f	f	\N	\N	8
30	3	territory	varchar	varchar(10)	NO	f	f	\N	\N	9
31	4	orderNumber	int	int	NO	t	t	orders	orderNumber	1
32	4	productCode	varchar	varchar(15)	NO	t	t	products	productCode	2
33	4	quantityOrdered	int	int	NO	f	f	\N	\N	3
34	4	priceEach	decimal	decimal(10,2)	NO	f	f	\N	\N	4
35	4	orderLineNumber	smallint	smallint	NO	f	f	\N	\N	5
36	5	orderNumber	int	int	NO	t	f	\N	\N	1
37	5	orderDate	date	date	NO	f	f	\N	\N	2
38	5	requiredDate	date	date	NO	f	f	\N	\N	3
39	5	shippedDate	date	date	YES	f	f	\N	\N	4
40	5	status	varchar	varchar(15)	NO	f	f	\N	\N	5
41	5	comments	text	text	YES	f	f	\N	\N	6
42	5	customerNumber	int	int	NO	f	t	customers	customerNumber	7
43	6	customerNumber	int	int	NO	t	t	customers	customerNumber	1
44	6	checkNumber	varchar	varchar(50)	NO	t	f	\N	\N	2
45	6	paymentDate	date	date	NO	f	f	\N	\N	3
46	6	amount	decimal	decimal(10,2)	NO	f	f	\N	\N	4
47	7	productLine	varchar	varchar(50)	NO	t	f	\N	\N	1
48	7	textDescription	varchar	varchar(4000)	YES	f	f	\N	\N	2
49	7	htmlDescription	mediumtext	mediumtext	YES	f	f	\N	\N	3
50	7	image	mediumblob	mediumblob	YES	f	f	\N	\N	4
51	8	productCode	varchar	varchar(15)	NO	t	f	\N	\N	1
52	8	productName	varchar	varchar(70)	NO	f	f	\N	\N	2
53	8	productLine	varchar	varchar(50)	NO	f	t	productlines	productLine	3
54	8	productScale	varchar	varchar(10)	NO	f	f	\N	\N	4
55	8	productVendor	varchar	varchar(50)	NO	f	f	\N	\N	5
56	8	productDescription	text	text	NO	f	f	\N	\N	6
57	8	quantityInStock	smallint	smallint	NO	f	f	\N	\N	7
58	8	buyPrice	decimal	decimal(10,2)	NO	f	f	\N	\N	8
59	8	MSRP	decimal	decimal(10,2)	NO	f	f	\N	\N	9
60	10	employeenumber	integer	integer	NO	f	t	cs_employees	employeenumber	1
61	10	customernumber	integer	integer	NO	f	t	cs_customers	customernumber	2
62	10	productcode	character varying	character varying(15)	NO	f	t	cs_products	productcode	3
63	10	text	character varying	character varying(200)	YES	f	f	\N	\N	4
64	10	date	timestamp without time zone	timestamp without time zone	NO	f	f	\N	\N	5
65	13	customernumber	integer	integer	NO	t	t	cs_customers	customernumber	1
66	13	productcode	character varying	character varying(15)	NO	t	t	cs_products	productcode	2
67	9	customernumber	integer	integer	NO	t	f	\N	\N	1
68	9	contactlastname	character varying	character varying(50)	YES	f	f	\N	\N	2
69	9	contactfirstname	character varying	character varying(50)	YES	f	f	\N	\N	3
70	9	phone	character varying	character varying(50)	YES	f	f	\N	\N	4
71	9	addressline1	character varying	character varying(50)	YES	f	f	\N	\N	5
72	9	addressline2	character varying	character varying(50)	YES	f	f	\N	\N	6
73	9	city	character varying	character varying(50)	YES	f	f	\N	\N	7
74	9	state	character varying	character varying(50)	YES	f	f	\N	\N	8
75	9	postalcode	character varying	character varying(15)	YES	f	f	\N	\N	9
76	9	country	character varying	character varying(50)	YES	f	f	\N	\N	10
77	11	employeenumber	integer	integer	NO	t	f	\N	\N	1
78	11	lastname	character varying	character varying(50)	YES	f	f	\N	\N	2
79	11	firstname	character varying	character varying(50)	YES	f	f	\N	\N	3
80	11	email	character varying	character varying(100)	YES	f	f	\N	\N	4
81	12	productcode	character varying	character varying(15)	NO	t	f	\N	\N	1
82	12	productname	character varying	character varying(70)	YES	f	f	\N	\N	2
83	12	productscale	character varying	character varying(10)	YES	f	f	\N	\N	3
84	12	productvendor	character varying	character varying(50)	YES	f	f	\N	\N	4
85	12	productdescription	text	text	YES	f	f	\N	\N	5
160	21	cliente_key	integer	integer	NO	t	f	\N	\N	1
161	21	customer_number	integer	integer	NO	f	f	\N	\N	2
162	21	customer_name	character varying	character varying(50)	YES	f	f	\N	\N	3
163	21	contact_last_name	character varying	character varying(50)	YES	f	f	\N	\N	4
164	21	contact_first_name	character varying	character varying(50)	YES	f	f	\N	\N	5
165	21	phone	character varying	character varying(50)	YES	f	f	\N	\N	6
166	21	address_line1	character varying	character varying(50)	YES	f	f	\N	\N	7
167	21	address_line2	character varying	character varying(50)	YES	f	f	\N	\N	8
168	21	city	character varying	character varying(50)	YES	f	f	\N	\N	9
169	21	state	character varying	character varying(50)	YES	f	f	\N	\N	10
170	21	postal_code	character varying	character varying(15)	YES	f	f	\N	\N	11
171	21	country	character varying	character varying(50)	YES	f	f	\N	\N	12
172	21	credit_limit	numeric	numeric	YES	f	f	\N	\N	13
173	21	sales_rep_employee_number	integer	integer	YES	f	f	\N	\N	14
174	24	empleado_key	integer	integer	NO	t	f	\N	\N	1
175	24	employee_number	integer	integer	NO	f	f	\N	\N	2
176	24	last_name	character varying	character varying(50)	YES	f	f	\N	\N	3
177	24	first_name	character varying	character varying(50)	YES	f	f	\N	\N	4
178	24	email	character varying	character varying(100)	YES	f	f	\N	\N	5
179	24	job_title	character varying	character varying(50)	YES	f	f	\N	\N	6
180	24	office_code	character varying	character varying(10)	YES	f	f	\N	\N	7
181	24	reports_to	integer	integer	YES	f	f	\N	\N	8
182	24	fuente	character varying	character varying(50)	YES	f	f	\N	\N	9
183	25	oficina_key	integer	integer	NO	t	f	\N	\N	1
184	25	office_code	character varying	character varying(10)	NO	f	f	\N	\N	2
185	25	city	character varying	character varying(50)	YES	f	f	\N	\N	3
186	25	phone	character varying	character varying(50)	YES	f	f	\N	\N	4
187	25	address_line1	character varying	character varying(50)	YES	f	f	\N	\N	5
188	25	address_line2	character varying	character varying(50)	YES	f	f	\N	\N	6
189	25	state	character varying	character varying(50)	YES	f	f	\N	\N	7
190	25	country	character varying	character varying(50)	YES	f	f	\N	\N	8
191	25	postal_code	character varying	character varying(15)	YES	f	f	\N	\N	9
192	25	territory	character varying	character varying(10)	YES	f	f	\N	\N	10
193	23	producto_key	integer	integer	NO	t	f	\N	\N	1
194	23	product_code	character varying	character varying(15)	NO	f	f	\N	\N	2
195	23	product_name	character varying	character varying(70)	YES	f	f	\N	\N	3
196	23	product_line	character varying	character varying(50)	YES	f	f	\N	\N	4
197	23	product_scale	character varying	character varying(10)	YES	f	f	\N	\N	5
198	23	product_vendor	character varying	character varying(50)	YES	f	f	\N	\N	6
199	23	product_description	text	text	YES	f	f	\N	\N	7
200	23	quantity_in_stock	integer	integer	YES	f	f	\N	\N	8
201	23	buy_price	numeric	numeric	YES	f	f	\N	\N	9
202	23	msrp	numeric	numeric	YES	f	f	\N	\N	10
203	26	tiempo_key	integer	integer	NO	t	f	\N	\N	1
204	26	fecha	date	date	NO	f	f	\N	\N	2
205	26	anio	integer	integer	NO	f	f	\N	\N	3
206	26	mes	integer	integer	NO	f	f	\N	\N	4
207	26	nombre_mes	character varying	character varying(20)	NO	f	f	\N	\N	5
208	26	trimestre	integer	integer	NO	f	f	\N	\N	6
209	26	dia	integer	integer	NO	f	f	\N	\N	7
210	26	dia_semana	integer	integer	NO	f	f	\N	\N	8
211	26	nombre_dia	character varying	character varying(20)	NO	f	f	\N	\N	9
212	27	llamada_id	integer	integer	NO	t	f	\N	\N	1
213	27	cliente_key	integer	integer	NO	f	t	dim_cliente	cliente_key	2
214	27	producto_key	integer	integer	NO	f	t	dim_producto	producto_key	3
215	27	empleado_key	integer	integer	NO	f	t	dim_empleado	empleado_key	4
216	27	tiempo_key	integer	integer	NO	f	t	dim_tiempo	tiempo_key	5
217	27	texto_llamada	character varying	character varying(200)	YES	f	f	\N	\N	6
218	27	cantidad_llamadas	integer	integer	NO	f	f	\N	\N	7
219	22	venta_id	integer	integer	NO	t	f	\N	\N	1
220	22	cliente_key	integer	integer	NO	f	t	dim_cliente	cliente_key	2
221	22	producto_key	integer	integer	NO	f	t	dim_producto	producto_key	3
222	22	empleado_key	integer	integer	YES	f	t	dim_empleado	empleado_key	4
223	22	oficina_key	integer	integer	YES	f	t	dim_oficina	oficina_key	5
224	22	tiempo_key	integer	integer	NO	f	t	dim_tiempo	tiempo_key	6
225	22	numero_orden	integer	integer	NO	f	f	\N	\N	7
226	22	estado_orden	character varying	character varying(15)	NO	f	f	\N	\N	8
227	22	fecha_orden	date	date	NO	f	f	\N	\N	9
228	22	fecha_requerida	date	date	YES	f	f	\N	\N	10
229	22	fecha_envio	date	date	YES	f	f	\N	\N	11
230	22	cantidad_ordenada	integer	integer	NO	f	f	\N	\N	12
231	22	precio_unitario	numeric	numeric	NO	f	f	\N	\N	13
232	22	monto_linea	numeric	numeric	NO	f	f	\N	\N	14
233	22	numero_linea	integer	integer	YES	f	f	\N	\N	15
\.


--
-- Data for Name: metadata_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metadata_table (table_id, datasource_id, table_name, row_count, description) FROM stdin;
1	1	customers	122	\N
2	1	employees	23	\N
3	1	offices	7	\N
4	1	orderdetails	2996	\N
5	1	orders	326	\N
6	1	payments	273	\N
7	1	productlines	7	\N
8	1	products	110	\N
9	2	cs_customers	122	\N
10	2	cs_customer_calls	108	\N
11	2	cs_employees	30	\N
12	2	cs_products	110	\N
13	2	cs_customer_products	101	\N
21	3	dim_cliente	122	Dimensión de clientes. Integra datos de classicmodels.customers (nombre comercial, crédito) con customerservice.cs_customers (contacto, dirección).
22	3	fact_ventas	8988	Tabla de hechos de ventas. Cada registro es una línea de detalle de una orden. Medidas: cantidad_ordenada, precio_unitario, monto_linea. 2,996 registros.
23	3	dim_producto	110	Dimensión de productos. Catálogo completo con línea de producto, precios y stock. Se nutre de classicmodels.products y productlines.
24	3	dim_empleado	53	Dimensión de empleados. Integra representantes de ventas (classicmodels) y agentes del call center (customerservice). 53 empleados en total.
25	3	dim_oficina	7	Dimensión de oficinas. Las 7 sucursales de la empresa con su ubicación y territorio comercial.
26	3	dim_tiempo	591	Dimensión de tiempo. Permite analizar datos por año, mes, trimestre y día. Generada a partir de las fechas de órdenes y llamadas.
27	3	fact_llamadas	324	Tabla de hechos de llamadas al call center. Cada registro es una llamada recibida. Medida: cantidad_llamadas. 108 registros.
\.


--
-- Data for Name: semantic_lineage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semantic_lineage (lineage_id, column_id, attribute_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	51	22
23	52	23
24	53	24
25	54	25
26	55	26
27	56	27
28	57	28
29	58	29
30	59	30
31	36	31
32	37	32
33	38	33
34	39	34
35	40	35
36	41	36
37	42	37
38	31	38
39	32	39
40	33	40
41	34	41
42	35	42
43	43	43
44	44	44
45	45	45
46	46	46
47	22	47
48	23	48
49	24	49
50	25	50
51	26	51
52	27	52
53	28	53
54	29	54
55	30	55
56	47	56
57	48	57
58	49	58
59	50	59
60	67	1
61	68	3
62	69	4
63	70	5
64	71	6
65	72	7
66	73	8
67	74	9
68	75	10
69	76	11
70	77	14
71	78	15
72	79	16
73	80	18
74	81	22
75	82	23
76	83	25
77	84	26
78	85	27
79	60	60
80	61	61
81	62	62
82	63	63
83	64	64
84	65	65
85	66	66
107	230	67
108	231	68
109	232	69
110	225	70
111	226	71
112	227	72
113	228	73
114	229	74
115	233	75
116	217	76
117	218	77
118	204	78
119	205	79
120	206	80
121	207	81
122	208	82
123	209	83
124	210	84
125	211	85
126	182	86
127	192	87
\.


--
-- Name: business_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_attribute_attribute_id_seq', 87, true);


--
-- Name: business_entity_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_entity_entity_id_seq', 17, true);


--
-- Name: datasource_datasource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasource_datasource_id_seq', 3, true);


--
-- Name: metadata_column_column_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metadata_column_column_id_seq', 233, true);


--
-- Name: metadata_table_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metadata_table_table_id_seq', 27, true);


--
-- Name: semantic_lineage_lineage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semantic_lineage_lineage_id_seq', 127, true);


--
-- Name: business_attribute business_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_attribute
    ADD CONSTRAINT business_attribute_pkey PRIMARY KEY (attribute_id);


--
-- Name: business_entity business_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_entity
    ADD CONSTRAINT business_entity_pkey PRIMARY KEY (entity_id);


--
-- Name: datasource datasource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasource
    ADD CONSTRAINT datasource_pkey PRIMARY KEY (datasource_id);


--
-- Name: metadata_column metadata_column_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_column
    ADD CONSTRAINT metadata_column_pkey PRIMARY KEY (column_id);


--
-- Name: metadata_table metadata_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_table
    ADD CONSTRAINT metadata_table_pkey PRIMARY KEY (table_id);


--
-- Name: semantic_lineage semantic_lineage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semantic_lineage
    ADD CONSTRAINT semantic_lineage_pkey PRIMARY KEY (lineage_id);


--
-- Name: business_attribute business_attribute_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_attribute
    ADD CONSTRAINT business_attribute_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.business_entity(entity_id);


--
-- Name: metadata_column metadata_column_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_column
    ADD CONSTRAINT metadata_column_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.metadata_table(table_id);


--
-- Name: metadata_table metadata_table_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata_table
    ADD CONSTRAINT metadata_table_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES public.datasource(datasource_id);


--
-- Name: semantic_lineage semantic_lineage_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semantic_lineage
    ADD CONSTRAINT semantic_lineage_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.business_attribute(attribute_id);


--
-- Name: semantic_lineage semantic_lineage_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semantic_lineage
    ADD CONSTRAINT semantic_lineage_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.metadata_column(column_id);


--
-- PostgreSQL database dump complete
--

\unrestrict bwa2yxR2Xpsr0GDoBVYB2BQxTbujfwWDwNdwklSeBsz1B05GVh70BDsGmLSdHGQ

