--
-- PostgreSQL database dump
--

\restrict YMNtT6A0KEWzYusqTonavYwy9HTaTPZLWyiXtyKqEGJH8hpYz1aRtauAVtTOMLL

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
-- Name: dim_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_cliente (
    cliente_key integer NOT NULL,
    customer_number integer NOT NULL,
    customer_name character varying(50),
    contact_last_name character varying(50),
    contact_first_name character varying(50),
    phone character varying(50),
    address_line1 character varying(50),
    address_line2 character varying(50),
    city character varying(50),
    state character varying(50),
    postal_code character varying(15),
    country character varying(50),
    credit_limit numeric(10,2),
    sales_rep_employee_number integer
);


ALTER TABLE public.dim_cliente OWNER TO postgres;

--
-- Name: dim_cliente_cliente_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_cliente_cliente_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_cliente_cliente_key_seq OWNER TO postgres;

--
-- Name: dim_cliente_cliente_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_cliente_cliente_key_seq OWNED BY public.dim_cliente.cliente_key;


--
-- Name: dim_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_empleado (
    empleado_key integer NOT NULL,
    employee_number integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    email character varying(100),
    job_title character varying(50),
    office_code character varying(10),
    reports_to integer,
    fuente character varying(50)
);


ALTER TABLE public.dim_empleado OWNER TO postgres;

--
-- Name: dim_empleado_empleado_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_empleado_empleado_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_empleado_empleado_key_seq OWNER TO postgres;

--
-- Name: dim_empleado_empleado_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_empleado_empleado_key_seq OWNED BY public.dim_empleado.empleado_key;


--
-- Name: dim_oficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_oficina (
    oficina_key integer NOT NULL,
    office_code character varying(10) NOT NULL,
    city character varying(50),
    phone character varying(50),
    address_line1 character varying(50),
    address_line2 character varying(50),
    state character varying(50),
    country character varying(50),
    postal_code character varying(15),
    territory character varying(10)
);


ALTER TABLE public.dim_oficina OWNER TO postgres;

--
-- Name: dim_oficina_oficina_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_oficina_oficina_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_oficina_oficina_key_seq OWNER TO postgres;

--
-- Name: dim_oficina_oficina_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_oficina_oficina_key_seq OWNED BY public.dim_oficina.oficina_key;


--
-- Name: dim_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_producto (
    producto_key integer NOT NULL,
    product_code character varying(15) NOT NULL,
    product_name character varying(70),
    product_line character varying(50),
    product_scale character varying(10),
    product_vendor character varying(50),
    product_description text,
    quantity_in_stock integer,
    buy_price numeric(10,2),
    msrp numeric(10,2)
);


ALTER TABLE public.dim_producto OWNER TO postgres;

--
-- Name: dim_producto_producto_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_producto_producto_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_producto_producto_key_seq OWNER TO postgres;

--
-- Name: dim_producto_producto_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_producto_producto_key_seq OWNED BY public.dim_producto.producto_key;


--
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tiempo (
    tiempo_key integer NOT NULL,
    fecha date NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    nombre_mes character varying(20) NOT NULL,
    trimestre integer NOT NULL,
    dia integer NOT NULL,
    dia_semana integer NOT NULL,
    nombre_dia character varying(20) NOT NULL
);


ALTER TABLE public.dim_tiempo OWNER TO postgres;

--
-- Name: dim_tiempo_tiempo_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tiempo_tiempo_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tiempo_tiempo_key_seq OWNER TO postgres;

--
-- Name: dim_tiempo_tiempo_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tiempo_tiempo_key_seq OWNED BY public.dim_tiempo.tiempo_key;


--
-- Name: fact_llamadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_llamadas (
    llamada_id integer NOT NULL,
    cliente_key integer NOT NULL,
    producto_key integer NOT NULL,
    empleado_key integer NOT NULL,
    tiempo_key integer NOT NULL,
    texto_llamada character varying(200),
    cantidad_llamadas integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.fact_llamadas OWNER TO postgres;

--
-- Name: fact_llamadas_llamada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_llamadas_llamada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_llamadas_llamada_id_seq OWNER TO postgres;

--
-- Name: fact_llamadas_llamada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_llamadas_llamada_id_seq OWNED BY public.fact_llamadas.llamada_id;


--
-- Name: fact_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_ventas (
    venta_id integer NOT NULL,
    cliente_key integer NOT NULL,
    producto_key integer NOT NULL,
    empleado_key integer,
    oficina_key integer,
    tiempo_key integer NOT NULL,
    numero_orden integer NOT NULL,
    estado_orden character varying(15) NOT NULL,
    fecha_orden date NOT NULL,
    fecha_requerida date,
    fecha_envio date,
    cantidad_ordenada integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    monto_linea numeric(10,2) NOT NULL,
    numero_linea integer
);


ALTER TABLE public.fact_ventas OWNER TO postgres;

--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_ventas_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_ventas_venta_id_seq OWNER TO postgres;

--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_ventas_venta_id_seq OWNED BY public.fact_ventas.venta_id;


--
-- Name: dim_cliente cliente_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente ALTER COLUMN cliente_key SET DEFAULT nextval('public.dim_cliente_cliente_key_seq'::regclass);


--
-- Name: dim_empleado empleado_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_empleado ALTER COLUMN empleado_key SET DEFAULT nextval('public.dim_empleado_empleado_key_seq'::regclass);


--
-- Name: dim_oficina oficina_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_oficina ALTER COLUMN oficina_key SET DEFAULT nextval('public.dim_oficina_oficina_key_seq'::regclass);


--
-- Name: dim_producto producto_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto ALTER COLUMN producto_key SET DEFAULT nextval('public.dim_producto_producto_key_seq'::regclass);


--
-- Name: dim_tiempo tiempo_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo ALTER COLUMN tiempo_key SET DEFAULT nextval('public.dim_tiempo_tiempo_key_seq'::regclass);


--
-- Name: fact_llamadas llamada_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas ALTER COLUMN llamada_id SET DEFAULT nextval('public.fact_llamadas_llamada_id_seq'::regclass);


--
-- Name: fact_ventas venta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas ALTER COLUMN venta_id SET DEFAULT nextval('public.fact_ventas_venta_id_seq'::regclass);


--
-- Data for Name: dim_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_cliente (cliente_key, customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, credit_limit, sales_rep_employee_number) FROM stdin;
1	103	Atelier graphique	Schmitt	Carine 	40.32.2555	54, rue Royale	\N	Nantes	\N	44000	France	21000.00	1370
2	112	Signal Gift Stores	King	Jean	7025551838	8489 Strong St.	\N	Las Vegas	NV	83030	USA	71800.00	1166
3	114	Australian Collectors, Co.	Ferguson	Peter	03 9520 4555	636 St Kilda Road	Level 3	Melbourne	Victoria	3004	Australia	117300.00	1611
4	119	La Rochelle Gifts	Labrune	Janine 	40.67.8555	67, rue des Cinquante Otages	\N	Nantes	\N	44000	France	118200.00	1370
5	121	Baane Mini Imports	Bergulfsen	Jonas 	07-98 9555	Erling Skakkes gate 78	\N	Stavern	\N	4110	Norway	81700.00	1504
6	124	Mini Gifts Distributors Ltd.	Nelson	Susan	4155551450	5677 Strong St.	\N	San Rafael	CA	97562	USA	210500.00	1165
7	125	Havel & Zbyszek Co	Piestrzeniewicz	Zbyszek 	(26) 642-7555	ul. Filtrowa 68	\N	Warszawa	\N	01-012	Poland	0.00	\N
8	128	Blauer See Auto, Co.	Keitel	Roland	+49 69 66 90 2555	Lyonerstr. 34	\N	Frankfurt	\N	60528	Germany	59700.00	1504
9	129	Mini Wheels Co.	Murphy	Julie	6505555787	5557 North Pendale Street	\N	San Francisco	CA	94217	USA	64600.00	1165
10	131	Land of Toys Inc.	Lee	Kwai	2125557818	897 Long Airport Avenue	\N	NYC	NY	10022	USA	114900.00	1323
11	141	Euro+ Shopping Channel	Freyre	Diego 	(91) 555 94 44	C/ Moralzarzal, 86	\N	Madrid	\N	28034	Spain	227600.00	1370
12	144	Volvo Model Replicas, Co	Berglund	Christina 	0921-12 3555	Berguvsvägen  8	\N	Luleå	\N	S-958 22	Sweden	53100.00	1504
13	145	Danish Wholesale Imports	Petersen	Jytte 	31 12 3555	Vinbæltet 34	\N	Kobenhavn	\N	1734	Denmark	83400.00	1401
14	146	Saveley & Henriot, Co.	Saveley	Mary 	78.32.5555	2, rue du Commerce	\N	Lyon	\N	69004	France	123900.00	1337
15	148	Dragon Souveniers, Ltd.	Natividad	Eric	+65 221 7555	Bronz Sok.	Bronz Apt. 3/6 Tesvikiye	Singapore	\N	079903	Singapore	103800.00	1621
16	151	Muscle Machine Inc	Young	Jeff	2125557413	4092 Furth Circle	Suite 400	NYC	NY	10022	USA	138500.00	1286
17	157	Diecast Classics Inc.	Leong	Kelvin	2155551555	7586 Pompton St.	\N	Allentown	PA	70267	USA	100600.00	1216
18	161	Technics Stores Inc.	Hashimoto	Juri	6505556809	9408 Furth Circle	\N	Burlingame	CA	94217	USA	84600.00	1165
19	166	Handji Gifts& Co	Victorino	Wendy	+65 224 1555	106 Linden Road Sandown	2nd Floor	Singapore	\N	069045	Singapore	97900.00	1612
20	167	Herkku Gifts	Oeztan	Veysel	+47 2267 3215	Brehmen St. 121	PR 334 Sentrum	Bergen	\N	N 5804	Norway	96800.00	1504
21	168	American Souvenirs Inc	Franco	Keith	2035557845	149 Spinnaker Dr.	Suite 101	New Haven	CT	97823	USA	0.00	1286
22	169	Porto Imports Co.	de Castro	Isabel 	(1) 356-5555	Estrada da saúde n. 58	\N	Lisboa	\N	1756	Portugal	0.00	\N
23	171	Daedalus Designs Imports	Rancé	Martine 	20.16.1555	184, chaussée de Tournai	\N	Lille	\N	59000	France	82900.00	1370
24	172	La Corne D'abondance, Co.	Bertrand	Marie	(1) 42.34.2555	265, boulevard Charonne	\N	Paris	\N	75012	France	84300.00	1337
25	173	Cambridge Collectables Co.	Tseng	Jerry	6175555555	4658 Baden Av.	\N	Cambridge	MA	51247	USA	43400.00	1188
26	175	Gift Depot Inc.	King	Julie	2035552570	25593 South Bay Ln.	\N	Bridgewater	CT	97562	USA	84300.00	1323
27	177	Osaka Souveniers Co.	Kentary	Mory	+81 06 6342 5555	1-6-20 Dojima	\N	Kita-ku	Osaka	 530-0003	Japan	81200.00	1621
28	181	Vitachrome Inc.	Frick	Michael	2125551500	2678 Kingston Rd.	Suite 101	NYC	NY	10022	USA	76400.00	1286
29	186	Toys of Finland, Co.	Karttunen	Matti	90-224 8555	Keskuskatu 45	\N	Helsinki	\N	21240	Finland	96500.00	1501
30	187	AV Stores, Co.	Ashworth	Rachel	(171) 555-1555	Fauntleroy Circus	\N	Manchester	\N	EC2 5NT	UK	136800.00	1501
31	189	Clover Collections, Co.	Cassidy	Dean	+353 1862 1555	25 Maiden Lane	Floor No. 4	Dublin	\N	2	Ireland	69400.00	1504
32	198	Auto-Moto Classics Inc.	Taylor	Leslie	6175558428	16780 Pompton St.	\N	Brickhaven	MA	58339	USA	23000.00	1216
33	201	UK Collectables, Ltd.	Devon	Elizabeth	(171) 555-2282	12, Berkeley Gardens Blvd	\N	Liverpool	\N	WX1 6LT	UK	92700.00	1501
34	202	Canadian Gift Exchange Network	Tamuri	Yoshi 	(604) 555-3392	1900 Oak St.	\N	Vancouver	BC	V3F 2K1	Canada	90300.00	1323
35	204	Online Mini Collectables	Barajas	Miguel	6175557555	7635 Spinnaker Dr.	\N	Brickhaven	MA	58339	USA	68700.00	1188
36	205	Toys4GrownUps.com	Young	Julie	6265557265	78934 Hillside Dr.	\N	Pasadena	CA	90003	USA	90700.00	1166
37	206	Asian Shopping Network, Co	Walker	Brydey	+612 9411 1555	Suntec Tower Three	8 Temasek	Singapore	\N	038988	Singapore	0.00	\N
38	209	Mini Caravy	Citeaux	Frédérique 	88.60.1555	24, place Kléber	\N	Strasbourg	\N	67000	France	53800.00	1370
39	211	King Kong Collectables, Co.	Gao	Mike	+852 2251 1555	Bank of China Tower	1 Garden Road	Central Hong Kong	\N	\N	Hong Kong	58600.00	1621
40	216	Enaco Distributors	Saavedra	Eduardo 	(93) 203 4555	Rambla de Cataluña, 23	\N	Barcelona	\N	08022	Spain	60300.00	1702
41	219	Boards & Toys Co.	Young	Mary	3105552373	4097 Douglas Av.	\N	Glendale	CA	92561	USA	11000.00	1166
42	223	Natürlich Autos	Kloss	Horst 	0372-555188	Taucherstraße 10	\N	Cunewalde	\N	01307	Germany	0.00	\N
43	227	Heintze Collectables	Ibsen	Palle	86 21 3555	Smagsloget 45	\N	Århus	\N	8200	Denmark	120800.00	1401
44	233	Québec Home Shopping Network	Fresnière	Jean 	(514) 555-8054	43 rue St. Laurent	\N	Montréal	Québec	H1J 1C3	Canada	48700.00	1286
45	237	ANG Resellers	Camino	Alejandra 	(91) 745 6555	Gran Vía, 1	\N	Madrid	\N	28001	Spain	0.00	\N
46	239	Collectable Mini Designs Co.	Thompson	Valarie	7605558146	361 Furth Circle	\N	San Diego	CA	91217	USA	105000.00	1166
47	240	giftsbymail.co.uk	Bennett	Helen 	(198) 555-8888	Garden House	Crowther Way 23	Cowes	Isle of Wight	PO31 7PJ	UK	93900.00	1501
48	242	Alpha Cognac	Roulet	Annette 	61.77.6555	1 rue Alsace-Lorraine	\N	Toulouse	\N	31000	France	61100.00	1370
49	247	Messner Shopping Network	Messner	Renate 	069-0555984	Magazinweg 7	\N	Frankfurt	\N	60528	Germany	0.00	\N
50	249	Amica Models & Co.	Accorti	Paolo 	011-4988555	Via Monte Bianco 34	\N	Torino	\N	10100	Italy	113000.00	1401
51	250	Lyon Souveniers	Da Silva	Daniel	+33 1 46 62 7555	27 rue du Colonel Pierre Avia	\N	Paris	\N	75508	France	68100.00	1337
52	256	Auto Associés & Cie.	Tonini	Daniel 	30.59.8555	67, avenue de l'Europe	\N	Versailles	\N	78000	France	77900.00	1370
53	259	Toms Spezialitäten, Ltd	Pfalzheim	Henriette 	0221-5554327	Mehrheimerstr. 369	\N	Köln	\N	50739	Germany	120400.00	1504
54	260	Royal Canadian Collectables, Ltd.	Lincoln	Elizabeth 	(604) 555-4555	23 Tsawassen Blvd.	\N	Tsawassen	BC	T2F 8M4	Canada	89600.00	1323
55	273	Franken Gifts, Co	Franken	Peter 	089-0877555	Berliner Platz 43	\N	München	\N	80805	Germany	0.00	\N
56	276	Anna's Decorations, Ltd	O'Hara	Anna	02 9936 8555	201 Miller Street	Level 15	North Sydney	NSW	2060	Australia	107800.00	1611
57	278	Rovelli Gifts	Rovelli	Giovanni 	035-640555	Via Ludovico il Moro 22	\N	Bergamo	\N	24100	Italy	119600.00	1401
58	282	Souveniers And Things Co.	Huxley	Adrian	+61 2 9495 8555	Monitor Money Building	815 Pacific Hwy	Chatswood	NSW	2067	Australia	93300.00	1611
59	286	Marta's Replicas Co.	Hernandez	Marta	6175558555	39323 Spinnaker Dr.	\N	Cambridge	MA	51247	USA	123700.00	1216
60	293	BG&E Collectables	Harrison	Ed	+41 26 425 50 01	Rte des Arsenaux 41 	\N	Fribourg	\N	1700	Switzerland	0.00	\N
61	298	Vida Sport, Ltd	Holz	Mihael	0897-034555	Grenzacherweg 237	\N	Genève	\N	1203	Switzerland	141300.00	1702
62	299	Norway Gifts By Mail, Co.	Klaeboe	Jan	+47 2212 1555	Drammensveien 126A	PB 211 Sentrum	Oslo	\N	N 0106	Norway	95100.00	1504
63	303	Schuyler Imports	Schuyler	Bradley	+31 20 491 9555	Kingsfordweg 151	\N	Amsterdam	\N	1043 GR	Netherlands	0.00	\N
64	307	Der Hund Imports	Andersen	Mel	030-0074555	Obere Str. 57	\N	Berlin	\N	12209	Germany	0.00	\N
65	311	Oulu Toy Supplies, Inc.	Koskitalo	Pirkko	981-443655	Torikatu 38	\N	Oulu	\N	90110	Finland	90500.00	1501
66	314	Petit Auto	Dewey	Catherine 	(02) 5554 67	Rue Joseph-Bens 532	\N	Bruxelles	\N	B-1180	Belgium	79900.00	1401
67	319	Mini Classics	Frick	Steve	9145554562	3758 North Pendale Street	\N	White Plains	NY	24067	USA	102700.00	1323
68	320	Mini Creations Ltd.	Huang	Wing	5085559555	4575 Hillside Dr.	\N	New Bedford	MA	50553	USA	94500.00	1188
69	321	Corporate Gift Ideas Co.	Brown	Julie	6505551386	7734 Strong St.	\N	San Francisco	CA	94217	USA	105000.00	1165
70	323	Down Under Souveniers, Inc	Graham	Mike	+64 9 312 5555	162-164 Grafton Road	Level 2	Auckland  	\N	\N	New Zealand	88000.00	1612
71	324	Stylish Desk Decors, Co.	Brown	Ann 	(171) 555-0297	35 King George	\N	London	\N	WX3 6FW	UK	77000.00	1501
72	328	Tekni Collectables Inc.	Brown	William	2015559350	7476 Moss Rd.	\N	Newark	NJ	94019	USA	43000.00	1323
73	333	Australian Gift Network, Co	Calaghan	Ben	61-7-3844-6555	31 Duncan St. West End	\N	South Brisbane	Queensland	4101	Australia	51600.00	1611
74	334	Suominen Souveniers	Suominen	Kalle	+358 9 8045 555	Software Engineering Center	SEC Oy	Espoo	\N	FIN-02271	Finland	98800.00	1501
75	335	Cramer Spezialitäten, Ltd	Cramer	Philip 	0555-09555	Maubelstr. 90	\N	Brandenburg	\N	14776	Germany	0.00	\N
76	339	Classic Gift Ideas, Inc	Cervantes	Francisca	2155554695	782 First Street	\N	Philadelphia	PA	71270	USA	81100.00	1188
77	344	CAF Imports	Fernandez	Jesus	+34 913 728 555	Merchants House	27-30 Merchant's Quay	Madrid	\N	28023	Spain	59600.00	1702
78	347	Men 'R' US Retailers, Ltd.	Chandler	Brian	2155554369	6047 Douglas Av.	\N	Los Angeles	CA	91003	USA	57700.00	1166
79	348	Asian Treasures, Inc.	McKenna	Patricia 	2967 555	8 Johnstown Road	\N	Cork	Co. Cork	\N	Ireland	0.00	\N
80	350	Marseille Mini Autos	Lebihan	Laurence 	91.24.4555	12, rue des Bouchers	\N	Marseille	\N	13008	France	65000.00	1337
81	353	Reims Collectables	Henriot	Paul 	26.47.1555	59 rue de l'Abbaye	\N	Reims	\N	51100	France	81100.00	1337
82	356	SAR Distributors, Co	Kuger	Armand	+27 21 550 3555	1250 Pretorius Street	\N	Hatfield	Pretoria	0028	South Africa	0.00	\N
83	357	GiftsForHim.com	MacKinlay	Wales	64-9-3763555	199 Great North Road	\N	Auckland	\N	\N	New Zealand	77700.00	1612
84	361	Kommission Auto	Josephs	Karin	0251-555259	Luisenstr. 48	\N	Münster	\N	44087	Germany	0.00	\N
85	362	Gifts4AllAges.com	Yoshido	Juri	6175559555	8616 Spinnaker Dr.	\N	Boston	MA	51003	USA	41900.00	1216
86	363	Online Diecast Creations Co.	Young	Dorothy	6035558647	2304 Long Airport Avenue	\N	Nashua	NH	62005	USA	114200.00	1216
87	369	Lisboa Souveniers, Inc	Rodriguez	Lino 	(1) 354-2555	Jardim das rosas n. 32	\N	Lisboa	\N	1675	Portugal	0.00	\N
88	376	Precious Collectables	Urs	Braun	0452-076555	Hauptstr. 29	\N	Bern	\N	3012	Switzerland	0.00	1702
89	379	Collectables For Less Inc.	Nelson	Allen	6175558555	7825 Douglas Av.	\N	Brickhaven	MA	58339	USA	70700.00	1188
90	381	Royale Belge	Cartrain	Pascale 	(071) 23 67 2555	Boulevard Tirou, 255	\N	Charleroi	\N	B-6000	Belgium	23500.00	1401
91	382	Salzburg Collectables	Pipps	Georg 	6562-9555	Geislweg 14	\N	Salzburg	\N	5020	Austria	71700.00	1401
92	385	Cruz & Sons Co.	Cruz	Arnold	+63 2 555 3587	15 McCallum Street	NatWest Center #13-03	Makati City	\N	1227 MM	Philippines	81500.00	1621
93	386	L'ordine Souveniers	Moroni	Maurizio 	0522-556555	Strada Provinciale 124	\N	Reggio Emilia	\N	42100	Italy	121400.00	1401
94	398	Tokyo Collectables, Ltd	Shimamura	Akiko	+81 3 3584 0555	2-2-8 Roppongi	\N	Minato-ku	Tokyo	106-0032	Japan	94400.00	1621
95	406	Auto Canal+ Petit	Perrier	Dominique	(1) 47.55.6555	25, rue Lauriston	\N	Paris	\N	75016	France	95000.00	1337
96	409	Stuttgart Collectable Exchange	Müller	Rita 	0711-555361	Adenauerallee 900	\N	Stuttgart	\N	70563	Germany	0.00	\N
97	412	Extreme Desk Decorations, Ltd	McRoy	Sarah	04 499 9555	101 Lambton Quay	Level 11	Wellington	\N	\N	New Zealand	86800.00	1612
98	415	Bavarian Collectables Imports, Co.	Donnermeyer	Michael	 +49 89 61 08 9555	Hansastr. 15	\N	Munich	\N	80686	Germany	77000.00	1504
99	424	Classic Legends Inc.	Hernandez	Maria	2125558493	5905 Pompton St.	Suite 750	NYC	NY	10022	USA	67500.00	1286
100	443	Feuer Online Stores, Inc	Feuer	Alexander 	0342-555176	Heerstr. 22	\N	Leipzig	\N	04179	Germany	0.00	\N
101	447	Gift Ideas Corp.	Lewis	Dan	2035554407	2440 Pompton St.	\N	Glendale	CT	97561	USA	49700.00	1323
102	448	Scandinavian Gift Ideas	Larsson	Martha	0695-34 6555	Åkergatan 24	\N	Bräcke	\N	S-844 67	Sweden	116400.00	1504
103	450	The Sharp Gifts Warehouse	Frick	Sue	4085553659	3086 Ingle Ln.	\N	San Jose	CA	94217	USA	77600.00	1165
104	452	Mini Auto Werke	Mendel	Roland 	7675-3555	Kirchgasse 6	\N	Graz	\N	8010	Austria	45300.00	1401
105	455	Super Scale Inc.	Murphy	Leslie	2035559545	567 North Pendale Street	\N	New Haven	CT	97823	USA	95400.00	1286
106	456	Microscale Inc.	Choi	Yu	2125551957	5290 North Pendale Street	Suite 200	NYC	NY	10022	USA	39800.00	1286
107	458	Corrida Auto Replicas, Ltd	Sommer	Martín 	(91) 555 22 82	C/ Araquil, 67	\N	Madrid	\N	28023	Spain	104600.00	1702
108	459	Warburg Exchange	Ottlieb	Sven 	0241-039123	Walserweg 21	\N	Aachen	\N	52066	Germany	0.00	\N
109	462	FunGiftIdeas.com	Benitez	Violeta	5085552555	1785 First Street	\N	New Bedford	MA	50553	USA	85800.00	1216
110	465	Anton Designs, Ltd.	Anton	Carmen	+34 913 728555	c/ Gobelas, 19-1 Urb. La Florida	\N	Madrid	\N	28023	Spain	0.00	\N
111	471	Australian Collectables, Ltd	Clenahan	Sean	61-9-3844-6555	7 Allen Street	\N	Glen Waverly	Victoria	3150	Australia	60300.00	1611
112	473	Frau da Collezione	Ricotti	Franco	+39 022515555	20093 Cologno Monzese	Alessandro Volta 16	Milan	\N	\N	Italy	34800.00	1401
113	475	West Coast Collectables Co.	Thompson	Steve	3105553722	3675 Furth Circle	\N	Burbank	CA	94019	USA	55400.00	1166
114	477	Mit Vergnügen & Co.	Moos	Hanna 	0621-08555	Forsterstr. 57	\N	Mannheim	\N	68306	Germany	0.00	\N
115	480	Kremlin Collectables, Co.	Semenov	Alexander 	+7 812 293 0521	2 Pobedy Square	\N	Saint Petersburg	\N	196143	Russia	0.00	\N
116	481	Raanan Stores, Inc	Altagar,G M	Raanan	+ 972 9 959 8555	3 Hagalim Blv.	\N	Herzlia	\N	47625	Israel	0.00	\N
117	484	Iberia Gift Imports, Corp.	Roel	José Pedro 	(95) 555 82 82	C/ Romero, 33	\N	Sevilla	\N	41101	Spain	65700.00	1702
118	486	Motor Mint Distributors Inc.	Salazar	Rosa	2155559857	11328 Douglas Av.	\N	Philadelphia	PA	71270	USA	72600.00	1323
119	487	Signal Collectibles Ltd.	Taylor	Sue	4155554312	2793 Furth Circle	\N	Brisbane	CA	94217	USA	60300.00	1165
120	489	Double Decker Gift Stores, Ltd	Smith	Thomas 	(171) 555-7555	120 Hanover Sq.	\N	London	\N	WA1 1DP	UK	43300.00	1501
121	495	Diecast Collectables	Franco	Valarie	6175552555	6251 Ingle Ln.	\N	Boston	MA	51003	USA	85100.00	1188
122	496	Kelly's Gift Shop	Snowden	Tony	+64 9 5555500	Arenales 1938 3'A'	\N	Auckland  	\N	\N	New Zealand	110000.00	1612
\.


--
-- Data for Name: dim_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_empleado (empleado_key, employee_number, last_name, first_name, email, job_title, office_code, reports_to, fuente) FROM stdin;
1	1002	Murphy	Diane	dmurphy@classicmodelcars.com	President	1	\N	classicmodels
2	1056	Patterson	Mary	mpatterso@classicmodelcars.com	VP Sales	1	1002	classicmodels
3	1076	Firrelli	Jeff	jfirrelli@classicmodelcars.com	VP Marketing	1	1002	classicmodels
4	1088	Patterson	William	wpatterson@classicmodelcars.com	Sales Manager (APAC)	6	1056	classicmodels
5	1102	Bondur	Gerard	gbondur@classicmodelcars.com	Sale Manager (EMEA)	4	1056	classicmodels
6	1143	Bow	Anthony	abow@classicmodelcars.com	Sales Manager (NA)	1	1056	classicmodels
7	1165	Jennings	Leslie	ljennings@classicmodelcars.com	Sales Rep	1	1143	classicmodels
8	1166	Thompson	Leslie	lthompson@classicmodelcars.com	Sales Rep	1	1143	classicmodels
9	1188	Firrelli	Julie	jfirrelli@classicmodelcars.com	Sales Rep	2	1143	classicmodels
10	1216	Patterson	Steve	spatterson@classicmodelcars.com	Sales Rep	2	1143	classicmodels
11	1286	Tseng	Foon Yue	ftseng@classicmodelcars.com	Sales Rep	3	1143	classicmodels
12	1323	Vanauf	George	gvanauf@classicmodelcars.com	Sales Rep	3	1143	classicmodels
13	1337	Bondur	Loui	lbondur@classicmodelcars.com	Sales Rep	4	1102	classicmodels
14	1370	Hernandez	Gerard	ghernande@classicmodelcars.com	Sales Rep	4	1102	classicmodels
15	1401	Castillo	Pamela	pcastillo@classicmodelcars.com	Sales Rep	4	1102	classicmodels
16	1501	Bott	Larry	lbott@classicmodelcars.com	Sales Rep	7	1102	classicmodels
17	1504	Jones	Barry	bjones@classicmodelcars.com	Sales Rep	7	1102	classicmodels
18	1611	Fixter	Andy	afixter@classicmodelcars.com	Sales Rep	6	1088	classicmodels
19	1612	Marsh	Peter	pmarsh@classicmodelcars.com	Sales Rep	6	1088	classicmodels
20	1619	King	Tom	tking@classicmodelcars.com	Sales Rep	6	1088	classicmodels
21	1621	Nishi	Mami	mnishi@classicmodelcars.com	Sales Rep	5	1056	classicmodels
22	1625	Kato	Yoshimi	ykato@classicmodelcars.com	Sales Rep	5	1621	classicmodels
23	1702	Gerard	Martin	mgerard@classicmodelcars.com	Sales Rep	4	1102	classicmodels
24	1	Lucas	Diego	lucas@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
25	2	Stockard	Fleta	stockard@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
26	3	Lindstedt	Margery	lindstedt@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
27	4	Nissen	Stacy	nissen@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
28	5	Gorecki	Camilla	gorecki@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
29	6	Schulze	Bernardina	schulze@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
30	7	Lamarre	Jan	lamarre@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
31	8	Flamm	Anissa	flamm@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
32	9	Whitehead	Palma	whitehead@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
33	10	Penhollow	Eric	penhollow@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
34	11	Matley	Josie	matley@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
35	12	Holliday	Carolyn	holliday@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
36	13	Grego	Fidela	grego@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
37	14	Starks	Wynona	starks@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
38	15	Roden	Chuck	roden@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
39	16	Caul	Glen	caul@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
40	17	Lyda	Hedwig	lyda@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
41	18	Minner	Angelique	minner@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
42	19	Barak	Mara	barak@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
43	20	Dall	Clarence	dall@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
44	21	Hilliker	Lorretta	hilliker@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
45	22	Rockefeller	Michaela	rockefeller@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
46	23	Habel	Claris	habel@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
47	24	Laforce	Kalyn	laforce@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
48	25	Throckmorton	Chante	throckmorton@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
49	26	Kornegay	Crystle	kornegay@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
50	27	Hassler	Karoline	hassler@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
51	28	Appell	Caron	appell@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
52	29	Wasinger	Sandra	wasinger@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
53	30	Gibbons	Keitha	gibbons@classicmodelcars.com	Call Center Agent	\N	\N	customerservice
\.


--
-- Data for Name: dim_oficina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_oficina (oficina_key, office_code, city, phone, address_line1, address_line2, state, country, postal_code, territory) FROM stdin;
1	1	San Francisco	+1 650 219 4782	100 Market Street	Suite 300	CA	USA	94080	NA
2	2	Boston	+1 215 837 0825	1550 Court Place	Suite 102	MA	USA	02107	NA
3	3	NYC	+1 212 555 3000	523 East 53rd Street	apt. 5A	NY	USA	10022	NA
4	4	Paris	+33 14 723 4404	43 Rue Jouffroy D'abbans	\N	\N	France	75017	EMEA
5	5	Tokyo	+81 33 224 5000	4-1 Kioicho	\N	Chiyoda-Ku	Japan	102-8578	Japan
6	6	Sydney	+61 2 9264 2451	5-11 Wentworth Avenue	Floor #2	\N	Australia	NSW 2010	APAC
7	7	London	+44 20 7877 2041	25 Old Broad Street	Level 7	\N	UK	EC2N 1HN	EMEA
\.


--
-- Data for Name: dim_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_producto (producto_key, product_code, product_name, product_line, product_scale, product_vendor, product_description, quantity_in_stock, buy_price, msrp) FROM stdin;
1	S10_1678	1969 Harley Davidson Ultimate Chopper	Motorcycles	1:10	Min Lin Diecast	This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.	7933	48.81	95.70
2	S10_1949	1952 Alpine Renault 1300	Classic Cars	1:10	Classic Metal Creations	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	7305	98.58	214.30
3	S10_2016	1996 Moto Guzzi 1100i	Motorcycles	1:10	Highway 66 Mini Classics	Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	6625	68.99	118.94
4	S10_4698	2003 Harley-Davidson Eagle Drag Bike	Motorcycles	1:10	Red Start Diecast	Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine	5582	91.02	193.66
5	S10_4757	1972 Alfa Romeo GTA	Classic Cars	1:10	Motor City Art Classics	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3252	85.68	136.00
6	S10_4962	1962 LanciaA Delta 16V	Classic Cars	1:10	Second Gear Diecast	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6791	103.42	147.74
7	S12_1099	1968 Ford Mustang	Classic Cars	1:12	Autoart Studio Design	Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.	68	95.34	194.57
8	S12_1108	2001 Ferrari Enzo	Classic Cars	1:12	Second Gear Diecast	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3619	95.59	207.80
9	S12_1666	1958 Setra Bus	Trucks and Buses	1:12	Welly Diecast Productions	Model features 30 windows, skylights & glare resistant glass, working steering system, original logos	1579	77.90	136.67
10	S12_2823	2002 Suzuki XREO	Motorcycles	1:12	Unimax Art Galleries	Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	9997	66.27	150.62
11	S12_3148	1969 Corvair Monza	Classic Cars	1:18	Welly Diecast Productions	1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll	6906	89.14	151.08
12	S12_3380	1968 Dodge Charger	Classic Cars	1:12	Welly Diecast Productions	1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black	9123	75.16	117.44
13	S12_3891	1969 Ford Falcon	Classic Cars	1:12	Second Gear Diecast	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	1049	83.05	173.02
14	S12_3990	1970 Plymouth Hemi Cuda	Classic Cars	1:12	Studio M Art Models	Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.	5663	31.92	79.80
15	S12_4473	1957 Chevy Pickup	Trucks and Buses	1:12	Exoto Designs	1:12 scale die-cast about 20" long Hood opens, Rubber wheels	6125	55.70	118.50
16	S12_4675	1969 Dodge Charger	Classic Cars	1:12	Welly Diecast Productions	Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.	7323	58.73	115.16
17	S18_1097	1940 Ford Pickup Truck	Trucks and Buses	1:18	Studio M Art Models	This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box	2613	58.33	116.67
18	S18_1129	1993 Mazda RX-7	Classic Cars	1:18	Highway 66 Mini Classics	This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.	3975	83.51	141.54
19	S18_1342	1937 Lincoln Berline	Vintage Cars	1:18	Motor City Art Classics	Features opening engine cover, doors, trunk, and fuel filler cap. Color black	8693	60.62	102.74
20	S18_1367	1936 Mercedes-Benz 500K Special Roadster	Vintage Cars	1:18	Studio M Art Models	This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.	8635	24.26	53.91
21	S18_1589	1965 Aston Martin DB5	Classic Cars	1:18	Classic Metal Creations	Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.	9042	65.96	124.44
22	S18_1662	1980s Black Hawk Helicopter	Planes	1:18	Red Start Diecast	1:18 scale replica of actual Army's UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.	5330	77.27	157.69
23	S18_1749	1917 Grand Touring Sedan	Vintage Cars	1:18	Welly Diecast Productions	This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.	2724	86.70	170.00
24	S18_1889	1948 Porsche 356-A Roadster	Classic Cars	1:18	Gearbox Collectibles	This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	8826	53.90	77.00
25	S18_1984	1995 Honda Civic	Classic Cars	1:18	Min Lin Diecast	This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.	9772	93.89	142.25
26	S18_2238	1998 Chrysler Plymouth Prowler	Classic Cars	1:18	Gearbox Collectibles	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	4724	101.51	163.73
27	S18_2248	1911 Ford Town Car	Vintage Cars	1:18	Motor City Art Classics	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.	540	33.30	60.54
28	S18_2319	1964 Mercedes Tour Bus	Trucks and Buses	1:18	Unimax Art Galleries	Exact replica. 100+ parts. working steering system, original logos	8258	74.86	122.73
29	S18_2325	1932 Model A Ford J-Coupe	Vintage Cars	1:18	Autoart Studio Design	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine	9354	58.48	127.13
30	S18_2432	1926 Ford Fire Engine	Trucks and Buses	1:18	Carousel DieCast Legends	Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.	2018	24.92	60.77
31	S18_2581	P-51-D Mustang	Planes	1:72	Gearbox Collectibles	Has retractable wheels and comes with a stand	992	49.00	84.48
32	S18_2625	1936 Harley Davidson El Knucklehead	Motorcycles	1:18	Welly Diecast Productions	Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.	4357	24.23	60.57
33	S18_2795	1928 Mercedes-Benz SSK	Vintage Cars	1:18	Gearbox Collectibles	This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.	548	72.56	168.75
34	S18_2870	1999 Indy 500 Monte Carlo SS	Classic Cars	1:18	Red Start Diecast	Features include opening and closing doors. Color: Red	8164	56.76	132.00
35	S18_2949	1913 Ford Model T Speedster	Vintage Cars	1:18	Carousel DieCast Legends	This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.	4189	60.78	101.31
36	S18_2957	1934 Ford V8 Coupe	Vintage Cars	1:18	Min Lin Diecast	Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System	5649	34.35	62.46
37	S18_3029	1999 Yamaha Speed Boat	Ships	1:18	Min Lin Diecast	Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	4259	51.61	86.02
38	S18_3136	18th Century Vintage Horse Carriage	Vintage Cars	1:18	Red Start Diecast	Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.	5992	60.74	104.72
39	S18_3140	1903 Ford Model A	Vintage Cars	1:18	Unimax Art Galleries	Features opening trunk,  working steering system	3913	68.30	136.59
40	S18_3232	1992 Ferrari 360 Spider red	Classic Cars	1:18	Unimax Art Galleries	his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	8347	77.90	169.34
41	S18_3233	1985 Toyota Supra	Classic Cars	1:18	Highway 66 Mini Classics	This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box	7733	57.01	107.57
42	S18_3259	Collectable Wooden Train	Trains	1:18	Carousel DieCast Legends	Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.	6450	67.56	100.84
43	S18_3278	1969 Dodge Super Bee	Classic Cars	1:18	Min Lin Diecast	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	1917	49.05	80.41
44	S18_3320	1917 Maxwell Touring Car	Vintage Cars	1:18	Exoto Designs	Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System	7913	57.54	99.21
45	S18_3482	1976 Ford Gran Torino	Classic Cars	1:18	Gearbox Collectibles	Highly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.	9127	73.49	146.99
46	S18_3685	1948 Porsche Type 356 Roadster	Classic Cars	1:18	Gearbox Collectibles	This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.	8990	62.16	141.28
47	S18_3782	1957 Vespa GS150	Motorcycles	1:18	Studio M Art Models	Features rotating wheels , working kick stand. Comes with stand.	7689	32.95	62.17
48	S18_3856	1941 Chevrolet Special Deluxe Cabriolet	Vintage Cars	1:18	Exoto Designs	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.	2378	64.58	105.87
49	S18_4027	1970 Triumph Spitfire	Classic Cars	1:18	Min Lin Diecast	Features include opening and closing doors. Color: White.	5545	91.92	143.62
50	S18_4409	1932 Alfa Romeo 8C2300 Spider Sport	Vintage Cars	1:18	Exoto Designs	This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.	6553	43.26	92.03
51	S18_4522	1904 Buick Runabout	Vintage Cars	1:18	Exoto Designs	Features opening trunk,  working steering system	8290	52.66	87.77
52	S18_4600	1940s Ford truck	Trucks and Buses	1:18	Motor City Art Classics	This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940's Pick-Up truck is painted in classic dark green color, and features rotating wheels.	3128	84.76	121.08
53	S18_4668	1939 Cadillac Limousine	Vintage Cars	1:18	Studio M Art Models	Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles	6645	23.14	50.31
54	S18_4721	1957 Corvette Convertible	Classic Cars	1:18	Classic Metal Creations	1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.	1249	69.93	148.80
55	S18_4933	1957 Ford Thunderbird	Classic Cars	1:18	Studio M Art Models	This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.	3209	34.21	71.27
56	S24_1046	1970 Chevy Chevelle SS 454	Classic Cars	1:24	Unimax Art Galleries	This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.	1005	49.24	73.49
57	S24_1444	1970 Dodge Coronet	Classic Cars	1:24	Highway 66 Mini Classics	1:24 scale die-cast about 18" long doors open, hood opens and rubber wheels	4074	32.37	57.80
58	S24_1578	1997 BMW R 1100 S	Motorcycles	1:24	Autoart Studio Design	Detailed scale replica with working suspension and constructed from over 70 parts	7003	60.86	112.70
59	S24_1628	1966 Shelby Cobra 427 S/C	Classic Cars	1:24	Carousel DieCast Legends	This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it's own display case.	8197	29.18	50.31
60	S24_1785	1928 British Royal Navy Airplane	Planes	1:24	Classic Metal Creations	Official logos and insignias	3627	66.74	109.42
61	S24_1937	1939 Chevrolet Deluxe Coupe	Vintage Cars	1:24	Motor City Art Classics	This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.	7332	22.57	33.19
62	S24_2000	1960 BSA Gold Star DBD34	Motorcycles	1:24	Highway 66 Mini Classics	Detailed scale replica with working suspension and constructed from over 70 parts	15	37.32	76.17
63	S24_2011	18th century schooner	Ships	1:24	Carousel DieCast Legends	All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.	1898	82.34	122.89
64	S24_2022	1938 Cadillac V-16 Presidential Limousine	Vintage Cars	1:24	Classic Metal Creations	This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.	2847	20.61	44.80
65	S24_2300	1962 Volkswagen Microbus	Trucks and Buses	1:24	Autoart Studio Design	This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.	2327	61.34	127.79
66	S24_2360	1982 Ducati 900 Monster	Motorcycles	1:24	Highway 66 Mini Classics	Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand	6840	47.10	69.26
67	S24_2766	1949 Jaguar XK 120	Classic Cars	1:24	Classic Metal Creations	Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	2350	47.25	90.87
68	S24_2840	1958 Chevy Corvette Limited Edition	Classic Cars	1:24	Carousel DieCast Legends	The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.	2542	15.91	35.36
69	S24_2841	1900s Vintage Bi-Plane	Planes	1:24	Autoart Studio Design	Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.	5942	34.25	68.51
70	S24_2887	1952 Citroen-15CV	Classic Cars	1:24	Exoto Designs	Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.	1452	72.82	117.44
71	S24_2972	1982 Lamborghini Diablo	Classic Cars	1:24	Second Gear Diecast	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	7723	16.24	37.76
72	S24_3151	1912 Ford Model T Delivery Wagon	Vintage Cars	1:24	Min Lin Diecast	This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.	9173	46.91	88.51
73	S24_3191	1969 Chevrolet Camaro Z28	Classic Cars	1:24	Exoto Designs	1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.	4695	50.51	85.61
74	S24_3371	1971 Alpine Renault 1600s	Classic Cars	1:24	Welly Diecast Productions	This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	7995	38.58	61.23
75	S24_3420	1937 Horch 930V Limousine	Vintage Cars	1:24	Autoart Studio Design	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system	2902	26.30	65.75
76	S24_3432	2002 Chevy Corvette	Classic Cars	1:24	Gearbox Collectibles	The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.	9446	62.11	107.08
77	S24_3816	1940 Ford Delivery Sedan	Vintage Cars	1:24	Carousel DieCast Legends	Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.	6621	48.64	83.86
78	S24_3856	1956 Porsche 356A Coupe	Classic Cars	1:18	Classic Metal Creations	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6600	98.30	140.43
79	S24_3949	Corsair F4U ( Bird Cage)	Planes	1:24	Second Gear Diecast	Has retractable wheels and comes with a stand. Official logos and insignias.	6812	29.34	68.24
80	S24_3969	1936 Mercedes Benz 500k Roadster	Vintage Cars	1:24	Red Start Diecast	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.	2081	21.75	41.03
81	S24_4048	1992 Porsche Cayenne Turbo Silver	Classic Cars	1:24	Exoto Designs	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	6582	69.78	118.28
82	S24_4258	1936 Chrysler Airflow	Vintage Cars	1:24	Second Gear Diecast	Features opening trunk,  working steering system. Color dark green.	4710	57.46	97.39
83	S24_4278	1900s Vintage Tri-Plane	Planes	1:24	Unimax Art Galleries	Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.	2756	36.23	72.45
84	S24_4620	1961 Chevrolet Impala	Classic Cars	1:18	Classic Metal Creations	This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.	7869	32.33	80.84
85	S32_1268	1980’s GM Manhattan Express	Trucks and Buses	1:32	Motor City Art Classics	This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.	5099	53.93	96.31
86	S32_1374	1997 BMW F650 ST	Motorcycles	1:32	Exoto Designs	Features official die-struck logos and baked enamel finish. Comes with stand.	178	66.92	99.89
87	S32_2206	1982 Ducati 996 R	Motorcycles	1:32	Gearbox Collectibles	Features rotating wheels , working kick stand. Comes with stand.	9241	24.14	40.23
88	S32_2509	1954 Greyhound Scenicruiser	Trucks and Buses	1:32	Classic Metal Creations	Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos	2874	25.98	54.11
89	S32_3207	1950's Chicago Surface Lines Streetcar	Trains	1:32	Gearbox Collectibles	This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).	8601	26.72	62.14
90	S32_3522	1996 Peterbilt 379 Stake Bed with Outrigger	Trucks and Buses	1:32	Red Start Diecast	This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab	814	33.61	64.64
91	S32_4289	1928 Ford Phaeton Deluxe	Vintage Cars	1:32	Highway 66 Mini Classics	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system	136	33.02	68.79
92	S32_4485	1974 Ducati 350 Mk3 Desmo	Motorcycles	1:32	Second Gear Diecast	This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand	3341	56.13	102.05
93	S50_1341	1930 Buick Marquette Phaeton	Vintage Cars	1:50	Studio M Art Models	Features opening trunk,  working steering system	7062	27.06	43.64
94	S50_1392	Diamond T620 Semi-Skirted Tanker	Trucks and Buses	1:50	Highway 66 Mini Classics	This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.	1016	68.29	115.75
95	S50_1514	1962 City of Detroit Streetcar	Trains	1:50	Classic Metal Creations	This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).	1645	37.49	58.58
96	S50_4713	2002 Yamaha YZR M1	Motorcycles	1:50	Autoart Studio Design	Features rotating wheels , working kick stand. Comes with stand.	600	34.17	81.36
97	S700_1138	The Schooner Bluenose	Ships	1:700	Autoart Studio Design	All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.	1897	34.00	66.67
98	S700_1691	American Airlines: B767-300	Planes	1:700	Min Lin Diecast	Exact replia with official logos and insignias and retractable wheels	5841	51.15	91.34
99	S700_1938	The Mayflower	Ships	1:700	Studio M Art Models	Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.	737	43.30	86.61
100	S700_2047	HMS Bounty	Ships	1:700	Unimax Art Galleries	Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	3501	39.83	90.52
101	S700_2466	America West Airlines B757-200	Planes	1:700	Motor City Art Classics	Official logos and insignias. Working steering system. Rotating jet engines	9653	68.80	99.72
102	S700_2610	The USS Constitution Ship	Ships	1:700	Red Start Diecast	All wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.	7083	33.97	72.28
103	S700_2824	1982 Camaro Z28	Classic Cars	1:18	Carousel DieCast Legends	Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2" Long.	6934	46.53	101.15
104	S700_2834	ATA: B757-300	Planes	1:700	Highway 66 Mini Classics	Exact replia with official logos and insignias and retractable wheels	7106	59.33	118.65
105	S700_3167	F/A 18 Hornet 1/72	Planes	1:72	Motor City Art Classics	10" Wingspan with retractable landing gears.Comes with pilot	551	54.40	80.00
106	S700_3505	The Titanic	Ships	1:700	Carousel DieCast Legends	Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.	1956	51.09	100.17
107	S700_3962	The Queen Mary	Ships	1:700	Welly Diecast Productions	Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	5088	53.63	99.31
108	S700_4002	American Airlines: MD-11S	Planes	1:700	Second Gear Diecast	Polished finish. Exact replia with official logos and insignias and retractable wheels	8820	36.27	74.03
109	S72_1253	Boeing X-32A JSF	Planes	1:72	Motor City Art Classics	10" Wingspan with retractable landing gears.Comes with pilot	4857	32.77	49.66
110	S72_3212	Pont Yacht	Ships	1:72	Unimax Art Galleries	Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged	414	33.30	54.60
\.


--
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tiempo (tiempo_key, fecha, anio, mes, nombre_mes, trimestre, dia, dia_semana, nombre_dia) FROM stdin;
1	2003-01-06	2003	1	Enero	1	6	0	Lunes
2	2003-01-09	2003	1	Enero	1	9	3	Jueves
3	2003-01-10	2003	1	Enero	1	10	4	Viernes
4	2003-01-11	2003	1	Enero	1	11	5	Sábado
5	2003-01-13	2003	1	Enero	1	13	0	Lunes
6	2003-01-14	2003	1	Enero	1	14	1	Martes
7	2003-01-18	2003	1	Enero	1	18	5	Sábado
8	2003-01-29	2003	1	Enero	1	29	2	Miércoles
9	2003-01-31	2003	1	Enero	1	31	4	Viernes
10	2003-02-01	2003	2	Febrero	1	1	5	Sábado
11	2003-02-02	2003	2	Febrero	1	2	6	Domingo
12	2003-02-07	2003	2	Febrero	1	7	4	Viernes
13	2003-02-09	2003	2	Febrero	1	9	6	Domingo
14	2003-02-11	2003	2	Febrero	1	11	1	Martes
15	2003-02-12	2003	2	Febrero	1	12	2	Miércoles
16	2003-02-17	2003	2	Febrero	1	17	0	Lunes
17	2003-02-19	2003	2	Febrero	1	19	2	Miércoles
18	2003-02-21	2003	2	Febrero	1	21	4	Viernes
19	2003-02-24	2003	2	Febrero	1	24	0	Lunes
20	2003-02-26	2003	2	Febrero	1	26	2	Miércoles
21	2003-03-03	2003	3	Marzo	1	3	0	Lunes
22	2003-03-07	2003	3	Marzo	1	7	4	Viernes
23	2003-03-08	2003	3	Marzo	1	8	5	Sábado
24	2003-03-10	2003	3	Marzo	1	10	0	Lunes
25	2003-03-11	2003	3	Marzo	1	11	1	Martes
26	2003-03-12	2003	3	Marzo	1	12	2	Miércoles
27	2003-03-18	2003	3	Marzo	1	18	1	Martes
28	2003-03-19	2003	3	Marzo	1	19	2	Miércoles
29	2003-03-20	2003	3	Marzo	1	20	3	Jueves
30	2003-03-24	2003	3	Marzo	1	24	0	Lunes
31	2003-03-25	2003	3	Marzo	1	25	1	Martes
32	2003-03-26	2003	3	Marzo	1	26	2	Miércoles
33	2003-03-27	2003	3	Marzo	1	27	3	Jueves
34	2003-03-29	2003	3	Marzo	1	29	5	Sábado
35	2003-03-30	2003	3	Marzo	1	30	6	Domingo
36	2003-03-31	2003	3	Marzo	1	31	0	Lunes
37	2003-04-01	2003	4	Abril	2	1	1	Martes
38	2003-04-02	2003	4	Abril	2	2	2	Miércoles
39	2003-04-03	2003	4	Abril	2	3	3	Jueves
40	2003-04-04	2003	4	Abril	2	4	4	Viernes
41	2003-04-07	2003	4	Abril	2	7	0	Lunes
42	2003-04-11	2003	4	Abril	2	11	4	Viernes
43	2003-04-12	2003	4	Abril	2	12	5	Sábado
44	2003-04-13	2003	4	Abril	2	13	6	Domingo
45	2003-04-16	2003	4	Abril	2	16	2	Miércoles
46	2003-04-17	2003	4	Abril	2	17	3	Jueves
47	2003-04-19	2003	4	Abril	2	19	5	Sábado
48	2003-04-21	2003	4	Abril	2	21	0	Lunes
49	2003-04-24	2003	4	Abril	2	24	3	Jueves
50	2003-04-26	2003	4	Abril	2	26	5	Sábado
51	2003-04-27	2003	4	Abril	2	27	6	Domingo
52	2003-04-28	2003	4	Abril	2	28	0	Lunes
53	2003-04-29	2003	4	Abril	2	29	1	Martes
54	2003-05-01	2003	5	Mayo	2	1	3	Jueves
55	2003-05-02	2003	5	Mayo	2	2	4	Viernes
56	2003-05-05	2003	5	Mayo	2	5	0	Lunes
57	2003-05-06	2003	5	Mayo	2	6	1	Martes
58	2003-05-07	2003	5	Mayo	2	7	2	Miércoles
59	2003-05-08	2003	5	Mayo	2	8	3	Jueves
60	2003-05-13	2003	5	Mayo	2	13	1	Martes
61	2003-05-15	2003	5	Mayo	2	15	3	Jueves
62	2003-05-16	2003	5	Mayo	2	16	4	Viernes
63	2003-05-20	2003	5	Mayo	2	20	1	Martes
64	2003-05-21	2003	5	Mayo	2	21	2	Miércoles
65	2003-05-22	2003	5	Mayo	2	22	3	Jueves
66	2003-05-24	2003	5	Mayo	2	24	5	Sábado
67	2003-05-25	2003	5	Mayo	2	25	6	Domingo
68	2003-05-27	2003	5	Mayo	2	27	1	Martes
69	2003-05-28	2003	5	Mayo	2	28	2	Miércoles
70	2003-05-29	2003	5	Mayo	2	29	3	Jueves
71	2003-06-02	2003	6	Junio	2	2	0	Lunes
72	2003-06-03	2003	6	Junio	2	3	1	Martes
73	2003-06-04	2003	6	Junio	2	4	2	Miércoles
74	2003-06-06	2003	6	Junio	2	6	4	Viernes
75	2003-06-07	2003	6	Junio	2	7	5	Sábado
76	2003-06-09	2003	6	Junio	2	9	0	Lunes
77	2003-06-11	2003	6	Junio	2	11	2	Miércoles
78	2003-06-12	2003	6	Junio	2	12	3	Jueves
79	2003-06-14	2003	6	Junio	2	14	5	Sábado
80	2003-06-16	2003	6	Junio	2	16	0	Lunes
81	2003-06-18	2003	6	Junio	2	18	2	Miércoles
82	2003-06-21	2003	6	Junio	2	21	5	Sábado
83	2003-06-24	2003	6	Junio	2	24	1	Martes
84	2003-06-25	2003	6	Junio	2	25	2	Miércoles
85	2003-06-27	2003	6	Junio	2	27	4	Viernes
86	2003-06-28	2003	6	Junio	2	28	5	Sábado
87	2003-07-01	2003	7	Julio	3	1	1	Martes
88	2003-07-02	2003	7	Julio	3	2	2	Miércoles
89	2003-07-03	2003	7	Julio	3	3	3	Jueves
90	2003-07-04	2003	7	Julio	3	4	4	Viernes
91	2003-07-05	2003	7	Julio	3	5	5	Sábado
92	2003-07-06	2003	7	Julio	3	6	6	Domingo
93	2003-07-07	2003	7	Julio	3	7	0	Lunes
94	2003-07-10	2003	7	Julio	3	10	3	Jueves
95	2003-07-12	2003	7	Julio	3	12	5	Sábado
96	2003-07-13	2003	7	Julio	3	13	6	Domingo
97	2003-07-14	2003	7	Julio	3	14	0	Lunes
98	2003-07-16	2003	7	Julio	3	16	2	Miércoles
99	2003-07-20	2003	7	Julio	3	20	6	Domingo
100	2003-07-21	2003	7	Julio	3	21	0	Lunes
101	2003-07-23	2003	7	Julio	3	23	2	Miércoles
102	2003-07-24	2003	7	Julio	3	24	3	Jueves
103	2003-07-30	2003	7	Julio	3	30	2	Miércoles
104	2003-08-01	2003	8	Agosto	3	1	4	Viernes
105	2003-08-02	2003	8	Agosto	3	2	5	Sábado
106	2003-08-04	2003	8	Agosto	3	4	0	Lunes
107	2003-08-06	2003	8	Agosto	3	6	2	Miércoles
108	2003-08-08	2003	8	Agosto	3	8	4	Viernes
109	2003-08-09	2003	8	Agosto	3	9	5	Sábado
110	2003-08-10	2003	8	Agosto	3	10	6	Domingo
111	2003-08-11	2003	8	Agosto	3	11	0	Lunes
112	2003-08-12	2003	8	Agosto	3	12	1	Martes
113	2003-08-13	2003	8	Agosto	3	13	2	Miércoles
114	2003-08-14	2003	8	Agosto	3	14	3	Jueves
115	2003-08-15	2003	8	Agosto	3	15	4	Viernes
116	2003-08-16	2003	8	Agosto	3	16	5	Sábado
117	2003-08-18	2003	8	Agosto	3	18	0	Lunes
118	2003-08-21	2003	8	Agosto	3	21	3	Jueves
119	2003-08-24	2003	8	Agosto	3	24	6	Domingo
120	2003-08-25	2003	8	Agosto	3	25	0	Lunes
121	2003-08-31	2003	8	Agosto	3	31	6	Domingo
122	2003-09-02	2003	9	Septiembre	3	2	1	Martes
123	2003-09-03	2003	9	Septiembre	3	3	2	Miércoles
124	2003-09-05	2003	9	Septiembre	3	5	4	Viernes
125	2003-09-06	2003	9	Septiembre	3	6	5	Sábado
126	2003-09-07	2003	9	Septiembre	3	7	6	Domingo
127	2003-09-09	2003	9	Septiembre	3	9	1	Martes
128	2003-09-11	2003	9	Septiembre	3	11	3	Jueves
129	2003-09-12	2003	9	Septiembre	3	12	4	Viernes
130	2003-09-13	2003	9	Septiembre	3	13	5	Sábado
131	2003-09-14	2003	9	Septiembre	3	14	6	Domingo
132	2003-09-15	2003	9	Septiembre	3	15	0	Lunes
133	2003-09-17	2003	9	Septiembre	3	17	2	Miércoles
134	2003-09-18	2003	9	Septiembre	3	18	3	Jueves
135	2003-09-19	2003	9	Septiembre	3	19	4	Viernes
136	2003-09-21	2003	9	Septiembre	3	21	6	Domingo
137	2003-09-24	2003	9	Septiembre	3	24	2	Miércoles
138	2003-09-25	2003	9	Septiembre	3	25	3	Jueves
139	2003-09-27	2003	9	Septiembre	3	27	5	Sábado
140	2003-09-28	2003	9	Septiembre	3	28	6	Domingo
141	2003-09-30	2003	9	Septiembre	3	30	1	Martes
142	2003-10-01	2003	10	Octubre	4	1	2	Miércoles
143	2003-10-02	2003	10	Octubre	4	2	3	Jueves
144	2003-10-03	2003	10	Octubre	4	3	4	Viernes
145	2003-10-04	2003	10	Octubre	4	4	5	Sábado
146	2003-10-05	2003	10	Octubre	4	5	6	Domingo
147	2003-10-06	2003	10	Octubre	4	6	0	Lunes
148	2003-10-07	2003	10	Octubre	4	7	1	Martes
149	2003-10-08	2003	10	Octubre	4	8	2	Miércoles
150	2003-10-09	2003	10	Octubre	4	9	3	Jueves
151	2003-10-10	2003	10	Octubre	4	10	4	Viernes
152	2003-10-11	2003	10	Octubre	4	11	5	Sábado
153	2003-10-12	2003	10	Octubre	4	12	6	Domingo
154	2003-10-13	2003	10	Octubre	4	13	0	Lunes
155	2003-10-14	2003	10	Octubre	4	14	1	Martes
156	2003-10-15	2003	10	Octubre	4	15	2	Miércoles
157	2003-10-16	2003	10	Octubre	4	16	3	Jueves
158	2003-10-17	2003	10	Octubre	4	17	4	Viernes
159	2003-10-18	2003	10	Octubre	4	18	5	Sábado
160	2003-10-19	2003	10	Octubre	4	19	6	Domingo
161	2003-10-20	2003	10	Octubre	4	20	0	Lunes
162	2003-10-21	2003	10	Octubre	4	21	1	Martes
163	2003-10-22	2003	10	Octubre	4	22	2	Miércoles
164	2003-10-23	2003	10	Octubre	4	23	3	Jueves
165	2003-10-24	2003	10	Octubre	4	24	4	Viernes
166	2003-10-25	2003	10	Octubre	4	25	5	Sábado
167	2003-10-26	2003	10	Octubre	4	26	6	Domingo
168	2003-10-27	2003	10	Octubre	4	27	0	Lunes
169	2003-10-28	2003	10	Octubre	4	28	1	Martes
170	2003-10-30	2003	10	Octubre	4	30	3	Jueves
171	2003-10-31	2003	10	Octubre	4	31	4	Viernes
172	2003-11-01	2003	11	Noviembre	4	1	5	Sábado
173	2003-11-03	2003	11	Noviembre	4	3	0	Lunes
174	2003-11-04	2003	11	Noviembre	4	4	1	Martes
175	2003-11-05	2003	11	Noviembre	4	5	2	Miércoles
176	2003-11-06	2003	11	Noviembre	4	6	3	Jueves
177	2003-11-07	2003	11	Noviembre	4	7	4	Viernes
178	2003-11-08	2003	11	Noviembre	4	8	5	Sábado
179	2003-11-09	2003	11	Noviembre	4	9	6	Domingo
180	2003-11-10	2003	11	Noviembre	4	10	0	Lunes
181	2003-11-11	2003	11	Noviembre	4	11	1	Martes
182	2003-11-12	2003	11	Noviembre	4	12	2	Miércoles
183	2003-11-13	2003	11	Noviembre	4	13	3	Jueves
184	2003-11-14	2003	11	Noviembre	4	14	4	Viernes
185	2003-11-15	2003	11	Noviembre	4	15	5	Sábado
186	2003-11-16	2003	11	Noviembre	4	16	6	Domingo
187	2003-11-17	2003	11	Noviembre	4	17	0	Lunes
188	2003-11-18	2003	11	Noviembre	4	18	1	Martes
189	2003-11-19	2003	11	Noviembre	4	19	2	Miércoles
190	2003-11-20	2003	11	Noviembre	4	20	3	Jueves
191	2003-11-21	2003	11	Noviembre	4	21	4	Viernes
192	2003-11-22	2003	11	Noviembre	4	22	5	Sábado
193	2003-11-23	2003	11	Noviembre	4	23	6	Domingo
194	2003-11-24	2003	11	Noviembre	4	24	0	Lunes
195	2003-11-25	2003	11	Noviembre	4	25	1	Martes
196	2003-11-26	2003	11	Noviembre	4	26	2	Miércoles
197	2003-11-27	2003	11	Noviembre	4	27	3	Jueves
198	2003-11-28	2003	11	Noviembre	4	28	4	Viernes
199	2003-11-29	2003	11	Noviembre	4	29	5	Sábado
200	2003-11-30	2003	11	Noviembre	4	30	6	Domingo
201	2003-12-01	2003	12	Diciembre	4	1	0	Lunes
202	2003-12-02	2003	12	Diciembre	4	2	1	Martes
203	2003-12-03	2003	12	Diciembre	4	3	2	Miércoles
204	2003-12-04	2003	12	Diciembre	4	4	3	Jueves
205	2003-12-05	2003	12	Diciembre	4	5	4	Viernes
206	2003-12-06	2003	12	Diciembre	4	6	5	Sábado
207	2003-12-07	2003	12	Diciembre	4	7	6	Domingo
208	2003-12-08	2003	12	Diciembre	4	8	0	Lunes
209	2003-12-09	2003	12	Diciembre	4	9	1	Martes
210	2003-12-10	2003	12	Diciembre	4	10	2	Miércoles
211	2003-12-11	2003	12	Diciembre	4	11	3	Jueves
212	2003-12-13	2003	12	Diciembre	4	13	5	Sábado
213	2003-12-17	2003	12	Diciembre	4	17	2	Miércoles
214	2003-12-26	2003	12	Diciembre	4	26	4	Viernes
215	2004-01-02	2004	1	Enero	1	2	4	Viernes
216	2004-01-04	2004	1	Enero	1	4	6	Domingo
217	2004-01-07	2004	1	Enero	1	7	2	Miércoles
218	2004-01-09	2004	1	Enero	1	9	4	Viernes
219	2004-01-11	2004	1	Enero	1	11	6	Domingo
220	2004-01-12	2004	1	Enero	1	12	0	Lunes
221	2004-01-13	2004	1	Enero	1	13	1	Martes
222	2004-01-15	2004	1	Enero	1	15	3	Jueves
223	2004-01-16	2004	1	Enero	1	16	4	Viernes
224	2004-01-18	2004	1	Enero	1	18	6	Domingo
225	2004-01-20	2004	1	Enero	1	20	1	Martes
226	2004-01-22	2004	1	Enero	1	22	3	Jueves
227	2004-01-24	2004	1	Enero	1	24	5	Sábado
228	2004-01-25	2004	1	Enero	1	25	6	Domingo
229	2004-01-26	2004	1	Enero	1	26	0	Lunes
230	2004-01-27	2004	1	Enero	1	27	1	Martes
231	2004-01-28	2004	1	Enero	1	28	2	Miércoles
232	2004-01-29	2004	1	Enero	1	29	3	Jueves
233	2004-02-01	2004	2	Febrero	1	1	6	Domingo
234	2004-02-02	2004	2	Febrero	1	2	0	Lunes
235	2004-02-04	2004	2	Febrero	1	4	2	Miércoles
236	2004-02-06	2004	2	Febrero	1	6	4	Viernes
237	2004-02-08	2004	2	Febrero	1	8	6	Domingo
238	2004-02-09	2004	2	Febrero	1	9	0	Lunes
239	2004-02-10	2004	2	Febrero	1	10	1	Martes
240	2004-02-11	2004	2	Febrero	1	11	2	Miércoles
241	2004-02-12	2004	2	Febrero	1	12	3	Jueves
242	2004-02-14	2004	2	Febrero	1	14	5	Sábado
243	2004-02-16	2004	2	Febrero	1	16	0	Lunes
244	2004-02-17	2004	2	Febrero	1	17	1	Martes
245	2004-02-18	2004	2	Febrero	1	18	2	Miércoles
246	2004-02-19	2004	2	Febrero	1	19	3	Jueves
247	2004-02-20	2004	2	Febrero	1	20	4	Viernes
248	2004-02-21	2004	2	Febrero	1	21	5	Sábado
249	2004-02-22	2004	2	Febrero	1	22	6	Domingo
250	2004-02-24	2004	2	Febrero	1	24	1	Martes
251	2004-02-25	2004	2	Febrero	1	25	2	Miércoles
252	2004-02-26	2004	2	Febrero	1	26	3	Jueves
253	2004-02-27	2004	2	Febrero	1	27	4	Viernes
254	2004-02-29	2004	2	Febrero	1	29	6	Domingo
255	2004-03-01	2004	3	Marzo	1	1	0	Lunes
256	2004-03-02	2004	3	Marzo	1	2	1	Martes
257	2004-03-06	2004	3	Marzo	1	6	5	Sábado
258	2004-03-08	2004	3	Marzo	1	8	0	Lunes
259	2004-03-10	2004	3	Marzo	1	10	2	Miércoles
260	2004-03-11	2004	3	Marzo	1	11	3	Jueves
261	2004-03-12	2004	3	Marzo	1	12	4	Viernes
262	2004-03-13	2004	3	Marzo	1	13	5	Sábado
263	2004-03-15	2004	3	Marzo	1	15	0	Lunes
264	2004-03-16	2004	3	Marzo	1	16	1	Martes
265	2004-03-18	2004	3	Marzo	1	18	3	Jueves
266	2004-03-19	2004	3	Marzo	1	19	4	Viernes
267	2004-03-20	2004	3	Marzo	1	20	5	Sábado
268	2004-03-24	2004	3	Marzo	1	24	2	Miércoles
269	2004-03-25	2004	3	Marzo	1	25	3	Jueves
270	2004-03-26	2004	3	Marzo	1	26	4	Viernes
271	2004-03-29	2004	3	Marzo	1	29	0	Lunes
272	2004-03-30	2004	3	Marzo	1	30	1	Martes
273	2004-04-02	2004	4	Abril	2	2	4	Viernes
274	2004-04-03	2004	4	Abril	2	3	5	Sábado
275	2004-04-04	2004	4	Abril	2	4	6	Domingo
276	2004-04-05	2004	4	Abril	2	5	0	Lunes
277	2004-04-06	2004	4	Abril	2	6	1	Martes
278	2004-04-08	2004	4	Abril	2	8	3	Jueves
279	2004-04-09	2004	4	Abril	2	9	4	Viernes
280	2004-04-10	2004	4	Abril	2	10	5	Sábado
281	2004-04-11	2004	4	Abril	2	11	6	Domingo
282	2004-04-12	2004	4	Abril	2	12	0	Lunes
283	2004-04-13	2004	4	Abril	2	13	1	Martes
284	2004-04-16	2004	4	Abril	2	16	4	Viernes
285	2004-04-17	2004	4	Abril	2	17	5	Sábado
286	2004-04-18	2004	4	Abril	2	18	6	Domingo
287	2004-04-19	2004	4	Abril	2	19	0	Lunes
288	2004-04-20	2004	4	Abril	2	20	1	Martes
289	2004-04-21	2004	4	Abril	2	21	2	Miércoles
290	2004-04-25	2004	4	Abril	2	25	6	Domingo
291	2004-04-26	2004	4	Abril	2	26	0	Lunes
292	2004-04-28	2004	4	Abril	2	28	2	Miércoles
293	2004-04-29	2004	4	Abril	2	29	3	Jueves
294	2004-05-03	2004	5	Mayo	2	3	0	Lunes
295	2004-05-04	2004	5	Mayo	2	4	1	Martes
296	2004-05-05	2004	5	Mayo	2	5	2	Miércoles
297	2004-05-06	2004	5	Mayo	2	6	3	Jueves
298	2004-05-07	2004	5	Mayo	2	7	4	Viernes
299	2004-05-08	2004	5	Mayo	2	8	5	Sábado
300	2004-05-09	2004	5	Mayo	2	9	6	Domingo
301	2004-05-11	2004	5	Mayo	2	11	1	Martes
302	2004-05-12	2004	5	Mayo	2	12	2	Miércoles
303	2004-05-13	2004	5	Mayo	2	13	3	Jueves
304	2004-05-14	2004	5	Mayo	2	14	4	Viernes
305	2004-05-15	2004	5	Mayo	2	15	5	Sábado
306	2004-05-17	2004	5	Mayo	2	17	0	Lunes
307	2004-05-18	2004	5	Mayo	2	18	1	Martes
308	2004-05-19	2004	5	Mayo	2	19	2	Miércoles
309	2004-05-24	2004	5	Mayo	2	24	0	Lunes
310	2004-05-25	2004	5	Mayo	2	25	1	Martes
311	2004-05-26	2004	5	Mayo	2	26	2	Miércoles
312	2004-05-29	2004	5	Mayo	2	29	5	Sábado
313	2004-06-01	2004	6	Junio	2	1	1	Martes
314	2004-06-02	2004	6	Junio	2	2	2	Miércoles
315	2004-06-03	2004	6	Junio	2	3	3	Jueves
316	2004-06-04	2004	6	Junio	2	4	4	Viernes
317	2004-06-08	2004	6	Junio	2	8	1	Martes
318	2004-06-09	2004	6	Junio	2	9	2	Miércoles
319	2004-06-10	2004	6	Junio	2	10	3	Jueves
320	2004-06-12	2004	6	Junio	2	12	5	Sábado
321	2004-06-13	2004	6	Junio	2	13	6	Domingo
322	2004-06-14	2004	6	Junio	2	14	0	Lunes
323	2004-06-15	2004	6	Junio	2	15	1	Martes
324	2004-06-16	2004	6	Junio	2	16	2	Miércoles
325	2004-06-17	2004	6	Junio	2	17	3	Jueves
326	2004-06-19	2004	6	Junio	2	19	5	Sábado
327	2004-06-22	2004	6	Junio	2	22	1	Martes
328	2004-06-23	2004	6	Junio	2	23	2	Miércoles
329	2004-06-24	2004	6	Junio	2	24	3	Jueves
330	2004-06-25	2004	6	Junio	2	25	4	Viernes
331	2004-06-28	2004	6	Junio	2	28	0	Lunes
332	2004-06-30	2004	6	Junio	2	30	2	Miércoles
333	2004-07-01	2004	7	Julio	3	1	3	Jueves
334	2004-07-02	2004	7	Julio	3	2	4	Viernes
335	2004-07-04	2004	7	Julio	3	4	6	Domingo
336	2004-07-06	2004	7	Julio	3	6	1	Martes
337	2004-07-07	2004	7	Julio	3	7	2	Miércoles
338	2004-07-09	2004	7	Julio	3	9	4	Viernes
339	2004-07-10	2004	7	Julio	3	10	5	Sábado
340	2004-07-12	2004	7	Julio	3	12	0	Lunes
341	2004-07-14	2004	7	Julio	3	14	2	Miércoles
342	2004-07-16	2004	7	Julio	3	16	4	Viernes
343	2004-07-17	2004	7	Julio	3	17	5	Sábado
344	2004-07-18	2004	7	Julio	3	18	6	Domingo
345	2004-07-19	2004	7	Julio	3	19	0	Lunes
346	2004-07-20	2004	7	Julio	3	20	1	Martes
347	2004-07-21	2004	7	Julio	3	21	2	Miércoles
348	2004-07-22	2004	7	Julio	3	22	3	Jueves
349	2004-07-23	2004	7	Julio	3	23	4	Viernes
350	2004-07-24	2004	7	Julio	3	24	5	Sábado
351	2004-07-26	2004	7	Julio	3	26	0	Lunes
352	2004-07-27	2004	7	Julio	3	27	1	Martes
353	2004-07-28	2004	7	Julio	3	28	2	Miércoles
354	2004-07-29	2004	7	Julio	3	29	3	Jueves
355	2004-07-30	2004	7	Julio	3	30	4	Viernes
356	2004-08-02	2004	8	Agosto	3	2	0	Lunes
357	2004-08-04	2004	8	Agosto	3	4	2	Miércoles
358	2004-08-05	2004	8	Agosto	3	5	3	Jueves
359	2004-08-06	2004	8	Agosto	3	6	4	Viernes
360	2004-08-08	2004	8	Agosto	3	8	6	Domingo
361	2004-08-09	2004	8	Agosto	3	9	0	Lunes
362	2004-08-11	2004	8	Agosto	3	11	2	Miércoles
363	2004-08-12	2004	8	Agosto	3	12	3	Jueves
364	2004-08-15	2004	8	Agosto	3	15	6	Domingo
365	2004-08-16	2004	8	Agosto	3	16	0	Lunes
366	2004-08-17	2004	8	Agosto	3	17	1	Martes
367	2004-08-19	2004	8	Agosto	3	19	3	Jueves
368	2004-08-20	2004	8	Agosto	3	20	4	Viernes
369	2004-08-21	2004	8	Agosto	3	21	5	Sábado
370	2004-08-22	2004	8	Agosto	3	22	6	Domingo
371	2004-08-23	2004	8	Agosto	3	23	0	Lunes
372	2004-08-24	2004	8	Agosto	3	24	1	Martes
373	2004-08-26	2004	8	Agosto	3	26	3	Jueves
374	2004-08-27	2004	8	Agosto	3	27	4	Viernes
375	2004-08-28	2004	8	Agosto	3	28	5	Sábado
376	2004-08-29	2004	8	Agosto	3	29	6	Domingo
377	2004-08-30	2004	8	Agosto	3	30	0	Lunes
378	2004-08-31	2004	8	Agosto	3	31	1	Martes
379	2004-09-01	2004	9	Septiembre	3	1	2	Miércoles
380	2004-09-03	2004	9	Septiembre	3	3	4	Viernes
381	2004-09-04	2004	9	Septiembre	3	4	5	Sábado
382	2004-09-05	2004	9	Septiembre	3	5	6	Domingo
383	2004-09-06	2004	9	Septiembre	3	6	0	Lunes
384	2004-09-07	2004	9	Septiembre	3	7	1	Martes
385	2004-09-08	2004	9	Septiembre	3	8	2	Miércoles
386	2004-09-09	2004	9	Septiembre	3	9	3	Jueves
387	2004-09-10	2004	9	Septiembre	3	10	4	Viernes
388	2004-09-11	2004	9	Septiembre	3	11	5	Sábado
389	2004-09-13	2004	9	Septiembre	3	13	0	Lunes
390	2004-09-14	2004	9	Septiembre	3	14	1	Martes
391	2004-09-15	2004	9	Septiembre	3	15	2	Miércoles
392	2004-09-16	2004	9	Septiembre	3	16	3	Jueves
393	2004-09-17	2004	9	Septiembre	3	17	4	Viernes
394	2004-09-18	2004	9	Septiembre	3	18	5	Sábado
395	2004-09-21	2004	9	Septiembre	3	21	1	Martes
396	2004-09-22	2004	9	Septiembre	3	22	2	Miércoles
397	2004-09-25	2004	9	Septiembre	3	25	5	Sábado
398	2004-09-27	2004	9	Septiembre	3	27	0	Lunes
399	2004-09-28	2004	9	Septiembre	3	28	1	Martes
400	2004-09-30	2004	9	Septiembre	3	30	3	Jueves
401	2004-10-01	2004	10	Octubre	4	1	4	Viernes
402	2004-10-02	2004	10	Octubre	4	2	5	Sábado
403	2004-10-05	2004	10	Octubre	4	5	1	Martes
404	2004-10-06	2004	10	Octubre	4	6	2	Miércoles
405	2004-10-09	2004	10	Octubre	4	9	5	Sábado
406	2004-10-10	2004	10	Octubre	4	10	6	Domingo
407	2004-10-11	2004	10	Octubre	4	11	0	Lunes
408	2004-10-12	2004	10	Octubre	4	12	1	Martes
409	2004-10-13	2004	10	Octubre	4	13	2	Miércoles
410	2004-10-14	2004	10	Octubre	4	14	3	Jueves
411	2004-10-15	2004	10	Octubre	4	15	4	Viernes
412	2004-10-16	2004	10	Octubre	4	16	5	Sábado
413	2004-10-17	2004	10	Octubre	4	17	6	Domingo
414	2004-10-18	2004	10	Octubre	4	18	0	Lunes
415	2004-10-20	2004	10	Octubre	4	20	2	Miércoles
416	2004-10-21	2004	10	Octubre	4	21	3	Jueves
417	2004-10-22	2004	10	Octubre	4	22	4	Viernes
418	2004-10-23	2004	10	Octubre	4	23	5	Sábado
419	2004-10-24	2004	10	Octubre	4	24	6	Domingo
420	2004-10-25	2004	10	Octubre	4	25	0	Lunes
421	2004-10-26	2004	10	Octubre	4	26	1	Martes
422	2004-10-27	2004	10	Octubre	4	27	2	Miércoles
423	2004-10-28	2004	10	Octubre	4	28	3	Jueves
424	2004-10-29	2004	10	Octubre	4	29	4	Viernes
425	2004-10-30	2004	10	Octubre	4	30	5	Sábado
426	2004-10-31	2004	10	Octubre	4	31	6	Domingo
427	2004-11-01	2004	11	Noviembre	4	1	0	Lunes
428	2004-11-02	2004	11	Noviembre	4	2	1	Martes
429	2004-11-03	2004	11	Noviembre	4	3	2	Miércoles
430	2004-11-04	2004	11	Noviembre	4	4	3	Jueves
431	2004-11-05	2004	11	Noviembre	4	5	4	Viernes
432	2004-11-06	2004	11	Noviembre	4	6	5	Sábado
433	2004-11-07	2004	11	Noviembre	4	7	6	Domingo
434	2004-11-08	2004	11	Noviembre	4	8	0	Lunes
435	2004-11-09	2004	11	Noviembre	4	9	1	Martes
436	2004-11-10	2004	11	Noviembre	4	10	2	Miércoles
437	2004-11-11	2004	11	Noviembre	4	11	3	Jueves
438	2004-11-12	2004	11	Noviembre	4	12	4	Viernes
439	2004-11-13	2004	11	Noviembre	4	13	5	Sábado
440	2004-11-15	2004	11	Noviembre	4	15	0	Lunes
441	2004-11-16	2004	11	Noviembre	4	16	1	Martes
442	2004-11-17	2004	11	Noviembre	4	17	2	Miércoles
443	2004-11-18	2004	11	Noviembre	4	18	3	Jueves
444	2004-11-19	2004	11	Noviembre	4	19	4	Viernes
445	2004-11-20	2004	11	Noviembre	4	20	5	Sábado
446	2004-11-21	2004	11	Noviembre	4	21	6	Domingo
447	2004-11-22	2004	11	Noviembre	4	22	0	Lunes
448	2004-11-23	2004	11	Noviembre	4	23	1	Martes
449	2004-11-24	2004	11	Noviembre	4	24	2	Miércoles
450	2004-11-25	2004	11	Noviembre	4	25	3	Jueves
451	2004-11-26	2004	11	Noviembre	4	26	4	Viernes
452	2004-11-27	2004	11	Noviembre	4	27	5	Sábado
453	2004-11-28	2004	11	Noviembre	4	28	6	Domingo
454	2004-11-29	2004	11	Noviembre	4	29	0	Lunes
455	2004-11-30	2004	11	Noviembre	4	30	1	Martes
456	2004-12-01	2004	12	Diciembre	4	1	2	Miércoles
457	2004-12-02	2004	12	Diciembre	4	2	3	Jueves
458	2004-12-03	2004	12	Diciembre	4	3	4	Viernes
459	2004-12-04	2004	12	Diciembre	4	4	5	Sábado
460	2004-12-05	2004	12	Diciembre	4	5	6	Domingo
461	2004-12-07	2004	12	Diciembre	4	7	1	Martes
462	2004-12-08	2004	12	Diciembre	4	8	2	Miércoles
463	2004-12-09	2004	12	Diciembre	4	9	3	Jueves
464	2004-12-10	2004	12	Diciembre	4	10	4	Viernes
465	2004-12-11	2004	12	Diciembre	4	11	5	Sábado
466	2004-12-12	2004	12	Diciembre	4	12	6	Domingo
467	2004-12-13	2004	12	Diciembre	4	13	0	Lunes
468	2004-12-14	2004	12	Diciembre	4	14	1	Martes
469	2004-12-15	2004	12	Diciembre	4	15	2	Miércoles
470	2004-12-16	2004	12	Diciembre	4	16	3	Jueves
471	2004-12-17	2004	12	Diciembre	4	17	4	Viernes
472	2004-12-18	2004	12	Diciembre	4	18	5	Sábado
473	2004-12-20	2004	12	Diciembre	4	20	0	Lunes
474	2004-12-22	2004	12	Diciembre	4	22	2	Miércoles
475	2004-12-23	2004	12	Diciembre	4	23	3	Jueves
476	2004-12-24	2004	12	Diciembre	4	24	4	Viernes
477	2005-01-03	2005	1	Enero	1	3	0	Lunes
478	2005-01-05	2005	1	Enero	1	5	2	Miércoles
479	2005-01-06	2005	1	Enero	1	6	3	Jueves
480	2005-01-07	2005	1	Enero	1	7	4	Viernes
481	2005-01-09	2005	1	Enero	1	9	6	Domingo
482	2005-01-10	2005	1	Enero	1	10	0	Lunes
483	2005-01-11	2005	1	Enero	1	11	1	Martes
484	2005-01-12	2005	1	Enero	1	12	2	Miércoles
485	2005-01-16	2005	1	Enero	1	16	6	Domingo
486	2005-01-17	2005	1	Enero	1	17	0	Lunes
487	2005-01-18	2005	1	Enero	1	18	1	Martes
488	2005-01-19	2005	1	Enero	1	19	2	Miércoles
489	2005-01-20	2005	1	Enero	1	20	3	Jueves
490	2005-01-21	2005	1	Enero	1	21	4	Viernes
491	2005-01-23	2005	1	Enero	1	23	6	Domingo
492	2005-01-24	2005	1	Enero	1	24	0	Lunes
493	2005-01-25	2005	1	Enero	1	25	1	Martes
494	2005-01-26	2005	1	Enero	1	26	2	Miércoles
495	2005-01-27	2005	1	Enero	1	27	3	Jueves
496	2005-01-28	2005	1	Enero	1	28	4	Viernes
497	2005-01-31	2005	1	Enero	1	31	0	Lunes
498	2005-02-01	2005	2	Febrero	1	1	1	Martes
499	2005-02-02	2005	2	Febrero	1	2	2	Miércoles
500	2005-02-03	2005	2	Febrero	1	3	3	Jueves
501	2005-02-05	2005	2	Febrero	1	5	5	Sábado
502	2005-02-06	2005	2	Febrero	1	6	6	Domingo
503	2005-02-08	2005	2	Febrero	1	8	1	Martes
504	2005-02-09	2005	2	Febrero	1	9	2	Miércoles
505	2005-02-10	2005	2	Febrero	1	10	3	Jueves
506	2005-02-11	2005	2	Febrero	1	11	4	Viernes
507	2005-02-12	2005	2	Febrero	1	12	5	Sábado
508	2005-02-13	2005	2	Febrero	1	13	6	Domingo
509	2005-02-14	2005	2	Febrero	1	14	0	Lunes
510	2005-02-16	2005	2	Febrero	1	16	2	Miércoles
511	2005-02-17	2005	2	Febrero	1	17	3	Jueves
512	2005-02-18	2005	2	Febrero	1	18	4	Viernes
513	2005-02-20	2005	2	Febrero	1	20	6	Domingo
514	2005-02-21	2005	2	Febrero	1	21	0	Lunes
515	2005-02-22	2005	2	Febrero	1	22	1	Martes
516	2005-02-23	2005	2	Febrero	1	23	2	Miércoles
517	2005-02-24	2005	2	Febrero	1	24	3	Jueves
518	2005-02-25	2005	2	Febrero	1	25	4	Viernes
519	2005-02-27	2005	2	Febrero	1	27	6	Domingo
520	2005-02-28	2005	2	Febrero	1	28	0	Lunes
521	2005-03-01	2005	3	Marzo	1	1	1	Martes
522	2005-03-02	2005	3	Marzo	1	2	2	Miércoles
523	2005-03-03	2005	3	Marzo	1	3	3	Jueves
524	2005-03-04	2005	3	Marzo	1	4	4	Viernes
525	2005-03-06	2005	3	Marzo	1	6	6	Domingo
526	2005-03-07	2005	3	Marzo	1	7	0	Lunes
527	2005-03-08	2005	3	Marzo	1	8	1	Martes
528	2005-03-09	2005	3	Marzo	1	9	2	Miércoles
529	2005-03-10	2005	3	Marzo	1	10	3	Jueves
530	2005-03-11	2005	3	Marzo	1	11	4	Viernes
531	2005-03-12	2005	3	Marzo	1	12	5	Sábado
532	2005-03-14	2005	3	Marzo	1	14	0	Lunes
533	2005-03-15	2005	3	Marzo	1	15	1	Martes
534	2005-03-17	2005	3	Marzo	1	17	3	Jueves
535	2005-03-18	2005	3	Marzo	1	18	4	Viernes
536	2005-03-19	2005	3	Marzo	1	19	5	Sábado
537	2005-03-20	2005	3	Marzo	1	20	6	Domingo
538	2005-03-22	2005	3	Marzo	1	22	1	Martes
539	2005-03-23	2005	3	Marzo	1	23	2	Miércoles
540	2005-03-24	2005	3	Marzo	1	24	3	Jueves
541	2005-03-25	2005	3	Marzo	1	25	4	Viernes
542	2005-03-28	2005	3	Marzo	1	28	0	Lunes
543	2005-03-30	2005	3	Marzo	1	30	2	Miércoles
544	2005-03-31	2005	3	Marzo	1	31	3	Jueves
545	2005-04-01	2005	4	Abril	2	1	4	Viernes
546	2005-04-02	2005	4	Abril	2	2	5	Sábado
547	2005-04-03	2005	4	Abril	2	3	6	Domingo
548	2005-04-04	2005	4	Abril	2	4	0	Lunes
549	2005-04-05	2005	4	Abril	2	5	1	Martes
550	2005-04-07	2005	4	Abril	2	7	3	Jueves
551	2005-04-08	2005	4	Abril	2	8	4	Viernes
552	2005-04-09	2005	4	Abril	2	9	5	Sábado
553	2005-04-11	2005	4	Abril	2	11	0	Lunes
554	2005-04-12	2005	4	Abril	2	12	1	Martes
555	2005-04-14	2005	4	Abril	2	14	3	Jueves
556	2005-04-15	2005	4	Abril	2	15	4	Viernes
557	2005-04-18	2005	4	Abril	2	18	0	Lunes
558	2005-04-20	2005	4	Abril	2	20	2	Miércoles
559	2005-04-21	2005	4	Abril	2	21	3	Jueves
560	2005-04-22	2005	4	Abril	2	22	4	Viernes
561	2005-04-23	2005	4	Abril	2	23	5	Sábado
562	2005-04-24	2005	4	Abril	2	24	6	Domingo
563	2005-04-25	2005	4	Abril	2	25	0	Lunes
564	2005-04-27	2005	4	Abril	2	27	2	Miércoles
565	2005-04-29	2005	4	Abril	2	29	4	Viernes
566	2005-04-30	2005	4	Abril	2	30	5	Sábado
567	2005-05-01	2005	5	Mayo	2	1	6	Domingo
568	2005-05-03	2005	5	Mayo	2	3	1	Martes
569	2005-05-04	2005	5	Mayo	2	4	2	Miércoles
570	2005-05-05	2005	5	Mayo	2	5	3	Jueves
571	2005-05-06	2005	5	Mayo	2	6	4	Viernes
572	2005-05-08	2005	5	Mayo	2	8	6	Domingo
573	2005-05-09	2005	5	Mayo	2	9	0	Lunes
574	2005-05-10	2005	5	Mayo	2	10	1	Martes
575	2005-05-12	2005	5	Mayo	2	12	3	Jueves
576	2005-05-13	2005	5	Mayo	2	13	4	Viernes
577	2005-05-14	2005	5	Mayo	2	14	5	Sábado
578	2005-05-16	2005	5	Mayo	2	16	0	Lunes
579	2005-05-17	2005	5	Mayo	2	17	1	Martes
580	2005-05-19	2005	5	Mayo	2	19	3	Jueves
581	2005-05-20	2005	5	Mayo	2	20	4	Viernes
582	2005-05-24	2005	5	Mayo	2	24	1	Martes
583	2005-05-28	2005	5	Mayo	2	28	5	Sábado
584	2005-05-29	2005	5	Mayo	2	29	6	Domingo
585	2005-05-30	2005	5	Mayo	2	30	0	Lunes
586	2005-05-31	2005	5	Mayo	2	31	1	Martes
587	2005-06-05	2005	6	Junio	2	5	6	Domingo
588	2005-06-06	2005	6	Junio	2	6	0	Lunes
589	2005-06-07	2005	6	Junio	2	7	1	Martes
590	2005-06-08	2005	6	Junio	2	8	2	Miércoles
591	2005-06-11	2005	6	Junio	2	11	5	Sábado
\.


--
-- Data for Name: fact_llamadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_llamadas (llamada_id, cliente_key, producto_key, empleado_key, tiempo_key, texto_llamada, cantidad_llamadas) FROM stdin;
1	13	93	49	573	Cras laoreet leo et massa rhoncus id posuere enim varius.	1
2	63	71	49	107	Curabitur hendrerit orci et vestibulum rhoncus.	1
3	93	72	49	84	In ut ex nec arcu ultricies dictum.	1
4	53	59	50	364	Nullam et purus eleifend laoreet mauris et dapibus tortor.	1
5	56	58	50	400	Cras rhoncus ante sit amet iaculis consequat.	1
6	83	95	50	372	Aenean in elit iaculis tortor blandit eleifend sed at diam.	1
7	3	30	51	424	Ut pulvinar massa ultrices tortor viverra id dictum purus malesuada.	1
8	6	32	51	228	Etiam luctus massa ac nibh lobortis rutrum.	1
9	56	91	51	50	Ut posuere magna ut est gravida dictum.	1
10	71	93	51	42	Vestibulum sed diam hendrerit magna volutpat volutpat.	1
11	83	95	51	241	Cras lacinia erat venenatis erat tempus ac posuere arcu dictum.	1
12	13	93	52	122	Integer vulputate ipsum eu eros eleifend sollicitudin.	1
13	17	89	52	51	Ut eu metus sit amet diam porta tincidunt.	1
14	58	70	52	399	Praesent ultricies ex id nisl posuere aliquet.	1
15	93	72	52	79	Mauris aliquet orci in dictum iaculis.	1
16	104	98	52	202	Sed ultrices velit mollis dui tempor eu eleifend tortor congue.	1
17	2	5	53	252	Quisque sed arcu vel turpis egestas consequat fringilla et odio.	1
18	21	29	53	519	Donec vel ligula id nibh faucibus maximus.	1
19	86	92	53	133	Praesent id eros eleifend suscipit tellus et finibus nibh.	1
20	99	36	53	17	Lorem ipsum dolor sit amet consectetur adipiscing elit.	1
21	106	51	53	218	Etiam tempor purus quis scelerisque elementum.	1
22	32	29	24	440	Vestibulum a dolor sed sapien ultricies luctus.	1
23	3	30	25	427	Vestibulum vitae ante id odio cursus pellentesque ac in lectus.	1
24	44	110	25	115	Morbi feugiat nisl euismod mi faucibus vitae aliquam tellus euismod.	1
25	65	96	25	193	Duis id dolor faucibus pharetra risus ut pretium velit.	1
26	86	48	26	513	Donec id risus id orci blandit sodales nec vitae eros.	1
27	35	53	27	141	Mauris sed felis quis ex pretium porttitor.	1
28	56	58	27	231	In dictum erat non aliquam ultricies.	1
29	58	70	27	141	Mauris bibendum sapien non est dictum ac imperdiet sem hendrerit.	1
30	65	96	27	421	Maecenas cursus arcu quis purus hendrerit laoreet.	1
31	69	62	27	423	Suspendisse accumsan eros quis magna pretium luctus.	1
32	2	5	28	355	Aenean sollicitudin risus nec ligula consequat maximus.	1
33	27	12	28	217	Proin vehicula magna in lorem dapibus vehicula.	1
34	114	98	28	366	Proin id est ut tellus pellentesque interdum.	1
35	122	59	28	447	Suspendisse a leo malesuada lobortis tellus mollis cursus elit.	1
36	51	107	29	257	Maecenas eu eros ac sapien tincidunt vulputate.	1
37	57	109	29	426	Mauris commodo magna eget congue euismod.	1
38	93	72	29	266	Donec in leo vel risus tempus varius.	1
39	16	55	30	146	Vivamus sed neque ut diam aliquet feugiat.	1
40	83	95	30	316	Mauris laoreet sem non ornare dapibus.	1
41	8	100	31	358	Nulla in quam in ligula maximus mattis.	1
42	20	106	31	119	Integer porttitor ligula et quam faucibus pellentesque.	1
43	88	95	31	454	Quisque aliquet tortor quis magna pretium hendrerit.	1
44	91	92	31	330	In eget tortor quis augue fermentum ultricies at ut ligula.	1
45	2	5	32	89	Cras tristique metus id purus sodales venenatis.	1
46	20	106	32	565	Quisque et ipsum ultrices pulvinar ex in imperdiet lorem.	1
47	65	96	32	239	Vivamus scelerisque erat at convallis porta.	1
48	85	99	32	126	Suspendisse eu mauris hendrerit sem congue imperdiet vitae laoreet nibh.	1
49	91	92	32	139	Fusce id ligula gravida consectetur nunc at ultrices neque.	1
50	114	98	32	133	Ut volutpat diam ac dolor dignissim sit amet convallis felis ornare.	1
51	35	53	33	333	Nam efficitur turpis at sagittis mattis.	1
52	66	90	33	238	Vivamus fermentum magna a tortor tempor vitae molestie nunc suscipit.	1
53	66	23	34	176	Nulla eget nunc et libero lacinia porta.	1
54	70	62	34	29	In sit amet risus consectetur mattis mi at iaculis felis.	1
55	99	36	34	255	Aenean bibendum diam a leo suscipit eget venenatis ex gravida.	1
56	111	81	34	251	Morbi in lorem eu velit pellentesque aliquam a et odio.	1
57	24	4	35	111	Aenean ac tellus id sem consequat maximus id sed quam.	1
58	47	72	35	209	Aliquam in mi vel nisl fringilla varius vel ut sem.	1
59	86	92	35	42	Duis ornare mauris id nulla egestas vel congue urna ornare.	1
60	86	94	35	22	Nullam in sem ornare tincidunt purus in cursus ipsum.	1
61	110	39	35	312	Nullam a ipsum ornare volutpat ligula sit amet tincidunt augue.	1
62	41	18	36	200	Morbi in mauris lacinia mattis elit nec aliquet nisl.	1
63	83	95	36	310	Vivamus vel nisi eget purus tincidunt cursus.	1
64	104	98	36	131	Maecenas mattis nulla at aliquam consectetur.	1
65	17	89	37	155	Curabitur eget enim eget lacus mattis sollicitudin eu et velit.	1
66	16	55	38	418	Vestibulum a augue condimentum commodo mauris ut lacinia magna.	1
67	122	59	38	283	In non eros eu quam bibendum tempor.	1
68	42	23	39	260	Maecenas egestas quam at nibh sodales congue.	1
69	56	91	39	277	Phasellus nec tortor a arcu fringilla molestie.	1
70	93	72	39	284	Pellentesque rhoncus nunc at sem blandit mollis.	1
71	100	31	39	92	Aenean a sapien suscipit rhoncus odio nec condimentum nisi.	1
72	110	44	39	549	In non ipsum quis dui pretium hendrerit.	1
73	64	19	40	509	Duis ac est at nulla ullamcorper facilisis eget sed tellus.	1
74	67	18	40	117	Proin ac quam ut odio mattis dapibus eu vitae leo.	1
75	86	48	40	485	Sed laoreet metus sed varius maximus.	1
225	56	91	51	50	Ut posuere magna ut est gravida dictum.	1
76	24	29	41	356	Suspendisse vel ante sollicitudin viverra orci nec auctor felis.	1
77	27	12	41	507	Phasellus efficitur lorem vitae erat venenatis sit amet auctor lectus suscipit.	1
78	63	76	41	170	Nam a libero semper massa sollicitudin dignissim eleifend eu tellus.	1
79	66	90	41	453	Nullam ultricies dui quis enim dictum a placerat libero posuere.	1
80	84	66	41	240	Vestibulum lobortis metus ut felis rutrum tempus.	1
81	103	49	41	408	Morbi rutrum justo id sodales varius.	1
82	114	98	41	390	Proin ac sem vulputate vestibulum magna sed eleifend justo.	1
83	8	100	42	221	Mauris cursus metus sed mi porta venenatis.	1
84	12	39	42	357	Nulla nec leo non dolor lacinia vehicula at in elit.	1
85	39	32	42	132	Donec nec ex commodo maximus orci sed convallis arcu.	1
86	56	91	42	398	Etiam sed risus fermentum dui varius imperdiet.	1
87	97	68	42	61	Cras vel magna id eros varius scelerisque non vel mauris.	1
88	12	39	43	326	Ut volutpat velit at mattis suscipit.	1
89	19	61	43	119	Integer et tellus ut eros viverra pellentesque.	1
90	69	63	43	154	Nullam in lacus ornare condimentum enim nec tempor odio.	1
91	15	96	44	286	Nunc vel erat vitae ante suscipit cursus sit amet a nisi.	1
92	20	106	44	477	Donec congue tellus sed arcu iaculis posuere.	1
93	27	12	44	402	Nunc a mauris vel velit tincidunt auctor.	1
94	82	98	44	427	Sed et orci eu sem posuere tempor.	1
95	106	51	44	377	In ac elit quis felis pellentesque faucibus at quis ipsum.	1
96	114	98	44	261	Quisque condimentum ligula venenatis feugiat malesuada.	1
97	65	96	45	73	Suspendisse efficitur purus et leo mattis eu porttitor magna lobortis.	1
98	88	95	45	21	Maecenas quis purus quis felis sollicitudin finibus eu eu mauris.	1
99	110	39	45	333	Nam dictum lacus ut malesuada tempor.	1
100	10	100	46	277	Vivamus ac augue et arcu placerat ultricies volutpat vitae massa.	1
101	67	42	46	397	Maecenas aliquam est nec porta scelerisque.	1
102	97	68	46	354	Proin facilisis odio sit amet nibh scelerisque non posuere turpis maximus.	1
103	97	68	47	326	In scelerisque ligula quis erat iaculis eget facilisis sem consequat.	1
104	109	91	47	524	Quisque malesuada ante eget tortor facilisis vel cursus magna vulputate.	1
105	3	30	48	264	Suspendisse in quam sed sapien semper lacinia.	1
106	99	36	48	322	Curabitur non ex vitae enim sollicitudin eleifend.	1
107	100	31	48	234	Duis quis libero nec lorem scelerisque vestibulum quis vitae arcu.	1
108	100	69	48	57	Maecenas posuere elit sit amet eros aliquam rhoncus.	1
109	13	93	49	573	Cras laoreet leo et massa rhoncus id posuere enim varius.	1
110	63	71	49	107	Curabitur hendrerit orci et vestibulum rhoncus.	1
111	93	72	49	84	In ut ex nec arcu ultricies dictum.	1
112	53	59	50	364	Nullam et purus eleifend laoreet mauris et dapibus tortor.	1
113	56	58	50	400	Cras rhoncus ante sit amet iaculis consequat.	1
114	83	95	50	372	Aenean in elit iaculis tortor blandit eleifend sed at diam.	1
115	3	30	51	424	Ut pulvinar massa ultrices tortor viverra id dictum purus malesuada.	1
116	6	32	51	228	Etiam luctus massa ac nibh lobortis rutrum.	1
117	56	91	51	50	Ut posuere magna ut est gravida dictum.	1
118	71	93	51	42	Vestibulum sed diam hendrerit magna volutpat volutpat.	1
119	83	95	51	241	Cras lacinia erat venenatis erat tempus ac posuere arcu dictum.	1
120	13	93	52	122	Integer vulputate ipsum eu eros eleifend sollicitudin.	1
121	17	89	52	51	Ut eu metus sit amet diam porta tincidunt.	1
122	58	70	52	399	Praesent ultricies ex id nisl posuere aliquet.	1
123	93	72	52	79	Mauris aliquet orci in dictum iaculis.	1
124	104	98	52	202	Sed ultrices velit mollis dui tempor eu eleifend tortor congue.	1
125	2	5	53	252	Quisque sed arcu vel turpis egestas consequat fringilla et odio.	1
126	21	29	53	519	Donec vel ligula id nibh faucibus maximus.	1
127	86	92	53	133	Praesent id eros eleifend suscipit tellus et finibus nibh.	1
128	99	36	53	17	Lorem ipsum dolor sit amet consectetur adipiscing elit.	1
129	106	51	53	218	Etiam tempor purus quis scelerisque elementum.	1
130	32	29	24	440	Vestibulum a dolor sed sapien ultricies luctus.	1
131	3	30	25	427	Vestibulum vitae ante id odio cursus pellentesque ac in lectus.	1
132	44	110	25	115	Morbi feugiat nisl euismod mi faucibus vitae aliquam tellus euismod.	1
133	65	96	25	193	Duis id dolor faucibus pharetra risus ut pretium velit.	1
134	86	48	26	513	Donec id risus id orci blandit sodales nec vitae eros.	1
135	35	53	27	141	Mauris sed felis quis ex pretium porttitor.	1
136	56	58	27	231	In dictum erat non aliquam ultricies.	1
137	58	70	27	141	Mauris bibendum sapien non est dictum ac imperdiet sem hendrerit.	1
138	65	96	27	421	Maecenas cursus arcu quis purus hendrerit laoreet.	1
139	69	62	27	423	Suspendisse accumsan eros quis magna pretium luctus.	1
140	2	5	28	355	Aenean sollicitudin risus nec ligula consequat maximus.	1
141	27	12	28	217	Proin vehicula magna in lorem dapibus vehicula.	1
142	114	98	28	366	Proin id est ut tellus pellentesque interdum.	1
143	122	59	28	447	Suspendisse a leo malesuada lobortis tellus mollis cursus elit.	1
144	51	107	29	257	Maecenas eu eros ac sapien tincidunt vulputate.	1
145	57	109	29	426	Mauris commodo magna eget congue euismod.	1
146	93	72	29	266	Donec in leo vel risus tempus varius.	1
147	16	55	30	146	Vivamus sed neque ut diam aliquet feugiat.	1
148	83	95	30	316	Mauris laoreet sem non ornare dapibus.	1
149	8	100	31	358	Nulla in quam in ligula maximus mattis.	1
150	20	106	31	119	Integer porttitor ligula et quam faucibus pellentesque.	1
151	88	95	31	454	Quisque aliquet tortor quis magna pretium hendrerit.	1
152	91	92	31	330	In eget tortor quis augue fermentum ultricies at ut ligula.	1
153	2	5	32	89	Cras tristique metus id purus sodales venenatis.	1
154	20	106	32	565	Quisque et ipsum ultrices pulvinar ex in imperdiet lorem.	1
155	65	96	32	239	Vivamus scelerisque erat at convallis porta.	1
156	85	99	32	126	Suspendisse eu mauris hendrerit sem congue imperdiet vitae laoreet nibh.	1
157	91	92	32	139	Fusce id ligula gravida consectetur nunc at ultrices neque.	1
158	114	98	32	133	Ut volutpat diam ac dolor dignissim sit amet convallis felis ornare.	1
159	35	53	33	333	Nam efficitur turpis at sagittis mattis.	1
160	66	90	33	238	Vivamus fermentum magna a tortor tempor vitae molestie nunc suscipit.	1
161	66	23	34	176	Nulla eget nunc et libero lacinia porta.	1
162	70	62	34	29	In sit amet risus consectetur mattis mi at iaculis felis.	1
163	99	36	34	255	Aenean bibendum diam a leo suscipit eget venenatis ex gravida.	1
164	111	81	34	251	Morbi in lorem eu velit pellentesque aliquam a et odio.	1
165	24	4	35	111	Aenean ac tellus id sem consequat maximus id sed quam.	1
166	47	72	35	209	Aliquam in mi vel nisl fringilla varius vel ut sem.	1
167	86	92	35	42	Duis ornare mauris id nulla egestas vel congue urna ornare.	1
168	86	94	35	22	Nullam in sem ornare tincidunt purus in cursus ipsum.	1
169	110	39	35	312	Nullam a ipsum ornare volutpat ligula sit amet tincidunt augue.	1
170	41	18	36	200	Morbi in mauris lacinia mattis elit nec aliquet nisl.	1
171	83	95	36	310	Vivamus vel nisi eget purus tincidunt cursus.	1
172	104	98	36	131	Maecenas mattis nulla at aliquam consectetur.	1
173	17	89	37	155	Curabitur eget enim eget lacus mattis sollicitudin eu et velit.	1
174	16	55	38	418	Vestibulum a augue condimentum commodo mauris ut lacinia magna.	1
175	122	59	38	283	In non eros eu quam bibendum tempor.	1
176	42	23	39	260	Maecenas egestas quam at nibh sodales congue.	1
177	56	91	39	277	Phasellus nec tortor a arcu fringilla molestie.	1
178	93	72	39	284	Pellentesque rhoncus nunc at sem blandit mollis.	1
179	100	31	39	92	Aenean a sapien suscipit rhoncus odio nec condimentum nisi.	1
180	110	44	39	549	In non ipsum quis dui pretium hendrerit.	1
181	64	19	40	509	Duis ac est at nulla ullamcorper facilisis eget sed tellus.	1
182	67	18	40	117	Proin ac quam ut odio mattis dapibus eu vitae leo.	1
183	86	48	40	485	Sed laoreet metus sed varius maximus.	1
184	24	29	41	356	Suspendisse vel ante sollicitudin viverra orci nec auctor felis.	1
185	27	12	41	507	Phasellus efficitur lorem vitae erat venenatis sit amet auctor lectus suscipit.	1
186	63	76	41	170	Nam a libero semper massa sollicitudin dignissim eleifend eu tellus.	1
187	66	90	41	453	Nullam ultricies dui quis enim dictum a placerat libero posuere.	1
188	84	66	41	240	Vestibulum lobortis metus ut felis rutrum tempus.	1
189	103	49	41	408	Morbi rutrum justo id sodales varius.	1
190	114	98	41	390	Proin ac sem vulputate vestibulum magna sed eleifend justo.	1
191	8	100	42	221	Mauris cursus metus sed mi porta venenatis.	1
192	12	39	42	357	Nulla nec leo non dolor lacinia vehicula at in elit.	1
193	39	32	42	132	Donec nec ex commodo maximus orci sed convallis arcu.	1
194	56	91	42	398	Etiam sed risus fermentum dui varius imperdiet.	1
195	97	68	42	61	Cras vel magna id eros varius scelerisque non vel mauris.	1
196	12	39	43	326	Ut volutpat velit at mattis suscipit.	1
197	19	61	43	119	Integer et tellus ut eros viverra pellentesque.	1
198	69	63	43	154	Nullam in lacus ornare condimentum enim nec tempor odio.	1
199	15	96	44	286	Nunc vel erat vitae ante suscipit cursus sit amet a nisi.	1
200	20	106	44	477	Donec congue tellus sed arcu iaculis posuere.	1
201	27	12	44	402	Nunc a mauris vel velit tincidunt auctor.	1
202	82	98	44	427	Sed et orci eu sem posuere tempor.	1
203	106	51	44	377	In ac elit quis felis pellentesque faucibus at quis ipsum.	1
204	114	98	44	261	Quisque condimentum ligula venenatis feugiat malesuada.	1
205	65	96	45	73	Suspendisse efficitur purus et leo mattis eu porttitor magna lobortis.	1
206	88	95	45	21	Maecenas quis purus quis felis sollicitudin finibus eu eu mauris.	1
207	110	39	45	333	Nam dictum lacus ut malesuada tempor.	1
208	10	100	46	277	Vivamus ac augue et arcu placerat ultricies volutpat vitae massa.	1
209	67	42	46	397	Maecenas aliquam est nec porta scelerisque.	1
210	97	68	46	354	Proin facilisis odio sit amet nibh scelerisque non posuere turpis maximus.	1
211	97	68	47	326	In scelerisque ligula quis erat iaculis eget facilisis sem consequat.	1
212	109	91	47	524	Quisque malesuada ante eget tortor facilisis vel cursus magna vulputate.	1
213	3	30	48	264	Suspendisse in quam sed sapien semper lacinia.	1
214	99	36	48	322	Curabitur non ex vitae enim sollicitudin eleifend.	1
215	100	31	48	234	Duis quis libero nec lorem scelerisque vestibulum quis vitae arcu.	1
216	100	69	48	57	Maecenas posuere elit sit amet eros aliquam rhoncus.	1
217	13	93	49	573	Cras laoreet leo et massa rhoncus id posuere enim varius.	1
218	63	71	49	107	Curabitur hendrerit orci et vestibulum rhoncus.	1
219	93	72	49	84	In ut ex nec arcu ultricies dictum.	1
220	53	59	50	364	Nullam et purus eleifend laoreet mauris et dapibus tortor.	1
221	56	58	50	400	Cras rhoncus ante sit amet iaculis consequat.	1
222	83	95	50	372	Aenean in elit iaculis tortor blandit eleifend sed at diam.	1
223	3	30	51	424	Ut pulvinar massa ultrices tortor viverra id dictum purus malesuada.	1
224	6	32	51	228	Etiam luctus massa ac nibh lobortis rutrum.	1
226	71	93	51	42	Vestibulum sed diam hendrerit magna volutpat volutpat.	1
227	83	95	51	241	Cras lacinia erat venenatis erat tempus ac posuere arcu dictum.	1
228	13	93	52	122	Integer vulputate ipsum eu eros eleifend sollicitudin.	1
229	17	89	52	51	Ut eu metus sit amet diam porta tincidunt.	1
230	58	70	52	399	Praesent ultricies ex id nisl posuere aliquet.	1
231	93	72	52	79	Mauris aliquet orci in dictum iaculis.	1
232	104	98	52	202	Sed ultrices velit mollis dui tempor eu eleifend tortor congue.	1
233	2	5	53	252	Quisque sed arcu vel turpis egestas consequat fringilla et odio.	1
234	21	29	53	519	Donec vel ligula id nibh faucibus maximus.	1
235	86	92	53	133	Praesent id eros eleifend suscipit tellus et finibus nibh.	1
236	99	36	53	17	Lorem ipsum dolor sit amet consectetur adipiscing elit.	1
237	106	51	53	218	Etiam tempor purus quis scelerisque elementum.	1
238	32	29	24	440	Vestibulum a dolor sed sapien ultricies luctus.	1
239	3	30	25	427	Vestibulum vitae ante id odio cursus pellentesque ac in lectus.	1
240	44	110	25	115	Morbi feugiat nisl euismod mi faucibus vitae aliquam tellus euismod.	1
241	65	96	25	193	Duis id dolor faucibus pharetra risus ut pretium velit.	1
242	86	48	26	513	Donec id risus id orci blandit sodales nec vitae eros.	1
243	35	53	27	141	Mauris sed felis quis ex pretium porttitor.	1
244	56	58	27	231	In dictum erat non aliquam ultricies.	1
245	58	70	27	141	Mauris bibendum sapien non est dictum ac imperdiet sem hendrerit.	1
246	65	96	27	421	Maecenas cursus arcu quis purus hendrerit laoreet.	1
247	69	62	27	423	Suspendisse accumsan eros quis magna pretium luctus.	1
248	2	5	28	355	Aenean sollicitudin risus nec ligula consequat maximus.	1
249	27	12	28	217	Proin vehicula magna in lorem dapibus vehicula.	1
250	114	98	28	366	Proin id est ut tellus pellentesque interdum.	1
251	122	59	28	447	Suspendisse a leo malesuada lobortis tellus mollis cursus elit.	1
252	51	107	29	257	Maecenas eu eros ac sapien tincidunt vulputate.	1
253	57	109	29	426	Mauris commodo magna eget congue euismod.	1
254	93	72	29	266	Donec in leo vel risus tempus varius.	1
255	16	55	30	146	Vivamus sed neque ut diam aliquet feugiat.	1
256	83	95	30	316	Mauris laoreet sem non ornare dapibus.	1
257	8	100	31	358	Nulla in quam in ligula maximus mattis.	1
258	20	106	31	119	Integer porttitor ligula et quam faucibus pellentesque.	1
259	88	95	31	454	Quisque aliquet tortor quis magna pretium hendrerit.	1
260	91	92	31	330	In eget tortor quis augue fermentum ultricies at ut ligula.	1
261	2	5	32	89	Cras tristique metus id purus sodales venenatis.	1
262	20	106	32	565	Quisque et ipsum ultrices pulvinar ex in imperdiet lorem.	1
263	65	96	32	239	Vivamus scelerisque erat at convallis porta.	1
264	85	99	32	126	Suspendisse eu mauris hendrerit sem congue imperdiet vitae laoreet nibh.	1
265	91	92	32	139	Fusce id ligula gravida consectetur nunc at ultrices neque.	1
266	114	98	32	133	Ut volutpat diam ac dolor dignissim sit amet convallis felis ornare.	1
267	35	53	33	333	Nam efficitur turpis at sagittis mattis.	1
268	66	90	33	238	Vivamus fermentum magna a tortor tempor vitae molestie nunc suscipit.	1
269	66	23	34	176	Nulla eget nunc et libero lacinia porta.	1
270	70	62	34	29	In sit amet risus consectetur mattis mi at iaculis felis.	1
271	99	36	34	255	Aenean bibendum diam a leo suscipit eget venenatis ex gravida.	1
272	111	81	34	251	Morbi in lorem eu velit pellentesque aliquam a et odio.	1
273	24	4	35	111	Aenean ac tellus id sem consequat maximus id sed quam.	1
274	47	72	35	209	Aliquam in mi vel nisl fringilla varius vel ut sem.	1
275	86	92	35	42	Duis ornare mauris id nulla egestas vel congue urna ornare.	1
276	86	94	35	22	Nullam in sem ornare tincidunt purus in cursus ipsum.	1
277	110	39	35	312	Nullam a ipsum ornare volutpat ligula sit amet tincidunt augue.	1
278	41	18	36	200	Morbi in mauris lacinia mattis elit nec aliquet nisl.	1
279	83	95	36	310	Vivamus vel nisi eget purus tincidunt cursus.	1
280	104	98	36	131	Maecenas mattis nulla at aliquam consectetur.	1
281	17	89	37	155	Curabitur eget enim eget lacus mattis sollicitudin eu et velit.	1
282	16	55	38	418	Vestibulum a augue condimentum commodo mauris ut lacinia magna.	1
283	122	59	38	283	In non eros eu quam bibendum tempor.	1
284	42	23	39	260	Maecenas egestas quam at nibh sodales congue.	1
285	56	91	39	277	Phasellus nec tortor a arcu fringilla molestie.	1
286	93	72	39	284	Pellentesque rhoncus nunc at sem blandit mollis.	1
287	100	31	39	92	Aenean a sapien suscipit rhoncus odio nec condimentum nisi.	1
288	110	44	39	549	In non ipsum quis dui pretium hendrerit.	1
289	64	19	40	509	Duis ac est at nulla ullamcorper facilisis eget sed tellus.	1
290	67	18	40	117	Proin ac quam ut odio mattis dapibus eu vitae leo.	1
291	86	48	40	485	Sed laoreet metus sed varius maximus.	1
292	24	29	41	356	Suspendisse vel ante sollicitudin viverra orci nec auctor felis.	1
293	27	12	41	507	Phasellus efficitur lorem vitae erat venenatis sit amet auctor lectus suscipit.	1
294	63	76	41	170	Nam a libero semper massa sollicitudin dignissim eleifend eu tellus.	1
295	66	90	41	453	Nullam ultricies dui quis enim dictum a placerat libero posuere.	1
296	84	66	41	240	Vestibulum lobortis metus ut felis rutrum tempus.	1
297	103	49	41	408	Morbi rutrum justo id sodales varius.	1
298	114	98	41	390	Proin ac sem vulputate vestibulum magna sed eleifend justo.	1
299	8	100	42	221	Mauris cursus metus sed mi porta venenatis.	1
300	12	39	42	357	Nulla nec leo non dolor lacinia vehicula at in elit.	1
301	39	32	42	132	Donec nec ex commodo maximus orci sed convallis arcu.	1
302	56	91	42	398	Etiam sed risus fermentum dui varius imperdiet.	1
303	97	68	42	61	Cras vel magna id eros varius scelerisque non vel mauris.	1
304	12	39	43	326	Ut volutpat velit at mattis suscipit.	1
305	19	61	43	119	Integer et tellus ut eros viverra pellentesque.	1
306	69	63	43	154	Nullam in lacus ornare condimentum enim nec tempor odio.	1
307	15	96	44	286	Nunc vel erat vitae ante suscipit cursus sit amet a nisi.	1
308	20	106	44	477	Donec congue tellus sed arcu iaculis posuere.	1
309	27	12	44	402	Nunc a mauris vel velit tincidunt auctor.	1
310	82	98	44	427	Sed et orci eu sem posuere tempor.	1
311	106	51	44	377	In ac elit quis felis pellentesque faucibus at quis ipsum.	1
312	114	98	44	261	Quisque condimentum ligula venenatis feugiat malesuada.	1
313	65	96	45	73	Suspendisse efficitur purus et leo mattis eu porttitor magna lobortis.	1
314	88	95	45	21	Maecenas quis purus quis felis sollicitudin finibus eu eu mauris.	1
315	110	39	45	333	Nam dictum lacus ut malesuada tempor.	1
316	10	100	46	277	Vivamus ac augue et arcu placerat ultricies volutpat vitae massa.	1
317	67	42	46	397	Maecenas aliquam est nec porta scelerisque.	1
318	97	68	46	354	Proin facilisis odio sit amet nibh scelerisque non posuere turpis maximus.	1
319	97	68	47	326	In scelerisque ligula quis erat iaculis eget facilisis sem consequat.	1
320	109	91	47	524	Quisque malesuada ante eget tortor facilisis vel cursus magna vulputate.	1
321	3	30	48	264	Suspendisse in quam sed sapien semper lacinia.	1
322	99	36	48	322	Curabitur non ex vitae enim sollicitudin eleifend.	1
323	100	31	48	234	Duis quis libero nec lorem scelerisque vestibulum quis vitae arcu.	1
324	100	69	48	57	Maecenas posuere elit sit amet eros aliquam rhoncus.	1
\.


--
-- Data for Name: fact_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_ventas (venta_id, cliente_key, producto_key, empleado_key, oficina_key, tiempo_key, numero_orden, estado_orden, fecha_orden, fecha_requerida, fecha_envio, cantidad_ordenada, precio_unitario, monto_linea, numero_linea) FROM stdin;
1	86	23	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	30	136.00	4080.00	3
2	86	27	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	50	55.09	2754.50	2
3	86	50	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	22	75.46	1660.12	4
4	86	80	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	49	35.29	1729.21	1
5	8	29	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	25	108.06	2701.50	4
6	8	33	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	26	167.06	4343.56	1
7	8	61	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	45	32.53	1463.85	3
8	8	64	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	46	44.35	2040.10	2
9	28	19	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	39	95.55	3726.45	2
10	28	20	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	41	43.13	1768.33	1
11	5	2	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	26	214.30	5571.80	11
12	5	6	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	119.67	5026.14	4
13	5	9	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	121.64	3284.28	8
14	5	17	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	94.50	3307.50	10
15	5	30	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	22	58.34	1283.48	2
16	5	35	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	92.19	2489.13	12
17	5	36	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	61.84	2164.40	14
18	5	38	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	86.92	2173.00	13
19	5	44	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	46	86.31	3970.26	16
20	5	52	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	98.07	3530.52	5
21	5	53	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	41	40.75	1670.75	9
22	5	65	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	107.34	3864.24	1
23	5	82	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	88.62	2215.50	15
24	5	85	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	31	92.46	2866.26	3
25	5	90	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	45	63.35	2850.75	7
26	5	103	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	94.07	3950.94	6
27	11	11	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	34	131.44	4468.96	1
28	11	15	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	41	111.39	4566.99	9
29	11	26	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	24	135.90	3261.60	8
30	11	28	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	29	122.73	3559.17	12
31	11	40	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	23	165.95	3816.85	13
32	11	49	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	38	119.20	4529.60	3
33	11	57	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	52.02	1820.70	6
34	11	68	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	44	30.41	1338.04	10
35	11	81	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	26	106.45	2767.70	5
36	11	88	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	51.95	1818.25	11
37	11	89	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	49	56.55	2770.95	4
38	11	94	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	33	114.59	3781.47	7
39	11	95	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	32	53.31	1705.92	2
40	13	5	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	127.84	6392.00	2
41	13	8	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	205.72	8434.52	15
42	13	13	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	141.88	4114.52	14
43	13	39	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	136.59	3004.98	11
44	13	42	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	38	87.73	3333.74	13
45	13	51	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	75.48	3094.68	10
46	13	63	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	43	117.97	5072.71	9
47	13	72	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	44	73.46	3232.24	4
48	13	77	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	75.47	3773.50	1
49	13	97	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	54.00	2214.00	5
50	13	99	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	86.61	2511.69	12
51	13	102	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	31	60.72	1882.32	3
52	13	106	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	39	92.16	3594.24	6
53	13	107	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	99.31	2184.82	7
54	13	110	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	25	44.77	1119.25	8
55	57	22	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	36	134.04	4825.44	12
56	57	31	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	81.10	2757.40	2
57	57	37	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	80.86	3315.26	18
58	57	48	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	94.22	3863.02	17
59	57	60	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	28	107.23	3002.44	4
60	57	69	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	49	65.77	3222.73	13
61	57	75	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	55.89	1732.59	14
62	57	79	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	50	55.96	2798.00	11
63	57	83	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	26	71.00	1846.00	3
64	57	91	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	33	65.35	2156.55	5
65	57	93	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	39	35.78	1395.42	6
66	57	98	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	91.34	2831.54	7
67	57	100	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	30	85.09	2552.70	16
68	57	101	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	99.72	3390.48	9
69	57	104	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	32	113.90	3644.80	1
70	57	105	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	44	76.00	3344.00	8
71	57	108	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	70.33	3375.84	10
72	57	109	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	43.70	2097.60	15
73	10	1	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	30	81.35	2440.50	2
74	10	3	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	39	105.86	4128.54	5
75	10	4	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	27	172.36	4653.72	4
76	10	10	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	21	122.00	2562.00	1
77	10	32	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	29	52.70	1528.30	6
78	10	58	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	25	96.92	2423.00	3
79	10	62	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	38	73.12	2778.56	7
80	10	86	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	20	88.90	1778.00	8
81	92	7	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	33	165.38	5457.54	6
82	92	12	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	45	96.30	4333.50	4
83	92	14	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	39	75.81	2956.59	7
84	92	16	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	36	107.10	3855.60	3
85	92	24	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	38	67.76	2574.88	2
86	92	43	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	26	73.17	1902.42	9
87	92	45	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	29	132.29	3836.41	8
88	92	47	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	43	52.84	2272.12	12
89	92	54	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	44	139.87	6154.28	11
90	92	66	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	35	64.41	2254.35	15
91	92	74	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	30	60.01	1800.30	5
92	92	78	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	40	132.00	5280.00	1
93	92	84	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	67.10	2080.10	10
94	92	87	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	27	36.21	977.67	13
95	92	92	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	87.76	2720.56	16
96	92	96	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	34	74.85	2544.90	14
97	118	18	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	117.48	3054.48	4
98	118	25	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	38	137.98	5243.24	3
99	118	34	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	126.72	3294.72	1
100	118	40	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	46	160.87	7400.02	5
101	118	46	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	47	125.74	5909.78	2
102	118	71	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	29	32.10	930.90	6
103	30	21	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	118.22	4374.14	16
104	30	23	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	153.00	6426.00	7
105	30	27	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	32	51.46	1646.72	6
106	30	29	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	33	115.69	3817.77	4
107	30	33	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	31	163.69	5074.39	1
108	30	50	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	28	81.91	2293.48	8
109	30	55	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	62.00	2604.00	9
110	30	56	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	36	72.02	2592.72	13
111	30	59	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	29	43.27	1254.83	15
112	30	61	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	20	28.88	577.60	3
113	30	64	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	39	40.77	1590.03	2
114	30	67	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	43	82.69	3555.67	11
115	30	70	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	46	112.74	5186.04	10
116	30	73	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	27	80.47	2172.69	12
117	30	76	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	96.37	3565.69	14
118	30	80	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	48	35.29	1693.92	5
119	9	19	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	33	87.33	2881.89	6
120	9	20	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	48	48.52	2328.96	5
121	9	36	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	28	53.09	1486.52	2
122	9	38	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	43	94.25	4052.75	1
123	9	44	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	39	91.27	3559.53	4
124	9	82	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	26	85.70	2228.20	3
125	12	2	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	29	197.16	5717.64	1
126	12	35	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	23	85.10	1957.30	2
127	6	9	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	21	121.64	2554.44	2
128	6	17	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	49	101.50	4973.50	4
129	6	53	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	50	43.27	2163.50	3
130	6	90	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	23	58.82	1352.86	1
131	24	6	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	31	128.53	3984.43	8
132	24	28	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	39	106.78	4164.42	3
133	24	30	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	45	53.48	2406.60	6
134	24	40	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	48	169.34	8128.32	4
135	24	52	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	41	105.34	4318.94	9
136	24	65	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	21	102.23	2146.83	5
137	24	68	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	24	28.64	687.36	1
138	24	85	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	32	88.61	2835.52	7
139	24	88	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	28	43.83	1227.24	2
140	24	103	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	42	82.94	3483.48	10
141	99	15	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	111.39	5123.94	5
142	99	26	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	140.81	6477.26	4
143	99	57	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	47	56.64	2662.08	2
144	99	81	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	44	106.45	4683.80	1
145	99	94	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	27	100.70	2718.90	3
146	90	89	15	4	42	10116	Shipped	2003-04-11	2003-04-19	2003-04-13	27	60.28	1627.56	1
147	15	8	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	33	195.33	6445.89	9
148	15	11	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	43	148.06	6366.58	10
149	15	13	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	39	173.02	6747.78	8
150	15	39	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	26	121.57	3160.82	5
151	15	42	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	81.68	1715.28	7
152	15	49	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	22	122.08	2685.76	12
153	15	51	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	23	73.73	1695.79	4
154	15	63	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	41	119.20	4887.20	3
155	15	95	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	55.65	1168.65	11
156	15	99	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	38	75.35	2863.30	6
157	15	107	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	45	89.38	4022.10	1
158	15	110	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	50	52.42	2621.00	2
159	40	106	23	4	48	10118	Shipped	2003-04-21	2003-04-29	2003-04-26	36	86.15	3101.40	1
160	91	5	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	46	112.88	5192.48	11
161	91	22	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	43	151.38	6509.34	3
162	91	37	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	21	74.84	1571.64	9
163	91	48	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	27	95.28	2572.56	8
164	91	69	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	41	64.40	2640.40	4
165	91	72	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	72.58	2540.30	13
166	91	75	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	20	63.12	1262.40	5
167	91	77	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	82.18	2876.30	10
168	91	79	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	62.10	1738.80	2
169	91	97	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	25	57.34	1433.50	14
170	91	100	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	29	74.23	2152.67	7
171	91	102	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	38	67.22	2554.36	12
172	91	108	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	26	63.67	1655.42	1
173	91	109	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	40.22	1126.16	6
174	3	3	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	118.94	3449.26	3
175	3	4	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	158.80	7304.80	2
176	3	31	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	82.79	2400.91	8
177	3	32	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	57.54	2646.84	4
178	3	58	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	35	110.45	3865.75	1
179	3	60	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	39	93.01	3627.39	10
180	3	62	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	34	72.36	2460.24	5
181	3	83	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	71.73	2080.17	9
182	3	86	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	22	94.90	2087.80	6
183	3	91	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	68.79	1994.91	11
184	3	93	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	49	41.46	2031.54	12
185	3	98	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	47	91.34	4292.98	13
186	3	101	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	81.77	1962.48	15
187	3	104	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	106.79	2562.96	7
188	3	105	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	43	72.00	3096.00	14
189	81	1	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	34	86.13	2928.42	5
190	81	10	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	50	126.52	6326.00	4
191	81	66	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	32	58.18	1861.76	2
192	81	92	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	25	95.93	2398.25	3
193	81	96	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	44	72.41	3186.04	1
194	80	7	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	42	155.66	6537.72	10
195	80	12	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	37	113.92	4215.04	8
196	80	14	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	32	65.44	2094.08	11
197	80	16	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	20	104.80	2096.00	7
198	80	18	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	114.65	3898.10	2
199	80	24	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	62.37	2681.91	6
200	80	25	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	113.80	3527.80	1
201	80	40	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	25	137.17	3429.25	3
202	80	43	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	69.15	1452.15	13
203	80	45	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	133.76	2808.96	12
204	80	47	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	35	59.06	2067.10	16
205	80	54	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	28	145.82	4082.96	15
206	80	71	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	39	34.74	1354.86	4
207	80	74	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	50.82	1727.88	9
208	80	78	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	136.22	5857.46	5
209	80	84	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	29	67.10	1945.90	14
210	80	87	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	33.79	1047.49	17
211	1	21	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	26	120.71	3138.46	2
212	1	34	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	46	114.84	5282.64	3
213	1	46	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	34	117.26	3986.84	4
214	1	59	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	50	43.27	2163.50	1
215	2	23	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	21	153.00	3213.00	6
216	2	27	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	58.12	2441.04	5
217	2	29	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	111.87	4698.54	3
218	2	50	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	36	75.46	2716.56	7
219	2	55	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	23	66.28	1524.44	8
220	2	56	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	62.47	1374.34	12
221	2	61	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	45	30.53	1373.85	2
222	2	64	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	36.29	798.38	1
223	2	67	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	32	74.51	2384.32	10
224	2	70	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	25	93.95	2348.75	9
225	2	73	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	49	76.19	3733.31	11
226	2	76	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	43	101.73	4374.39	13
227	2	80	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	46	36.11	1661.06	4
228	3	19	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	32	89.38	2860.16	1
229	3	33	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	34	138.38	4704.92	2
230	107	2	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	205.73	7817.74	11
231	107	6	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	22	122.62	2697.64	4
232	107	9	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	21	135.30	2841.30	8
233	107	17	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	116.67	4433.46	10
234	107	20	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	42	51.21	2150.82	17
235	107	30	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	51.05	2195.15	2
236	107	35	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	31	93.21	2889.51	12
237	107	36	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	46	61.84	2844.64	14
238	107	38	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	30	93.20	2796.00	13
239	107	44	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	94.25	3581.50	16
240	107	52	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	50	102.92	5146.00	5
241	107	53	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	47.29	2033.47	9
242	107	65	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	27	122.68	3312.36	1
243	107	82	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	34	83.76	2847.84	15
244	107	85	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	82.83	3561.69	3
245	107	90	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	26	62.05	1613.30	7
246	107	103	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	45	97.10	4369.50	6
247	16	8	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	193.25	8889.50	2
248	16	11	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	140.50	6463.00	3
249	16	13	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	42	169.56	7121.52	1
250	16	15	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	24	100.73	2417.52	11
251	16	26	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	140.81	6336.45	10
252	16	28	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	114.14	5136.30	14
253	16	40	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	22	149.02	3278.44	15
254	16	49	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	25	126.39	3159.75	5
255	16	57	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	50.86	1017.20	8
256	16	68	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	39	34.30	1337.70	12
257	16	81	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	107.63	2152.60	7
258	16	88	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	46.53	2093.85	13
259	16	89	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	29	60.90	1766.10	6
260	16	94	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	111.12	5111.52	9
261	16	95	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	55.65	2559.90	4
262	11	39	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	120.20	4928.20	2
263	11	42	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	80.67	3307.47	4
264	11	51	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	43	77.24	3321.32	1
265	11	99	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	32	72.75	2328.00	3
266	71	5	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	33	123.76	4084.08	2
267	71	63	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	113.06	5087.70	9
268	71	72	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	41	81.43	3338.63	4
269	71	77	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	50	76.31	3815.50	1
270	71	97	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	31	58.67	1818.77	5
271	71	102	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	72.28	3252.60	3
272	71	106	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	42	90.15	3786.30	6
273	71	107	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	30	94.34	2830.20	7
274	71	110	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	32	44.23	1415.36	8
275	32	37	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	40	68.82	2752.80	2
276	32	48	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	33	99.52	3284.16	1
277	101	22	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	141.92	2980.32	4
278	101	69	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	35	60.97	2133.95	5
279	101	75	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	29	52.60	1525.40	6
280	101	79	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	50	54.59	2729.50	3
281	101	100	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	22	76.94	1692.68	8
282	101	101	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	40	86.76	3470.40	1
283	101	108	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	26	63.67	1655.42	2
284	101	109	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	40.22	844.62	7
285	70	105	19	6	84	10132	Shipped	2003-06-25	2003-07-01	2003-06-28	36	80.00	2880.00	1
286	11	31	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	80.26	3932.74	3
287	11	60	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	41	109.42	4486.22	5
288	11	83	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	46	61.58	2832.68	4
289	11	86	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	23	80.91	1860.93	1
290	11	91	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	67.41	3303.09	6
291	11	93	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	37.09	1001.43	7
292	11	98	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	24	76.73	1841.52	8
293	11	104	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	115.09	3107.43	2
294	51	1	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	41	90.92	3727.72	2
295	51	3	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	27	116.56	3147.12	5
296	51	4	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	31	187.85	5823.35	4
297	51	10	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	20	131.04	2620.80	1
298	51	32	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	30	51.48	1544.40	6
299	51	58	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	35	94.67	3313.45	3
300	51	62	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	43	75.41	3242.63	7
301	6	7	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	173.17	7273.14	7
302	6	12	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	110.39	5298.72	5
303	6	14	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	24	72.62	1742.88	8
304	6	16	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	103.64	3005.56	4
305	6	24	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	66.99	3215.52	3
306	6	43	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	65.94	2967.30	10
307	6	45	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	139.64	5864.88	9
308	6	47	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	49.74	2238.30	13
309	6	54	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	31	133.92	4151.52	12
310	6	66	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	67.18	1948.22	16
311	6	71	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	20	34.36	687.20	1
312	6	74	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	27	52.05	1405.35	6
313	6	78	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	47	139.03	6534.41	2
314	6	84	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	23	76.80	1766.40	11
315	6	87	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	33	38.62	1274.46	14
316	6	92	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	30	91.85	2755.50	17
317	6	96	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	44	78.92	3472.48	15
318	48	18	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	25	117.48	2937.00	2
319	48	25	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	36	120.91	4352.76	1
320	48	40	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	41	169.34	6942.94	3
321	81	21	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	44	115.73	5092.12	2
322	81	34	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	37	110.88	4102.56	3
323	81	46	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	31	118.68	3679.08	4
324	81	59	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	26	40.25	1046.50	1
325	122	23	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	149.60	4936.80	6
326	122	27	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	51.46	1132.12	5
327	122	29	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	38	114.42	4347.96	3
328	122	50	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	47	79.15	3720.05	7
329	122	55	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	23	64.86	1491.78	8
330	122	56	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	45	59.53	2678.85	12
331	122	61	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	33.19	730.18	2
332	122	64	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	38.53	1271.49	1
333	122	67	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	28	73.60	2060.80	10
334	122	70	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	30	96.30	2889.00	9
335	122	73	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	49	77.05	3775.45	11
336	122	76	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	21	99.58	2091.18	13
337	122	80	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	29	32.82	951.78	4
338	58	19	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	31	89.38	2770.78	7
339	58	20	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	49	52.83	2588.67	6
340	58	33	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	41	151.88	6227.08	8
341	58	35	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	46	91.18	4194.28	1
342	58	36	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	52.47	1049.40	3
343	58	38	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	101.58	2031.60	2
344	58	44	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	30	81.35	2440.50	5
345	58	82	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	29	93.49	2711.21	4
346	18	2	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	37	186.44	6898.28	11
347	18	6	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	131.49	3418.74	4
348	18	9	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	38	118.90	4518.20	8
349	18	17	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	32	95.67	3061.44	10
350	18	30	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	46	51.05	2348.30	2
351	18	52	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	40	100.50	4020.00	5
352	18	53	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	29	40.25	1167.25	9
353	18	65	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	47	118.84	5585.48	1
354	18	85	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	87.64	2278.64	3
355	18	90	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	28	62.05	1737.40	7
356	18	103	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	36	101.15	3641.40	6
357	74	15	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	114.95	2413.95	5
358	74	26	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	39	160.46	6257.94	4
359	74	28	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	47	103.09	4845.23	8
360	74	40	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	34	143.94	4893.96	9
361	74	57	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	20	50.86	1017.20	2
362	74	68	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	32.18	675.78	6
363	74	81	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	40	104.09	4163.60	1
364	74	88	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	24	53.03	1272.72	7
365	74	94	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	44	94.92	4176.48	3
366	6	8	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	166.24	5485.92	12
367	6	11	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	140.50	4636.50	13
368	6	13	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	46	167.83	7720.18	11
369	6	39	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	47	129.76	6098.72	8
370	6	42	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	22	95.80	2107.60	10
371	6	49	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	122.08	2929.92	15
372	6	51	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	79.87	1916.88	7
373	6	63	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	114.29	3771.57	6
374	6	72	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	49	74.35	3643.15	1
375	6	89	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	60.90	2557.80	16
376	6	95	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	56.24	2362.08	14
377	6	97	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	41	55.34	2268.94	2
378	6	99	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	43	77.08	3314.44	9
379	6	106	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	21	92.16	1935.36	3
380	6	107	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	38	91.37	3472.06	4
381	6	110	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	39	46.96	1831.44	5
382	68	5	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	49	133.28	6530.72	15
383	68	22	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	32	126.15	4036.80	7
384	68	37	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	46	70.54	3244.84	13
385	68	48	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	99.52	3383.68	12
386	68	69	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	27	63.71	1720.17	8
387	68	75	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	33	59.83	1974.39	9
388	68	77	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	23	74.64	1716.72	14
389	68	79	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	55.96	1566.88	6
390	68	93	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	34.91	1186.94	1
391	68	98	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	36	86.77	3123.72	2
392	68	100	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	87.80	2282.80	11
393	68	101	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	79.78	2074.28	4
394	68	102	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	31	69.39	2151.09	16
395	68	105	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	70.40	1971.20	3
396	68	108	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	65.15	2215.10	5
397	68	109	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	37	49.66	1837.42	10
398	90	91	15	4	113	10144	Shipped	2003-08-13	2003-08-21	2003-08-14	20	56.41	1128.20	1
399	36	1	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	45	76.56	3445.20	6
400	36	3	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	37	104.67	3872.79	9
401	36	4	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	154.93	5112.69	8
402	36	10	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	49	146.10	7158.90	5
403	36	31	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	71.81	2154.30	14
404	36	32	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	52.70	1581.00	10
405	36	58	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	43	103.68	4458.24	7
406	36	60	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	40	87.54	3501.60	16
407	36	62	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	47	63.98	3007.06	11
408	36	66	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	56.10	1514.70	3
409	36	83	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	71.73	2367.09	15
410	36	86	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	99.89	3296.37	12
411	36	87	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	31	39.43	1222.33	1
412	36	92	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	95.93	2590.11	4
413	36	96	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	38	73.22	2782.36	2
414	36	104	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	20	113.90	2278.00	13
415	101	47	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	47	60.30	2834.10	2
416	101	54	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	29	130.94	3797.26	1
417	89	7	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	48	161.49	7751.52	7
418	89	12	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	110.39	3422.09	5
419	89	14	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	21	74.21	1558.41	8
420	89	16	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	33	97.89	3230.37	4
421	89	24	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	26	70.84	1841.84	3
422	89	43	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	36	74.78	2692.08	10
423	89	45	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	37	129.35	4785.95	9
424	89	71	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	25	33.23	830.75	1
425	89	74	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	30	48.98	1469.40	6
426	89	78	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	23	123.58	2842.34	2
427	89	84	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	72.76	2255.56	11
428	56	18	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	23	114.65	2636.95	13
429	56	21	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	108.26	5088.22	9
430	56	25	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	136.56	3414.00	12
431	56	34	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	113.52	3065.04	10
432	56	40	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	32	143.94	4606.08	14
433	56	46	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	28	135.63	3797.64	11
434	56	50	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	83.75	2847.50	1
435	56	55	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	29	66.28	1922.12	2
436	56	56	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	65.41	1635.25	6
437	56	59	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	46.29	2175.63	8
438	56	67	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	21	77.24	1622.04	4
439	56	70	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	115.09	3913.06	3
440	56	73	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	31	71.91	2229.21	5
441	56	76	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	96.37	2601.99	7
442	119	19	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	50	87.33	4366.50	4
443	119	20	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	30	48.52	1455.60	3
444	119	23	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	34	156.40	5317.60	11
445	119	27	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	24	50.85	1220.40	10
446	119	29	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	33	125.86	4153.38	8
447	119	33	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	23	167.06	3842.38	5
448	119	44	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	42	89.29	3750.18	2
449	119	61	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	36	31.20	1123.20	7
450	119	64	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	49	39.87	1953.63	6
451	119	80	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	26	38.57	1002.82	9
452	119	82	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	20	90.57	1811.40	1
453	15	2	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	45	182.16	8197.20	8
454	15	6	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	121.15	2423.00	1
455	15	9	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	135.30	4059.00	5
456	15	17	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	34	95.67	3252.78	7
457	15	35	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	47	93.21	4380.87	9
458	15	36	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	56.21	1686.30	11
459	15	38	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	26	97.39	2532.14	10
460	15	52	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	111.39	5458.11	2
461	15	53	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	47.29	1418.70	6
462	15	90	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	62.05	3040.45	4
463	15	103	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	95.08	1901.60	3
464	65	15	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	24	114.95	2758.80	3
465	65	26	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	43	152.27	6547.61	2
466	65	28	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	49	106.78	5232.22	6
467	65	30	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	39	58.34	2275.26	9
468	65	40	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	21	167.65	3520.65	7
469	65	65	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	42	109.90	4615.80	8
470	65	68	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	30	29.35	880.50	4
471	65	85	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	27	84.75	2288.25	10
472	65	88	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	41	43.29	1774.89	5
473	65	94	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	26	108.81	2829.06	1
474	73	49	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	35	117.77	4121.95	1
475	73	57	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	25	49.13	1228.25	4
476	73	81	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	23	112.37	2584.51	3
477	73	89	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	33	57.17	1886.61	2
478	11	8	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	201.57	4031.40	11
479	11	11	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	42	128.42	5393.64	12
480	11	13	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	49	155.72	7630.28	10
481	11	39	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	125.66	3895.46	7
482	11	42	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	29	82.69	2398.01	9
483	11	51	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	22	82.50	1815.00	6
484	11	63	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	40	111.83	4473.20	5
485	11	95	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	53.31	1652.61	13
486	11	97	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	43	58.00	2494.00	1
487	11	99	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	80.55	2497.05	8
488	11	106	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	87.15	4357.50	2
489	11	107	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	85.41	1708.20	3
490	11	110	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	51.87	2593.50	4
491	41	72	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	31	75.23	2332.13	2
492	41	102	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	36	59.27	2133.72	1
493	29	5	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	129.20	4134.40	13
494	29	22	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	38	138.77	5273.26	5
495	29	37	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	83.44	3671.36	11
496	29	48	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	29	105.87	3070.23	10
497	29	69	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	23	62.34	1433.82	6
498	29	75	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	56.55	1922.70	7
499	29	77	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	37	76.31	2823.47	12
500	29	79	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	58.69	2582.36	4
501	29	100	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	89.61	2867.52	9
502	29	101	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	20	87.75	1755.00	2
503	29	105	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	43	76.80	3302.40	1
504	29	108	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	70.33	3094.52	3
505	29	109	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	49.16	1671.44	8
506	11	93	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	20	43.64	872.80	1
507	11	98	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	48	77.64	3726.72	2
508	112	31	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	69.27	2285.91	3
509	112	60	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	40	89.72	3588.80	5
510	112	83	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	66.65	2199.45	4
511	112	86	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	34	83.91	2852.94	1
512	112	91	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	28	56.41	1579.48	6
513	112	104	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	48	109.16	5239.68	2
514	5	62	17	7	151	10158	Shipped	2003-10-10	2003-10-18	2003-10-15	22	67.79	1491.38	1
515	69	1	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	49	81.35	3986.15	14
516	69	3	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	37	101.10	3740.70	17
517	69	4	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	22	170.42	3749.24	16
518	69	7	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	41	188.73	7737.93	2
519	69	10	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	38	131.04	4979.52	13
520	69	14	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	24	67.03	1608.72	3
521	69	32	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	42	51.48	2162.16	18
522	69	43	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	66.74	1401.54	5
523	69	45	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	25	129.35	3233.75	4
524	69	47	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	54.71	1148.91	8
525	69	54	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	32	142.85	4571.20	7
526	69	58	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	44	100.30	4413.20	15
527	69	66	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	27	67.18	1813.86	11
528	69	74	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	50	49.60	2480.00	1
529	69	84	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	80.84	1859.32	6
530	69	87	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	35	39.43	1380.05	9
531	69	92	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	86.74	1995.02	12
532	69	96	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	31	78.11	2421.41	10
533	78	12	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	46	96.30	4429.80	6
534	78	16	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	50	93.28	4664.00	5
535	78	24	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	38	70.84	2691.92	4
536	78	40	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	20	140.55	2811.00	1
537	78	71	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	42	30.59	1284.78	2
538	78	78	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	35	130.60	4571.00	3
539	43	18	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	28	121.72	3408.16	12
540	43	21	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	43	102.04	4387.72	8
541	43	25	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	48	139.41	6691.68	11
542	43	34	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	125.40	2884.20	9
543	43	46	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	36	132.80	4780.80	10
544	43	55	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	62.72	1568.00	1
545	43	56	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	37	73.49	2719.13	5
546	43	59	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	47.29	1087.67	7
547	43	67	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	82.69	1653.80	3
548	43	70	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	108.04	2701.00	2
549	43	73	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	72.77	1455.40	4
550	43	76	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	30	94.23	2826.90	6
551	69	19	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	87.33	4191.84	2
552	69	20	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	45	45.28	2037.60	1
553	69	23	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	29	141.10	4091.90	9
554	69	27	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	27	53.28	1438.56	8
555	69	29	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	38	113.15	4299.70	6
556	69	33	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	156.94	7533.12	3
557	69	50	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	39	86.51	3373.89	10
558	69	61	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	27.55	1019.35	5
559	69	64	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	43	38.98	1676.14	4
560	69	80	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	32.82	1214.34	7
561	99	2	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	21	212.16	4455.36	1
562	99	35	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	31	101.31	3140.61	2
563	99	36	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	48	59.96	2878.08	4
564	99	38	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	40	101.58	4063.20	3
565	99	44	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	43	80.36	3455.48	6
566	99	82	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	42	96.42	4049.64	5
567	104	6	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	21	143.31	3009.51	2
568	104	9	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	121.64	5960.36	6
569	104	17	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	36	103.84	3738.24	8
570	104	52	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	45	107.76	4849.20	3
571	104	53	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	25	46.29	1157.25	7
572	104	85	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	24	91.49	2195.76	1
573	104	90	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	57.53	2818.97	5
574	104	103	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	39	86.99	3392.61	4
575	15	8	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	168.32	7406.08	3
576	15	11	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	34	123.89	4212.26	4
577	15	13	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	152.26	4111.02	2
578	15	15	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	109.02	5232.96	12
579	15	26	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	29	134.26	3893.54	11
580	15	28	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	46	120.28	5532.88	15
581	15	30	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	31	60.77	1883.87	18
582	15	40	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	47	154.10	7242.70	16
583	15	42	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	50	84.71	4235.50	1
584	15	49	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	28	123.51	3458.28	6
585	15	57	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	25	46.82	1170.50	9
586	15	65	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	32	117.57	3762.24	17
587	15	68	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	31.12	840.24	13
588	15	81	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	24	106.45	2554.80	8
589	15	88	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	50.86	2441.28	14
590	15	89	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	55.30	2433.20	7
591	15	94	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	106.49	5111.52	10
592	15	95	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	38	49.21	1869.98	5
593	109	39	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	43	136.59	5873.37	2
594	109	51	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	26	72.85	1894.10	1
595	109	99	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	29	76.22	2210.38	3
596	102	5	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	44	123.76	5445.44	9
597	102	22	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	141.92	6102.56	1
598	102	37	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	69.68	3205.28	7
599	102	48	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	34	84.70	2879.80	6
600	102	63	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	33	110.60	3649.80	16
601	102	69	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	21	54.81	1151.01	2
602	102	72	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	20	77.00	1540.00	11
603	102	75	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	32	64.44	2062.08	3
604	102	77	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	73.80	2140.20	8
605	102	97	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	66.00	2838.00	12
606	102	100	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	87.80	2546.20	5
607	102	102	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	62.16	2859.36	10
608	102	106	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	24	85.14	2043.36	13
609	102	107	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	28	83.42	2335.76	14
610	102	109	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	40	42.71	1708.40	4
611	102	110	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	38	43.68	1659.84	15
612	18	1	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.74	3410.64	1
613	18	3	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	97.53	2633.31	4
614	18	4	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	20	160.74	3214.80	3
615	18	31	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	21	75.19	1578.99	9
616	18	32	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	46	49.06	2256.76	5
617	18	58	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	50	103.68	5184.00	2
618	18	60	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	49	93.01	4557.49	11
619	18	62	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	29	72.36	2098.44	6
620	18	79	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	57.32	1547.64	18
621	18	83	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	68.10	3268.80	10
622	18	86	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	89.90	2517.20	7
623	18	91	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	57.78	1791.18	12
624	18	93	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	39.71	1906.08	13
625	18	98	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	91.34	2557.52	14
626	18	101	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	87.75	2720.25	16
627	18	104	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.92	3417.12	8
628	18	105	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	72.00	3456.00	15
629	18	108	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	39	67.37	2627.43	17
630	56	7	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	30	163.44	4903.20	2
631	56	10	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	35	126.52	4428.20	13
632	56	14	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	71.82	2585.52	3
633	56	43	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	32	65.13	2084.16	5
634	56	45	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	136.70	4921.20	4
635	56	47	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	52.84	2007.92	8
636	56	54	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	33	120.53	3977.49	7
637	56	66	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	66.49	2526.62	11
638	56	74	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	53.27	1811.18	1
639	56	84	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	24	77.61	1862.64	6
640	56	87	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	26	37.01	962.26	9
641	56	92	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	83.68	2845.12	12
642	56	96	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	48	75.66	3631.68	10
643	104	12	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	47	116.27	5464.69	4
644	104	16	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	41	93.28	3824.48	3
645	104	24	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	20	70.07	1401.40	2
646	104	78	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	34	130.60	4440.40	1
647	44	18	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	134.46	4706.10	2
648	44	25	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	128.03	4481.05	1
649	44	40	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	39	165.95	6472.05	3
650	44	71	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	36	34.74	1250.64	4
651	26	21	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	42	109.51	4599.42	6
652	26	34	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	39	117.48	4581.72	7
653	26	46	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	48	139.87	6713.76	8
654	26	56	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	32	61.00	1952.00	3
655	26	59	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	34	43.27	1471.18	5
656	26	67	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	79.97	1759.34	1
657	26	73	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	24	77.91	1869.84	2
658	26	76	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	87.81	1931.82	4
659	57	19	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	43	101.71	4373.53	6
660	57	20	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	48	51.75	2484.00	5
661	57	23	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	24	168.30	4039.20	13
662	57	27	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	26	55.09	1432.34	12
663	57	29	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	127.13	3941.03	10
664	57	33	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	140.06	3081.32	7
665	57	36	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	28	56.84	1591.52	2
666	57	38	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	86.92	2694.52	1
667	57	44	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	29	90.28	2618.12	4
668	57	50	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	21	77.31	1623.51	14
669	57	55	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	39	58.44	2279.16	15
670	57	61	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	29.87	925.97	9
671	57	64	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	27	39.42	1064.34	8
672	57	70	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	23	98.65	2268.95	16
673	57	80	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	35	35.70	1249.50	11
674	57	82	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	93.49	2056.78	3
675	73	2	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	34	207.87	7067.58	4
676	73	9	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	43	113.44	4877.92	1
677	73	17	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	48	108.50	5208.00	3
678	73	35	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	46	100.30	4613.80	5
679	73	53	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	49	44.27	2169.23	2
680	71	6	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	33	119.67	3949.11	9
681	71	15	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	26	109.02	2834.52	1
682	71	28	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	48	101.87	4889.76	4
683	71	30	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	41	59.55	2441.55	7
684	71	40	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	150.71	4370.59	5
685	71	52	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	47	102.92	4837.24	10
686	71	65	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	28	121.40	3399.20	6
687	71	68	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	37	32.18	1190.66	2
688	71	85	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	22	89.57	1970.54	8
689	71	88	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	50	50.86	2543.00	3
690	71	90	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	56.24	1630.96	12
691	71	103	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	42	80.92	3398.64	11
692	93	8	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	33	166.24	5485.92	2
693	93	11	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	47	145.04	6816.88	3
694	93	13	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	50	160.91	8045.50	1
695	93	26	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	20	139.17	2783.40	10
696	93	49	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	36	140.75	5067.00	5
697	93	57	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	27	55.49	1498.23	8
698	93	81	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	29	101.72	2949.88	7
699	93	89	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	22	62.14	1367.08	6
700	93	94	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	23	109.96	2529.08	9
701	93	95	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	38	52.14	1981.32	4
702	77	39	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	23	113.37	2607.51	9
703	77	42	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	29	92.77	2690.33	11
704	77	51	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	35	82.50	2887.50	8
705	77	63	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	50	115.52	5776.00	7
706	77	72	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	45	79.66	3584.70	2
707	77	97	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	58.67	1408.08	3
708	77	99	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	31	77.95	2416.45	10
709	77	102	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	32	64.33	2058.56	1
710	77	106	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	44	88.15	3878.60	4
711	77	107	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	83.42	2002.08	5
712	77	110	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	40	52.96	2118.40	6
713	48	5	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	24	131.92	3166.08	12
714	48	22	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	42	127.73	5364.66	4
715	48	37	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	41	70.54	2892.14	10
716	48	48	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	48	104.81	5030.88	9
717	48	69	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	67.82	2305.88	5
718	48	75	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	27	65.75	1775.25	6
719	48	77	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	21	68.77	1444.17	11
720	48	79	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	30	64.15	1924.50	3
721	48	100	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	86.90	2954.60	8
722	48	101	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	22	91.74	2018.28	1
723	48	108	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	68.11	3064.95	2
724	48	109	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	41.71	1876.95	7
725	122	31	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	82.79	1986.96	3
726	122	60	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	47	105.04	4936.88	5
727	122	83	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	27	66.65	1799.55	4
728	122	86	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	45	86.90	3910.50	1
729	122	91	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	63.97	1535.28	6
730	122	93	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	34	43.20	1468.80	7
731	122	98	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	23	75.81	1743.63	8
732	122	104	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	25	98.48	2462.00	2
733	122	105	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	39	80.00	3120.00	9
734	23	1	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	29	76.56	2220.24	9
735	23	3	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	42	99.91	4196.22	12
736	23	4	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	41	164.61	6749.01	11
737	23	10	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	40	131.04	5241.60	8
738	23	32	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	25	48.46	1211.50	13
739	23	47	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	59.06	1240.26	3
740	23	54	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	44	147.31	6481.64	2
741	23	58	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	48	98.05	4706.40	10
742	23	62	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	61.70	1727.60	14
743	23	66	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	35	60.95	2133.25	6
744	23	84	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	68.71	1923.88	1
745	23	87	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	34	33.39	1135.26	4
746	23	92	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	22	102.05	2245.10	7
747	23	96	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	74.85	1571.85	5
748	20	7	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	155.66	4202.82	14
749	20	12	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	28	113.92	3189.76	12
750	20	14	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	20	67.03	1340.60	15
751	20	16	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	36	107.10	3855.60	11
752	20	18	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	44	124.56	5480.64	6
753	20	21	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	42	124.44	5226.48	2
754	20	24	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	74.69	1643.18	10
755	20	25	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	21	129.45	2718.45	5
756	20	34	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	130.68	3528.36	3
757	20	40	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	45	147.33	6629.85	7
758	20	43	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	30	73.17	2195.10	17
759	20	45	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	120.53	2651.66	16
760	20	46	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	39	137.04	5344.56	4
761	20	59	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	34	45.28	1539.52	1
762	20	71	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	37	32.85	1215.45	8
763	20	74	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	23	54.49	1253.27	13
764	20	78	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	25	122.17	3054.25	9
765	6	19	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	25	83.22	2080.50	3
766	6	20	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	32	44.21	1414.72	2
767	6	23	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	159.80	7031.20	10
768	6	27	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	38	54.49	2070.62	9
769	6	29	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	105.52	2110.40	7
770	6	33	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	21	135.00	2835.00	4
771	6	44	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	86.31	2848.23	1
772	6	50	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	88.35	3180.60	11
773	6	55	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	61.29	2696.76	12
774	6	56	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	47	63.20	2970.40	16
775	6	61	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	39	31.86	1242.54	6
776	6	64	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	31	39.87	1235.97	5
777	6	67	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	87.24	3140.64	14
778	6	70	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	116.27	2325.40	13
779	6	73	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	73.62	2429.46	15
780	6	76	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	49	95.30	4669.70	17
781	6	80	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	23	34.88	802.24	8
782	76	2	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	180.01	4140.23	8
783	76	6	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	28	127.06	3557.68	1
784	76	9	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	41	114.80	4706.80	5
785	76	17	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	108.50	2278.50	7
786	76	35	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	37	91.18	3373.66	9
787	76	36	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	39	51.22	1997.58	11
788	76	38	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	22	90.06	1981.32	10
789	76	52	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	118.66	2491.86	2
790	76	53	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	40	42.26	1690.40	6
791	76	82	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	47	81.81	3845.07	12
792	76	90	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	49	52.36	2565.64	4
793	76	103	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	85.98	1977.54	3
794	117	15	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	37	105.47	3902.39	6
795	117	26	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	145.72	6703.12	5
796	117	28	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	119.05	5476.30	9
797	117	30	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	44	60.77	2673.88	12
798	117	40	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	28	165.95	4646.60	10
799	117	57	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	31	57.22	1773.82	3
800	117	65	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	24	117.57	2821.68	11
801	117	68	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	42	30.06	1262.52	7
802	117	81	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	49	114.73	5621.77	2
803	117	85	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	84.75	3898.50	13
804	117	88	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	33	52.49	1732.17	8
805	117	89	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	48	59.03	2833.44	1
806	117	94	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	45	92.60	4167.00	4
807	68	8	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	195.33	4101.93	13
808	68	11	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	146.55	4836.15	14
809	68	13	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	43	147.07	6324.01	12
810	68	39	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	124.30	3480.40	9
811	68	42	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	49	94.79	4644.71	11
812	68	49	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	127.82	4984.98	16
813	68	51	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	47	87.77	4125.19	8
814	68	63	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	105.69	3170.70	7
815	68	72	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	83.20	2745.60	2
816	68	95	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	20	46.86	937.20	15
817	68	97	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	64.67	1358.07	3
818	68	99	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	79.68	2390.40	10
819	68	102	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	61.44	2396.16	1
820	68	106	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	37	99.17	3669.29	4
821	68	107	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	22	93.35	2053.70	5
822	68	110	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	47.50	1330.00	6
823	120	5	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	26	108.80	2828.80	9
824	120	22	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	137.19	4390.08	1
825	120	37	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	73.12	2339.84	7
826	120	48	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	46	98.46	4529.16	6
827	120	69	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	22	60.29	1326.38	2
828	120	75	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	21	59.83	1256.43	3
829	120	77	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	36	68.77	2475.72	8
830	120	100	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	24	80.56	1933.44	5
831	120	109	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	28	42.71	1195.88	4
832	39	31	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	45	70.12	3155.40	1
833	39	60	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	46	96.29	4429.34	3
834	39	79	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	43	55.96	2406.28	10
835	39	83	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	33	64.48	2127.84	2
836	39	91	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	31	61.22	1897.82	4
837	39	93	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	41	39.71	1628.11	5
838	39	98	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	84.95	2888.30	6
839	39	101	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	95.73	4212.12	8
840	39	105	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	72.00	2448.00	7
841	39	108	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	70.33	3094.52	9
842	20	1	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	48	95.70	4593.60	1
843	20	3	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	38	111.80	4248.40	4
844	20	4	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	45	182.04	8191.80	3
845	20	32	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	32	52.09	1666.88	5
846	20	58	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	25	95.80	2395.00	2
847	20	62	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	40	61.70	2468.00	6
848	20	86	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	44	81.91	3604.04	7
849	20	104	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	29	96.11	2787.19	8
850	36	10	8	1	188	10189	Shipped	2003-11-18	2003-11-25	2003-11-24	28	138.57	3879.96	1
851	11	66	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	58.87	2472.54	3
852	11	87	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	46	38.62	1776.52	1
853	11	92	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	89.80	3771.60	4
854	11	96	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	40	67.53	2701.20	2
855	53	7	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	21	155.66	3268.86	3
856	53	12	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	40	104.52	4180.80	1
857	53	14	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	30	70.22	2106.60	4
858	53	43	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	36	75.59	2721.24	6
859	53	45	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	23	119.06	2738.38	5
860	53	47	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	43	60.93	2619.99	9
861	53	54	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	32	136.90	4380.80	8
862	53	74	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	48	53.27	2556.96	2
863	53	84	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	44	77.61	3414.84	7
864	86	16	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	27	99.04	2674.08	16
865	86	18	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	22	140.12	3082.64	11
866	86	21	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	29	100.80	2923.20	7
867	86	24	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	70.84	3187.80	15
868	86	25	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	128.03	6017.41	10
869	86	34	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	38	110.88	4213.44	8
870	86	40	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	26	137.17	3566.42	12
871	86	46	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	125.74	5658.30	9
872	86	56	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	37	72.02	2664.74	4
873	86	59	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	49.30	2317.10	6
874	86	67	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	86.33	3971.18	2
875	86	70	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	23	112.74	2593.02	1
876	86	71	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	30	33.23	996.90	13
877	86	73	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	32	69.34	2218.88	3
878	86	76	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	93.16	4285.36	5
879	86	78	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	112.34	5055.30	14
880	111	19	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	92.47	2589.16	7
881	111	20	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	46	46.36	2132.56	6
882	111	23	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	21	153.00	3213.00	14
883	111	27	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	42	60.54	2542.68	13
884	111	29	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	44	115.69	5090.36	11
885	111	33	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	143.44	3155.68	8
886	111	35	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	87.13	2439.64	1
887	111	36	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	53.09	1274.16	3
888	111	38	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	23	97.39	2239.97	2
889	111	44	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	32	79.37	2539.84	5
890	111	50	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	92.03	2208.72	15
891	111	55	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	25	66.28	1657.00	16
892	111	61	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	26	32.19	836.94	10
893	111	64	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	44.80	896.00	9
894	111	80	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	38.16	839.52	12
895	111	82	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	92.52	1850.40	4
896	14	2	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	42	203.59	8550.78	11
897	14	6	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	134.44	3495.44	4
898	14	9	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	38	124.37	4726.06	8
899	14	17	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	21	103.84	2180.64	10
900	14	30	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	45	51.05	2297.25	2
901	14	52	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	32	113.82	3642.24	5
902	14	53	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	41	47.79	1959.39	9
903	14	65	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	49	112.46	5510.54	1
904	14	85	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	37	77.05	2850.85	3
905	14	90	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	39	61.41	2394.99	7
906	14	103	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	80.92	2103.92	6
907	67	15	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	118.50	5806.50	6
908	67	26	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	27	139.17	3757.59	5
909	67	28	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	35	112.91	3951.85	9
910	67	40	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	50	150.71	7535.50	10
911	67	57	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	44	54.33	2390.52	3
912	67	68	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	31.82	1018.24	7
913	67	81	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	34	95.81	3257.54	2
914	67	88	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	51.95	1662.40	8
915	67	89	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	33	59.03	1947.99	1
916	67	94	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	97.23	4764.27	4
917	105	8	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	47	203.64	9571.08	5
918	105	11	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	24	151.08	3625.92	6
919	105	13	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	38	147.07	5588.66	4
920	105	39	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	49	127.03	6224.47	1
921	105	42	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	35	81.68	2858.80	3
922	105	49	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	27	126.39	3412.53	8
923	105	95	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	46	56.82	2613.72	7
924	105	99	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	50	84.88	4244.00	2
925	40	5	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	45	118.32	5324.40	6
926	40	37	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	46	83.44	3838.24	4
927	40	48	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	85.75	1886.50	3
928	40	51	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	78.99	3949.50	14
929	40	63	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	41	109.37	4484.17	13
930	40	72	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	47	83.20	3910.40	8
931	40	77	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	67.93	1494.46	5
932	40	97	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	23	60.00	1380.00	9
933	40	100	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	24	78.75	1890.00	2
934	40	102	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	66.50	3325.00	7
935	40	106	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	27	100.17	2704.59	10
936	40	107	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	35	88.39	3093.65	11
937	40	109	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	29	39.73	1152.17	1
938	40	110	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	42	48.59	2040.78	12
939	92	22	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	149.81	6292.02	4
940	92	69	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	48	60.97	2926.56	5
941	92	75	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	27	61.81	1668.87	6
942	92	79	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	43	65.51	2816.93	3
943	92	101	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	94.73	3978.66	1
944	92	108	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	40	74.03	2961.20	2
945	113	93	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	29	37.97	1101.13	1
946	113	98	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	48	81.29	3901.92	2
947	113	105	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	38	70.40	2675.20	3
948	39	31	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	28	74.34	2081.52	3
949	39	60	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	33	99.57	3285.81	5
950	39	83	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	70.28	2740.92	4
951	39	86	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	35	80.91	2831.85	1
952	39	91	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	27	65.35	1764.45	6
953	39	104	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	115.09	4488.51	2
954	9	1	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	22	82.30	1810.60	2
955	9	3	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	24	116.56	2797.44	5
956	9	4	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	49	191.72	9394.28	4
957	9	10	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	126.52	3163.00	1
958	9	32	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	30	48.46	1453.80	6
959	9	58	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	39	93.54	3648.06	3
960	9	62	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	66.27	1656.75	7
961	83	47	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	30	55.33	1659.90	3
962	83	54	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	43	124.99	5374.57	2
963	83	66	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	56.10	2805.00	6
964	83	84	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	75.18	3759.00	1
965	83	87	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	27	33.39	901.53	4
966	83	92	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	31	81.64	2530.84	7
967	83	96	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	40	79.73	3189.20	5
968	11	7	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	161.49	3229.80	8
969	11	12	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	111.57	2231.40	6
970	11	14	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	44	63.84	2808.96	9
971	11	16	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	115.16	5412.52	5
972	11	24	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	45	73.15	3291.75	4
973	11	40	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	48	157.49	7559.52	1
974	11	43	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	33	66.74	2202.42	11
975	11	45	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	32	127.88	4092.16	10
976	11	71	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	21	33.23	697.83	2
977	11	74	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	34	56.94	1935.96	7
978	11	78	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	140.43	6600.21	3
979	16	18	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	114.65	4815.30	17
980	16	21	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	113.24	4529.60	13
981	16	23	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	33	153.00	5049.00	4
982	16	25	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	38	133.72	5081.36	16
983	16	27	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	23	59.33	1364.59	3
984	16	29	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	26	119.50	3107.00	1
985	16	34	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	27	106.92	2886.84	14
986	16	46	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	35	132.80	4648.00	15
987	16	50	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	29	83.75	2428.75	5
988	16	55	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	69.84	3142.80	6
989	16	56	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	20	69.82	1396.40	10
990	16	59	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	46.79	2105.55	12
991	16	67	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	47	79.06	3715.82	8
992	16	70	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	112.74	4735.08	7
993	16	73	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	84.75	3390.00	9
994	16	76	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	48	104.94	5037.12	11
995	16	80	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	39	34.88	1360.32	2
996	11	19	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	36	98.63	3550.68	2
997	11	20	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	48	45.82	2199.36	1
998	11	33	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	40	138.38	5535.20	3
999	11	61	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	32	27.88	892.16	5
1000	11	64	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	24	36.74	881.76	4
1001	34	2	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	47	203.59	9568.73	6
1002	34	9	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	109.34	3061.52	3
1003	34	17	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	34	115.50	3927.00	5
1004	34	35	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	37	98.27	3635.99	7
1005	34	36	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	51.84	1451.52	9
1006	34	38	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	30	102.63	3078.90	8
1007	34	44	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	99.21	2777.88	11
1008	34	53	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	21	45.78	961.38	4
1009	34	82	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	95.44	3149.52	10
1010	34	90	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	36	54.94	1977.84	2
1011	34	103	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	89.01	2937.33	1
1012	121	6	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	31	125.58	3892.98	15
1013	121	15	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	34	95.99	3263.66	7
1014	121	26	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	44	140.81	6195.64	6
1015	121	28	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	43	109.23	4696.89	10
1016	121	30	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	37	60.77	2248.49	13
1017	121	40	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	25	140.55	3513.75	11
1018	121	49	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	40	143.62	5744.80	1
1019	121	52	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	47	119.87	5633.89	16
1020	121	57	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	57.80	2832.20	4
1021	121	65	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	46	127.79	5878.34	12
1022	121	68	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	42	30.76	1291.92	8
1023	121	81	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	108.82	3046.96	3
1024	121	85	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	84.75	4152.75	14
1025	121	88	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	27	51.95	1402.65	9
1026	121	89	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	45	55.30	2488.50	2
1027	121	94	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	106.49	2981.72	5
1028	14	8	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	176.63	8124.98	13
1029	14	11	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	26	128.42	3338.92	14
1030	14	13	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	152.26	3045.20	12
1031	14	39	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	24	117.47	2819.28	9
1032	14	42	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	48	96.81	4646.88	11
1033	14	51	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	45	72.85	3278.25	8
1034	14	63	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	35	122.89	4301.15	7
1035	14	72	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	80.54	1610.80	2
1036	14	95	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	30	57.99	1739.70	15
1037	14	97	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	38	56.67	2153.46	3
1038	14	99	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	40	73.62	2944.80	10
1039	14	102	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	63.61	2926.06	1
1040	14	106	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	37	95.16	3520.92	4
1041	14	107	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	33	95.34	3146.22	5
1042	14	110	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	42	48.05	2018.10	6
1043	78	5	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	39	129.20	5038.80	8
1044	78	37	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	28	82.58	2312.24	6
1045	78	48	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	20	97.40	1948.00	5
1046	78	69	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	43	66.45	2857.35	1
1047	78	75	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	36	56.55	2035.80	2
1048	78	77	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	22	79.67	1752.74	7
1049	78	100	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	33	90.52	2987.16	4
1050	78	109	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	48	44.20	2121.60	3
1051	27	3	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	23	112.99	2598.77	2
1052	27	4	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	34	189.79	6452.86	1
1053	27	22	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	141.92	4399.52	17
1054	27	31	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	50	68.43	3421.50	7
1055	27	32	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	51.48	2059.20	3
1056	27	60	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	27	100.67	2718.09	9
1057	27	62	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	30	63.22	1896.60	4
1058	27	79	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	29	56.64	1642.56	16
1059	27	83	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	68.10	2724.00	8
1060	27	86	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	46	84.91	3905.86	5
1061	27	91	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	39	57.10	2226.90	10
1062	27	93	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	43	43.20	1857.60	11
1063	27	98	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	21	87.69	1841.49	12
1064	27	101	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	26	93.74	2437.24	14
1065	27	104	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	25	98.48	2462.00	6
1066	27	105	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	64.00	1984.00	13
1067	27	108	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	42	60.70	2549.40	15
1068	95	1	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	90.92	3727.72	14
1069	95	7	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	171.22	7020.02	2
1070	95	10	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	36	126.52	4554.72	13
1071	95	14	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	79.80	2234.40	3
1072	95	43	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	35	73.17	2560.95	5
1073	95	45	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	138.17	3868.76	4
1074	95	47	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	46	60.30	2773.80	8
1075	95	54	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	148.80	6100.80	7
1076	95	58	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	25	109.32	2733.00	15
1077	95	66	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	21	62.33	1308.93	11
1078	95	74	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	48	52.66	2527.68	1
1079	95	84	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	22	80.84	1778.48	6
1080	95	87	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	39.83	1633.03	9
1081	95	92	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	37	94.91	3511.67	12
1082	95	96	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	40	70.78	2831.20	10
1083	11	12	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	39	99.82	3892.98	16
1084	11	16	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	33	110.55	3648.15	15
1085	11	18	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	29	117.48	3406.92	10
1086	11	21	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	38	105.77	4019.26	6
1087	11	24	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	20	64.68	1293.60	14
1088	11	25	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	133.72	5482.52	9
1089	11	34	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	117.48	4699.20	7
1090	11	40	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	155.79	6231.60	11
1091	11	46	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	115.85	5213.25	8
1092	11	56	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	61.73	2530.93	3
1093	11	59	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	43.27	1947.15	5
1094	11	67	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	81.78	3680.10	1
1095	11	71	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	34	37.38	1270.92	12
1096	11	73	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	27	77.91	2103.57	2
1097	11	76	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	46	100.66	4630.36	4
1098	11	78	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	49	117.96	5780.04	13
1099	120	50	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	38	84.67	3217.46	1
1100	120	55	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	25	58.44	1461.00	2
1101	120	70	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	27	97.48	2631.96	3
1102	107	23	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	30	166.60	4998.00	7
1103	107	27	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	21	53.28	1118.88	6
1104	107	29	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	27	125.86	3398.22	4
1105	107	33	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	50	167.06	8353.00	1
1106	107	61	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	20	32.19	643.80	3
1107	107	64	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	49	39.87	1953.63	2
1108	107	80	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	44	38.57	1697.08	5
1109	113	2	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	35	205.73	7200.55	3
1110	113	17	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	100.34	4615.64	2
1111	113	19	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	27	92.47	2496.69	10
1112	113	20	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	33	53.91	1779.03	9
1113	113	35	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	97.26	4765.74	4
1114	113	36	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	31	56.21	1742.51	6
1115	113	38	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	89.01	4361.49	5
1116	113	44	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	41	84.33	3457.53	8
1117	113	53	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	42.76	1966.96	1
1118	113	82	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	39	94.47	3684.33	7
1119	52	9	14	4	234	10216	Shipped	2004-02-02	2004-02-10	2004-02-04	43	133.94	5759.42	1
1120	19	6	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	48	132.97	6382.56	4
1121	19	30	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	35	58.34	2041.90	2
1122	19	52	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	38	118.66	4509.08	5
1123	19	65	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	28	103.51	2898.28	1
1124	19	85	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	21	78.97	1658.37	3
1125	19	90	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	39	56.24	2193.36	7
1126	19	103	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	31	90.02	2790.62	6
1127	112	28	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	22	110.46	2430.12	1
1128	112	40	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	34	152.41	5181.94	2
1129	119	15	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	48	94.80	4550.40	2
1130	119	26	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	43	132.62	5702.66	1
1131	119	68	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	21	31.12	653.52	3
1132	119	88	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	35	47.62	1666.70	4
1133	31	8	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	32	189.10	6051.20	2
1134	31	11	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	151.08	4532.40	3
1135	31	13	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	27	166.10	4484.70	1
1136	31	49	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	50	126.39	6319.50	5
1137	31	57	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	26	48.55	1262.30	8
1138	31	81	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	101.72	3763.64	7
1139	31	89	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	20	49.71	994.20	6
1140	31	94	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	92.60	3426.20	9
1141	31	95	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	56.82	1704.60	4
1142	66	39	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	33	133.86	4417.38	3
1143	66	42	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	89.75	2064.25	5
1144	66	51	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	39	84.26	3286.14	2
1145	66	63	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	49	113.06	5539.94	1
1146	66	99	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	69.29	1593.67	4
1147	46	5	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	133.28	6530.72	12
1148	46	22	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	137.19	6722.31	4
1149	46	37	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	79.14	3877.86	10
1150	46	48	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	45	88.93	4001.85	9
1151	46	69	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	32	56.86	1819.52	5
1152	46	72	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	47	74.35	3494.45	14
1153	46	75	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	61.15	2629.45	6
1154	46	77	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	46	77.99	3587.54	11
1155	46	79	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	48	55.27	2652.96	3
1156	46	97	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	58.67	1818.77	15
1157	46	100	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	26	80.56	2094.56	8
1158	46	101	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	37	90.75	3357.75	1
1159	46	102	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	69.39	2498.04	13
1160	46	106	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	38	84.14	3197.32	16
1161	46	107	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	81.43	2524.33	17
1162	46	108	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	66.63	2865.09	2
1163	46	109	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	45.19	1400.89	7
1164	46	110	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	48.59	1749.24	18
1165	3	1	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	37	80.39	2974.43	1
1166	3	3	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	110.61	5198.67	4
1167	3	4	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	49	189.79	9299.71	3
1168	3	31	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	67.58	3176.26	9
1169	3	32	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	28	58.75	1645.00	5
1170	3	58	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	32	104.81	3353.92	2
1171	3	60	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	34	87.54	2976.36	11
1172	3	62	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	38	60.94	2315.72	6
1173	3	83	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	23	68.10	1566.30	10
1174	3	86	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	21	90.90	1908.90	7
1175	3	91	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	20	66.73	1334.60	12
1176	3	93	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	41	41.02	1681.82	13
1177	3	98	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	25	84.03	2100.75	14
1178	3	104	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	29	113.90	3303.10	8
1179	3	105	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	26	79.20	2059.20	15
1180	23	10	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	141.58	6087.94	6
1181	23	47	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	38	57.20	2173.60	1
1182	23	66	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	37	60.26	2229.62	4
1183	23	87	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	37.01	1591.43	2
1184	23	92	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	30	94.91	2847.30	5
1185	23	96	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	50	81.36	4068.00	3
1186	61	7	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	157.60	4255.20	9
1187	61	12	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	25	101.00	2525.00	7
1188	61	14	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	64.64	2391.68	10
1189	61	16	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	21	100.19	2103.99	6
1190	61	18	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	32	116.06	3713.92	1
1191	61	24	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	47	71.61	3365.67	5
1192	61	40	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	43	162.57	6990.51	2
1193	61	43	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	69.96	2588.52	12
1194	61	45	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	119.06	3214.62	11
1195	61	54	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	35	135.41	4739.35	14
1196	61	71	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	42	34.74	1459.08	3
1197	61	74	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	24	51.43	1234.32	8
1198	61	78	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	40	130.60	5224.00	4
1199	61	84	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	46	77.61	3570.06	13
1200	46	21	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	38	108.26	4113.88	4
1201	46	25	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	129.45	3106.80	7
1202	46	34	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	125.40	3009.60	5
1203	46	46	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	46	122.91	5653.86	6
1204	46	56	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	21	65.41	1373.61	1
1205	46	59	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	36	47.79	1720.44	3
1206	46	76	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	48	95.30	4574.40	2
1207	14	19	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	25	85.27	2131.75	3
1208	14	20	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	31	50.14	1554.34	2
1209	14	23	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	26	136.00	3536.00	10
1210	14	27	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	28	59.93	1678.04	9
1211	14	29	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	46	118.23	5438.58	7
1212	14	33	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	29	146.81	4257.49	4
1213	14	44	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	99.21	3273.93	1
1214	14	50	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	34	87.43	2972.62	11
1215	14	55	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	37	70.56	2610.72	12
1216	14	61	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	42	27.22	1143.24	6
1217	14	64	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	24	39.42	946.08	5
1218	14	67	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	47	84.51	3971.97	14
1219	14	70	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	102.17	3371.61	13
1220	14	73	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	40	78.76	3150.40	15
1221	14	80	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	27	34.88	941.76	8
1222	25	2	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	29	214.30	6214.70	2
1223	25	17	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	32	100.34	3210.88	1
1224	25	35	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	24	101.31	2431.44	3
1225	25	36	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	45	57.46	2585.70	5
1226	25	38	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	31	100.53	3116.43	4
1227	25	82	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	33	84.73	2796.09	6
1228	6	6	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	138.88	6944.00	9
1229	6	9	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	110.70	2767.50	13
1230	6	15	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	36	95.99	3455.64	1
1231	6	28	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	26	104.32	2712.32	4
1232	6	30	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	28	53.48	1497.44	7
1233	6	40	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	22	157.49	3464.78	5
1234	6	52	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	41	119.87	4914.67	10
1235	6	53	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	39	43.77	1707.03	14
1236	6	65	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	48	115.01	5520.48	6
1237	6	68	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	33	34.65	1143.45	2
1238	6	85	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	78.97	1974.25	8
1239	6	88	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	23	49.78	1144.94	3
1240	6	90	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	30	52.36	1570.80	12
1241	6	103	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	91.04	4552.00	11
1242	8	11	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	128.42	5522.06	1
1243	8	26	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	49	153.91	7541.59	8
1244	8	49	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	42	142.18	5971.56	3
1245	8	57	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	36	47.40	1706.40	6
1246	8	81	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	45	99.36	4471.20	5
1247	8	89	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	46	59.03	2715.38	4
1248	8	94	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	34	100.70	3423.80	7
1249	8	95	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	57.41	2468.63	2
1250	77	8	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	42	193.25	8116.50	2
1251	77	13	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	49	147.07	7206.43	1
1252	47	39	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	22	133.86	2944.92	6
1253	47	42	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	97.81	4694.88	8
1254	47	51	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	23	78.12	1796.76	5
1255	47	63	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	46	113.06	5200.76	4
1256	47	99	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	26	84.88	2206.88	7
1257	47	106	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	86.15	4135.20	1
1258	47	107	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	35	81.43	2850.05	2
1259	47	110	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	24	48.59	1166.16	3
1260	72	72	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	40	70.81	2832.40	2
1261	72	97	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	36	66.00	2376.00	3
1262	72	102	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	29	67.94	1970.26	1
1263	97	5	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	118.32	5679.36	9
1264	97	22	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	50	146.65	7332.50	1
1265	97	37	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	84.30	4046.40	7
1266	97	48	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	39	85.75	3344.25	6
1267	97	69	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	44	67.14	2954.16	2
1268	97	75	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	25	65.09	1627.25	3
1269	97	77	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	31	78.83	2443.73	8
1270	97	100	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	29	83.28	2415.12	5
1271	97	109	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	40	45.69	1827.60	4
1272	54	31	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	24	81.95	1966.80	3
1273	54	60	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	23	89.72	2063.56	5
1274	54	79	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	33	55.27	1823.91	12
1275	54	83	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	40	63.03	2521.20	4
1276	54	86	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	90.90	3726.90	1
1277	54	91	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	66.73	2268.82	6
1278	54	93	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	37.09	1520.69	7
1279	54	98	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	88.60	2215.00	8
1280	54	101	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	38	92.74	3524.12	10
1281	54	104	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	116.28	2907.00	2
1282	54	105	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	32	73.60	2355.20	9
1283	54	108	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	70.33	2391.22	11
1284	118	3	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	22	105.86	2328.92	1
1285	118	32	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	23	52.70	1212.10	2
1286	118	62	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	36	65.51	2358.36	3
1287	28	1	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	23	91.87	2113.01	7
1288	28	4	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	39	158.80	6193.20	9
1289	28	10	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	32	129.53	4144.96	6
1290	28	47	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	49.74	1293.24	1
1291	28	58	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	109.32	2186.40	8
1292	28	66	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	62.33	1620.58	4
1293	28	87	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	35.00	910.00	2
1294	28	92	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	27	94.91	2562.57	5
1295	28	96	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	78.92	1578.40	3
1296	13	7	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	28	161.49	4521.72	3
1297	13	12	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	29	104.52	3031.08	1
1298	13	14	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	20	73.42	1468.40	4
1299	13	43	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	41	68.35	2802.35	6
1300	13	45	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	49	144.05	7058.45	5
1301	13	54	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	44	120.53	5303.32	8
1302	13	74	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	47	53.88	2532.36	2
1303	13	84	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	22	67.91	1494.02	7
1304	65	16	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	21	100.19	2103.99	5
1305	65	24	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	46	70.07	3223.22	4
1306	65	40	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	47	135.47	6367.09	1
1307	65	71	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	20	32.47	649.40	2
1308	65	78	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	29	133.41	3868.89	3
1309	27	18	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	41	125.97	5164.77	3
1310	27	25	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	136.56	5052.72	2
1311	27	46	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	134.22	4966.14	1
1312	38	21	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	119.46	2508.66	11
1313	38	23	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	41	153.00	6273.00	2
1314	38	27	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	33	55.70	1838.10	1
1315	38	34	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	44	126.72	5575.68	12
1316	38	50	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	42	77.31	3247.02	3
1317	38	55	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	30	62.72	1881.60	4
1318	38	56	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	22	72.02	1584.44	8
1319	38	59	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	47.29	993.09	10
1320	38	67	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	47	89.05	4185.35	6
1321	38	70	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	28	117.44	3288.32	5
1322	38	73	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	26	69.34	1802.84	7
1323	38	76	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	27	107.08	2891.16	9
1324	106	80	11	3	288	10242	Shipped	2004-04-20	2004-04-28	2004-04-25	46	36.52	1679.92	1
1325	121	29	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	47	111.87	5257.89	2
1326	121	61	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	33	30.87	1018.71	1
1327	11	19	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	99.66	3986.40	7
1328	11	20	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	20	48.52	970.40	6
1329	11	33	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	43	141.75	6095.25	8
1330	11	35	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	30	87.13	2613.90	1
1331	11	36	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	24	54.96	1319.04	3
1332	11	38	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	29	85.87	2490.23	2
1333	11	44	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	36	87.30	3142.80	5
1334	11	64	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	39	42.11	1642.29	9
1335	11	82	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	97.39	3895.60	4
1336	105	2	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	34	195.01	6630.34	9
1337	105	6	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	28	147.74	4136.72	2
1338	105	9	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	38	120.27	4570.26	6
1339	105	17	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	29	114.34	3315.86	8
1340	105	52	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	21	111.39	2339.19	3
1341	105	53	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	45	48.80	2196.00	7
1342	105	85	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	37	81.86	3028.82	1
1343	105	90	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	54.94	2417.36	5
1344	105	103	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	81.93	3604.92	4
1345	11	15	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	99.54	4578.84	5
1346	11	26	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	40	144.08	5763.20	4
1347	11	28	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	100.64	2214.08	8
1348	11	30	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	30	57.73	1731.90	11
1349	11	40	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	36	145.63	5242.68	9
1350	11	57	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	44	46.24	2034.56	2
1351	11	65	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	29	118.84	3446.36	10
1352	11	68	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	49	34.65	1697.85	6
1353	11	81	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	100.54	4624.84	1
1354	11	88	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	35	45.45	1590.75	7
1355	11	94	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	113.44	2495.68	3
1356	74	8	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	44	195.33	8594.52	2
1357	74	11	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	25	140.50	3512.50	3
1358	74	13	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	27	167.83	4531.41	1
1359	74	49	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	48	143.62	6893.76	5
1360	74	89	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	40	58.41	2336.40	6
1361	74	95	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	49	51.55	2525.95	4
1362	10	5	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	20	126.48	2529.60	3
1363	10	37	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	21	80.86	1698.06	1
1364	10	39	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	133.86	4283.52	12
1365	10	42	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	95.80	4023.60	14
1366	10	51	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	87.77	3686.34	11
1367	10	63	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	48	122.89	5898.72	10
1368	10	72	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	85.85	2575.50	5
1369	10	77	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	83.02	1909.46	2
1370	10	97	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	36	66.00	2376.00	6
1371	10	99	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	40	81.41	3256.40	13
1372	10	102	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	69.39	2220.48	4
1373	10	106	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	84.14	2524.20	7
1374	10	107	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	35	92.36	3232.60	8
1375	10	110	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	53.51	1230.73	9
1376	25	48	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	46	88.93	4090.78	5
1377	25	69	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	20	54.81	1096.20	1
1378	25	75	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	25	65.75	1643.75	2
1379	25	100	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	40	85.99	3439.60	4
1380	25	109	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	32	49.16	1573.12	3
1381	103	22	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	45	148.23	6670.35	14
1382	103	31	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	27	84.48	2280.96	4
1383	103	60	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	95.20	2951.20	6
1384	103	62	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	32	63.22	2023.04	1
1385	103	79	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	40	61.42	2456.80	13
1386	103	83	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	37	72.45	2680.65	5
1387	103	86	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	99.89	3096.59	2
1388	103	91	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	50	62.60	3130.00	7
1389	103	93	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	36	36.66	1319.76	8
1390	103	98	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	91.34	2831.54	9
1391	103	101	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	35	90.75	3176.25	11
1392	103	104	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	98.48	4333.12	3
1393	103	105	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	76.00	3344.00	10
1394	103	108	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	38	65.89	2503.82	12
1395	72	1	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	59	93.79	5533.61	2
1396	72	3	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	115.37	5076.28	5
1397	72	4	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	43	172.36	7411.48	4
1398	72	10	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	46	129.53	5958.38	1
1399	72	32	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	58.15	2558.60	6
1400	72	58	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	50	91.29	4564.50	3
1401	95	43	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	20	74.78	1495.60	2
1402	95	45	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	41	145.52	5966.32	1
1403	95	47	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	31	50.36	1561.16	5
1404	95	54	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	26	127.97	3327.22	4
1405	95	66	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	47	63.03	2962.41	8
1406	95	84	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	38	69.52	2641.76	3
1407	95	87	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	36	36.21	1303.56	6
1408	95	92	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	25	93.89	2347.25	9
1409	95	96	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	48	72.41	3475.68	7
1410	33	7	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	157.60	3782.40	13
1411	33	12	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	22	102.17	2247.74	11
1412	33	14	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	25	67.03	1675.75	14
1413	33	16	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	41	109.40	4485.40	10
1414	33	18	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	26	130.22	3385.72	5
1415	33	21	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	103.29	2478.96	1
1416	33	24	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	23	67.76	1558.48	9
1417	33	25	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	33	130.87	4318.71	4
1418	33	34	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	37	114.84	4249.08	2
1419	33	40	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	145.63	5825.20	6
1420	33	46	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	31	139.87	4335.97	3
1421	33	71	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	34.74	1389.60	7
1422	33	74	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	50.82	1219.68	12
1423	33	78	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	39	115.15	4490.85	8
1424	70	23	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	137.70	6747.30	5
1425	70	27	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	36	55.09	1983.24	4
1426	70	29	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	41	102.98	4222.18	2
1427	70	50	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	80.99	2753.66	6
1428	70	55	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	30	59.87	1796.10	7
1429	70	56	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	66.88	2273.92	11
1430	70	59	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	32	43.27	1384.64	13
1431	70	61	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	38	28.88	1097.44	1
1432	70	67	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	31	85.42	2648.02	9
1433	70	70	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	33	111.57	3681.81	8
1434	70	73	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	42	69.34	2912.28	10
1435	70	76	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	101.73	4984.77	12
1436	70	80	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	20	39.80	796.00	3
1437	38	33	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	24	135.00	3240.00	1
1438	38	64	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	37	37.63	1392.31	2
1439	13	19	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	34	93.49	3178.66	2
1440	13	20	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	29	52.83	1532.07	1
1441	103	35	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	50	92.19	4609.50	1
1442	103	36	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	49	59.34	2907.66	3
1443	103	38	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	37	83.78	3099.86	2
1444	103	44	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	26	91.27	2373.02	5
1445	103	82	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	46	81.81	3763.26	4
1446	94	2	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	32	177.87	5691.84	6
1447	94	9	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	133.94	5491.54	3
1448	94	17	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	113.17	4639.97	5
1449	94	53	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	21	49.81	1046.01	4
1450	94	90	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	20	62.70	1254.00	2
1451	94	103	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	45	86.99	3914.55	1
1452	19	6	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	26	121.15	3149.90	12
1453	19	15	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	46	117.32	5396.72	4
1454	19	26	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	134.26	4027.80	3
1455	19	28	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	34	120.28	4089.52	7
1456	19	30	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	59.55	1786.50	10
1457	19	40	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	27	152.41	4115.07	8
1458	19	52	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	41	107.76	4418.16	13
1459	19	57	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	28	46.82	1310.96	1
1460	19	65	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	47	121.40	5705.80	9
1461	19	68	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	31	31.47	975.57	5
1462	19	85	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	45	95.35	4290.75	11
1463	19	88	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	40	45.99	1839.60	6
1464	19	94	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	29	105.33	3054.57	2
1465	83	8	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	46	180.79	8316.34	5
1466	83	11	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	30	140.50	4215.00	6
1467	83	13	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	44	169.56	7460.64	4
1468	83	39	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	32	121.57	3890.24	1
1469	83	42	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	29	92.77	2690.33	3
1470	83	49	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	137.88	3171.24	8
1471	83	81	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	117.10	2693.30	10
1472	83	89	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	27	55.30	1493.10	9
1473	83	95	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	21	56.24	1181.04	7
1474	83	99	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	33	80.55	2658.15	2
1475	44	5	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	27	116.96	3157.92	1
1476	44	51	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	20	80.75	1615.00	9
1477	44	63	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	36	105.69	3804.84	8
1478	44	72	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	22	79.66	1752.52	3
1479	44	97	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	34	64.00	2176.00	4
1480	44	102	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	44	58.55	2576.20	2
1481	44	106	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	25	89.15	2228.75	5
1482	44	107	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	50	88.39	4419.50	6
1483	44	110	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	29	43.68	1266.72	7
1484	11	22	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	157.69	7726.81	9
1485	11	37	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	32	81.72	2615.04	15
1486	11	48	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	85.75	2915.50	14
1487	11	60	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	98.48	3348.32	1
1488	11	69	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	24	63.71	1529.04	10
1489	11	75	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	46	65.75	3024.50	11
1490	11	77	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	82.18	4026.82	16
1491	11	79	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	48	58.69	2817.12	8
1492	11	91	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	63.97	2558.80	2
1493	11	93	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	35.78	1753.22	3
1494	11	98	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	87.69	3507.60	4
1495	11	100	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	44	83.28	3664.32	13
1496	11	101	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	33	81.77	2698.41	6
1497	11	105	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	27	64.80	1749.60	5
1498	11	108	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	35	64.41	2254.35	7
1499	11	109	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	21	41.71	875.91	12
1500	26	1	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	89.00	3026.00	2
1501	26	3	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	40	107.05	4282.00	5
1502	26	4	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	41	193.66	7940.06	4
1503	26	10	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	48	123.51	5928.48	1
1504	26	31	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	33	67.58	2230.14	10
1505	26	32	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	50.27	1709.18	6
1506	26	58	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	42	109.32	4591.44	3
1507	26	62	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	37	67.03	2480.11	7
1508	26	83	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	24	59.41	1425.84	11
1509	26	86	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	31	93.90	2910.90	8
1510	26	104	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	47	117.46	5520.62	9
1511	85	47	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	48	58.44	2805.12	3
1512	85	54	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	124.99	2499.80	2
1513	85	66	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	37	61.64	2280.68	6
1514	85	84	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	75.18	3533.46	1
1515	85	87	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	39.02	780.40	4
1516	85	92	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	34	100.01	3400.34	7
1517	85	96	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	67.53	3173.91	5
1518	111	43	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	45	74.78	3365.10	2
1519	111	45	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	49	123.47	6050.03	1
1520	93	7	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	44	188.73	8304.12	14
1521	93	12	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	22	110.39	2428.58	12
1522	93	14	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	35	67.83	2374.05	15
1523	93	16	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	40	112.86	4514.40	11
1524	93	18	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	21	131.63	2764.23	6
1525	93	21	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	36	99.55	3583.80	2
1526	93	24	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	77.00	2541.00	10
1527	93	25	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	49	139.41	6831.09	5
1528	93	34	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	20	113.52	2270.40	3
1529	93	40	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	29	137.17	3977.93	7
1530	93	46	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	127.15	4195.95	4
1531	93	59	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	28	40.25	1127.00	1
1532	93	71	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	34	35.12	1194.08	8
1533	93	74	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	47	56.33	2647.51	13
1534	93	78	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	24	119.37	2864.88	9
1535	16	55	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	36	71.27	2565.72	1
1536	16	56	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	40	72.02	2880.80	5
1537	16	67	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	38	76.33	2900.54	3
1538	16	70	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	93.95	4039.85	2
1539	16	73	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	44	83.90	3691.60	4
1540	16	76	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	98.51	4235.93	6
1541	97	19	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	49	93.49	4581.01	3
1542	97	20	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	26	45.82	1191.32	2
1543	97	23	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	34	164.90	5606.60	10
1544	97	27	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	31	60.54	1876.74	9
1545	97	29	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	50	124.59	6229.50	7
1546	97	33	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	148.50	5197.50	4
1547	97	44	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	39	96.23	3752.97	1
1548	97	50	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	84.67	2963.45	11
1549	97	61	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	33	31.86	1051.38	6
1550	97	64	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	40	36.29	1451.60	5
1551	97	80	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	30	37.75	1132.50	8
1552	91	36	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	32	57.46	1838.72	1
1553	91	82	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	48	95.44	4581.12	2
1554	58	2	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	171.44	3600.24	9
1555	58	6	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	124.10	3971.20	2
1556	58	9	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	28	135.30	3788.40	6
1557	58	17	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	43	94.50	4063.50	8
1558	58	35	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	31	81.05	2512.55	10
1559	58	38	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	85.87	3263.06	11
1560	58	52	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	107.76	4094.88	3
1561	58	53	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	44	40.25	1771.00	7
1562	58	85	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	93.42	2989.44	1
1563	58	90	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	52.36	1099.56	5
1564	58	103	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	46	101.15	4652.90	4
1565	6	15	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	31	99.54	3085.74	5
1566	6	26	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	147.36	7368.00	4
1567	6	28	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	121.50	6075.00	8
1568	6	30	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	25	59.55	1488.75	11
1569	6	40	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	20	169.34	3386.80	9
1570	6	57	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	45	49.71	2236.95	2
1571	6	65	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	43	122.68	5275.24	10
1572	6	68	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	38	28.64	1088.32	6
1573	6	81	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	22	110.00	2420.00	1
1574	6	88	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	35	51.95	1818.25	7
1575	6	94	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	34	93.76	3187.84	3
1576	17	8	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	35	187.02	6545.70	2
1577	17	11	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	27	123.89	3345.03	3
1578	17	13	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	39	148.80	5803.20	1
1579	17	49	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	25	126.39	3159.75	5
1580	17	89	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	45	56.55	2544.75	6
1581	17	95	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	43	53.89	2317.27	4
1582	66	5	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	30	136.00	4080.00	4
1583	66	37	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	34	84.30	2866.20	2
1584	66	39	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	117.47	4698.80	13
1585	66	42	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	47	87.73	4123.31	15
1586	66	48	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	50	105.87	5293.50	1
1587	66	51	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	33	72.85	2404.05	12
1588	66	63	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	22	103.23	2271.06	11
1589	66	72	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	27	84.08	2270.16	6
1590	66	77	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	48	83.86	4025.28	3
1591	66	97	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	66.00	1386.00	7
1592	66	99	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	77.95	1636.95	14
1593	66	102	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	42	57.82	2428.44	5
1594	66	106	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	91.15	3646.00	8
1595	66	107	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	26	89.38	2323.88	9
1596	66	110	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	37	51.32	1898.84	10
1597	89	22	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	41	129.31	5301.71	1
1598	89	69	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	40	56.86	2274.40	2
1599	89	75	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	65.09	1562.16	3
1600	89	100	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	75.13	1803.12	5
1601	89	109	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	32	49.66	1589.12	4
1602	4	1	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	45	81.35	3660.75	1
1603	4	3	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	22	115.37	2538.14	4
1604	4	4	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	36	154.93	5577.48	3
1605	4	31	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	35	70.12	2454.20	9
1606	4	32	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	37	52.09	1927.33	5
1607	4	58	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	21	105.94	2224.74	2
1608	4	60	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	25	97.38	2434.50	11
1609	4	62	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	30	61.70	1851.00	6
1610	4	79	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	41	58.00	2378.00	18
1611	4	83	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	27	67.38	1819.26	10
1612	4	86	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	23	89.90	2067.70	7
1613	4	91	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	28	58.47	1637.16	12
1614	4	93	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	38	40.15	1525.70	13
1615	4	98	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	32	85.86	2747.52	14
1616	4	101	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	39	82.77	3228.03	16
1617	4	104	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	48	102.04	4897.92	8
1618	4	105	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	43	72.00	3096.00	15
1619	4	108	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	31	59.96	1858.76	17
1620	35	7	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	50	184.84	9242.00	3
1621	35	10	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	43	150.62	6476.66	14
1622	35	12	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	47	104.52	4912.44	1
1623	35	14	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	67.83	2577.54	4
1624	35	43	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	78.00	2964.00	6
1625	35	45	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	30	139.64	4189.20	5
1626	35	47	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	33	54.71	1805.43	9
1627	35	54	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	120.53	5785.44	8
1628	35	66	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	46	61.64	2835.44	12
1629	35	74	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	20	58.17	1163.40	2
1630	35	84	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	67.10	3220.80	7
1631	35	87	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	27	35.40	955.80	10
1632	35	92	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	94.91	3606.58	13
1633	35	96	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	21	67.53	1418.13	11
1634	15	16	21	5	357	10277	Shipped	2004-08-04	2004-08-12	2004-08-05	28	93.28	2611.84	1
1635	2	18	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	34	114.65	3898.10	6
1636	2	21	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	23	107.02	2461.46	2
1637	2	24	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	73.15	2121.35	10
1638	2	25	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	118.07	3424.03	5
1639	2	34	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	39	117.48	4581.72	3
1640	2	40	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	42	167.65	7041.30	7
1641	2	46	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	114.44	3547.64	4
1642	2	59	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	35	48.80	1708.00	1
1643	2	71	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	37.38	1158.78	8
1644	2	78	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	25	136.22	3405.50	9
1645	11	55	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	26	68.42	1778.92	1
1646	11	56	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	32	68.35	2187.20	5
1647	11	67	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	49	76.33	3740.17	3
1648	11	70	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	106.87	5129.76	2
1649	11	73	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	33	78.76	2599.08	4
1650	11	76	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	95.30	4574.40	6
1651	50	2	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	205.73	6994.82	2
1652	50	17	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	24	98.00	2352.00	1
1653	50	19	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	50	87.33	4366.50	9
1654	50	20	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	27	47.44	1280.88	8
1655	50	23	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	26	161.50	4199.00	16
1656	50	27	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	25	53.28	1332.00	15
1657	50	29	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	37	109.33	4045.21	13
1658	50	33	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	22	158.63	3489.86	10
1659	50	35	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	46	82.06	3774.76	3
1660	50	36	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	43	54.34	2336.62	5
1661	50	38	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	29	102.63	2976.27	4
1662	50	44	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	99.21	3373.14	7
1663	50	50	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	35	77.31	2705.85	17
1664	50	61	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	20	29.87	597.40	12
1665	50	64	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	45	36.29	1633.05	11
1666	50	80	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	33	35.29	1164.57	14
1667	50	82	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	21	79.86	1677.06	6
1668	17	6	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	132.97	5850.68	9
1669	17	9	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	127.10	3177.50	13
1670	17	15	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	41	98.36	4032.76	1
1671	17	28	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	48	114.14	5478.72	4
1672	17	30	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	56.52	1639.08	7
1673	17	40	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	135.47	3386.75	5
1674	17	52	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	96.86	2421.50	10
1675	17	53	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	42.76	1881.44	14
1676	17	65	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	112.46	2811.50	6
1677	17	68	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	20	33.95	679.00	2
1678	17	85	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	80.90	2346.10	8
1679	17	88	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	31	44.91	1392.21	3
1680	17	90	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	36	59.47	2140.92	12
1681	17	103	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	27	89.01	2403.27	11
1682	6	8	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	41	176.63	7241.83	5
1683	6	11	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	27	142.02	3834.54	6
1684	6	13	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	24	169.56	4069.44	4
1685	6	26	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	23	147.36	3389.28	13
1686	6	39	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	122.93	5285.99	1
1687	6	42	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	88.74	3194.64	3
1688	6	49	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	31	132.13	4096.03	8
1689	6	57	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	29	49.71	1441.59	11
1690	6	81	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	39	96.99	3782.61	10
1691	6	89	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	51.58	1856.88	9
1692	6	94	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	38	114.59	4354.42	12
1693	6	95	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	37	56.24	2080.88	7
1694	6	99	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	77.95	3351.85	2
1695	54	5	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	25	130.56	3264.00	6
1696	54	37	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	21	78.28	1643.88	4
1697	54	48	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	46	100.58	4626.68	3
1698	54	51	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	71.97	2446.98	14
1699	54	63	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	42	99.54	4180.68	13
1700	54	72	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	80.54	2738.36	8
1701	54	77	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	77.15	2545.95	5
1702	54	97	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	45	62.00	2790.00	9
1703	54	100	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	20	74.23	1484.60	2
1704	54	102	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	47	68.67	3227.49	7
1705	54	106	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	22	88.15	1939.30	10
1706	54	107	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	38	85.41	3245.58	11
1707	54	109	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	43	41.22	1772.46	1
1708	54	110	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	49.14	1621.62	12
1709	62	22	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	137.19	6173.55	11
1710	62	31	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	31	68.43	2121.33	1
1711	62	60	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	22	101.76	2238.72	3
1712	62	69	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	30	65.08	1952.40	12
1713	62	75	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	39	59.83	2333.37	13
1714	62	79	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	65.51	1375.71	10
1715	62	83	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	66.65	1399.65	2
1716	62	91	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	50	60.54	3027.00	4
1717	62	93	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	33	35.78	1180.74	5
1718	62	98	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	24	87.69	2104.56	6
1719	62	101	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	95.73	4307.85	8
1720	62	105	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	25	68.00	1700.00	7
1721	62	108	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	32	73.29	2345.28	9
1722	59	1	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	36	95.70	3445.20	6
1723	59	3	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	47	110.61	5198.67	9
1724	59	4	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	27	166.55	4496.85	8
1725	59	10	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	49	131.04	6420.96	5
1726	59	32	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	20	50.88	1017.60	10
1727	59	58	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	34	91.29	3103.86	7
1728	59	62	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	61.70	2406.30	11
1729	59	66	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	38	64.41	2447.58	3
1730	59	86	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	82.91	3067.67	12
1731	59	87	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	36.61	1354.57	1
1732	59	92	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	26	100.01	2600.26	4
1733	59	96	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	76.48	2982.72	2
1734	59	104	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	45	102.04	4591.80	13
1735	24	47	13	4	375	10286	Shipped	2004-08-28	2004-09-06	2004-09-01	38	51.60	1960.80	1
1736	61	7	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	21	190.68	4004.28	12
1737	61	12	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	45	117.44	5284.80	10
1738	61	14	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	74.21	3042.61	13
1739	61	16	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	23	107.10	2463.30	9
1740	61	18	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	113.23	4642.43	4
1741	61	24	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	61.60	2710.40	8
1742	61	25	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	24	123.76	2970.24	3
1743	61	34	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	114.84	5052.96	1
1744	61	40	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.17	4938.12	5
1745	61	43	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	43	68.35	2939.05	15
1746	61	45	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	127.88	5115.20	14
1747	61	46	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	27	139.87	3776.49	2
1748	61	54	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	34	119.04	4047.36	17
1749	61	71	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	31.34	1128.24	6
1750	61	74	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	20	58.17	1163.40	11
1751	61	78	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.62	4954.32	7
1752	61	84	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	79.22	3168.80	16
1753	19	21	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	20	120.71	2414.20	14
1754	19	23	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	32	168.30	5385.60	5
1755	19	27	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	28	50.25	1407.00	4
1756	19	29	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	31	102.98	3192.38	2
1757	19	50	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	90.19	3156.65	6
1758	19	55	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	23	57.02	1311.46	7
1759	19	56	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	36	66.88	2407.68	11
1760	19	59	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	50	49.30	2465.00	13
1761	19	61	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	29	32.19	933.51	1
1762	19	67	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	81.78	2862.30	9
1763	19	70	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	48	109.22	5242.56	8
1764	19	73	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	34	76.19	2590.46	10
1765	19	76	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	41	101.73	4170.93	12
1766	19	80	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	33	37.75	1245.75	3
1767	20	19	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	38	92.47	3513.86	2
1768	20	20	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	24	44.75	1074.00	1
1769	20	33	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	43	141.75	6095.25	3
1770	20	64	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	45	41.22	1854.90	4
1771	32	44	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	26	80.36	2089.36	2
1772	32	82	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	45	83.76	3769.20	1
1773	102	2	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	210.01	7770.37	11
1774	102	6	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	30	141.83	4254.90	4
1775	102	9	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	123.00	5043.00	8
1776	102	17	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	96.84	3970.44	10
1777	102	30	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	52.26	1358.76	2
1778	102	35	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	47	99.28	4666.16	12
1779	102	36	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	56.21	2079.77	14
1780	102	38	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	23	93.20	2143.60	13
1781	102	52	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	96.86	4649.28	5
1782	102	53	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	29	45.28	1313.12	9
1783	102	65	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	109.90	5275.20	1
1784	102	85	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	82.83	2153.58	3
1785	102	90	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	32	53.00	1696.00	7
1786	102	103	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	28	86.99	2435.72	6
1787	10	15	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	94.80	1990.80	8
1788	10	26	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	26	140.81	3661.06	7
1789	10	28	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	103.09	4226.69	11
1790	10	40	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	147.33	3093.93	12
1791	10	49	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	44	114.90	5055.60	2
1792	10	57	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	40	48.55	1942.00	5
1793	10	68	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	39	34.30	1337.70	9
1794	10	81	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	27	113.55	3065.85	4
1795	10	88	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	50	54.11	2705.50	10
1796	10	89	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	31	59.65	1849.15	3
1797	10	94	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	113.44	4651.04	6
1798	10	95	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	35	49.79	1742.65	1
1799	50	8	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	46	187.02	8602.92	8
1800	50	11	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	129.93	3118.32	9
1801	50	13	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	45	171.29	7708.05	7
1802	50	39	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	110.64	2655.36	4
1803	50	42	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	22	91.76	2018.72	6
1804	50	51	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	49	72.85	3569.65	3
1805	50	63	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	21	111.83	2348.43	2
1806	50	99	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	29	77.95	2260.55	5
1807	50	110	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	32	51.32	1642.24	1
1808	35	107	9	2	387	10294	Shipped	2004-09-10	2004-09-17	2004-09-14	45	98.32	4424.40	1
1809	85	5	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	24	136.00	3264.00	1
1810	85	72	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	46	84.08	3867.68	3
1811	85	97	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	26	62.00	1612.00	4
1812	85	102	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	44	71.56	3148.64	2
1813	85	106	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	34	93.16	3167.44	5
1814	98	22	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	36	146.65	5279.40	7
1815	98	37	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	69.68	1463.28	13
1816	98	48	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	105.87	2329.14	12
1817	98	69	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	60.97	1280.37	8
1818	98	75	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	31	63.78	1977.18	9
1819	98	77	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	83.02	1826.44	14
1820	98	79	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	32	63.46	2030.72	6
1821	98	93	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	26	41.02	1066.52	1
1822	98	98	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	42	75.81	3184.02	2
1823	98	100	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	34	89.61	3046.74	11
1824	98	101	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	24	96.73	2321.52	4
1825	98	105	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	74.40	1636.80	3
1826	98	108	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	47	61.44	2887.68	5
1827	98	109	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	46.68	980.28	10
1828	31	31	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	25	81.95	2048.75	4
1829	31	60	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	107.23	3431.36	6
1830	31	62	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	70.08	2242.56	1
1831	31	83	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	23	71.73	1649.79	5
1832	31	86	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	26	88.90	2311.40	2
1833	31	91	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	28	63.29	1772.12	7
1834	31	104	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	35	111.53	3903.55	3
1835	1	3	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	39	105.86	4128.54	1
1836	1	32	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	32	60.57	1938.24	2
1837	29	1	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	23	76.56	1760.88	9
1838	29	4	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	29	164.61	4773.69	11
1839	29	10	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	123.51	2964.24	8
1840	29	47	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	39	62.17	2424.63	3
1841	29	54	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	49	119.04	5832.96	2
1842	29	58	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	47	107.07	5032.29	10
1843	29	66	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	33	58.87	1942.71	6
1844	29	84	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	32	66.29	2121.28	1
1845	29	87	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	36.21	869.04	4
1846	29	92	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	38	84.70	3218.60	7
1847	29	96	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	44	77.29	3400.76	5
1848	8	7	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	33	184.84	6099.72	5
1849	8	12	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	29	116.27	3371.83	3
1850	8	14	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	22	76.61	1685.42	6
1851	8	16	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	95.58	2198.34	2
1852	8	24	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	41	63.14	2588.74	1
1853	8	43	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	49	65.94	3231.06	8
1854	8	45	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	144.05	3313.15	7
1855	8	74	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	31	52.05	1613.55	4
1856	62	18	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	37	114.65	4242.05	8
1857	62	21	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	32	118.22	3783.04	4
1858	62	25	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	47	119.49	5616.03	7
1859	62	34	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	113.52	2497.44	5
1860	62	40	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	23	135.47	3115.81	9
1861	62	46	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	39	137.04	5344.56	6
1862	62	56	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	27	64.67	1746.09	1
1863	62	59	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	40.75	896.50	3
1864	62	71	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	48	32.10	1540.80	10
1865	62	76	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	86.73	1908.06	2
1866	62	78	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	50	122.17	6108.50	11
1867	33	23	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	43	166.60	7163.80	1
1868	33	50	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	38	82.83	3147.54	2
1869	33	55	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	23	70.56	1622.88	3
1870	33	67	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	49	75.42	3695.58	5
1871	33	70	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	45	104.52	4703.40	4
1872	33	73	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	48	74.48	3575.04	6
1873	117	27	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	46	56.91	2617.86	2
1874	117	80	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	24	35.70	856.80	1
1875	52	2	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	47	201.44	9467.68	6
1876	52	9	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	39	117.54	4584.06	3
1877	52	17	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	106.17	4883.82	5
1878	52	19	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	95.55	3535.35	13
1879	52	20	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	46.90	1735.30	12
1880	52	29	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	102.98	2471.52	17
1881	52	33	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	20	141.75	2835.00	14
1882	52	35	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	98.27	4520.42	7
1883	52	36	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	54.34	1304.16	9
1884	52	38	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	26	90.06	2341.56	8
1885	52	44	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	38	95.24	3619.12	11
1886	52	53	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	34	44.27	1505.18	4
1887	52	61	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	23	29.21	671.83	16
1888	52	64	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	44	42.11	1852.84	15
1889	52	82	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	33	80.83	2667.39	10
1890	52	90	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	36	52.36	1884.96	2
1891	52	103	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	40	80.92	3236.80	1
1892	59	6	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	130.01	4940.38	13
1893	59	15	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	107.84	4097.92	5
1894	59	26	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	27	132.62	3580.74	4
1895	59	28	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	117.82	4241.52	8
1896	59	30	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	41	58.95	2416.95	11
1897	59	40	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	37	160.87	5952.19	9
1898	59	52	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	22	112.60	2477.20	14
1899	59	57	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	45	48.55	2184.75	2
1900	59	65	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	24	107.34	2576.16	10
1901	59	68	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	48	30.76	1476.48	6
1902	59	81	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	118.28	4258.08	1
1903	59	85	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	28	94.38	2642.64	12
1904	59	88	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	40	48.70	1948.00	7
1905	59	94	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	42	109.96	4618.32	3
1906	30	8	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	182.86	5668.66	13
1907	30	11	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	145.04	4931.36	14
1908	30	13	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	20	145.34	2906.80	12
1909	30	39	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	114.74	3671.68	9
1910	30	42	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	40	83.70	3348.00	11
1911	30	49	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	23	126.39	2906.97	16
1912	30	51	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	39	85.14	3320.46	8
1913	30	63	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	29	109.37	3171.73	7
1914	30	72	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	76.12	2359.72	2
1915	30	89	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	46	60.28	2772.88	17
1916	30	95	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	51.55	1752.70	15
1917	30	97	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	50	61.34	3067.00	3
1918	30	99	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	38	73.62	2797.56	10
1919	30	102	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	43	62.16	2672.88	1
1920	30	106	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	99.17	3173.44	4
1921	30	107	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	30	87.39	2621.70	5
1922	30	110	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	35	48.05	1681.75	6
1923	76	5	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	118.32	2603.04	9
1924	76	22	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	39	135.61	5288.79	1
1925	76	37	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	31	71.40	2213.40	7
1926	76	48	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	48	92.11	4421.28	6
1927	76	69	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	25	58.23	1455.75	2
1928	76	75	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	64.44	1417.68	3
1929	76	77	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	75.47	1660.34	8
1930	76	100	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	81.47	2769.98	5
1931	76	109	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	44.20	1502.80	4
1932	67	3	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	115.37	3922.58	2
1933	67	4	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	20	187.85	3757.00	1
1934	67	31	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	27	81.95	2212.65	7
1935	67	32	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	48.46	1647.64	3
1936	67	60	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	99.57	3086.67	9
1937	67	62	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	68.55	3221.85	4
1938	67	79	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	43	58.00	2494.00	16
1939	67	83	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	44	71.73	3156.12	8
1940	67	86	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	24	99.89	2397.36	5
1941	67	91	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	46	61.22	2816.12	10
1942	67	93	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	37.09	1743.23	11
1943	67	98	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	73.07	1534.47	12
1944	67	101	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	35	88.75	3106.25	14
1945	67	104	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	100.85	3126.35	6
1946	67	105	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	79.20	1663.20	13
1947	67	108	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	39	62.93	2454.27	15
1948	5	1	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	41	94.74	3884.34	5
1949	5	10	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	26	144.60	3759.60	4
1950	5	58	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	21	96.92	2035.32	6
1951	5	66	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	24	59.56	1429.44	2
1952	5	92	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	50	93.89	4694.50	3
1953	5	96	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	28	74.04	2073.12	1
1954	53	7	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	165.38	5457.54	10
1955	53	12	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	105.70	2536.80	8
1956	53	14	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	77.41	3793.09	11
1957	53	16	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	25	101.34	2533.50	7
1958	53	18	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	37	128.80	4765.60	2
1959	53	24	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	20	66.99	1339.80	6
1960	53	25	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	129.45	3106.80	1
1961	53	40	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	48	159.18	7640.64	3
1962	53	43	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	27	70.76	1910.52	13
1963	53	45	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	122.00	5978.00	12
1964	53	47	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	42	59.06	2480.52	16
1965	53	54	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	40	133.92	5356.80	15
1966	53	71	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	33.23	1096.59	4
1967	53	74	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	38	50.21	1907.98	9
1968	53	78	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	45	139.03	6256.35	5
1969	53	84	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	75.18	3683.82	14
1970	53	87	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	36	38.62	1390.32	17
1971	11	21	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	29	124.44	3608.76	9
1972	11	34	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	114.84	4938.12	10
1973	11	46	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	32	134.22	4295.04	11
1974	11	50	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	41	92.03	3773.23	1
1975	11	55	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	66.99	1674.75	2
1976	11	56	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	26	70.55	1834.30	6
1977	11	59	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	45	48.80	2196.00	8
1978	11	67	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	28	89.05	2493.40	4
1979	11	70	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	116.27	4999.61	3
1980	11	73	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	85.61	2140.25	5
1981	11	76	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	46	91.02	4186.92	7
1982	6	2	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	214.30	10286.40	3
1983	6	17	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	32	101.50	3248.00	2
1984	6	19	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	43	102.74	4417.82	10
1985	6	20	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	43.67	1091.75	9
1986	6	23	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	146.20	7017.60	17
1987	6	27	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	30	48.43	1452.90	16
1988	6	29	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	111.87	3467.97	14
1989	6	33	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	150.19	3754.75	11
1990	6	35	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	37	91.18	3373.66	4
1991	6	36	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	35	54.34	1901.90	6
1992	6	38	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	38	93.20	3541.60	5
1993	6	44	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	33	84.33	2782.89	8
1994	6	53	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	44.27	1726.53	1
1995	6	61	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	27.88	1087.32	13
1996	6	64	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	23	43.46	999.58	12
1997	6	80	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	40.21	1246.51	15
1998	6	82	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	44	96.42	4242.48	7
1999	34	6	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	40	141.83	5673.20	7
2000	34	9	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	21	131.20	2755.20	11
2001	34	28	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	29	109.23	3167.67	2
2002	34	30	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	52.87	1797.58	5
2003	34	40	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	25	143.94	3598.50	3
2004	34	52	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	28	110.18	3085.04	8
2005	34	65	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	42	102.23	4293.66	4
2006	34	85	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	27	96.31	2600.37	6
2007	34	88	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	38	48.70	1850.60	1
2008	34	90	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	55.59	1890.06	10
2009	34	103	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	30	96.09	2882.70	9
2010	43	8	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	176.63	6711.94	5
2011	43	11	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	46	125.40	5768.40	6
2012	43	13	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	36	169.56	6104.16	4
2013	43	15	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	45	95.99	4319.55	14
2014	43	26	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	42	135.90	5707.80	13
2015	43	39	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	20	129.76	2595.20	1
2016	43	42	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	84.71	1948.33	3
2017	43	49	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	29	129.26	3748.54	8
2018	43	57	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	44	51.44	2263.36	11
2019	43	68	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	39	31.82	1240.98	15
2020	43	81	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	111.18	4224.84	10
2021	43	89	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	35	58.41	2044.35	9
2022	43	94	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	28	115.75	3241.00	12
2023	43	95	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	50.38	1914.44	7
2024	43	99	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	83.15	1912.45	2
2025	4	51	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	36	78.12	2812.32	7
2026	4	63	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	35	111.83	3914.05	6
2027	4	72	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	24	78.77	1890.48	1
2028	4	97	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	41	60.67	2487.47	2
2029	4	106	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	31	99.17	3074.27	3
2030	4	107	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	37	88.39	3270.43	4
2031	4	110	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	40	51.32	2052.80	5
2032	47	5	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	33	126.48	4173.84	17
2033	47	22	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	27	140.34	3789.18	9
2034	47	37	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	21	72.26	1517.46	15
2035	47	48	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	89.99	4229.53	14
2036	47	60	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	93.01	2325.25	1
2037	47	69	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	67.14	2282.76	10
2038	47	75	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	55.23	2595.81	11
2039	47	77	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	77.15	1928.75	16
2040	47	79	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	30	67.56	2026.80	8
2041	47	91	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	24	59.16	1419.84	2
2042	47	93	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	36.66	1246.44	3
2043	47	98	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	74.90	2546.60	4
2044	47	100	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	45	73.32	3299.40	13
2045	47	101	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	23	85.76	1972.48	6
2046	47	102	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	67.22	3226.56	18
2047	47	105	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	77.60	3724.80	5
2048	47	108	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	44	68.11	2996.84	7
2049	47	109	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	43.70	1485.80	12
2050	18	83	7	1	428	10317	Shipped	2004-11-02	2004-11-12	2004-11-08	35	69.55	2434.25	1
2051	17	1	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	46	84.22	3874.12	1
2052	17	3	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	45	102.29	4603.05	4
2053	17	4	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	37	189.79	7022.23	3
2054	17	31	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	31	81.95	2540.45	9
2055	17	32	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	42	49.67	2086.14	5
2056	17	58	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	48	93.54	4489.92	2
2057	17	62	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	26	60.94	1584.44	6
2058	17	86	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	47	81.91	3849.77	7
2059	17	104	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	50	102.04	5102.00	8
2060	106	10	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	30	134.05	4021.50	9
2061	106	43	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	46	77.19	3550.74	1
2062	106	47	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	44	54.71	2407.24	4
2063	106	54	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	120.53	5423.85	3
2064	106	66	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	31	65.80	2039.80	7
2065	106	84	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	43	78.41	3371.63	2
2066	106	87	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	29	35.00	1015.00	5
2067	106	92	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	22	96.95	2132.90	8
2068	106	96	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	79.73	3587.85	6
2069	12	7	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	31	184.84	5730.04	3
2070	12	12	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	35	102.17	3575.95	1
2071	12	14	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	38	63.84	2425.92	4
2072	12	45	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	25	139.64	3491.00	5
2073	12	74	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	26	60.62	1576.12	2
2074	109	16	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	24	105.95	2542.80	15
2075	109	18	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	41	123.14	5048.74	10
2076	109	21	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	44	120.71	5311.24	6
2077	109	24	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	73.92	2735.04	14
2078	109	25	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	25	142.25	3556.25	9
2079	109	34	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	27	126.72	3421.44	7
2080	109	40	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	33	164.26	5420.58	11
2081	109	46	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	28	138.45	3876.60	8
2082	109	56	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	68.35	2050.50	3
2083	109	59	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	48	42.76	2052.48	5
2084	109	67	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	74.51	2235.30	1
2085	109	71	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	31.72	1173.64	12
2086	109	73	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	39	81.33	3171.87	2
2087	109	76	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	21	103.87	2181.27	4
2088	109	78	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	26	137.62	3578.12	13
2089	86	2	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	40	180.01	7200.40	1
2090	86	6	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	46	141.83	6524.18	8
2091	86	9	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	27	136.67	3690.09	9
2092	86	17	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	22	101.50	2233.00	10
2093	86	19	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	43	92.47	3976.21	14
2094	86	20	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	44.21	1812.61	5
2095	86	29	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	50	120.77	6038.50	6
2096	86	30	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	35	57.12	1999.20	11
2097	86	33	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	36	158.63	5710.68	2
2098	86	35	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	33	100.30	3309.90	12
2099	86	36	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	54.34	2227.94	13
2100	86	38	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	48	90.06	4322.88	7
2101	86	61	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	20	26.55	531.00	3
2102	86	64	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	30	40.77	1223.10	4
2103	8	44	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	33	88.30	2913.90	2
2104	8	52	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	47	96.86	4552.42	1
2105	28	11	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	148.06	3997.62	1
2106	28	15	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	26	100.73	2618.98	7
2107	28	26	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	47	142.45	6695.15	8
2108	28	28	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	105.55	3483.15	10
2109	28	40	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	137.17	3703.59	12
2110	28	49	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	49	120.64	5911.36	13
2111	28	53	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	38	49.81	1892.78	6
2112	28	57	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	25	49.71	1242.75	14
2113	28	65	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	31	107.34	3327.54	2
2114	28	68	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	30	29.35	880.50	9
2115	28	82	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	95.44	3149.52	3
2116	28	85	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	20	91.49	1829.80	11
2117	28	90	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	48	60.76	2916.48	4
2118	28	103	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	34	80.92	2751.28	5
2119	5	5	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	47	111.52	5241.44	6
2120	5	8	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	42	193.25	8116.50	8
2121	5	13	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	166.10	3986.40	1
2122	5	39	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	114.74	2753.76	9
2123	5	81	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	114.73	5048.12	5
2124	5	88	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	44.37	1686.06	3
2125	5	89	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	28	55.30	1548.40	2
2126	5	94	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	99.55	3782.90	4
2127	5	95	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	56.24	2474.56	7
2128	12	42	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	32	94.79	3033.28	6
2129	12	51	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	50	73.73	3686.50	5
2130	12	63	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	120.43	4937.63	4
2131	12	72	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	86.74	3556.34	3
2132	12	77	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	20	81.34	1626.80	2
2133	12	97	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	39	60.67	2366.13	1
2134	13	22	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	154.54	3863.50	6
2135	13	31	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	45	74.34	3345.30	8
2136	13	37	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	74.84	1871.00	5
2137	13	99	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	20	79.68	1593.60	7
2138	13	102	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	21	65.05	1366.05	1
2139	13	106	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	43	85.14	3661.02	2
2140	13	107	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	83.42	3086.54	3
2141	13	110	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	48.05	1777.85	4
2142	57	48	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	104.81	3563.54	6
2143	57	60	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	47	87.54	4114.38	14
2144	57	69	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	48	67.82	3255.36	1
2145	57	75	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	20	56.55	1131.00	2
2146	57	79	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	35	55.96	1958.60	3
2147	57	83	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	43	69.55	2990.65	4
2148	57	91	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	24	57.10	1370.40	5
2149	57	93	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	42.33	1439.22	7
2150	57	98	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	27	84.03	2268.81	8
2151	57	100	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	41	75.13	3080.33	9
2152	57	101	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	37	95.73	3542.01	10
2153	57	104	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	117.46	3876.18	11
2154	57	105	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	71.20	2349.60	13
2155	57	108	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	39	69.59	2714.01	12
2156	10	1	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	42	80.39	3376.38	1
2157	10	3	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	20	109.42	2188.40	2
2158	10	4	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	26	164.61	4279.86	3
2159	10	7	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	41	182.90	7498.90	5
2160	10	10	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	24	128.03	3072.72	6
2161	10	12	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	46	117.44	5402.24	13
2162	10	14	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	33	74.21	2448.93	14
2163	10	16	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	39	102.49	3997.11	15
2164	10	24	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	29	66.22	1920.38	9
2165	10	32	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	55.72	2117.36	12
2166	10	43	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	65.13	2474.94	10
2167	10	58	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	30	104.81	3144.30	7
2168	10	62	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	37	71.60	2649.20	4
2169	10	86	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	45	80.91	3640.95	11
2170	10	109	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	44	41.22	1813.68	8
2171	92	45	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	37	136.70	5057.90	3
2172	92	47	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	29	59.06	1712.74	2
2173	92	54	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	50	133.92	6696.00	4
2174	92	66	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	42	56.10	2356.20	1
2175	118	18	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	46	120.31	5534.26	6
2176	118	21	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	99.55	4380.20	14
2177	118	23	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	154.70	6806.80	7
2178	118	25	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	30	135.14	4054.20	8
2179	118	34	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	130.68	3397.68	10
2180	118	40	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	169.34	4572.18	11
2181	118	46	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	132.80	3452.80	12
2182	118	71	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	37.00	999.00	13
2183	118	74	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	25	55.11	1377.75	9
2184	118	78	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	21	139.03	2919.63	1
2185	118	84	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	41	70.33	2883.53	2
2186	118	87	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	28	33.39	934.92	3
2187	118	92	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	32	100.01	3200.32	4
2188	118	96	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	20	74.04	1480.80	5
2189	30	19	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	46	89.38	4111.48	15
2190	30	20	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	27	51.21	1382.67	16
2191	30	27	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	38	53.88	2047.44	9
2192	30	29	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	35	116.96	4093.60	8
2193	30	33	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	24	138.38	3321.12	1
2194	30	36	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	53.09	1380.34	17
2195	30	38	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	40	100.53	4021.20	18
2196	30	50	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	50	92.03	4601.50	2
2197	30	55	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	21	70.56	1481.76	3
2198	30	56	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	23	61.73	1419.79	4
2199	30	59	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	20	47.29	945.80	5
2200	30	61	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	29.87	1344.15	6
2201	30	64	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	43.01	1118.26	10
2202	30	67	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	39	84.51	3295.89	7
2203	30	70	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	44	108.04	4753.76	11
2204	30	73	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	77.91	3505.95	12
2205	30	76	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	31	94.23	2921.13	13
2206	30	80	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	41	34.47	1413.27	14
2207	9	2	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	26	188.58	4903.08	3
2208	9	9	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	121.64	4014.12	6
2209	9	17	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	29	110.84	3214.36	7
2210	9	35	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	31	95.23	2952.13	5
2211	9	44	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	46	95.24	4381.04	2
2212	9	53	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	24	42.26	1014.24	8
2213	9	82	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	39	95.44	3722.16	1
2214	9	90	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	62.05	2047.65	4
2215	12	6	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	26	130.01	3380.26	2
2216	12	28	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	46	108.00	4968.00	6
2217	12	30	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	34	52.87	1797.58	1
2218	12	40	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	20	147.33	2946.60	3
2219	12	52	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	49	101.71	4983.79	4
2220	12	65	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	42	117.57	4937.94	5
2221	6	68	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	33	32.88	1085.04	2
2222	6	85	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	44	77.05	3390.20	1
2223	6	88	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	40	49.78	1991.20	3
2224	24	8	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	176.63	5828.79	10
2225	24	11	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	126.91	4188.03	11
2226	24	13	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	141.88	6952.12	1
2227	24	15	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	38	95.99	3647.62	3
2228	24	26	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	153.91	7541.59	6
2229	24	39	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	48	135.22	6490.56	12
2230	24	42	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	21	100.84	2117.64	7
2231	24	57	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	45	49.71	2236.95	4
2232	24	81	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	113.55	3520.05	5
2233	24	89	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	59.03	1829.93	9
2234	24	94	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	23	109.96	2529.08	8
2235	24	103	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	46	94.07	4327.22	2
2236	99	5	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	25	131.92	3298.00	8
2237	99	49	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	140.75	5067.00	3
2238	99	51	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	76.36	2214.44	2
2239	99	63	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	119.20	3456.80	4
2240	99	95	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	21	54.48	1144.08	6
2241	99	99	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	73.62	2650.32	9
2242	99	106	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	31	84.14	2608.34	1
2243	99	107	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	83.42	3003.12	7
2244	99	110	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	42	49.14	2063.88	5
2245	90	22	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	41	137.19	5624.79	1
2246	90	37	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	28	80.86	2264.08	3
2247	90	48	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	45	93.17	4192.65	2
2248	94	3	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	40	117.75	4710.00	4
2249	94	4	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	39	178.17	6948.63	3
2250	94	31	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	79.41	2144.07	2
2251	94	32	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	30	48.46	1453.80	1
2252	94	58	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	96.92	2616.84	10
2253	94	60	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	21	106.14	2228.94	7
2254	94	69	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	67.82	3730.10	12
2255	94	72	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	73.46	4040.30	13
2256	94	75	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	29	57.86	1677.94	14
2257	94	77	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	42	72.96	3064.32	16
2258	94	79	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	45	57.32	2579.40	11
2259	94	97	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	22	53.34	1173.48	5
2260	94	100	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	86.90	4779.50	15
2261	94	102	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	62.16	3108.00	9
2262	94	108	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	66.63	3331.50	8
2263	94	109	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	49.66	1340.82	6
2264	40	62	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	62.46	3435.30	8
2265	40	83	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	63.76	2550.40	1
2266	40	86	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	95.89	5273.95	2
2267	40	91	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	39	67.41	2628.99	3
2268	40	93	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	37.09	1483.60	4
2269	40	98	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	30	73.99	2219.70	5
2270	40	101	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	81.77	4497.35	7
2271	40	104	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	29	98.48	2855.92	6
2272	91	1	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	41	84.22	3453.02	9
2273	91	7	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	45	192.62	8667.90	2
2274	91	10	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	120.50	6627.50	8
2275	91	12	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	44	111.57	4909.08	1
2276	91	14	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	36	77.41	2786.76	10
2277	91	16	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	109.40	6017.00	7
2278	91	66	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	32	63.03	2016.96	6
2279	91	92	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	31	95.93	2973.83	4
2280	91	96	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	38	78.11	2968.18	3
2281	91	105	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	34	70.40	2393.60	5
2282	3	18	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	40	118.89	4755.60	2
2283	3	24	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	63.14	3472.70	1
2284	3	25	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	22	115.22	2534.84	3
2285	3	40	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	30	167.65	5029.50	4
2286	3	43	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	25	76.39	1909.75	5
2287	3	45	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	136.70	7518.50	7
2288	3	47	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	26	57.82	1503.32	8
2289	3	54	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	38	124.99	4749.62	11
2290	3	71	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	39	30.59	1193.01	9
2291	3	74	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	48	60.01	2880.48	10
2292	3	78	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	42	112.34	4718.28	6
2293	81	21	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	36	109.51	3942.36	4
2294	81	34	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	25	118.80	2970.00	3
2295	81	46	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	44	127.15	5594.60	2
2296	81	59	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	27	44.78	1209.06	6
2297	81	84	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	30	76.80	2304.00	1
2298	81	87	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	29	37.41	1084.89	5
2299	80	23	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	45	168.30	7573.50	1
2300	80	27	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	40	49.04	1961.60	2
2301	80	29	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	30	118.23	3546.90	3
2302	80	50	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	21	80.99	1700.79	4
2303	80	55	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	26	68.42	1778.92	5
2304	80	56	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	29	61.00	1769.00	7
2305	80	61	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	20	27.88	557.60	6
2306	1	64	14	4	450	10345	Shipped	2004-11-25	2004-12-01	2004-11-26	43	38.98	1676.14	1
2307	2	19	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	42	88.36	3711.12	3
2308	2	67	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	25	87.24	2181.00	1
2309	2	70	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	117.44	2818.56	5
2310	2	73	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	80.47	1931.28	2
2311	2	76	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	26	103.87	2700.62	6
2312	2	80	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	22	38.57	848.54	4
2313	3	2	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	30	188.58	5657.40	1
2314	3	6	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	27	132.97	3590.19	2
2315	3	9	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	29	132.57	3844.53	3
2316	3	17	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	42	113.17	4753.14	5
2317	3	20	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	46.36	973.56	7
2318	3	30	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	50	51.05	2552.50	8
2319	3	33	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	136.69	2870.49	6
2320	3	35	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	48	84.09	4036.32	9
2321	3	36	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	34	60.59	2060.06	10
2322	3	38	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	95.30	4288.50	11
2323	3	44	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	26	84.33	2192.58	12
2324	3	52	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	115.03	5176.35	4
2325	107	8	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	48	207.80	9974.40	8
2326	107	11	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	47	122.37	5751.39	4
2327	107	53	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	29	43.77	1269.33	6
2328	107	65	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	37	107.34	3971.58	1
2329	107	82	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	39	82.78	3228.42	2
2330	107	85	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	42	90.53	3802.26	3
2331	107	90	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	31	62.70	1943.70	5
2332	107	103	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	32	100.14	3204.48	7
2333	16	13	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	26	166.10	4318.60	10
2334	16	15	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	114.95	5517.60	9
2335	16	26	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	142.45	5413.10	8
2336	16	28	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	117.82	4477.16	7
2337	16	40	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	164.26	7884.48	6
2338	16	49	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	34	140.75	4785.50	5
2339	16	57	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	50.29	2413.92	4
2340	16	68	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	36	31.47	1132.92	3
2341	16	81	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	23	111.18	2557.14	2
2342	16	88	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	33	44.37	1464.21	1
2343	11	5	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	26	110.16	2864.16	5
2344	11	37	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	43	84.30	3624.90	6
2345	11	39	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	135.22	5949.68	1
2346	11	42	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	41	94.79	3886.39	2
2347	11	51	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	70.22	2106.60	3
2348	11	63	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	34	98.31	3342.54	7
2349	11	72	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	86.74	2602.20	9
2350	11	77	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	77.15	1928.75	10
2351	11	89	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	27	61.52	1661.04	14
2352	11	94	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	104.18	3229.58	8
2353	11	95	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	56.82	2500.08	17
2354	11	97	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	46	56.00	2576.00	11
2355	11	99	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	28	76.22	2134.16	4
2356	11	102	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	29	68.67	1991.43	12
2357	11	106	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	87.15	2701.65	13
2358	11	107	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	97.32	2433.00	16
2359	11	110	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	20	48.05	961.00	15
2360	71	22	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	39	143.50	5596.50	1
2361	71	48	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	20	104.81	2096.20	2
2362	71	69	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	25	64.40	1610.00	5
2363	71	75	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	38	53.92	2048.96	4
2364	71	79	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	34	68.24	2320.16	3
2365	32	100	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	23	75.13	1727.99	3
2366	32	101	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	87.75	4299.75	2
2367	32	108	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	22	62.19	1368.18	1
2368	32	109	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	46.18	2262.82	4
2369	101	31	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	27	71.81	1938.87	1
2370	101	60	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	28	107.23	3002.44	2
2371	101	83	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	35	69.55	2434.25	3
2372	101	86	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	46	86.90	3997.40	5
2373	101	91	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	68.10	2724.00	7
2374	101	93	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	35.78	1431.20	8
2375	101	98	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	39	73.07	2849.73	9
2376	101	104	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	48	98.48	4727.04	4
2377	101	105	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	43	74.40	3199.20	6
2378	70	1	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	84.22	3537.24	6
2379	70	3	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	20	95.15	1903.00	2
2380	70	4	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	178.17	7483.14	3
2381	70	7	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	31	157.60	4885.60	9
2382	70	10	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	35	141.58	4955.30	4
2383	70	12	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	29	98.65	2860.85	11
2384	70	14	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	23	76.61	1762.03	12
2385	70	16	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	100.19	2805.32	13
2386	70	24	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	76.23	1600.83	8
2387	70	32	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	49.06	1373.68	10
2388	70	43	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	36	69.15	2489.40	7
2389	70	58	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	96.92	2035.32	5
2390	70	62	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	62.46	1748.88	1
2391	11	45	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	23	117.59	2704.57	7
2392	11	47	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	31	60.30	1869.30	1
2393	11	54	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	25	124.99	3124.75	2
2394	11	66	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	41	56.10	2300.10	3
2395	11	71	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	36	37.38	1345.68	4
2396	11	74	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	44	60.62	2667.28	6
2397	11	78	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	32	137.62	4403.84	8
2398	11	84	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	28	75.18	2105.04	9
2399	11	87	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	38	32.99	1253.62	10
2400	11	92	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	40	93.89	3755.60	5
2401	51	18	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	43	120.31	5173.33	8
2402	51	19	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	50	82.19	4109.50	9
2403	51	20	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	22	44.75	984.50	6
2404	51	25	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	27	130.87	3533.49	2
2405	51	29	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	29	106.79	3096.91	3
2406	51	33	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	30	158.63	4758.90	1
2407	51	61	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	48	31.86	1529.28	5
2408	51	64	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	42.11	1094.86	7
2409	51	96	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	78.11	2030.86	4
2410	6	2	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	32	199.30	6377.60	10
2411	6	6	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	43	135.92	5844.56	9
2412	6	9	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	109.34	5357.66	8
2413	6	17	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	39	112.00	4368.00	1
2414	6	30	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	58.95	2416.95	7
2415	6	35	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	91.18	3738.38	6
2416	6	36	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	59.34	2907.66	5
2417	6	38	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	44	104.72	4607.68	4
2418	6	44	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	25	84.33	2108.25	3
2419	6	52	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	28	105.34	2949.52	2
2420	11	11	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	49	129.93	6366.57	5
2421	11	15	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	42	98.36	4131.12	9
2422	11	26	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	142.45	2849.00	10
2423	11	28	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	99.41	1988.20	11
2424	11	40	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	32	137.17	4389.44	12
2425	11	49	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	25	117.77	2944.25	13
2426	11	53	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	30	46.29	1388.70	8
2427	11	57	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	44	56.07	2467.08	14
2428	11	65	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	127.79	5239.39	7
2429	11	68	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	33.59	1209.24	4
2430	11	82	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	88.62	3633.42	6
2431	11	85	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	82.83	3396.03	1
2432	11	90	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	51.71	1861.56	2
2433	11	103	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	27	85.98	2321.46	3
2434	81	5	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	48	122.40	5875.20	6
2435	81	8	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	42	180.79	7593.18	8
2436	81	13	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	49	162.64	7969.36	5
2437	81	81	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	108.82	2394.04	7
2438	81	88	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	36	45.45	1636.20	3
2439	81	89	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	62.14	1367.08	1
2440	81	94	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	46	99.55	4579.30	2
2441	81	95	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	25	47.45	1186.25	4
2442	122	22	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	50	126.15	6307.50	12
2443	122	31	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	41	68.43	2805.63	13
2444	122	37	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	46	71.40	3284.40	14
2445	122	39	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	122.93	3564.97	8
2446	122	42	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	94.79	2748.91	18
2447	122	48	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	101.64	4065.60	15
2448	122	51	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	76.36	3054.40	1
2449	122	60	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	106.14	2335.08	17
2450	122	63	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	100.77	3123.87	2
2451	122	69	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	49	55.49	2719.01	16
2452	122	72	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	36	70.81	2549.16	3
2453	122	77	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	78.83	1734.26	4
2454	122	97	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	32	64.67	2069.44	5
2455	122	99	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	26	86.61	2251.86	6
2456	122	102	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	30	70.11	2103.30	7
2457	122	106	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	35	83.14	2909.90	9
2458	122	107	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	92.36	2863.16	10
2459	122	110	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	54.05	1675.55	11
2460	58	1	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	92.83	1856.60	13
2461	58	3	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	114.18	2968.68	8
2462	58	75	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	34	62.46	2123.64	6
2463	58	79	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	61.42	1596.92	7
2464	58	83	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	25	68.83	1720.75	1
2465	58	91	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	49	56.41	2764.09	2
2466	58	93	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	33	35.78	1180.74	3
2467	58	98	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	88.60	1772.00	4
2468	58	100	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	24	85.99	2063.76	14
2469	58	101	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	91.74	2385.24	9
2470	58	104	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	107.97	4750.68	5
2471	58	105	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	76.80	3379.20	10
2472	58	108	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	35	62.19	2176.65	11
2473	58	109	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	23	47.67	1096.41	12
2474	18	4	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	182.04	4004.88	4
2475	18	10	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	131.04	2882.88	1
2476	18	32	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	23	53.91	1239.93	3
2477	18	58	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	50	91.29	4564.50	2
2478	74	7	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	33	180.95	5971.35	3
2479	74	12	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	106.87	3633.58	4
2480	74	14	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	68.63	2333.42	5
2481	74	16	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	103.64	4767.44	6
2482	74	24	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	22	61.60	1355.20	7
2483	74	43	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	69.15	3180.90	10
2484	74	45	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	24	124.94	2998.56	11
2485	74	47	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	32	52.22	1671.04	12
2486	74	54	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	28	123.50	3458.00	13
2487	74	62	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	70.08	1471.68	8
2488	74	66	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	56.10	2412.30	14
2489	74	74	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	52.05	1093.05	15
2490	74	78	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	31	113.75	3526.25	1
2491	74	84	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	75.99	3267.57	9
2492	74	86	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	50	92.90	4645.00	2
2493	80	87	13	4	479	10364	Shipped	2005-01-06	2005-01-17	2005-01-09	48	38.22	1834.56	1
2494	68	18	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	30	116.06	3481.80	1
2495	68	92	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	22	82.66	1818.52	3
2496	68	96	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	44	68.34	3006.96	2
2497	90	25	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	116.65	3966.10	3
2498	90	34	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	49	105.60	5174.40	2
2499	90	40	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	154.10	5239.40	1
2500	36	21	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	49	105.77	5182.73	1
2501	36	23	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	37	144.50	5346.50	3
2502	36	27	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	45	50.25	2261.25	4
2503	36	29	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	27	124.59	3363.93	5
2504	36	33	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	32	140.06	4481.92	7
2505	36	46	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	46	131.39	6043.94	6
2506	36	50	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	43	77.31	3324.33	8
2507	36	55	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	44	66.99	2947.56	9
2508	36	56	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	21	72.76	1527.96	10
2509	36	59	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	38	50.31	1911.78	11
2510	36	61	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	23	29.54	679.42	13
2511	36	64	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	28	43.01	1204.28	12
2512	36	71	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	36	36.25	1305.00	2
2513	6	67	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	40	73.60	2944.00	2
2514	6	70	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	31	115.09	3567.79	5
2515	6	73	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	83.04	3819.84	1
2516	6	76	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	20	93.16	1863.20	4
2517	6	80	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	36.52	1679.92	3
2518	89	2	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	41	195.01	7995.41	2
2519	89	19	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	44	89.38	3932.72	8
2520	89	20	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	32	46.36	1483.52	7
2521	89	35	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	42	100.30	4212.60	1
2522	89	36	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	28	51.84	1451.52	6
2523	89	38	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	21	90.06	1891.26	5
2524	89	44	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	45	80.36	3616.20	4
2525	89	82	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	40	93.49	3739.60	3
2526	56	6	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	35	128.53	4498.55	4
2527	56	9	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	49	128.47	6295.03	8
2528	56	17	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	100.34	2709.18	1
2529	56	28	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	101.87	2241.14	5
2530	56	30	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	60.16	1323.52	7
2531	56	40	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	167.65	4526.55	9
2532	56	52	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	29	105.34	3054.86	6
2533	56	53	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	20	41.76	835.20	2
2534	56	90	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	25	63.99	1599.75	3
2535	6	8	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	32	178.71	5718.72	6
2536	6	15	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	49	104.28	5109.72	4
2537	6	26	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	160.46	4011.50	7
2538	6	57	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	53.75	1343.75	12
2539	6	65	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	126.51	2530.20	5
2540	6	68	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	45	35.01	1575.45	8
2541	6	81	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	28	95.81	2682.68	9
2542	6	85	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	26	82.83	2153.58	1
2543	6	88	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	44.37	887.40	2
2544	6	89	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	30	53.44	1603.20	11
2545	6	94	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	48	97.23	4667.04	10
2546	6	103	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	34	83.95	2854.30	3
2547	94	11	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	40	146.55	5862.00	4
2548	94	13	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	34	140.15	4765.10	1
2549	94	39	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	28	131.13	3671.64	3
2550	94	42	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	25	91.76	2294.00	5
2551	94	49	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	48	119.20	5721.60	6
2552	94	51	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	41	78.99	3238.59	7
2553	94	63	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	37	102.00	3774.00	8
2554	94	95	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	24	56.82	1363.68	9
2555	94	99	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	44	74.48	3277.12	2
2556	65	5	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	118.32	4614.48	3
2557	65	22	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	28	143.50	4018.00	4
2558	65	37	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	22	75.70	1665.40	5
2559	65	48	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	50	99.52	4976.00	6
2560	65	69	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	38	58.92	2238.96	7
2561	65	72	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	33	82.31	2716.23	12
2562	65	75	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	46	53.92	2480.32	11
2563	65	77	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	23	83.86	1928.78	10
2564	65	79	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	62.10	2421.90	13
2565	65	97	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	44	58.00	2552.00	14
2566	65	100	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	32	76.94	2462.08	15
2567	65	102	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	41	69.39	2844.99	16
2568	65	106	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	34	94.16	3201.44	2
2569	65	107	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	37	83.42	3086.54	8
2570	65	108	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	45	68.11	3064.95	17
2571	65	109	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	25	44.20	1105.00	9
2572	65	110	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	29	48.05	1393.45	1
2573	73	3	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	39	115.37	4499.43	5
2574	73	4	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	158.80	3493.60	1
2575	73	31	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	42	75.19	3157.98	2
2576	73	32	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	48.46	1066.12	4
2577	73	58	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	38	112.70	4282.60	6
2578	73	60	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	46	107.23	4932.58	3
2579	4	1	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	21	76.56	1607.76	12
2580	4	7	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	45	184.84	8317.80	7
2581	4	10	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	150.62	7380.38	13
2582	4	62	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	23	67.03	1541.69	9
2583	4	66	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	20	60.26	1205.20	14
2584	4	83	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	43	60.13	2585.59	2
2585	4	86	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	87.90	3252.30	3
2586	4	91	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	59.85	2633.40	4
2587	4	92	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	41	96.95	3974.95	15
2588	4	93	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	36.22	1774.78	5
2589	4	96	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	69.16	3388.84	8
2590	4	98	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	86.77	3210.49	6
2591	4	101	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	33	94.73	3126.09	1
2592	4	104	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	25	98.48	2462.00	10
2593	4	105	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	69.60	3062.40	11
2594	41	12	8	1	503	10376	Shipped	2005-02-08	2005-02-18	2005-02-13	35	98.65	3452.75	1
2595	29	14	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	24	65.44	1570.56	5
2596	29	16	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	50	112.86	5643.00	1
2597	29	18	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	35	124.56	4359.60	2
2598	29	24	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	31	61.60	1909.60	4
2599	29	25	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	36	125.18	4506.48	6
2600	29	40	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	39	143.94	5613.66	3
2601	11	21	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	34	121.95	4146.30	5
2602	11	43	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	22	66.74	1468.28	4
2603	11	45	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	43	146.99	6320.57	10
2604	11	47	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	28	60.30	1688.40	9
2605	11	54	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	49	122.02	5978.98	8
2606	11	71	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	30.59	1254.19	7
2607	11	74	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	46	52.66	2422.36	6
2608	11	78	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	33	129.20	4263.60	3
2609	11	84	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	80.84	3314.44	2
2610	11	87	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	40	35.80	1432.00	1
2611	11	23	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	39	156.40	6099.60	2
2612	11	27	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	27	50.85	1372.95	1
2613	11	34	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	29	113.52	3292.08	5
2614	11	46	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	134.22	4295.04	4
2615	11	59	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	48.80	1561.60	3
2616	11	19	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	88.36	2385.72	13
2617	11	29	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	40	119.50	4780.00	10
2618	11	33	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	21	156.94	3295.74	8
2619	11	50	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	78.23	2503.36	1
2620	11	55	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	24	66.99	1607.76	2
2621	11	56	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	66.88	2273.92	3
2622	11	61	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	29.87	955.84	4
2623	11	64	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	37.63	1016.01	5
2624	11	67	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	36	77.24	2780.64	6
2625	11	70	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	111.57	4909.08	7
2626	11	73	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	77.05	3390.20	9
2627	11	76	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	91.02	3094.68	11
2628	11	80	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	43	32.82	1411.26	12
2629	69	2	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	36	182.16	6557.76	3
2630	69	6	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	37	138.88	5138.56	6
2631	69	9	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	20	132.57	2651.40	1
2632	69	17	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	48	114.34	5488.32	2
2633	69	20	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	25	49.60	1240.00	9
2634	69	30	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	60.77	2126.95	7
2635	69	35	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	41	100.30	4112.30	8
2636	69	36	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	40	51.22	2048.80	4
2637	69	38	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	93.20	3262.00	5
2638	6	8	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	166.24	5652.16	10
2639	6	11	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	37	145.04	5366.48	11
2640	6	13	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	143.61	4882.74	12
2641	6	15	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	32	103.10	3299.20	13
2642	6	26	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	25	160.46	4011.50	5
2643	6	44	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	50	84.33	4216.50	7
2644	6	52	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	115.03	4486.17	1
2645	6	53	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	46.29	1805.31	2
2646	6	65	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	20	120.12	2402.40	3
2647	6	82	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	33	97.39	3213.87	4
2648	6	85	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	26	85.72	2228.72	6
2649	6	90	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	48	57.53	2761.44	8
2650	6	103	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	101.15	3439.10	9
2651	11	28	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	27	119.05	3214.35	11
2652	11	39	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	24	125.66	3015.84	9
2653	11	40	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	47	155.79	7322.13	6
2654	11	42	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	26	83.70	2176.20	12
2655	11	49	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	137.88	5239.44	1
2656	11	51	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	28	77.24	2162.72	7
2657	11	57	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	22	52.60	1157.20	2
2658	11	68	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	40	33.24	1329.60	3
2659	11	81	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	21	117.10	2459.10	4
2660	11	88	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	32	53.57	1714.24	5
2661	11	89	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	44	55.93	2460.92	8
2662	11	94	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	29	94.92	2752.68	13
2663	11	95	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	48.62	1847.56	10
2664	69	5	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	34	129.20	4392.80	4
2665	69	63	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	28	114.29	3200.12	3
2666	69	72	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	43	71.69	3082.67	2
2667	69	99	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	49	71.02	3479.98	1
2668	6	77	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	37	78.83	2916.71	2
2669	6	97	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	25	62.00	1550.00	1
2670	11	22	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	25	130.88	3272.00	7
2671	11	31	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	21	72.65	1525.65	18
2672	11	37	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	73.12	2705.44	5
2673	11	48	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	22	100.58	2212.76	6
2674	11	60	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	33	101.76	3358.08	11
2675	11	69	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	39	56.86	2217.54	1
2676	11	75	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	35	54.57	1909.95	9
2677	11	79	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	41	55.96	2294.36	12
2678	11	83	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	71.73	3586.50	8
2679	11	100	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	29	85.09	2467.61	13
2680	11	101	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	90.75	3357.75	14
2681	11	102	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	67.22	2487.14	10
2682	11	105	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	32	68.00	2176.00	17
2683	11	106	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	45	83.14	3741.30	2
2684	11	107	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	30	80.44	2413.20	3
2685	11	108	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	44	59.22	2605.68	15
2686	11	109	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	47.67	2383.50	16
2687	11	110	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	43	52.42	2254.06	4
2688	15	86	21	5	522	10387	Shipped	2005-03-02	2005-03-09	2005-03-06	44	79.91	3516.04	1
2689	109	1	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	42	80.39	3376.38	4
2690	109	3	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	118.94	5947.00	5
2691	109	4	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	21	156.86	3294.06	7
2692	109	10	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	44	125.01	5500.44	6
2693	109	91	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	35	58.47	2046.45	8
2694	109	93	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	27	41.02	1107.54	1
2695	109	98	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	46	74.90	3445.40	2
2696	109	104	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	111.53	5576.50	3
2697	102	7	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	26	182.90	4755.40	4
2698	102	12	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	25	95.13	2378.25	6
2699	102	14	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	36	76.61	2757.96	7
2700	102	16	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	47	102.49	4817.03	8
2701	102	24	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	63.91	3131.59	3
2702	102	32	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	39	52.09	2031.51	5
2703	102	58	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	45	112.70	5071.50	1
2704	102	62	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	61.70	3023.30	2
2705	6	18	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	117.48	4229.28	14
2706	6	25	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	34	132.29	4497.86	15
2707	6	29	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	31	102.98	3192.38	16
2708	6	33	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	26	162.00	4212.00	7
2709	6	43	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	40	75.59	3023.60	9
2710	6	45	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	50	135.23	6761.50	1
2711	6	47	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	54.09	1947.24	2
2712	6	54	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	49	122.02	5978.98	3
2713	6	66	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	35	67.87	2375.45	4
2714	6	71	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	37	35.87	1327.19	5
2715	6	74	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	46	51.43	2365.78	6
2716	6	78	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	134.81	6066.45	8
2717	6	84	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	30	66.29	1988.70	10
2718	6	87	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	41	39.02	1599.82	11
2719	6	92	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	101.03	4546.35	12
2720	6	96	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	22	81.36	1789.92	13
2721	56	2	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	195.01	4680.24	4
2722	56	6	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	37	121.15	4482.55	7
2723	56	9	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	39	110.70	4317.30	9
2724	56	17	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	29	114.34	3315.86	10
2725	56	19	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	35	102.74	3595.90	2
2726	56	20	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	42	47.44	1992.48	3
2727	56	30	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	44	57.73	2540.12	5
2728	56	35	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	32	99.28	3176.96	6
2729	56	61	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	33	26.55	876.15	8
2730	56	64	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	36.29	870.96	1
2731	104	36	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	37	61.21	2264.77	3
2732	104	38	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	29	103.67	3006.43	2
2733	104	44	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	36	98.22	3535.92	1
2734	70	11	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	35	145.04	5076.40	8
2735	70	15	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	32	99.54	3185.28	10
2736	70	26	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	20	137.53	2750.60	11
2737	70	28	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	104.32	3964.16	7
2738	70	52	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	30	106.55	3196.50	9
2739	70	53	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	44	41.76	1837.44	1
2740	70	65	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	112.46	3711.18	2
2741	70	82	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	88.62	2924.46	3
2742	70	85	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	84.75	3220.50	4
2743	70	90	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	31	63.35	1963.85	5
2744	70	103	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	21	83.95	1762.95	6
2745	11	40	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	22	135.47	2980.34	5
2746	11	49	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	124.95	4623.15	1
2747	11	57	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	31	53.18	1648.58	2
2748	11	68	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	46	35.36	1626.56	6
2749	11	81	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	104.09	3851.33	7
2750	11	88	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	36	47.08	1694.88	3
2751	11	89	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	30	55.93	1677.90	4
2752	51	5	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	32	125.12	4003.84	2
2753	51	8	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	33	205.72	6788.76	1
2754	51	94	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	46	98.39	4525.94	4
2755	51	95	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	45	57.99	2609.55	3
2756	6	13	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	155.72	5138.76	3
2757	6	39	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	129.76	4282.08	2
2758	6	42	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	24	91.76	2202.24	4
2759	6	51	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	45	83.38	3752.10	5
2760	6	63	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	49	100.77	4937.73	6
2761	6	72	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	27	77.00	2079.00	7
2762	6	77	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	37	77.99	2885.63	8
2763	6	97	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	39	62.00	2418.00	1
2764	48	99	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	32	69.29	2217.28	5
2765	48	102	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	22	62.88	1383.36	4
2766	48	106	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	48	86.15	4135.20	3
2767	48	107	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	36	80.44	2895.84	2
2768	48	110	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	34	52.96	1800.64	1
2769	81	22	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	33	130.88	4319.04	11
2770	81	31	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	82.79	2814.86	15
2771	81	37	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	70.54	1975.12	18
2772	81	48	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	92.11	4144.95	17
2773	81	60	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	43	100.67	4328.81	16
2774	81	69	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	60.29	1688.12	3
2775	81	75	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	61.15	2079.10	13
2776	81	79	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	41	56.64	2322.24	2
2777	81	83	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	65.93	2966.85	14
2778	81	91	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	60.54	1331.88	4
2779	81	93	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	49	38.84	1903.16	5
2780	81	98	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	47	78.55	3691.85	6
2781	81	100	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	75.13	2704.68	7
2782	81	101	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	98.72	2171.84	8
2783	81	104	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	23	102.04	2346.92	9
2784	81	105	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	29	76.80	2227.20	10
2785	81	108	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	62.19	2238.84	12
2786	81	109	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	41.22	1401.48	1
2787	122	1	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	40	77.52	3100.80	8
2788	122	3	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	51	99.91	5095.41	7
2789	122	4	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	22	156.86	3450.92	6
2790	122	10	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	29	123.51	3581.79	5
2791	122	32	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	30	51.48	1544.40	4
2792	122	58	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	57	104.81	5974.17	3
2793	122	62	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	58	75.41	4373.78	2
2794	122	86	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	32	97.89	3132.48	1
2795	103	5	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	64	134.64	8616.96	9
2796	103	22	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	34	129.31	4396.54	1
2797	103	37	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	30	74.84	2245.20	7
2798	103	48	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	58	88.93	5157.94	6
2799	103	69	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	24	55.49	1331.76	2
2800	103	75	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	38	59.18	2248.84	3
2801	103	77	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	42	74.64	3134.88	8
2802	103	100	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	46	82.37	3789.02	5
2803	103	109	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	20	41.71	834.20	4
2804	72	31	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	42	75.19	3157.98	3
2805	72	60	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	38	87.54	3326.52	5
2806	72	79	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	64	59.37	3799.68	12
2807	72	83	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	52	65.93	3428.36	4
2808	72	86	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	49	81.91	4013.59	1
2809	72	91	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	62	62.60	3881.20	6
2810	72	93	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	56	41.46	2321.76	7
2811	72	98	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	11	77.64	854.04	8
2812	72	101	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	85	98.72	8391.20	10
2813	72	104	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	21	96.11	2018.31	2
2814	72	105	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	77	73.60	5667.20	9
2815	72	108	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	40	66.63	2665.20	11
2816	95	3	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	45	118.94	5352.30	1
2817	95	32	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	55	58.15	3198.25	2
2818	95	62	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	59	61.70	3640.30	3
2819	33	1	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	24	85.17	2044.08	7
2820	33	4	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	174.29	11503.14	9
2821	33	10	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	122.00	8052.00	6
2822	33	47	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	36	55.33	1991.88	1
2823	33	58	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	46	109.32	5028.72	8
2824	33	66	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	27	57.49	1552.23	4
2825	33	87	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	30	35.80	1074.00	2
2826	33	92	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	45	88.78	3995.10	5
2827	33	96	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	31	65.09	2017.79	3
2828	70	7	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	64	163.44	10460.16	3
2829	70	12	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	43	102.17	4393.31	1
2830	70	14	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	77	67.03	5161.31	4
2831	70	43	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	90	67.54	6078.60	6
2832	70	45	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	28	127.88	3580.64	5
2833	70	54	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	124.99	5999.52	8
2834	70	74	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	49	53.27	2610.23	2
2835	70	84	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	65.48	3143.04	7
2836	38	16	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	97	115.16	11170.52	5
2837	38	24	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	61	72.38	4415.18	4
2838	38	40	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	55	147.33	8103.15	1
2839	38	71	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	47	37.38	1756.86	2
2840	38	78	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	76	127.79	9712.04	3
2841	13	18	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	61	124.56	7598.16	3
2842	13	25	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	48	133.72	6418.56	2
2843	13	46	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	65	117.26	7621.90	1
2844	103	21	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	114.48	6754.32	11
2845	103	23	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	141.10	10723.60	2
2846	103	27	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	42	58.12	2441.04	1
2847	103	34	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	41	132.00	5412.00	12
2848	103	50	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	6	91.11	546.66	3
2849	103	55	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	66	64.14	4233.24	4
2850	103	56	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	26	68.35	1777.10	8
2851	103	59	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	64	45.78	2929.92	10
2852	103	67	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	81.78	6215.28	6
2853	103	70	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	98.65	5820.35	5
2854	103	73	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	13	77.05	1001.65	7
2855	103	76	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	43	101.73	4374.39	9
2856	94	80	21	5	560	10408	Shipped	2005-04-22	2005-04-29	2005-04-27	15	41.03	615.45	1
2857	19	29	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	6	104.25	625.50	2
2858	19	61	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	61	27.88	1700.68	1
2859	83	19	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	65	99.66	6477.90	7
2860	83	20	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	51.21	2253.24	6
2861	83	33	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	56	145.13	8127.28	8
2862	83	35	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	47	93.21	4380.87	1
2863	83	36	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	53	49.97	2648.41	3
2864	83	38	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	34	84.82	2883.88	2
2865	83	44	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	81.35	3579.40	5
2866	83	64	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	31	42.56	1319.36	9
2867	83	82	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	50	95.44	4772.00	4
2868	44	2	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	23	205.73	4731.79	9
2869	44	6	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	144.79	3909.33	2
2870	44	9	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	40	110.70	4428.00	6
2871	44	17	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	109.67	2961.09	8
2872	44	52	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	46	106.55	4901.30	3
2873	44	53	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	35	41.25	1443.75	7
2874	44	85	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	26	78.01	2028.26	1
2875	44	90	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	60.76	1640.52	5
2876	44	103	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	34	89.01	3026.34	4
2877	11	15	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	54	100.73	5439.42	5
2878	11	26	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	41	150.63	6175.83	4
2879	11	28	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	56	120.28	6735.68	8
2880	11	30	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	47	49.83	2342.01	11
2881	11	40	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	60	157.49	9449.40	9
2882	11	57	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	21	47.40	995.40	2
2883	11	65	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	70	109.90	7693.00	10
2884	11	68	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	30	32.88	986.40	6
2885	11	81	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	31	108.82	3373.42	1
2886	11	88	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	19	50.86	966.34	7
2887	11	94	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	26	105.33	2738.58	3
2888	26	8	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	36	201.57	7256.52	2
2889	26	11	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	47	145.04	6816.88	3
2890	26	13	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	22	173.02	3806.44	1
2891	26	49	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	49	133.57	6544.93	5
2892	26	89	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	24	56.55	1357.20	6
2893	26	95	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	51	53.31	2718.81	4
2894	85	5	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	49	114.24	5597.76	3
2895	85	37	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	44	77.42	3406.48	1
2896	85	39	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	41	128.39	5263.99	12
2897	85	42	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	48	85.71	4114.08	14
2898	85	51	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	56	83.38	4669.28	11
2899	85	63	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	43	108.14	4650.02	10
2900	85	72	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	60	72.58	4354.80	5
2901	85	77	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	51	72.96	3720.96	2
2902	85	97	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	37	62.00	2294.00	6
2903	85	99	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	34	74.48	2532.32	13
2904	85	102	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	31	61.44	1904.64	4
2905	85	106	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	28	84.14	2355.92	7
2906	85	107	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	40	84.41	3376.40	8
2907	85	110	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	47	54.60	2566.20	9
2908	111	48	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	51	86.81	4427.31	5
2909	111	69	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	21	60.97	1280.37	1
2910	111	75	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	18	59.83	1076.94	2
2911	111	100	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	32	73.32	2346.24	4
2912	111	109	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	42	43.20	1814.40	3
2913	93	22	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	24	129.31	3103.44	14
2914	93	31	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	15	70.96	1064.40	4
2915	93	60	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	47	90.82	4268.54	6
2916	93	62	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	32	62.46	1998.72	1
2917	93	79	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	18	64.83	1166.94	13
2918	93	83	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	48	70.28	3373.44	5
2919	93	86	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	45	86.90	3910.50	2
2920	93	91	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	26	68.10	1770.60	7
2921	93	93	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	37	39.71	1469.27	8
2922	93	98	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	23	88.60	2037.80	9
2923	93	101	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	22	84.76	1864.72	11
2924	93	104	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	41	98.48	4037.68	3
2925	93	105	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	39	65.60	2558.40	10
2926	93	108	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	43	63.67	2737.81	12
2927	11	1	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	66	79.43	5242.38	2
2928	11	3	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	45	116.56	5245.20	5
2929	11	4	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	56	162.67	9109.52	4
2930	11	10	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	21	144.60	3036.60	1
2931	11	32	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	36	58.75	2115.00	6
2932	11	58	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	35	109.32	3826.20	3
2933	97	43	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	16	70.76	1132.16	2
2934	97	45	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	27	139.64	3770.28	1
2935	97	47	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	33	56.57	1866.81	5
2936	97	54	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	28	120.53	3374.84	4
2937	97	66	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	52	64.41	3349.32	8
2938	97	84	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	10	66.29	662.90	3
2939	97	87	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	43	36.61	1574.23	6
2940	97	92	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	50	100.01	5000.50	9
2941	97	96	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	40	72.41	2896.40	7
2942	91	7	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	12	182.90	2194.80	13
2943	91	12	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	10	111.57	1115.70	11
2944	91	14	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	64.64	2197.76	14
2945	91	16	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	32	99.04	3169.28	10
2946	91	18	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	38	117.48	4464.24	5
2947	91	21	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	37	100.80	3729.60	1
2948	91	24	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	39	67.76	2642.64	9
2949	91	25	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	133.72	4546.48	4
2950	91	34	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	116.16	6388.80	2
2951	91	40	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	35	165.95	5808.25	6
2952	91	46	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	43	114.44	4920.92	3
2953	91	71	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	15	32.10	481.50	7
2954	91	74	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	52.66	2896.30	12
2955	91	78	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	70	112.34	7863.80	8
2956	58	23	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	153.00	5661.00	5
2957	58	27	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	52.06	1874.16	4
2958	58	29	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	116.96	5263.20	2
2959	58	50	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	66	73.62	4858.92	6
2960	58	55	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	68.42	2463.12	7
2961	58	56	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	60	60.26	3615.60	11
2962	58	59	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	48.80	1805.60	13
2963	58	61	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	32.19	1448.55	1
2964	58	67	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	39	76.33	2976.87	9
2965	58	70	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	55	115.09	6329.95	8
2966	58	73	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	35	77.05	2696.75	10
2967	58	76	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	26	104.94	2728.44	12
2968	58	80	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	15	35.29	529.35	3
2969	6	33	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	35	167.06	5847.10	1
2970	6	64	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	40	44.80	1792.00	2
2971	17	19	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	51	91.44	4663.44	2
2972	17	20	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	25	47.44	1186.00	1
2973	66	35	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	10	89.15	891.50	1
2974	66	36	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	31	56.21	1742.51	3
2975	66	38	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	98.44	2067.24	2
2976	66	44	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	80.36	1687.56	5
2977	66	82	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	28	78.89	2208.92	4
2978	11	2	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	50	201.44	10072.00	6
2979	11	9	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	49	121.64	5960.36	3
2980	11	17	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	54	108.50	5859.00	5
2981	11	53	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	26	40.25	1046.50	4
2982	11	90	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	44	54.94	2417.36	2
2983	11	103	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	46	85.98	3955.08	1
2984	4	6	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	131.49	4996.62	12
2985	4	15	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	33	95.99	3167.67	4
2986	4	26	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	147.36	4126.08	3
2987	4	28	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	117.82	4477.16	7
2988	4	30	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	19	48.62	923.78	10
2989	4	40	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	140.55	3935.40	8
2990	4	52	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	107.76	4094.88	13
2991	4	57	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	55	53.75	2956.25	1
2992	4	65	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	49	127.79	6261.71	9
2993	4	68	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	31	31.82	986.42	5
2994	4	85	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	41	83.79	3435.39	11
2995	4	88	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	11	50.32	553.52	6
2996	4	94	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	18	94.92	1708.56	2
2997	86	23	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	30	136.00	4080.00	3
2998	86	27	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	50	55.09	2754.50	2
2999	86	50	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	22	75.46	1660.12	4
3000	86	80	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	49	35.29	1729.21	1
3001	8	29	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	25	108.06	2701.50	4
3002	8	33	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	26	167.06	4343.56	1
3003	8	61	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	45	32.53	1463.85	3
3004	8	64	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	46	44.35	2040.10	2
3005	28	19	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	39	95.55	3726.45	2
3006	28	20	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	41	43.13	1768.33	1
3007	5	2	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	26	214.30	5571.80	11
3008	5	6	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	119.67	5026.14	4
3009	5	9	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	121.64	3284.28	8
3010	5	17	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	94.50	3307.50	10
3011	5	30	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	22	58.34	1283.48	2
3012	5	35	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	92.19	2489.13	12
3013	5	36	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	61.84	2164.40	14
3014	5	38	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	86.92	2173.00	13
3015	5	44	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	46	86.31	3970.26	16
3016	5	52	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	98.07	3530.52	5
3017	5	53	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	41	40.75	1670.75	9
3018	5	65	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	107.34	3864.24	1
3019	5	82	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	88.62	2215.50	15
3020	5	85	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	31	92.46	2866.26	3
3021	5	90	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	45	63.35	2850.75	7
3022	5	103	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	94.07	3950.94	6
3023	11	11	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	34	131.44	4468.96	1
3024	11	15	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	41	111.39	4566.99	9
3025	11	26	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	24	135.90	3261.60	8
3026	11	28	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	29	122.73	3559.17	12
3027	11	40	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	23	165.95	3816.85	13
3028	11	49	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	38	119.20	4529.60	3
3029	11	57	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	52.02	1820.70	6
3030	11	68	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	44	30.41	1338.04	10
3031	11	81	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	26	106.45	2767.70	5
3032	11	88	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	51.95	1818.25	11
3033	11	89	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	49	56.55	2770.95	4
3034	11	94	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	33	114.59	3781.47	7
3035	11	95	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	32	53.31	1705.92	2
3036	13	5	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	127.84	6392.00	2
3037	13	8	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	205.72	8434.52	15
3038	13	13	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	141.88	4114.52	14
3039	13	39	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	136.59	3004.98	11
3040	13	42	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	38	87.73	3333.74	13
3041	13	51	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	75.48	3094.68	10
3042	13	63	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	43	117.97	5072.71	9
3043	13	72	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	44	73.46	3232.24	4
3044	13	77	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	75.47	3773.50	1
3045	13	97	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	54.00	2214.00	5
3046	13	99	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	86.61	2511.69	12
3047	13	102	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	31	60.72	1882.32	3
3048	13	106	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	39	92.16	3594.24	6
3049	13	107	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	99.31	2184.82	7
3050	13	110	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	25	44.77	1119.25	8
3051	57	22	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	36	134.04	4825.44	12
3052	57	31	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	81.10	2757.40	2
3053	57	37	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	80.86	3315.26	18
3054	57	48	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	94.22	3863.02	17
3055	57	60	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	28	107.23	3002.44	4
3056	57	69	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	49	65.77	3222.73	13
3057	57	75	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	55.89	1732.59	14
3058	57	79	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	50	55.96	2798.00	11
3059	57	83	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	26	71.00	1846.00	3
3060	57	91	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	33	65.35	2156.55	5
3061	57	93	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	39	35.78	1395.42	6
3062	57	98	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	91.34	2831.54	7
3063	57	100	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	30	85.09	2552.70	16
3064	57	101	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	99.72	3390.48	9
3065	57	104	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	32	113.90	3644.80	1
3066	57	105	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	44	76.00	3344.00	8
3067	57	108	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	70.33	3375.84	10
3068	57	109	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	43.70	2097.60	15
3069	10	1	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	30	81.35	2440.50	2
3070	10	3	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	39	105.86	4128.54	5
3071	10	4	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	27	172.36	4653.72	4
3072	10	10	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	21	122.00	2562.00	1
3073	10	32	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	29	52.70	1528.30	6
3074	10	58	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	25	96.92	2423.00	3
3075	10	62	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	38	73.12	2778.56	7
3076	10	86	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	20	88.90	1778.00	8
3077	92	7	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	33	165.38	5457.54	6
3078	92	12	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	45	96.30	4333.50	4
3079	92	14	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	39	75.81	2956.59	7
3080	92	16	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	36	107.10	3855.60	3
3081	92	24	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	38	67.76	2574.88	2
3082	92	43	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	26	73.17	1902.42	9
3083	92	45	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	29	132.29	3836.41	8
3084	92	47	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	43	52.84	2272.12	12
3085	92	54	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	44	139.87	6154.28	11
3086	92	66	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	35	64.41	2254.35	15
3087	92	74	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	30	60.01	1800.30	5
3088	92	78	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	40	132.00	5280.00	1
3089	92	84	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	67.10	2080.10	10
3090	92	87	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	27	36.21	977.67	13
3091	92	92	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	87.76	2720.56	16
3092	92	96	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	34	74.85	2544.90	14
3093	118	18	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	117.48	3054.48	4
3094	118	25	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	38	137.98	5243.24	3
3095	118	34	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	126.72	3294.72	1
3096	118	40	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	46	160.87	7400.02	5
3097	118	46	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	47	125.74	5909.78	2
3098	118	71	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	29	32.10	930.90	6
3099	30	21	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	118.22	4374.14	16
3100	30	23	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	153.00	6426.00	7
3101	30	27	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	32	51.46	1646.72	6
3102	30	29	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	33	115.69	3817.77	4
3103	30	33	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	31	163.69	5074.39	1
3104	30	50	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	28	81.91	2293.48	8
3105	30	55	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	62.00	2604.00	9
3106	30	56	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	36	72.02	2592.72	13
3107	30	59	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	29	43.27	1254.83	15
3108	30	61	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	20	28.88	577.60	3
3109	30	64	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	39	40.77	1590.03	2
3110	30	67	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	43	82.69	3555.67	11
3111	30	70	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	46	112.74	5186.04	10
3112	30	73	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	27	80.47	2172.69	12
3113	30	76	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	96.37	3565.69	14
3114	30	80	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	48	35.29	1693.92	5
3115	9	19	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	33	87.33	2881.89	6
3116	9	20	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	48	48.52	2328.96	5
3117	9	36	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	28	53.09	1486.52	2
3118	9	38	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	43	94.25	4052.75	1
3119	9	44	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	39	91.27	3559.53	4
3120	9	82	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	26	85.70	2228.20	3
3121	12	2	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	29	197.16	5717.64	1
3122	12	35	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	23	85.10	1957.30	2
3123	6	9	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	21	121.64	2554.44	2
3124	6	17	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	49	101.50	4973.50	4
3125	6	53	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	50	43.27	2163.50	3
3126	6	90	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	23	58.82	1352.86	1
3127	24	6	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	31	128.53	3984.43	8
3128	24	28	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	39	106.78	4164.42	3
3129	24	30	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	45	53.48	2406.60	6
3130	24	40	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	48	169.34	8128.32	4
3131	24	52	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	41	105.34	4318.94	9
3132	24	65	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	21	102.23	2146.83	5
3133	24	68	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	24	28.64	687.36	1
3134	24	85	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	32	88.61	2835.52	7
3135	24	88	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	28	43.83	1227.24	2
3136	24	103	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	42	82.94	3483.48	10
3137	99	15	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	111.39	5123.94	5
3138	99	26	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	140.81	6477.26	4
3139	99	57	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	47	56.64	2662.08	2
3140	99	81	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	44	106.45	4683.80	1
3141	99	94	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	27	100.70	2718.90	3
3142	90	89	15	4	42	10116	Shipped	2003-04-11	2003-04-19	2003-04-13	27	60.28	1627.56	1
3143	15	8	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	33	195.33	6445.89	9
3144	15	11	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	43	148.06	6366.58	10
3145	15	13	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	39	173.02	6747.78	8
3146	15	39	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	26	121.57	3160.82	5
3147	15	42	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	81.68	1715.28	7
3148	15	49	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	22	122.08	2685.76	12
3149	15	51	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	23	73.73	1695.79	4
3150	15	63	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	41	119.20	4887.20	3
3151	15	95	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	55.65	1168.65	11
3152	15	99	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	38	75.35	2863.30	6
3153	15	107	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	45	89.38	4022.10	1
3154	15	110	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	50	52.42	2621.00	2
3155	40	106	23	4	48	10118	Shipped	2003-04-21	2003-04-29	2003-04-26	36	86.15	3101.40	1
3156	91	5	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	46	112.88	5192.48	11
3157	91	22	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	43	151.38	6509.34	3
3158	91	37	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	21	74.84	1571.64	9
3159	91	48	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	27	95.28	2572.56	8
3160	91	69	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	41	64.40	2640.40	4
3161	91	72	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	72.58	2540.30	13
3162	91	75	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	20	63.12	1262.40	5
3163	91	77	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	82.18	2876.30	10
3164	91	79	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	62.10	1738.80	2
3165	91	97	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	25	57.34	1433.50	14
3166	91	100	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	29	74.23	2152.67	7
3167	91	102	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	38	67.22	2554.36	12
3168	91	108	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	26	63.67	1655.42	1
3169	91	109	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	40.22	1126.16	6
3170	3	3	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	118.94	3449.26	3
3171	3	4	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	158.80	7304.80	2
3172	3	31	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	82.79	2400.91	8
3173	3	32	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	57.54	2646.84	4
3174	3	58	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	35	110.45	3865.75	1
3175	3	60	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	39	93.01	3627.39	10
3176	3	62	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	34	72.36	2460.24	5
3177	3	83	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	71.73	2080.17	9
3178	3	86	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	22	94.90	2087.80	6
3179	3	91	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	68.79	1994.91	11
3180	3	93	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	49	41.46	2031.54	12
3181	3	98	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	47	91.34	4292.98	13
3182	3	101	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	81.77	1962.48	15
3183	3	104	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	106.79	2562.96	7
3184	3	105	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	43	72.00	3096.00	14
3185	81	1	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	34	86.13	2928.42	5
3186	81	10	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	50	126.52	6326.00	4
3187	81	66	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	32	58.18	1861.76	2
3188	81	92	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	25	95.93	2398.25	3
3189	81	96	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	44	72.41	3186.04	1
3190	80	7	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	42	155.66	6537.72	10
3191	80	12	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	37	113.92	4215.04	8
3192	80	14	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	32	65.44	2094.08	11
3193	80	16	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	20	104.80	2096.00	7
3194	80	18	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	114.65	3898.10	2
3195	80	24	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	62.37	2681.91	6
3196	80	25	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	113.80	3527.80	1
3197	80	40	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	25	137.17	3429.25	3
3198	80	43	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	69.15	1452.15	13
3199	80	45	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	133.76	2808.96	12
3200	80	47	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	35	59.06	2067.10	16
3201	80	54	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	28	145.82	4082.96	15
3202	80	71	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	39	34.74	1354.86	4
3203	80	74	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	50.82	1727.88	9
3204	80	78	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	136.22	5857.46	5
3205	80	84	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	29	67.10	1945.90	14
3206	80	87	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	33.79	1047.49	17
3207	1	21	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	26	120.71	3138.46	2
3208	1	34	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	46	114.84	5282.64	3
3209	1	46	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	34	117.26	3986.84	4
3210	1	59	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	50	43.27	2163.50	1
3211	2	23	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	21	153.00	3213.00	6
3212	2	27	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	58.12	2441.04	5
3213	2	29	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	111.87	4698.54	3
3214	2	50	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	36	75.46	2716.56	7
3215	2	55	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	23	66.28	1524.44	8
3216	2	56	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	62.47	1374.34	12
3217	2	61	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	45	30.53	1373.85	2
3218	2	64	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	36.29	798.38	1
3219	2	67	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	32	74.51	2384.32	10
3220	2	70	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	25	93.95	2348.75	9
3221	2	73	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	49	76.19	3733.31	11
3222	2	76	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	43	101.73	4374.39	13
3223	2	80	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	46	36.11	1661.06	4
3224	3	19	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	32	89.38	2860.16	1
3225	3	33	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	34	138.38	4704.92	2
3226	107	2	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	205.73	7817.74	11
3227	107	6	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	22	122.62	2697.64	4
3228	107	9	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	21	135.30	2841.30	8
3229	107	17	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	116.67	4433.46	10
3230	107	20	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	42	51.21	2150.82	17
3231	107	30	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	51.05	2195.15	2
3232	107	35	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	31	93.21	2889.51	12
3233	107	36	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	46	61.84	2844.64	14
3234	107	38	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	30	93.20	2796.00	13
3235	107	44	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	94.25	3581.50	16
3236	107	52	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	50	102.92	5146.00	5
3237	107	53	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	47.29	2033.47	9
3238	107	65	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	27	122.68	3312.36	1
3239	107	82	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	34	83.76	2847.84	15
3240	107	85	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	82.83	3561.69	3
3241	107	90	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	26	62.05	1613.30	7
3242	107	103	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	45	97.10	4369.50	6
3243	16	8	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	193.25	8889.50	2
3244	16	11	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	140.50	6463.00	3
3245	16	13	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	42	169.56	7121.52	1
3246	16	15	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	24	100.73	2417.52	11
3247	16	26	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	140.81	6336.45	10
3248	16	28	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	114.14	5136.30	14
3249	16	40	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	22	149.02	3278.44	15
3250	16	49	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	25	126.39	3159.75	5
3251	16	57	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	50.86	1017.20	8
3252	16	68	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	39	34.30	1337.70	12
3253	16	81	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	107.63	2152.60	7
3254	16	88	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	46.53	2093.85	13
3255	16	89	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	29	60.90	1766.10	6
3256	16	94	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	111.12	5111.52	9
3257	16	95	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	55.65	2559.90	4
3258	11	39	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	120.20	4928.20	2
3259	11	42	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	80.67	3307.47	4
3260	11	51	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	43	77.24	3321.32	1
3261	11	99	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	32	72.75	2328.00	3
3262	71	5	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	33	123.76	4084.08	2
3263	71	63	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	113.06	5087.70	9
3264	71	72	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	41	81.43	3338.63	4
3265	71	77	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	50	76.31	3815.50	1
3266	71	97	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	31	58.67	1818.77	5
3267	71	102	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	72.28	3252.60	3
3268	71	106	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	42	90.15	3786.30	6
3269	71	107	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	30	94.34	2830.20	7
3270	71	110	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	32	44.23	1415.36	8
3271	32	37	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	40	68.82	2752.80	2
3272	32	48	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	33	99.52	3284.16	1
3273	101	22	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	141.92	2980.32	4
3274	101	69	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	35	60.97	2133.95	5
3275	101	75	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	29	52.60	1525.40	6
3276	101	79	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	50	54.59	2729.50	3
3277	101	100	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	22	76.94	1692.68	8
3278	101	101	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	40	86.76	3470.40	1
3279	101	108	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	26	63.67	1655.42	2
3280	101	109	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	40.22	844.62	7
3281	70	105	19	6	84	10132	Shipped	2003-06-25	2003-07-01	2003-06-28	36	80.00	2880.00	1
3282	11	31	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	80.26	3932.74	3
3283	11	60	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	41	109.42	4486.22	5
3284	11	83	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	46	61.58	2832.68	4
3285	11	86	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	23	80.91	1860.93	1
3286	11	91	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	67.41	3303.09	6
3287	11	93	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	37.09	1001.43	7
3288	11	98	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	24	76.73	1841.52	8
3289	11	104	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	115.09	3107.43	2
3290	51	1	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	41	90.92	3727.72	2
3291	51	3	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	27	116.56	3147.12	5
3292	51	4	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	31	187.85	5823.35	4
3293	51	10	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	20	131.04	2620.80	1
3294	51	32	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	30	51.48	1544.40	6
3295	51	58	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	35	94.67	3313.45	3
3296	51	62	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	43	75.41	3242.63	7
3297	6	7	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	173.17	7273.14	7
3298	6	12	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	110.39	5298.72	5
3299	6	14	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	24	72.62	1742.88	8
3300	6	16	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	103.64	3005.56	4
3301	6	24	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	66.99	3215.52	3
3302	6	43	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	65.94	2967.30	10
3303	6	45	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	139.64	5864.88	9
3304	6	47	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	49.74	2238.30	13
3305	6	54	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	31	133.92	4151.52	12
3306	6	66	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	67.18	1948.22	16
3307	6	71	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	20	34.36	687.20	1
3308	6	74	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	27	52.05	1405.35	6
3309	6	78	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	47	139.03	6534.41	2
3310	6	84	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	23	76.80	1766.40	11
3311	6	87	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	33	38.62	1274.46	14
3312	6	92	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	30	91.85	2755.50	17
3313	6	96	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	44	78.92	3472.48	15
3314	48	18	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	25	117.48	2937.00	2
3315	48	25	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	36	120.91	4352.76	1
3316	48	40	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	41	169.34	6942.94	3
3317	81	21	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	44	115.73	5092.12	2
3318	81	34	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	37	110.88	4102.56	3
3319	81	46	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	31	118.68	3679.08	4
3320	81	59	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	26	40.25	1046.50	1
3321	122	23	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	149.60	4936.80	6
3322	122	27	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	51.46	1132.12	5
3323	122	29	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	38	114.42	4347.96	3
3324	122	50	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	47	79.15	3720.05	7
3325	122	55	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	23	64.86	1491.78	8
3326	122	56	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	45	59.53	2678.85	12
3327	122	61	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	33.19	730.18	2
3328	122	64	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	38.53	1271.49	1
3329	122	67	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	28	73.60	2060.80	10
3330	122	70	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	30	96.30	2889.00	9
3331	122	73	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	49	77.05	3775.45	11
3332	122	76	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	21	99.58	2091.18	13
3333	122	80	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	29	32.82	951.78	4
3334	58	19	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	31	89.38	2770.78	7
3335	58	20	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	49	52.83	2588.67	6
3336	58	33	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	41	151.88	6227.08	8
3337	58	35	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	46	91.18	4194.28	1
3338	58	36	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	52.47	1049.40	3
3339	58	38	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	101.58	2031.60	2
3340	58	44	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	30	81.35	2440.50	5
3341	58	82	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	29	93.49	2711.21	4
3342	18	2	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	37	186.44	6898.28	11
3343	18	6	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	131.49	3418.74	4
3344	18	9	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	38	118.90	4518.20	8
3345	18	17	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	32	95.67	3061.44	10
3346	18	30	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	46	51.05	2348.30	2
3347	18	52	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	40	100.50	4020.00	5
3348	18	53	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	29	40.25	1167.25	9
3349	18	65	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	47	118.84	5585.48	1
3350	18	85	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	87.64	2278.64	3
3351	18	90	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	28	62.05	1737.40	7
3352	18	103	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	36	101.15	3641.40	6
3353	74	15	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	114.95	2413.95	5
3354	74	26	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	39	160.46	6257.94	4
3355	74	28	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	47	103.09	4845.23	8
3356	74	40	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	34	143.94	4893.96	9
3357	74	57	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	20	50.86	1017.20	2
3358	74	68	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	32.18	675.78	6
3359	74	81	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	40	104.09	4163.60	1
3360	74	88	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	24	53.03	1272.72	7
3361	74	94	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	44	94.92	4176.48	3
3362	6	8	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	166.24	5485.92	12
3363	6	11	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	140.50	4636.50	13
3364	6	13	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	46	167.83	7720.18	11
3365	6	39	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	47	129.76	6098.72	8
3366	6	42	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	22	95.80	2107.60	10
3367	6	49	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	122.08	2929.92	15
3368	6	51	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	79.87	1916.88	7
3369	6	63	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	114.29	3771.57	6
3370	6	72	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	49	74.35	3643.15	1
3371	6	89	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	60.90	2557.80	16
3372	6	95	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	56.24	2362.08	14
3373	6	97	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	41	55.34	2268.94	2
3374	6	99	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	43	77.08	3314.44	9
3375	6	106	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	21	92.16	1935.36	3
3376	6	107	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	38	91.37	3472.06	4
3377	6	110	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	39	46.96	1831.44	5
3378	68	5	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	49	133.28	6530.72	15
3379	68	22	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	32	126.15	4036.80	7
3380	68	37	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	46	70.54	3244.84	13
3381	68	48	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	99.52	3383.68	12
3382	68	69	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	27	63.71	1720.17	8
3383	68	75	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	33	59.83	1974.39	9
3384	68	77	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	23	74.64	1716.72	14
3385	68	79	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	55.96	1566.88	6
3386	68	93	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	34.91	1186.94	1
3387	68	98	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	36	86.77	3123.72	2
3388	68	100	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	87.80	2282.80	11
3389	68	101	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	79.78	2074.28	4
3390	68	102	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	31	69.39	2151.09	16
3391	68	105	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	70.40	1971.20	3
3392	68	108	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	65.15	2215.10	5
3393	68	109	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	37	49.66	1837.42	10
3394	90	91	15	4	113	10144	Shipped	2003-08-13	2003-08-21	2003-08-14	20	56.41	1128.20	1
3395	36	1	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	45	76.56	3445.20	6
3396	36	3	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	37	104.67	3872.79	9
3397	36	4	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	154.93	5112.69	8
3398	36	10	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	49	146.10	7158.90	5
3399	36	31	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	71.81	2154.30	14
3400	36	32	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	52.70	1581.00	10
3401	36	58	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	43	103.68	4458.24	7
3402	36	60	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	40	87.54	3501.60	16
3403	36	62	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	47	63.98	3007.06	11
3404	36	66	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	56.10	1514.70	3
3405	36	83	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	71.73	2367.09	15
3406	36	86	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	99.89	3296.37	12
3407	36	87	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	31	39.43	1222.33	1
3408	36	92	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	95.93	2590.11	4
3409	36	96	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	38	73.22	2782.36	2
3410	36	104	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	20	113.90	2278.00	13
3411	101	47	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	47	60.30	2834.10	2
3412	101	54	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	29	130.94	3797.26	1
3413	89	7	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	48	161.49	7751.52	7
3414	89	12	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	110.39	3422.09	5
3415	89	14	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	21	74.21	1558.41	8
3416	89	16	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	33	97.89	3230.37	4
3417	89	24	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	26	70.84	1841.84	3
3418	89	43	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	36	74.78	2692.08	10
3419	89	45	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	37	129.35	4785.95	9
3420	89	71	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	25	33.23	830.75	1
3421	89	74	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	30	48.98	1469.40	6
3422	89	78	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	23	123.58	2842.34	2
3423	89	84	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	72.76	2255.56	11
3424	56	18	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	23	114.65	2636.95	13
3425	56	21	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	108.26	5088.22	9
3426	56	25	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	136.56	3414.00	12
3427	56	34	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	113.52	3065.04	10
3428	56	40	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	32	143.94	4606.08	14
3429	56	46	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	28	135.63	3797.64	11
3430	56	50	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	83.75	2847.50	1
3431	56	55	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	29	66.28	1922.12	2
3432	56	56	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	65.41	1635.25	6
3433	56	59	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	46.29	2175.63	8
3434	56	67	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	21	77.24	1622.04	4
3435	56	70	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	115.09	3913.06	3
3436	56	73	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	31	71.91	2229.21	5
3437	56	76	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	96.37	2601.99	7
3438	119	19	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	50	87.33	4366.50	4
3439	119	20	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	30	48.52	1455.60	3
3440	119	23	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	34	156.40	5317.60	11
3441	119	27	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	24	50.85	1220.40	10
3442	119	29	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	33	125.86	4153.38	8
3443	119	33	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	23	167.06	3842.38	5
3444	119	44	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	42	89.29	3750.18	2
3445	119	61	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	36	31.20	1123.20	7
3446	119	64	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	49	39.87	1953.63	6
3447	119	80	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	26	38.57	1002.82	9
3448	119	82	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	20	90.57	1811.40	1
3449	15	2	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	45	182.16	8197.20	8
3450	15	6	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	121.15	2423.00	1
3451	15	9	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	135.30	4059.00	5
3452	15	17	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	34	95.67	3252.78	7
3453	15	35	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	47	93.21	4380.87	9
3454	15	36	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	56.21	1686.30	11
3455	15	38	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	26	97.39	2532.14	10
3456	15	52	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	111.39	5458.11	2
3457	15	53	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	47.29	1418.70	6
3458	15	90	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	62.05	3040.45	4
3459	15	103	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	95.08	1901.60	3
3460	65	15	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	24	114.95	2758.80	3
3461	65	26	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	43	152.27	6547.61	2
3462	65	28	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	49	106.78	5232.22	6
3463	65	30	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	39	58.34	2275.26	9
3464	65	40	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	21	167.65	3520.65	7
3465	65	65	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	42	109.90	4615.80	8
3466	65	68	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	30	29.35	880.50	4
3467	65	85	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	27	84.75	2288.25	10
3468	65	88	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	41	43.29	1774.89	5
3469	65	94	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	26	108.81	2829.06	1
3470	73	49	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	35	117.77	4121.95	1
3471	73	57	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	25	49.13	1228.25	4
3472	73	81	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	23	112.37	2584.51	3
3473	73	89	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	33	57.17	1886.61	2
3474	11	8	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	201.57	4031.40	11
3475	11	11	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	42	128.42	5393.64	12
3476	11	13	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	49	155.72	7630.28	10
3477	11	39	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	125.66	3895.46	7
3478	11	42	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	29	82.69	2398.01	9
3479	11	51	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	22	82.50	1815.00	6
3480	11	63	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	40	111.83	4473.20	5
3481	11	95	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	53.31	1652.61	13
3482	11	97	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	43	58.00	2494.00	1
3483	11	99	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	80.55	2497.05	8
3484	11	106	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	87.15	4357.50	2
3485	11	107	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	85.41	1708.20	3
3486	11	110	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	51.87	2593.50	4
3487	41	72	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	31	75.23	2332.13	2
3488	41	102	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	36	59.27	2133.72	1
3489	29	5	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	129.20	4134.40	13
3490	29	22	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	38	138.77	5273.26	5
3491	29	37	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	83.44	3671.36	11
3492	29	48	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	29	105.87	3070.23	10
3493	29	69	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	23	62.34	1433.82	6
3494	29	75	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	56.55	1922.70	7
3495	29	77	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	37	76.31	2823.47	12
3496	29	79	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	58.69	2582.36	4
3497	29	100	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	89.61	2867.52	9
3498	29	101	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	20	87.75	1755.00	2
3499	29	105	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	43	76.80	3302.40	1
3500	29	108	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	70.33	3094.52	3
3501	29	109	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	49.16	1671.44	8
3502	11	93	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	20	43.64	872.80	1
3503	11	98	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	48	77.64	3726.72	2
3504	112	31	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	69.27	2285.91	3
3505	112	60	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	40	89.72	3588.80	5
3506	112	83	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	66.65	2199.45	4
3507	112	86	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	34	83.91	2852.94	1
3508	112	91	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	28	56.41	1579.48	6
3509	112	104	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	48	109.16	5239.68	2
3510	5	62	17	7	151	10158	Shipped	2003-10-10	2003-10-18	2003-10-15	22	67.79	1491.38	1
3511	69	1	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	49	81.35	3986.15	14
3512	69	3	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	37	101.10	3740.70	17
3513	69	4	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	22	170.42	3749.24	16
3514	69	7	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	41	188.73	7737.93	2
3515	69	10	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	38	131.04	4979.52	13
3516	69	14	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	24	67.03	1608.72	3
3517	69	32	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	42	51.48	2162.16	18
3518	69	43	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	66.74	1401.54	5
3519	69	45	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	25	129.35	3233.75	4
3520	69	47	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	54.71	1148.91	8
3521	69	54	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	32	142.85	4571.20	7
3522	69	58	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	44	100.30	4413.20	15
3523	69	66	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	27	67.18	1813.86	11
3524	69	74	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	50	49.60	2480.00	1
3525	69	84	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	80.84	1859.32	6
3526	69	87	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	35	39.43	1380.05	9
3527	69	92	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	86.74	1995.02	12
3528	69	96	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	31	78.11	2421.41	10
3529	78	12	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	46	96.30	4429.80	6
3530	78	16	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	50	93.28	4664.00	5
3531	78	24	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	38	70.84	2691.92	4
3532	78	40	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	20	140.55	2811.00	1
3533	78	71	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	42	30.59	1284.78	2
3534	78	78	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	35	130.60	4571.00	3
3535	43	18	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	28	121.72	3408.16	12
3536	43	21	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	43	102.04	4387.72	8
3537	43	25	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	48	139.41	6691.68	11
3538	43	34	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	125.40	2884.20	9
3539	43	46	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	36	132.80	4780.80	10
3540	43	55	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	62.72	1568.00	1
3541	43	56	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	37	73.49	2719.13	5
3542	43	59	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	47.29	1087.67	7
3543	43	67	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	82.69	1653.80	3
3544	43	70	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	108.04	2701.00	2
3545	43	73	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	72.77	1455.40	4
3546	43	76	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	30	94.23	2826.90	6
3547	69	19	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	87.33	4191.84	2
3548	69	20	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	45	45.28	2037.60	1
3549	69	23	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	29	141.10	4091.90	9
3550	69	27	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	27	53.28	1438.56	8
3551	69	29	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	38	113.15	4299.70	6
3552	69	33	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	156.94	7533.12	3
3553	69	50	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	39	86.51	3373.89	10
3554	69	61	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	27.55	1019.35	5
3555	69	64	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	43	38.98	1676.14	4
3556	69	80	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	32.82	1214.34	7
3557	99	2	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	21	212.16	4455.36	1
3558	99	35	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	31	101.31	3140.61	2
3559	99	36	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	48	59.96	2878.08	4
3560	99	38	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	40	101.58	4063.20	3
3561	99	44	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	43	80.36	3455.48	6
3562	99	82	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	42	96.42	4049.64	5
3563	104	6	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	21	143.31	3009.51	2
3564	104	9	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	121.64	5960.36	6
3565	104	17	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	36	103.84	3738.24	8
3566	104	52	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	45	107.76	4849.20	3
3567	104	53	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	25	46.29	1157.25	7
3568	104	85	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	24	91.49	2195.76	1
3569	104	90	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	57.53	2818.97	5
3570	104	103	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	39	86.99	3392.61	4
3571	15	8	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	168.32	7406.08	3
3572	15	11	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	34	123.89	4212.26	4
3573	15	13	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	152.26	4111.02	2
3574	15	15	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	109.02	5232.96	12
3575	15	26	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	29	134.26	3893.54	11
3576	15	28	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	46	120.28	5532.88	15
3577	15	30	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	31	60.77	1883.87	18
3578	15	40	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	47	154.10	7242.70	16
3579	15	42	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	50	84.71	4235.50	1
3580	15	49	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	28	123.51	3458.28	6
3581	15	57	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	25	46.82	1170.50	9
3582	15	65	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	32	117.57	3762.24	17
3583	15	68	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	31.12	840.24	13
3584	15	81	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	24	106.45	2554.80	8
3585	15	88	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	50.86	2441.28	14
3586	15	89	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	55.30	2433.20	7
3587	15	94	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	106.49	5111.52	10
3588	15	95	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	38	49.21	1869.98	5
3589	109	39	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	43	136.59	5873.37	2
3590	109	51	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	26	72.85	1894.10	1
3591	109	99	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	29	76.22	2210.38	3
3592	102	5	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	44	123.76	5445.44	9
3593	102	22	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	141.92	6102.56	1
3594	102	37	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	69.68	3205.28	7
3595	102	48	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	34	84.70	2879.80	6
3596	102	63	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	33	110.60	3649.80	16
3597	102	69	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	21	54.81	1151.01	2
3598	102	72	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	20	77.00	1540.00	11
3599	102	75	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	32	64.44	2062.08	3
3600	102	77	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	73.80	2140.20	8
3601	102	97	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	66.00	2838.00	12
3602	102	100	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	87.80	2546.20	5
3603	102	102	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	62.16	2859.36	10
3604	102	106	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	24	85.14	2043.36	13
3605	102	107	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	28	83.42	2335.76	14
3606	102	109	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	40	42.71	1708.40	4
3607	102	110	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	38	43.68	1659.84	15
3608	18	1	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.74	3410.64	1
3609	18	3	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	97.53	2633.31	4
3610	18	4	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	20	160.74	3214.80	3
3611	18	31	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	21	75.19	1578.99	9
3612	18	32	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	46	49.06	2256.76	5
3613	18	58	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	50	103.68	5184.00	2
3614	18	60	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	49	93.01	4557.49	11
3615	18	62	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	29	72.36	2098.44	6
3616	18	79	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	57.32	1547.64	18
3617	18	83	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	68.10	3268.80	10
3618	18	86	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	89.90	2517.20	7
3619	18	91	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	57.78	1791.18	12
3620	18	93	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	39.71	1906.08	13
3621	18	98	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	91.34	2557.52	14
3622	18	101	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	87.75	2720.25	16
3623	18	104	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.92	3417.12	8
3624	18	105	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	72.00	3456.00	15
3625	18	108	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	39	67.37	2627.43	17
3626	56	7	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	30	163.44	4903.20	2
3627	56	10	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	35	126.52	4428.20	13
3628	56	14	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	71.82	2585.52	3
3629	56	43	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	32	65.13	2084.16	5
3630	56	45	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	136.70	4921.20	4
3631	56	47	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	52.84	2007.92	8
3632	56	54	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	33	120.53	3977.49	7
3633	56	66	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	66.49	2526.62	11
3634	56	74	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	53.27	1811.18	1
3635	56	84	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	24	77.61	1862.64	6
3636	56	87	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	26	37.01	962.26	9
3637	56	92	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	83.68	2845.12	12
3638	56	96	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	48	75.66	3631.68	10
3639	104	12	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	47	116.27	5464.69	4
3640	104	16	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	41	93.28	3824.48	3
3641	104	24	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	20	70.07	1401.40	2
3642	104	78	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	34	130.60	4440.40	1
3643	44	18	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	134.46	4706.10	2
3644	44	25	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	128.03	4481.05	1
3645	44	40	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	39	165.95	6472.05	3
3646	44	71	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	36	34.74	1250.64	4
3647	26	21	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	42	109.51	4599.42	6
3648	26	34	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	39	117.48	4581.72	7
3649	26	46	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	48	139.87	6713.76	8
3650	26	56	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	32	61.00	1952.00	3
3651	26	59	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	34	43.27	1471.18	5
3652	26	67	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	79.97	1759.34	1
3653	26	73	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	24	77.91	1869.84	2
3654	26	76	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	87.81	1931.82	4
3655	57	19	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	43	101.71	4373.53	6
3656	57	20	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	48	51.75	2484.00	5
3657	57	23	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	24	168.30	4039.20	13
3658	57	27	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	26	55.09	1432.34	12
3659	57	29	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	127.13	3941.03	10
3660	57	33	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	140.06	3081.32	7
3661	57	36	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	28	56.84	1591.52	2
3662	57	38	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	86.92	2694.52	1
3663	57	44	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	29	90.28	2618.12	4
3664	57	50	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	21	77.31	1623.51	14
3665	57	55	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	39	58.44	2279.16	15
3666	57	61	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	29.87	925.97	9
3667	57	64	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	27	39.42	1064.34	8
3668	57	70	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	23	98.65	2268.95	16
3669	57	80	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	35	35.70	1249.50	11
3670	57	82	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	93.49	2056.78	3
3671	73	2	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	34	207.87	7067.58	4
3672	73	9	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	43	113.44	4877.92	1
3673	73	17	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	48	108.50	5208.00	3
3674	73	35	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	46	100.30	4613.80	5
3675	73	53	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	49	44.27	2169.23	2
3676	71	6	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	33	119.67	3949.11	9
3677	71	15	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	26	109.02	2834.52	1
3678	71	28	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	48	101.87	4889.76	4
3679	71	30	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	41	59.55	2441.55	7
3680	71	40	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	150.71	4370.59	5
3681	71	52	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	47	102.92	4837.24	10
3682	71	65	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	28	121.40	3399.20	6
3683	71	68	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	37	32.18	1190.66	2
3684	71	85	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	22	89.57	1970.54	8
3685	71	88	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	50	50.86	2543.00	3
3686	71	90	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	56.24	1630.96	12
3687	71	103	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	42	80.92	3398.64	11
3688	93	8	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	33	166.24	5485.92	2
3689	93	11	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	47	145.04	6816.88	3
3690	93	13	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	50	160.91	8045.50	1
3691	93	26	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	20	139.17	2783.40	10
3692	93	49	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	36	140.75	5067.00	5
3693	93	57	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	27	55.49	1498.23	8
3694	93	81	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	29	101.72	2949.88	7
3695	93	89	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	22	62.14	1367.08	6
3696	93	94	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	23	109.96	2529.08	9
3697	93	95	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	38	52.14	1981.32	4
3698	77	39	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	23	113.37	2607.51	9
3699	77	42	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	29	92.77	2690.33	11
3700	77	51	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	35	82.50	2887.50	8
3701	77	63	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	50	115.52	5776.00	7
3702	77	72	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	45	79.66	3584.70	2
3703	77	97	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	58.67	1408.08	3
3704	77	99	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	31	77.95	2416.45	10
3705	77	102	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	32	64.33	2058.56	1
3706	77	106	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	44	88.15	3878.60	4
3707	77	107	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	83.42	2002.08	5
3708	77	110	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	40	52.96	2118.40	6
3709	48	5	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	24	131.92	3166.08	12
3710	48	22	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	42	127.73	5364.66	4
3711	48	37	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	41	70.54	2892.14	10
3712	48	48	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	48	104.81	5030.88	9
3713	48	69	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	67.82	2305.88	5
3714	48	75	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	27	65.75	1775.25	6
3715	48	77	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	21	68.77	1444.17	11
3716	48	79	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	30	64.15	1924.50	3
3717	48	100	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	86.90	2954.60	8
3718	48	101	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	22	91.74	2018.28	1
3719	48	108	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	68.11	3064.95	2
3720	48	109	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	41.71	1876.95	7
3721	122	31	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	82.79	1986.96	3
3722	122	60	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	47	105.04	4936.88	5
3723	122	83	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	27	66.65	1799.55	4
3724	122	86	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	45	86.90	3910.50	1
3725	122	91	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	63.97	1535.28	6
3726	122	93	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	34	43.20	1468.80	7
3727	122	98	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	23	75.81	1743.63	8
3728	122	104	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	25	98.48	2462.00	2
3729	122	105	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	39	80.00	3120.00	9
3730	23	1	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	29	76.56	2220.24	9
3731	23	3	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	42	99.91	4196.22	12
3732	23	4	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	41	164.61	6749.01	11
3733	23	10	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	40	131.04	5241.60	8
3734	23	32	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	25	48.46	1211.50	13
3735	23	47	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	59.06	1240.26	3
3736	23	54	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	44	147.31	6481.64	2
3737	23	58	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	48	98.05	4706.40	10
3738	23	62	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	61.70	1727.60	14
3739	23	66	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	35	60.95	2133.25	6
3740	23	84	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	68.71	1923.88	1
3741	23	87	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	34	33.39	1135.26	4
3742	23	92	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	22	102.05	2245.10	7
3743	23	96	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	74.85	1571.85	5
3744	20	7	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	155.66	4202.82	14
3745	20	12	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	28	113.92	3189.76	12
3746	20	14	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	20	67.03	1340.60	15
3747	20	16	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	36	107.10	3855.60	11
3748	20	18	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	44	124.56	5480.64	6
3749	20	21	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	42	124.44	5226.48	2
3750	20	24	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	74.69	1643.18	10
3751	20	25	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	21	129.45	2718.45	5
3752	20	34	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	130.68	3528.36	3
3753	20	40	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	45	147.33	6629.85	7
3754	20	43	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	30	73.17	2195.10	17
3755	20	45	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	120.53	2651.66	16
3756	20	46	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	39	137.04	5344.56	4
3757	20	59	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	34	45.28	1539.52	1
3758	20	71	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	37	32.85	1215.45	8
3759	20	74	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	23	54.49	1253.27	13
3760	20	78	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	25	122.17	3054.25	9
3761	6	19	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	25	83.22	2080.50	3
3762	6	20	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	32	44.21	1414.72	2
3763	6	23	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	159.80	7031.20	10
3764	6	27	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	38	54.49	2070.62	9
3765	6	29	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	105.52	2110.40	7
3766	6	33	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	21	135.00	2835.00	4
3767	6	44	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	86.31	2848.23	1
3768	6	50	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	88.35	3180.60	11
3769	6	55	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	61.29	2696.76	12
3770	6	56	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	47	63.20	2970.40	16
3771	6	61	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	39	31.86	1242.54	6
3772	6	64	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	31	39.87	1235.97	5
3773	6	67	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	87.24	3140.64	14
3774	6	70	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	116.27	2325.40	13
3775	6	73	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	73.62	2429.46	15
3776	6	76	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	49	95.30	4669.70	17
3777	6	80	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	23	34.88	802.24	8
3778	76	2	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	180.01	4140.23	8
3779	76	6	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	28	127.06	3557.68	1
3780	76	9	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	41	114.80	4706.80	5
3781	76	17	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	108.50	2278.50	7
3782	76	35	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	37	91.18	3373.66	9
3783	76	36	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	39	51.22	1997.58	11
3784	76	38	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	22	90.06	1981.32	10
3785	76	52	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	118.66	2491.86	2
3786	76	53	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	40	42.26	1690.40	6
3787	76	82	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	47	81.81	3845.07	12
3788	76	90	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	49	52.36	2565.64	4
3789	76	103	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	85.98	1977.54	3
3790	117	15	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	37	105.47	3902.39	6
3791	117	26	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	145.72	6703.12	5
3792	117	28	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	119.05	5476.30	9
3793	117	30	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	44	60.77	2673.88	12
3794	117	40	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	28	165.95	4646.60	10
3795	117	57	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	31	57.22	1773.82	3
3796	117	65	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	24	117.57	2821.68	11
3797	117	68	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	42	30.06	1262.52	7
3798	117	81	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	49	114.73	5621.77	2
3799	117	85	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	84.75	3898.50	13
3800	117	88	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	33	52.49	1732.17	8
3801	117	89	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	48	59.03	2833.44	1
3802	117	94	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	45	92.60	4167.00	4
3803	68	8	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	195.33	4101.93	13
3804	68	11	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	146.55	4836.15	14
3805	68	13	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	43	147.07	6324.01	12
3806	68	39	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	124.30	3480.40	9
3807	68	42	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	49	94.79	4644.71	11
3808	68	49	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	127.82	4984.98	16
3809	68	51	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	47	87.77	4125.19	8
3810	68	63	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	105.69	3170.70	7
3811	68	72	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	83.20	2745.60	2
3812	68	95	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	20	46.86	937.20	15
3813	68	97	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	64.67	1358.07	3
3814	68	99	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	79.68	2390.40	10
3815	68	102	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	61.44	2396.16	1
3816	68	106	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	37	99.17	3669.29	4
3817	68	107	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	22	93.35	2053.70	5
3818	68	110	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	47.50	1330.00	6
3819	120	5	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	26	108.80	2828.80	9
3820	120	22	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	137.19	4390.08	1
3821	120	37	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	73.12	2339.84	7
3822	120	48	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	46	98.46	4529.16	6
3823	120	69	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	22	60.29	1326.38	2
3824	120	75	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	21	59.83	1256.43	3
3825	120	77	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	36	68.77	2475.72	8
3826	120	100	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	24	80.56	1933.44	5
3827	120	109	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	28	42.71	1195.88	4
3828	39	31	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	45	70.12	3155.40	1
3829	39	60	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	46	96.29	4429.34	3
3830	39	79	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	43	55.96	2406.28	10
3831	39	83	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	33	64.48	2127.84	2
3832	39	91	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	31	61.22	1897.82	4
3833	39	93	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	41	39.71	1628.11	5
3834	39	98	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	84.95	2888.30	6
3835	39	101	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	95.73	4212.12	8
3836	39	105	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	72.00	2448.00	7
3837	39	108	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	70.33	3094.52	9
3838	20	1	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	48	95.70	4593.60	1
3839	20	3	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	38	111.80	4248.40	4
3840	20	4	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	45	182.04	8191.80	3
3841	20	32	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	32	52.09	1666.88	5
3842	20	58	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	25	95.80	2395.00	2
3843	20	62	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	40	61.70	2468.00	6
3844	20	86	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	44	81.91	3604.04	7
3845	20	104	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	29	96.11	2787.19	8
3846	36	10	8	1	188	10189	Shipped	2003-11-18	2003-11-25	2003-11-24	28	138.57	3879.96	1
3847	11	66	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	58.87	2472.54	3
3848	11	87	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	46	38.62	1776.52	1
3849	11	92	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	89.80	3771.60	4
3850	11	96	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	40	67.53	2701.20	2
3851	53	7	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	21	155.66	3268.86	3
3852	53	12	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	40	104.52	4180.80	1
3853	53	14	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	30	70.22	2106.60	4
3854	53	43	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	36	75.59	2721.24	6
3855	53	45	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	23	119.06	2738.38	5
3856	53	47	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	43	60.93	2619.99	9
3857	53	54	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	32	136.90	4380.80	8
3858	53	74	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	48	53.27	2556.96	2
3859	53	84	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	44	77.61	3414.84	7
3860	86	16	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	27	99.04	2674.08	16
3861	86	18	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	22	140.12	3082.64	11
3862	86	21	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	29	100.80	2923.20	7
3863	86	24	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	70.84	3187.80	15
3864	86	25	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	128.03	6017.41	10
3865	86	34	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	38	110.88	4213.44	8
3866	86	40	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	26	137.17	3566.42	12
3867	86	46	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	125.74	5658.30	9
3868	86	56	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	37	72.02	2664.74	4
3869	86	59	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	49.30	2317.10	6
3870	86	67	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	86.33	3971.18	2
3871	86	70	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	23	112.74	2593.02	1
3872	86	71	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	30	33.23	996.90	13
3873	86	73	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	32	69.34	2218.88	3
3874	86	76	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	93.16	4285.36	5
3875	86	78	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	112.34	5055.30	14
3876	111	19	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	92.47	2589.16	7
3877	111	20	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	46	46.36	2132.56	6
3878	111	23	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	21	153.00	3213.00	14
3879	111	27	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	42	60.54	2542.68	13
3880	111	29	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	44	115.69	5090.36	11
3881	111	33	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	143.44	3155.68	8
3882	111	35	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	87.13	2439.64	1
3883	111	36	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	53.09	1274.16	3
3884	111	38	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	23	97.39	2239.97	2
3885	111	44	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	32	79.37	2539.84	5
3886	111	50	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	92.03	2208.72	15
3887	111	55	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	25	66.28	1657.00	16
3888	111	61	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	26	32.19	836.94	10
3889	111	64	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	44.80	896.00	9
3890	111	80	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	38.16	839.52	12
3891	111	82	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	92.52	1850.40	4
3892	14	2	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	42	203.59	8550.78	11
3893	14	6	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	134.44	3495.44	4
3894	14	9	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	38	124.37	4726.06	8
3895	14	17	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	21	103.84	2180.64	10
3896	14	30	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	45	51.05	2297.25	2
3897	14	52	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	32	113.82	3642.24	5
3898	14	53	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	41	47.79	1959.39	9
3899	14	65	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	49	112.46	5510.54	1
3900	14	85	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	37	77.05	2850.85	3
3901	14	90	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	39	61.41	2394.99	7
3902	14	103	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	80.92	2103.92	6
3903	67	15	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	118.50	5806.50	6
3904	67	26	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	27	139.17	3757.59	5
3905	67	28	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	35	112.91	3951.85	9
3906	67	40	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	50	150.71	7535.50	10
3907	67	57	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	44	54.33	2390.52	3
3908	67	68	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	31.82	1018.24	7
3909	67	81	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	34	95.81	3257.54	2
3910	67	88	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	51.95	1662.40	8
3911	67	89	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	33	59.03	1947.99	1
3912	67	94	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	97.23	4764.27	4
3913	105	8	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	47	203.64	9571.08	5
3914	105	11	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	24	151.08	3625.92	6
3915	105	13	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	38	147.07	5588.66	4
3916	105	39	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	49	127.03	6224.47	1
3917	105	42	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	35	81.68	2858.80	3
3918	105	49	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	27	126.39	3412.53	8
3919	105	95	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	46	56.82	2613.72	7
3920	105	99	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	50	84.88	4244.00	2
3921	40	5	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	45	118.32	5324.40	6
3922	40	37	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	46	83.44	3838.24	4
3923	40	48	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	85.75	1886.50	3
3924	40	51	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	78.99	3949.50	14
3925	40	63	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	41	109.37	4484.17	13
3926	40	72	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	47	83.20	3910.40	8
3927	40	77	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	67.93	1494.46	5
3928	40	97	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	23	60.00	1380.00	9
3929	40	100	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	24	78.75	1890.00	2
3930	40	102	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	66.50	3325.00	7
3931	40	106	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	27	100.17	2704.59	10
3932	40	107	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	35	88.39	3093.65	11
3933	40	109	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	29	39.73	1152.17	1
3934	40	110	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	42	48.59	2040.78	12
3935	92	22	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	149.81	6292.02	4
3936	92	69	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	48	60.97	2926.56	5
3937	92	75	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	27	61.81	1668.87	6
3938	92	79	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	43	65.51	2816.93	3
3939	92	101	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	94.73	3978.66	1
3940	92	108	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	40	74.03	2961.20	2
3941	113	93	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	29	37.97	1101.13	1
3942	113	98	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	48	81.29	3901.92	2
3943	113	105	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	38	70.40	2675.20	3
3944	39	31	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	28	74.34	2081.52	3
3945	39	60	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	33	99.57	3285.81	5
3946	39	83	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	70.28	2740.92	4
3947	39	86	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	35	80.91	2831.85	1
3948	39	91	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	27	65.35	1764.45	6
3949	39	104	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	115.09	4488.51	2
3950	9	1	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	22	82.30	1810.60	2
3951	9	3	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	24	116.56	2797.44	5
3952	9	4	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	49	191.72	9394.28	4
3953	9	10	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	126.52	3163.00	1
3954	9	32	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	30	48.46	1453.80	6
3955	9	58	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	39	93.54	3648.06	3
3956	9	62	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	66.27	1656.75	7
3957	83	47	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	30	55.33	1659.90	3
3958	83	54	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	43	124.99	5374.57	2
3959	83	66	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	56.10	2805.00	6
3960	83	84	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	75.18	3759.00	1
3961	83	87	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	27	33.39	901.53	4
3962	83	92	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	31	81.64	2530.84	7
3963	83	96	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	40	79.73	3189.20	5
3964	11	7	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	161.49	3229.80	8
3965	11	12	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	111.57	2231.40	6
3966	11	14	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	44	63.84	2808.96	9
3967	11	16	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	115.16	5412.52	5
3968	11	24	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	45	73.15	3291.75	4
3969	11	40	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	48	157.49	7559.52	1
3970	11	43	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	33	66.74	2202.42	11
3971	11	45	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	32	127.88	4092.16	10
3972	11	71	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	21	33.23	697.83	2
3973	11	74	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	34	56.94	1935.96	7
3974	11	78	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	140.43	6600.21	3
3975	16	18	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	114.65	4815.30	17
3976	16	21	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	113.24	4529.60	13
3977	16	23	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	33	153.00	5049.00	4
3978	16	25	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	38	133.72	5081.36	16
3979	16	27	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	23	59.33	1364.59	3
3980	16	29	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	26	119.50	3107.00	1
3981	16	34	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	27	106.92	2886.84	14
3982	16	46	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	35	132.80	4648.00	15
3983	16	50	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	29	83.75	2428.75	5
3984	16	55	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	69.84	3142.80	6
3985	16	56	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	20	69.82	1396.40	10
3986	16	59	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	46.79	2105.55	12
3987	16	67	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	47	79.06	3715.82	8
3988	16	70	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	112.74	4735.08	7
3989	16	73	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	84.75	3390.00	9
3990	16	76	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	48	104.94	5037.12	11
3991	16	80	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	39	34.88	1360.32	2
3992	11	19	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	36	98.63	3550.68	2
3993	11	20	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	48	45.82	2199.36	1
3994	11	33	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	40	138.38	5535.20	3
3995	11	61	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	32	27.88	892.16	5
3996	11	64	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	24	36.74	881.76	4
3997	34	2	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	47	203.59	9568.73	6
3998	34	9	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	109.34	3061.52	3
3999	34	17	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	34	115.50	3927.00	5
4000	34	35	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	37	98.27	3635.99	7
4001	34	36	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	51.84	1451.52	9
4002	34	38	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	30	102.63	3078.90	8
4003	34	44	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	99.21	2777.88	11
4004	34	53	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	21	45.78	961.38	4
4005	34	82	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	95.44	3149.52	10
4006	34	90	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	36	54.94	1977.84	2
4007	34	103	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	89.01	2937.33	1
4008	121	6	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	31	125.58	3892.98	15
4009	121	15	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	34	95.99	3263.66	7
4010	121	26	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	44	140.81	6195.64	6
4011	121	28	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	43	109.23	4696.89	10
4012	121	30	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	37	60.77	2248.49	13
4013	121	40	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	25	140.55	3513.75	11
4014	121	49	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	40	143.62	5744.80	1
4015	121	52	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	47	119.87	5633.89	16
4016	121	57	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	57.80	2832.20	4
4017	121	65	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	46	127.79	5878.34	12
4018	121	68	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	42	30.76	1291.92	8
4019	121	81	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	108.82	3046.96	3
4020	121	85	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	84.75	4152.75	14
4021	121	88	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	27	51.95	1402.65	9
4022	121	89	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	45	55.30	2488.50	2
4023	121	94	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	106.49	2981.72	5
4024	14	8	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	176.63	8124.98	13
4025	14	11	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	26	128.42	3338.92	14
4026	14	13	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	152.26	3045.20	12
4027	14	39	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	24	117.47	2819.28	9
4028	14	42	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	48	96.81	4646.88	11
4029	14	51	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	45	72.85	3278.25	8
4030	14	63	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	35	122.89	4301.15	7
4031	14	72	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	80.54	1610.80	2
4032	14	95	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	30	57.99	1739.70	15
4033	14	97	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	38	56.67	2153.46	3
4034	14	99	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	40	73.62	2944.80	10
4035	14	102	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	63.61	2926.06	1
4036	14	106	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	37	95.16	3520.92	4
4037	14	107	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	33	95.34	3146.22	5
4038	14	110	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	42	48.05	2018.10	6
4039	78	5	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	39	129.20	5038.80	8
4040	78	37	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	28	82.58	2312.24	6
4041	78	48	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	20	97.40	1948.00	5
4042	78	69	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	43	66.45	2857.35	1
4043	78	75	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	36	56.55	2035.80	2
4044	78	77	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	22	79.67	1752.74	7
4045	78	100	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	33	90.52	2987.16	4
4046	78	109	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	48	44.20	2121.60	3
4047	27	3	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	23	112.99	2598.77	2
4048	27	4	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	34	189.79	6452.86	1
4049	27	22	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	141.92	4399.52	17
4050	27	31	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	50	68.43	3421.50	7
4051	27	32	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	51.48	2059.20	3
4052	27	60	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	27	100.67	2718.09	9
4053	27	62	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	30	63.22	1896.60	4
4054	27	79	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	29	56.64	1642.56	16
4055	27	83	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	68.10	2724.00	8
4056	27	86	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	46	84.91	3905.86	5
4057	27	91	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	39	57.10	2226.90	10
4058	27	93	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	43	43.20	1857.60	11
4059	27	98	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	21	87.69	1841.49	12
4060	27	101	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	26	93.74	2437.24	14
4061	27	104	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	25	98.48	2462.00	6
4062	27	105	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	64.00	1984.00	13
4063	27	108	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	42	60.70	2549.40	15
4064	95	1	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	90.92	3727.72	14
4065	95	7	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	171.22	7020.02	2
4066	95	10	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	36	126.52	4554.72	13
4067	95	14	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	79.80	2234.40	3
4068	95	43	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	35	73.17	2560.95	5
4069	95	45	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	138.17	3868.76	4
4070	95	47	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	46	60.30	2773.80	8
4071	95	54	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	148.80	6100.80	7
4072	95	58	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	25	109.32	2733.00	15
4073	95	66	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	21	62.33	1308.93	11
4074	95	74	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	48	52.66	2527.68	1
4075	95	84	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	22	80.84	1778.48	6
4076	95	87	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	39.83	1633.03	9
4077	95	92	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	37	94.91	3511.67	12
4078	95	96	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	40	70.78	2831.20	10
4079	11	12	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	39	99.82	3892.98	16
4080	11	16	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	33	110.55	3648.15	15
4081	11	18	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	29	117.48	3406.92	10
4082	11	21	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	38	105.77	4019.26	6
4083	11	24	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	20	64.68	1293.60	14
4084	11	25	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	133.72	5482.52	9
4085	11	34	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	117.48	4699.20	7
4086	11	40	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	155.79	6231.60	11
4087	11	46	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	115.85	5213.25	8
4088	11	56	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	61.73	2530.93	3
4089	11	59	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	43.27	1947.15	5
4090	11	67	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	81.78	3680.10	1
4091	11	71	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	34	37.38	1270.92	12
4092	11	73	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	27	77.91	2103.57	2
4093	11	76	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	46	100.66	4630.36	4
4094	11	78	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	49	117.96	5780.04	13
4095	120	50	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	38	84.67	3217.46	1
4096	120	55	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	25	58.44	1461.00	2
4097	120	70	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	27	97.48	2631.96	3
4098	107	23	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	30	166.60	4998.00	7
4099	107	27	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	21	53.28	1118.88	6
4100	107	29	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	27	125.86	3398.22	4
4101	107	33	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	50	167.06	8353.00	1
4102	107	61	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	20	32.19	643.80	3
4103	107	64	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	49	39.87	1953.63	2
4104	107	80	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	44	38.57	1697.08	5
4105	113	2	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	35	205.73	7200.55	3
4106	113	17	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	100.34	4615.64	2
4107	113	19	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	27	92.47	2496.69	10
4108	113	20	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	33	53.91	1779.03	9
4109	113	35	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	97.26	4765.74	4
4110	113	36	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	31	56.21	1742.51	6
4111	113	38	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	89.01	4361.49	5
4112	113	44	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	41	84.33	3457.53	8
4113	113	53	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	42.76	1966.96	1
4114	113	82	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	39	94.47	3684.33	7
4115	52	9	14	4	234	10216	Shipped	2004-02-02	2004-02-10	2004-02-04	43	133.94	5759.42	1
4116	19	6	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	48	132.97	6382.56	4
4117	19	30	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	35	58.34	2041.90	2
4118	19	52	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	38	118.66	4509.08	5
4119	19	65	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	28	103.51	2898.28	1
4120	19	85	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	21	78.97	1658.37	3
4121	19	90	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	39	56.24	2193.36	7
4122	19	103	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	31	90.02	2790.62	6
4123	112	28	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	22	110.46	2430.12	1
4124	112	40	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	34	152.41	5181.94	2
4125	119	15	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	48	94.80	4550.40	2
4126	119	26	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	43	132.62	5702.66	1
4127	119	68	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	21	31.12	653.52	3
4128	119	88	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	35	47.62	1666.70	4
4129	31	8	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	32	189.10	6051.20	2
4130	31	11	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	151.08	4532.40	3
4131	31	13	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	27	166.10	4484.70	1
4132	31	49	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	50	126.39	6319.50	5
4133	31	57	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	26	48.55	1262.30	8
4134	31	81	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	101.72	3763.64	7
4135	31	89	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	20	49.71	994.20	6
4136	31	94	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	92.60	3426.20	9
4137	31	95	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	56.82	1704.60	4
4138	66	39	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	33	133.86	4417.38	3
4139	66	42	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	89.75	2064.25	5
4140	66	51	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	39	84.26	3286.14	2
4141	66	63	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	49	113.06	5539.94	1
4142	66	99	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	69.29	1593.67	4
4143	46	5	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	133.28	6530.72	12
4144	46	22	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	137.19	6722.31	4
4145	46	37	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	79.14	3877.86	10
4146	46	48	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	45	88.93	4001.85	9
4147	46	69	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	32	56.86	1819.52	5
4148	46	72	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	47	74.35	3494.45	14
4149	46	75	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	61.15	2629.45	6
4150	46	77	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	46	77.99	3587.54	11
4151	46	79	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	48	55.27	2652.96	3
4152	46	97	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	58.67	1818.77	15
4153	46	100	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	26	80.56	2094.56	8
4154	46	101	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	37	90.75	3357.75	1
4155	46	102	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	69.39	2498.04	13
4156	46	106	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	38	84.14	3197.32	16
4157	46	107	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	81.43	2524.33	17
4158	46	108	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	66.63	2865.09	2
4159	46	109	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	45.19	1400.89	7
4160	46	110	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	48.59	1749.24	18
4161	3	1	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	37	80.39	2974.43	1
4162	3	3	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	110.61	5198.67	4
4163	3	4	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	49	189.79	9299.71	3
4164	3	31	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	67.58	3176.26	9
4165	3	32	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	28	58.75	1645.00	5
4166	3	58	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	32	104.81	3353.92	2
4167	3	60	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	34	87.54	2976.36	11
4168	3	62	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	38	60.94	2315.72	6
4169	3	83	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	23	68.10	1566.30	10
4170	3	86	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	21	90.90	1908.90	7
4171	3	91	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	20	66.73	1334.60	12
4172	3	93	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	41	41.02	1681.82	13
4173	3	98	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	25	84.03	2100.75	14
4174	3	104	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	29	113.90	3303.10	8
4175	3	105	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	26	79.20	2059.20	15
4176	23	10	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	141.58	6087.94	6
4177	23	47	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	38	57.20	2173.60	1
4178	23	66	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	37	60.26	2229.62	4
4179	23	87	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	37.01	1591.43	2
4180	23	92	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	30	94.91	2847.30	5
4181	23	96	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	50	81.36	4068.00	3
4182	61	7	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	157.60	4255.20	9
4183	61	12	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	25	101.00	2525.00	7
4184	61	14	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	64.64	2391.68	10
4185	61	16	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	21	100.19	2103.99	6
4186	61	18	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	32	116.06	3713.92	1
4187	61	24	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	47	71.61	3365.67	5
4188	61	40	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	43	162.57	6990.51	2
4189	61	43	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	69.96	2588.52	12
4190	61	45	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	119.06	3214.62	11
4191	61	54	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	35	135.41	4739.35	14
4192	61	71	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	42	34.74	1459.08	3
4193	61	74	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	24	51.43	1234.32	8
4194	61	78	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	40	130.60	5224.00	4
4195	61	84	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	46	77.61	3570.06	13
4196	46	21	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	38	108.26	4113.88	4
4197	46	25	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	129.45	3106.80	7
4198	46	34	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	125.40	3009.60	5
4199	46	46	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	46	122.91	5653.86	6
4200	46	56	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	21	65.41	1373.61	1
4201	46	59	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	36	47.79	1720.44	3
4202	46	76	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	48	95.30	4574.40	2
4203	14	19	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	25	85.27	2131.75	3
4204	14	20	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	31	50.14	1554.34	2
4205	14	23	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	26	136.00	3536.00	10
4206	14	27	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	28	59.93	1678.04	9
4207	14	29	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	46	118.23	5438.58	7
4208	14	33	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	29	146.81	4257.49	4
4209	14	44	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	99.21	3273.93	1
4210	14	50	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	34	87.43	2972.62	11
4211	14	55	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	37	70.56	2610.72	12
4212	14	61	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	42	27.22	1143.24	6
4213	14	64	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	24	39.42	946.08	5
4214	14	67	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	47	84.51	3971.97	14
4215	14	70	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	102.17	3371.61	13
4216	14	73	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	40	78.76	3150.40	15
4217	14	80	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	27	34.88	941.76	8
4218	25	2	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	29	214.30	6214.70	2
4219	25	17	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	32	100.34	3210.88	1
4220	25	35	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	24	101.31	2431.44	3
4221	25	36	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	45	57.46	2585.70	5
4222	25	38	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	31	100.53	3116.43	4
4223	25	82	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	33	84.73	2796.09	6
4224	6	6	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	138.88	6944.00	9
4225	6	9	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	110.70	2767.50	13
4226	6	15	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	36	95.99	3455.64	1
4227	6	28	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	26	104.32	2712.32	4
4228	6	30	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	28	53.48	1497.44	7
4229	6	40	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	22	157.49	3464.78	5
4230	6	52	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	41	119.87	4914.67	10
4231	6	53	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	39	43.77	1707.03	14
4232	6	65	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	48	115.01	5520.48	6
4233	6	68	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	33	34.65	1143.45	2
4234	6	85	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	78.97	1974.25	8
4235	6	88	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	23	49.78	1144.94	3
4236	6	90	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	30	52.36	1570.80	12
4237	6	103	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	91.04	4552.00	11
4238	8	11	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	128.42	5522.06	1
4239	8	26	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	49	153.91	7541.59	8
4240	8	49	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	42	142.18	5971.56	3
4241	8	57	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	36	47.40	1706.40	6
4242	8	81	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	45	99.36	4471.20	5
4243	8	89	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	46	59.03	2715.38	4
4244	8	94	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	34	100.70	3423.80	7
4245	8	95	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	57.41	2468.63	2
4246	77	8	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	42	193.25	8116.50	2
4247	77	13	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	49	147.07	7206.43	1
4248	47	39	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	22	133.86	2944.92	6
4249	47	42	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	97.81	4694.88	8
4250	47	51	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	23	78.12	1796.76	5
4251	47	63	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	46	113.06	5200.76	4
4252	47	99	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	26	84.88	2206.88	7
4253	47	106	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	86.15	4135.20	1
4254	47	107	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	35	81.43	2850.05	2
4255	47	110	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	24	48.59	1166.16	3
4256	72	72	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	40	70.81	2832.40	2
4257	72	97	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	36	66.00	2376.00	3
4258	72	102	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	29	67.94	1970.26	1
4259	97	5	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	118.32	5679.36	9
4260	97	22	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	50	146.65	7332.50	1
4261	97	37	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	84.30	4046.40	7
4262	97	48	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	39	85.75	3344.25	6
4263	97	69	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	44	67.14	2954.16	2
4264	97	75	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	25	65.09	1627.25	3
4265	97	77	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	31	78.83	2443.73	8
4266	97	100	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	29	83.28	2415.12	5
4267	97	109	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	40	45.69	1827.60	4
4268	54	31	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	24	81.95	1966.80	3
4269	54	60	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	23	89.72	2063.56	5
4270	54	79	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	33	55.27	1823.91	12
4271	54	83	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	40	63.03	2521.20	4
4272	54	86	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	90.90	3726.90	1
4273	54	91	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	66.73	2268.82	6
4274	54	93	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	37.09	1520.69	7
4275	54	98	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	88.60	2215.00	8
4276	54	101	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	38	92.74	3524.12	10
4277	54	104	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	116.28	2907.00	2
4278	54	105	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	32	73.60	2355.20	9
4279	54	108	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	70.33	2391.22	11
4280	118	3	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	22	105.86	2328.92	1
4281	118	32	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	23	52.70	1212.10	2
4282	118	62	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	36	65.51	2358.36	3
4283	28	1	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	23	91.87	2113.01	7
4284	28	4	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	39	158.80	6193.20	9
4285	28	10	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	32	129.53	4144.96	6
4286	28	47	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	49.74	1293.24	1
4287	28	58	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	109.32	2186.40	8
4288	28	66	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	62.33	1620.58	4
4289	28	87	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	35.00	910.00	2
4290	28	92	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	27	94.91	2562.57	5
4291	28	96	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	78.92	1578.40	3
4292	13	7	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	28	161.49	4521.72	3
4293	13	12	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	29	104.52	3031.08	1
4294	13	14	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	20	73.42	1468.40	4
4295	13	43	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	41	68.35	2802.35	6
4296	13	45	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	49	144.05	7058.45	5
4297	13	54	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	44	120.53	5303.32	8
4298	13	74	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	47	53.88	2532.36	2
4299	13	84	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	22	67.91	1494.02	7
4300	65	16	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	21	100.19	2103.99	5
4301	65	24	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	46	70.07	3223.22	4
4302	65	40	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	47	135.47	6367.09	1
4303	65	71	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	20	32.47	649.40	2
4304	65	78	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	29	133.41	3868.89	3
4305	27	18	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	41	125.97	5164.77	3
4306	27	25	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	136.56	5052.72	2
4307	27	46	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	134.22	4966.14	1
4308	38	21	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	119.46	2508.66	11
4309	38	23	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	41	153.00	6273.00	2
4310	38	27	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	33	55.70	1838.10	1
4311	38	34	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	44	126.72	5575.68	12
4312	38	50	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	42	77.31	3247.02	3
4313	38	55	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	30	62.72	1881.60	4
4314	38	56	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	22	72.02	1584.44	8
4315	38	59	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	47.29	993.09	10
4316	38	67	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	47	89.05	4185.35	6
4317	38	70	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	28	117.44	3288.32	5
4318	38	73	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	26	69.34	1802.84	7
4319	38	76	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	27	107.08	2891.16	9
4320	106	80	11	3	288	10242	Shipped	2004-04-20	2004-04-28	2004-04-25	46	36.52	1679.92	1
4321	121	29	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	47	111.87	5257.89	2
4322	121	61	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	33	30.87	1018.71	1
4323	11	19	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	99.66	3986.40	7
4324	11	20	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	20	48.52	970.40	6
4325	11	33	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	43	141.75	6095.25	8
4326	11	35	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	30	87.13	2613.90	1
4327	11	36	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	24	54.96	1319.04	3
4328	11	38	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	29	85.87	2490.23	2
4329	11	44	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	36	87.30	3142.80	5
4330	11	64	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	39	42.11	1642.29	9
4331	11	82	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	97.39	3895.60	4
4332	105	2	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	34	195.01	6630.34	9
4333	105	6	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	28	147.74	4136.72	2
4334	105	9	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	38	120.27	4570.26	6
4335	105	17	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	29	114.34	3315.86	8
4336	105	52	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	21	111.39	2339.19	3
4337	105	53	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	45	48.80	2196.00	7
4338	105	85	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	37	81.86	3028.82	1
4339	105	90	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	54.94	2417.36	5
4340	105	103	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	81.93	3604.92	4
4341	11	15	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	99.54	4578.84	5
4342	11	26	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	40	144.08	5763.20	4
4343	11	28	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	100.64	2214.08	8
4344	11	30	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	30	57.73	1731.90	11
4345	11	40	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	36	145.63	5242.68	9
4346	11	57	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	44	46.24	2034.56	2
4347	11	65	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	29	118.84	3446.36	10
4348	11	68	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	49	34.65	1697.85	6
4349	11	81	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	100.54	4624.84	1
4350	11	88	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	35	45.45	1590.75	7
4351	11	94	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	113.44	2495.68	3
4352	74	8	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	44	195.33	8594.52	2
4353	74	11	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	25	140.50	3512.50	3
4354	74	13	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	27	167.83	4531.41	1
4355	74	49	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	48	143.62	6893.76	5
4356	74	89	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	40	58.41	2336.40	6
4357	74	95	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	49	51.55	2525.95	4
4358	10	5	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	20	126.48	2529.60	3
4359	10	37	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	21	80.86	1698.06	1
4360	10	39	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	133.86	4283.52	12
4361	10	42	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	95.80	4023.60	14
4362	10	51	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	87.77	3686.34	11
4363	10	63	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	48	122.89	5898.72	10
4364	10	72	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	85.85	2575.50	5
4365	10	77	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	83.02	1909.46	2
4366	10	97	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	36	66.00	2376.00	6
4367	10	99	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	40	81.41	3256.40	13
4368	10	102	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	69.39	2220.48	4
4369	10	106	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	84.14	2524.20	7
4370	10	107	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	35	92.36	3232.60	8
4371	10	110	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	53.51	1230.73	9
4372	25	48	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	46	88.93	4090.78	5
4373	25	69	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	20	54.81	1096.20	1
4374	25	75	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	25	65.75	1643.75	2
4375	25	100	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	40	85.99	3439.60	4
4376	25	109	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	32	49.16	1573.12	3
4377	103	22	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	45	148.23	6670.35	14
4378	103	31	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	27	84.48	2280.96	4
4379	103	60	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	95.20	2951.20	6
4380	103	62	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	32	63.22	2023.04	1
4381	103	79	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	40	61.42	2456.80	13
4382	103	83	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	37	72.45	2680.65	5
4383	103	86	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	99.89	3096.59	2
4384	103	91	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	50	62.60	3130.00	7
4385	103	93	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	36	36.66	1319.76	8
4386	103	98	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	91.34	2831.54	9
4387	103	101	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	35	90.75	3176.25	11
4388	103	104	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	98.48	4333.12	3
4389	103	105	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	76.00	3344.00	10
4390	103	108	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	38	65.89	2503.82	12
4391	72	1	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	59	93.79	5533.61	2
4392	72	3	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	115.37	5076.28	5
4393	72	4	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	43	172.36	7411.48	4
4394	72	10	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	46	129.53	5958.38	1
4395	72	32	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	58.15	2558.60	6
4396	72	58	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	50	91.29	4564.50	3
4397	95	43	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	20	74.78	1495.60	2
4398	95	45	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	41	145.52	5966.32	1
4399	95	47	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	31	50.36	1561.16	5
4400	95	54	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	26	127.97	3327.22	4
4401	95	66	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	47	63.03	2962.41	8
4402	95	84	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	38	69.52	2641.76	3
4403	95	87	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	36	36.21	1303.56	6
4404	95	92	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	25	93.89	2347.25	9
4405	95	96	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	48	72.41	3475.68	7
4406	33	7	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	157.60	3782.40	13
4407	33	12	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	22	102.17	2247.74	11
4408	33	14	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	25	67.03	1675.75	14
4409	33	16	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	41	109.40	4485.40	10
4410	33	18	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	26	130.22	3385.72	5
4411	33	21	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	103.29	2478.96	1
4412	33	24	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	23	67.76	1558.48	9
4413	33	25	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	33	130.87	4318.71	4
4414	33	34	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	37	114.84	4249.08	2
4415	33	40	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	145.63	5825.20	6
4416	33	46	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	31	139.87	4335.97	3
4417	33	71	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	34.74	1389.60	7
4418	33	74	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	50.82	1219.68	12
4419	33	78	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	39	115.15	4490.85	8
4420	70	23	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	137.70	6747.30	5
4421	70	27	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	36	55.09	1983.24	4
4422	70	29	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	41	102.98	4222.18	2
4423	70	50	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	80.99	2753.66	6
4424	70	55	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	30	59.87	1796.10	7
4425	70	56	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	66.88	2273.92	11
4426	70	59	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	32	43.27	1384.64	13
4427	70	61	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	38	28.88	1097.44	1
4428	70	67	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	31	85.42	2648.02	9
4429	70	70	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	33	111.57	3681.81	8
4430	70	73	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	42	69.34	2912.28	10
4431	70	76	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	101.73	4984.77	12
4432	70	80	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	20	39.80	796.00	3
4433	38	33	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	24	135.00	3240.00	1
4434	38	64	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	37	37.63	1392.31	2
4435	13	19	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	34	93.49	3178.66	2
4436	13	20	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	29	52.83	1532.07	1
4437	103	35	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	50	92.19	4609.50	1
4438	103	36	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	49	59.34	2907.66	3
4439	103	38	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	37	83.78	3099.86	2
4440	103	44	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	26	91.27	2373.02	5
4441	103	82	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	46	81.81	3763.26	4
4442	94	2	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	32	177.87	5691.84	6
4443	94	9	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	133.94	5491.54	3
4444	94	17	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	113.17	4639.97	5
4445	94	53	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	21	49.81	1046.01	4
4446	94	90	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	20	62.70	1254.00	2
4447	94	103	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	45	86.99	3914.55	1
4448	19	6	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	26	121.15	3149.90	12
4449	19	15	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	46	117.32	5396.72	4
4450	19	26	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	134.26	4027.80	3
4451	19	28	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	34	120.28	4089.52	7
4452	19	30	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	59.55	1786.50	10
4453	19	40	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	27	152.41	4115.07	8
4454	19	52	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	41	107.76	4418.16	13
4455	19	57	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	28	46.82	1310.96	1
4456	19	65	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	47	121.40	5705.80	9
4457	19	68	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	31	31.47	975.57	5
4458	19	85	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	45	95.35	4290.75	11
4459	19	88	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	40	45.99	1839.60	6
4460	19	94	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	29	105.33	3054.57	2
4461	83	8	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	46	180.79	8316.34	5
4462	83	11	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	30	140.50	4215.00	6
4463	83	13	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	44	169.56	7460.64	4
4464	83	39	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	32	121.57	3890.24	1
4465	83	42	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	29	92.77	2690.33	3
4466	83	49	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	137.88	3171.24	8
4467	83	81	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	117.10	2693.30	10
4468	83	89	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	27	55.30	1493.10	9
4469	83	95	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	21	56.24	1181.04	7
4470	83	99	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	33	80.55	2658.15	2
4471	44	5	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	27	116.96	3157.92	1
4472	44	51	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	20	80.75	1615.00	9
4473	44	63	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	36	105.69	3804.84	8
4474	44	72	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	22	79.66	1752.52	3
4475	44	97	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	34	64.00	2176.00	4
4476	44	102	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	44	58.55	2576.20	2
4477	44	106	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	25	89.15	2228.75	5
4478	44	107	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	50	88.39	4419.50	6
4479	44	110	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	29	43.68	1266.72	7
4480	11	22	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	157.69	7726.81	9
4481	11	37	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	32	81.72	2615.04	15
4482	11	48	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	85.75	2915.50	14
4483	11	60	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	98.48	3348.32	1
4484	11	69	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	24	63.71	1529.04	10
4485	11	75	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	46	65.75	3024.50	11
4486	11	77	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	82.18	4026.82	16
4487	11	79	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	48	58.69	2817.12	8
4488	11	91	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	63.97	2558.80	2
4489	11	93	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	35.78	1753.22	3
4490	11	98	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	87.69	3507.60	4
4491	11	100	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	44	83.28	3664.32	13
4492	11	101	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	33	81.77	2698.41	6
4493	11	105	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	27	64.80	1749.60	5
4494	11	108	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	35	64.41	2254.35	7
4495	11	109	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	21	41.71	875.91	12
4496	26	1	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	89.00	3026.00	2
4497	26	3	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	40	107.05	4282.00	5
4498	26	4	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	41	193.66	7940.06	4
4499	26	10	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	48	123.51	5928.48	1
4500	26	31	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	33	67.58	2230.14	10
4501	26	32	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	50.27	1709.18	6
4502	26	58	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	42	109.32	4591.44	3
4503	26	62	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	37	67.03	2480.11	7
4504	26	83	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	24	59.41	1425.84	11
4505	26	86	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	31	93.90	2910.90	8
4506	26	104	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	47	117.46	5520.62	9
4507	85	47	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	48	58.44	2805.12	3
4508	85	54	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	124.99	2499.80	2
4509	85	66	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	37	61.64	2280.68	6
4510	85	84	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	75.18	3533.46	1
4511	85	87	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	39.02	780.40	4
4512	85	92	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	34	100.01	3400.34	7
4513	85	96	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	67.53	3173.91	5
4514	111	43	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	45	74.78	3365.10	2
4515	111	45	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	49	123.47	6050.03	1
4516	93	7	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	44	188.73	8304.12	14
4517	93	12	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	22	110.39	2428.58	12
4518	93	14	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	35	67.83	2374.05	15
4519	93	16	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	40	112.86	4514.40	11
4520	93	18	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	21	131.63	2764.23	6
4521	93	21	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	36	99.55	3583.80	2
4522	93	24	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	77.00	2541.00	10
4523	93	25	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	49	139.41	6831.09	5
4524	93	34	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	20	113.52	2270.40	3
4525	93	40	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	29	137.17	3977.93	7
4526	93	46	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	127.15	4195.95	4
4527	93	59	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	28	40.25	1127.00	1
4528	93	71	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	34	35.12	1194.08	8
4529	93	74	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	47	56.33	2647.51	13
4530	93	78	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	24	119.37	2864.88	9
4531	16	55	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	36	71.27	2565.72	1
4532	16	56	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	40	72.02	2880.80	5
4533	16	67	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	38	76.33	2900.54	3
4534	16	70	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	93.95	4039.85	2
4535	16	73	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	44	83.90	3691.60	4
4536	16	76	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	98.51	4235.93	6
4537	97	19	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	49	93.49	4581.01	3
4538	97	20	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	26	45.82	1191.32	2
4539	97	23	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	34	164.90	5606.60	10
4540	97	27	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	31	60.54	1876.74	9
4541	97	29	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	50	124.59	6229.50	7
4542	97	33	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	148.50	5197.50	4
4543	97	44	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	39	96.23	3752.97	1
4544	97	50	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	84.67	2963.45	11
4545	97	61	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	33	31.86	1051.38	6
4546	97	64	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	40	36.29	1451.60	5
4547	97	80	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	30	37.75	1132.50	8
4548	91	36	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	32	57.46	1838.72	1
4549	91	82	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	48	95.44	4581.12	2
4550	58	2	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	171.44	3600.24	9
4551	58	6	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	124.10	3971.20	2
4552	58	9	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	28	135.30	3788.40	6
4553	58	17	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	43	94.50	4063.50	8
4554	58	35	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	31	81.05	2512.55	10
4555	58	38	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	85.87	3263.06	11
4556	58	52	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	107.76	4094.88	3
4557	58	53	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	44	40.25	1771.00	7
4558	58	85	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	93.42	2989.44	1
4559	58	90	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	52.36	1099.56	5
4560	58	103	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	46	101.15	4652.90	4
4561	6	15	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	31	99.54	3085.74	5
4562	6	26	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	147.36	7368.00	4
4563	6	28	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	121.50	6075.00	8
4564	6	30	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	25	59.55	1488.75	11
4565	6	40	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	20	169.34	3386.80	9
4566	6	57	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	45	49.71	2236.95	2
4567	6	65	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	43	122.68	5275.24	10
4568	6	68	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	38	28.64	1088.32	6
4569	6	81	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	22	110.00	2420.00	1
4570	6	88	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	35	51.95	1818.25	7
4571	6	94	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	34	93.76	3187.84	3
4572	17	8	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	35	187.02	6545.70	2
4573	17	11	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	27	123.89	3345.03	3
4574	17	13	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	39	148.80	5803.20	1
4575	17	49	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	25	126.39	3159.75	5
4576	17	89	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	45	56.55	2544.75	6
4577	17	95	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	43	53.89	2317.27	4
4578	66	5	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	30	136.00	4080.00	4
4579	66	37	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	34	84.30	2866.20	2
4580	66	39	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	117.47	4698.80	13
4581	66	42	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	47	87.73	4123.31	15
4582	66	48	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	50	105.87	5293.50	1
4583	66	51	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	33	72.85	2404.05	12
4584	66	63	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	22	103.23	2271.06	11
4585	66	72	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	27	84.08	2270.16	6
4586	66	77	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	48	83.86	4025.28	3
4587	66	97	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	66.00	1386.00	7
4588	66	99	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	77.95	1636.95	14
4589	66	102	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	42	57.82	2428.44	5
4590	66	106	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	91.15	3646.00	8
4591	66	107	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	26	89.38	2323.88	9
4592	66	110	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	37	51.32	1898.84	10
4593	89	22	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	41	129.31	5301.71	1
4594	89	69	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	40	56.86	2274.40	2
4595	89	75	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	65.09	1562.16	3
4596	89	100	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	75.13	1803.12	5
4597	89	109	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	32	49.66	1589.12	4
4598	4	1	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	45	81.35	3660.75	1
4599	4	3	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	22	115.37	2538.14	4
4600	4	4	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	36	154.93	5577.48	3
4601	4	31	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	35	70.12	2454.20	9
4602	4	32	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	37	52.09	1927.33	5
4603	4	58	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	21	105.94	2224.74	2
4604	4	60	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	25	97.38	2434.50	11
4605	4	62	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	30	61.70	1851.00	6
4606	4	79	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	41	58.00	2378.00	18
4607	4	83	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	27	67.38	1819.26	10
4608	4	86	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	23	89.90	2067.70	7
4609	4	91	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	28	58.47	1637.16	12
4610	4	93	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	38	40.15	1525.70	13
4611	4	98	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	32	85.86	2747.52	14
4612	4	101	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	39	82.77	3228.03	16
4613	4	104	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	48	102.04	4897.92	8
4614	4	105	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	43	72.00	3096.00	15
4615	4	108	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	31	59.96	1858.76	17
4616	35	7	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	50	184.84	9242.00	3
4617	35	10	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	43	150.62	6476.66	14
4618	35	12	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	47	104.52	4912.44	1
4619	35	14	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	67.83	2577.54	4
4620	35	43	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	78.00	2964.00	6
4621	35	45	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	30	139.64	4189.20	5
4622	35	47	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	33	54.71	1805.43	9
4623	35	54	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	120.53	5785.44	8
4624	35	66	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	46	61.64	2835.44	12
4625	35	74	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	20	58.17	1163.40	2
4626	35	84	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	67.10	3220.80	7
4627	35	87	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	27	35.40	955.80	10
4628	35	92	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	94.91	3606.58	13
4629	35	96	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	21	67.53	1418.13	11
4630	15	16	21	5	357	10277	Shipped	2004-08-04	2004-08-12	2004-08-05	28	93.28	2611.84	1
4631	2	18	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	34	114.65	3898.10	6
4632	2	21	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	23	107.02	2461.46	2
4633	2	24	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	73.15	2121.35	10
4634	2	25	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	118.07	3424.03	5
4635	2	34	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	39	117.48	4581.72	3
4636	2	40	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	42	167.65	7041.30	7
4637	2	46	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	114.44	3547.64	4
4638	2	59	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	35	48.80	1708.00	1
4639	2	71	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	37.38	1158.78	8
4640	2	78	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	25	136.22	3405.50	9
4641	11	55	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	26	68.42	1778.92	1
4642	11	56	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	32	68.35	2187.20	5
4643	11	67	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	49	76.33	3740.17	3
4644	11	70	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	106.87	5129.76	2
4645	11	73	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	33	78.76	2599.08	4
4646	11	76	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	95.30	4574.40	6
4647	50	2	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	205.73	6994.82	2
4648	50	17	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	24	98.00	2352.00	1
4649	50	19	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	50	87.33	4366.50	9
4650	50	20	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	27	47.44	1280.88	8
4651	50	23	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	26	161.50	4199.00	16
4652	50	27	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	25	53.28	1332.00	15
4653	50	29	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	37	109.33	4045.21	13
4654	50	33	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	22	158.63	3489.86	10
4655	50	35	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	46	82.06	3774.76	3
4656	50	36	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	43	54.34	2336.62	5
4657	50	38	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	29	102.63	2976.27	4
4658	50	44	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	99.21	3373.14	7
4659	50	50	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	35	77.31	2705.85	17
4660	50	61	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	20	29.87	597.40	12
4661	50	64	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	45	36.29	1633.05	11
4662	50	80	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	33	35.29	1164.57	14
4663	50	82	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	21	79.86	1677.06	6
4664	17	6	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	132.97	5850.68	9
4665	17	9	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	127.10	3177.50	13
4666	17	15	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	41	98.36	4032.76	1
4667	17	28	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	48	114.14	5478.72	4
4668	17	30	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	56.52	1639.08	7
4669	17	40	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	135.47	3386.75	5
4670	17	52	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	96.86	2421.50	10
4671	17	53	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	42.76	1881.44	14
4672	17	65	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	112.46	2811.50	6
4673	17	68	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	20	33.95	679.00	2
4674	17	85	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	80.90	2346.10	8
4675	17	88	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	31	44.91	1392.21	3
4676	17	90	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	36	59.47	2140.92	12
4677	17	103	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	27	89.01	2403.27	11
4678	6	8	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	41	176.63	7241.83	5
4679	6	11	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	27	142.02	3834.54	6
4680	6	13	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	24	169.56	4069.44	4
4681	6	26	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	23	147.36	3389.28	13
4682	6	39	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	122.93	5285.99	1
4683	6	42	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	88.74	3194.64	3
4684	6	49	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	31	132.13	4096.03	8
4685	6	57	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	29	49.71	1441.59	11
4686	6	81	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	39	96.99	3782.61	10
4687	6	89	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	51.58	1856.88	9
4688	6	94	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	38	114.59	4354.42	12
4689	6	95	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	37	56.24	2080.88	7
4690	6	99	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	77.95	3351.85	2
4691	54	5	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	25	130.56	3264.00	6
4692	54	37	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	21	78.28	1643.88	4
4693	54	48	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	46	100.58	4626.68	3
4694	54	51	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	71.97	2446.98	14
4695	54	63	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	42	99.54	4180.68	13
4696	54	72	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	80.54	2738.36	8
4697	54	77	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	77.15	2545.95	5
4698	54	97	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	45	62.00	2790.00	9
4699	54	100	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	20	74.23	1484.60	2
4700	54	102	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	47	68.67	3227.49	7
4701	54	106	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	22	88.15	1939.30	10
4702	54	107	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	38	85.41	3245.58	11
4703	54	109	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	43	41.22	1772.46	1
4704	54	110	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	49.14	1621.62	12
4705	62	22	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	137.19	6173.55	11
4706	62	31	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	31	68.43	2121.33	1
4707	62	60	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	22	101.76	2238.72	3
4708	62	69	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	30	65.08	1952.40	12
4709	62	75	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	39	59.83	2333.37	13
4710	62	79	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	65.51	1375.71	10
4711	62	83	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	66.65	1399.65	2
4712	62	91	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	50	60.54	3027.00	4
4713	62	93	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	33	35.78	1180.74	5
4714	62	98	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	24	87.69	2104.56	6
4715	62	101	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	95.73	4307.85	8
4716	62	105	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	25	68.00	1700.00	7
4717	62	108	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	32	73.29	2345.28	9
4718	59	1	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	36	95.70	3445.20	6
4719	59	3	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	47	110.61	5198.67	9
4720	59	4	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	27	166.55	4496.85	8
4721	59	10	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	49	131.04	6420.96	5
4722	59	32	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	20	50.88	1017.60	10
4723	59	58	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	34	91.29	3103.86	7
4724	59	62	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	61.70	2406.30	11
4725	59	66	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	38	64.41	2447.58	3
4726	59	86	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	82.91	3067.67	12
4727	59	87	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	36.61	1354.57	1
4728	59	92	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	26	100.01	2600.26	4
4729	59	96	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	76.48	2982.72	2
4730	59	104	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	45	102.04	4591.80	13
4731	24	47	13	4	375	10286	Shipped	2004-08-28	2004-09-06	2004-09-01	38	51.60	1960.80	1
4732	61	7	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	21	190.68	4004.28	12
4733	61	12	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	45	117.44	5284.80	10
4734	61	14	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	74.21	3042.61	13
4735	61	16	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	23	107.10	2463.30	9
4736	61	18	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	113.23	4642.43	4
4737	61	24	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	61.60	2710.40	8
4738	61	25	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	24	123.76	2970.24	3
4739	61	34	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	114.84	5052.96	1
4740	61	40	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.17	4938.12	5
4741	61	43	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	43	68.35	2939.05	15
4742	61	45	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	127.88	5115.20	14
4743	61	46	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	27	139.87	3776.49	2
4744	61	54	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	34	119.04	4047.36	17
4745	61	71	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	31.34	1128.24	6
4746	61	74	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	20	58.17	1163.40	11
4747	61	78	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.62	4954.32	7
4748	61	84	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	79.22	3168.80	16
4749	19	21	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	20	120.71	2414.20	14
4750	19	23	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	32	168.30	5385.60	5
4751	19	27	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	28	50.25	1407.00	4
4752	19	29	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	31	102.98	3192.38	2
4753	19	50	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	90.19	3156.65	6
4754	19	55	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	23	57.02	1311.46	7
4755	19	56	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	36	66.88	2407.68	11
4756	19	59	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	50	49.30	2465.00	13
4757	19	61	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	29	32.19	933.51	1
4758	19	67	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	81.78	2862.30	9
4759	19	70	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	48	109.22	5242.56	8
4760	19	73	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	34	76.19	2590.46	10
4761	19	76	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	41	101.73	4170.93	12
4762	19	80	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	33	37.75	1245.75	3
4763	20	19	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	38	92.47	3513.86	2
4764	20	20	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	24	44.75	1074.00	1
4765	20	33	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	43	141.75	6095.25	3
4766	20	64	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	45	41.22	1854.90	4
4767	32	44	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	26	80.36	2089.36	2
4768	32	82	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	45	83.76	3769.20	1
4769	102	2	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	210.01	7770.37	11
4770	102	6	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	30	141.83	4254.90	4
4771	102	9	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	123.00	5043.00	8
4772	102	17	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	96.84	3970.44	10
4773	102	30	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	52.26	1358.76	2
4774	102	35	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	47	99.28	4666.16	12
4775	102	36	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	56.21	2079.77	14
4776	102	38	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	23	93.20	2143.60	13
4777	102	52	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	96.86	4649.28	5
4778	102	53	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	29	45.28	1313.12	9
4779	102	65	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	109.90	5275.20	1
4780	102	85	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	82.83	2153.58	3
4781	102	90	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	32	53.00	1696.00	7
4782	102	103	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	28	86.99	2435.72	6
4783	10	15	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	94.80	1990.80	8
4784	10	26	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	26	140.81	3661.06	7
4785	10	28	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	103.09	4226.69	11
4786	10	40	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	147.33	3093.93	12
4787	10	49	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	44	114.90	5055.60	2
4788	10	57	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	40	48.55	1942.00	5
4789	10	68	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	39	34.30	1337.70	9
4790	10	81	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	27	113.55	3065.85	4
4791	10	88	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	50	54.11	2705.50	10
4792	10	89	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	31	59.65	1849.15	3
4793	10	94	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	113.44	4651.04	6
4794	10	95	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	35	49.79	1742.65	1
4795	50	8	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	46	187.02	8602.92	8
4796	50	11	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	129.93	3118.32	9
4797	50	13	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	45	171.29	7708.05	7
4798	50	39	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	110.64	2655.36	4
4799	50	42	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	22	91.76	2018.72	6
4800	50	51	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	49	72.85	3569.65	3
4801	50	63	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	21	111.83	2348.43	2
4802	50	99	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	29	77.95	2260.55	5
4803	50	110	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	32	51.32	1642.24	1
4804	35	107	9	2	387	10294	Shipped	2004-09-10	2004-09-17	2004-09-14	45	98.32	4424.40	1
4805	85	5	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	24	136.00	3264.00	1
4806	85	72	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	46	84.08	3867.68	3
4807	85	97	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	26	62.00	1612.00	4
4808	85	102	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	44	71.56	3148.64	2
4809	85	106	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	34	93.16	3167.44	5
4810	98	22	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	36	146.65	5279.40	7
4811	98	37	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	69.68	1463.28	13
4812	98	48	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	105.87	2329.14	12
4813	98	69	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	60.97	1280.37	8
4814	98	75	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	31	63.78	1977.18	9
4815	98	77	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	83.02	1826.44	14
4816	98	79	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	32	63.46	2030.72	6
4817	98	93	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	26	41.02	1066.52	1
4818	98	98	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	42	75.81	3184.02	2
4819	98	100	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	34	89.61	3046.74	11
4820	98	101	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	24	96.73	2321.52	4
4821	98	105	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	74.40	1636.80	3
4822	98	108	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	47	61.44	2887.68	5
4823	98	109	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	46.68	980.28	10
4824	31	31	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	25	81.95	2048.75	4
4825	31	60	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	107.23	3431.36	6
4826	31	62	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	70.08	2242.56	1
4827	31	83	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	23	71.73	1649.79	5
4828	31	86	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	26	88.90	2311.40	2
4829	31	91	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	28	63.29	1772.12	7
4830	31	104	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	35	111.53	3903.55	3
4831	1	3	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	39	105.86	4128.54	1
4832	1	32	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	32	60.57	1938.24	2
4833	29	1	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	23	76.56	1760.88	9
4834	29	4	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	29	164.61	4773.69	11
4835	29	10	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	123.51	2964.24	8
4836	29	47	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	39	62.17	2424.63	3
4837	29	54	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	49	119.04	5832.96	2
4838	29	58	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	47	107.07	5032.29	10
4839	29	66	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	33	58.87	1942.71	6
4840	29	84	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	32	66.29	2121.28	1
4841	29	87	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	36.21	869.04	4
4842	29	92	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	38	84.70	3218.60	7
4843	29	96	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	44	77.29	3400.76	5
4844	8	7	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	33	184.84	6099.72	5
4845	8	12	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	29	116.27	3371.83	3
4846	8	14	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	22	76.61	1685.42	6
4847	8	16	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	95.58	2198.34	2
4848	8	24	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	41	63.14	2588.74	1
4849	8	43	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	49	65.94	3231.06	8
4850	8	45	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	144.05	3313.15	7
4851	8	74	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	31	52.05	1613.55	4
4852	62	18	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	37	114.65	4242.05	8
4853	62	21	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	32	118.22	3783.04	4
4854	62	25	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	47	119.49	5616.03	7
4855	62	34	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	113.52	2497.44	5
4856	62	40	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	23	135.47	3115.81	9
4857	62	46	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	39	137.04	5344.56	6
4858	62	56	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	27	64.67	1746.09	1
4859	62	59	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	40.75	896.50	3
4860	62	71	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	48	32.10	1540.80	10
4861	62	76	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	86.73	1908.06	2
4862	62	78	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	50	122.17	6108.50	11
4863	33	23	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	43	166.60	7163.80	1
4864	33	50	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	38	82.83	3147.54	2
4865	33	55	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	23	70.56	1622.88	3
4866	33	67	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	49	75.42	3695.58	5
4867	33	70	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	45	104.52	4703.40	4
4868	33	73	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	48	74.48	3575.04	6
4869	117	27	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	46	56.91	2617.86	2
4870	117	80	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	24	35.70	856.80	1
4871	52	2	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	47	201.44	9467.68	6
4872	52	9	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	39	117.54	4584.06	3
4873	52	17	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	106.17	4883.82	5
4874	52	19	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	95.55	3535.35	13
4875	52	20	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	46.90	1735.30	12
4876	52	29	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	102.98	2471.52	17
4877	52	33	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	20	141.75	2835.00	14
4878	52	35	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	98.27	4520.42	7
4879	52	36	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	54.34	1304.16	9
4880	52	38	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	26	90.06	2341.56	8
4881	52	44	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	38	95.24	3619.12	11
4882	52	53	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	34	44.27	1505.18	4
4883	52	61	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	23	29.21	671.83	16
4884	52	64	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	44	42.11	1852.84	15
4885	52	82	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	33	80.83	2667.39	10
4886	52	90	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	36	52.36	1884.96	2
4887	52	103	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	40	80.92	3236.80	1
4888	59	6	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	130.01	4940.38	13
4889	59	15	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	107.84	4097.92	5
4890	59	26	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	27	132.62	3580.74	4
4891	59	28	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	117.82	4241.52	8
4892	59	30	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	41	58.95	2416.95	11
4893	59	40	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	37	160.87	5952.19	9
4894	59	52	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	22	112.60	2477.20	14
4895	59	57	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	45	48.55	2184.75	2
4896	59	65	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	24	107.34	2576.16	10
4897	59	68	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	48	30.76	1476.48	6
4898	59	81	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	118.28	4258.08	1
4899	59	85	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	28	94.38	2642.64	12
4900	59	88	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	40	48.70	1948.00	7
4901	59	94	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	42	109.96	4618.32	3
4902	30	8	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	182.86	5668.66	13
4903	30	11	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	145.04	4931.36	14
4904	30	13	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	20	145.34	2906.80	12
4905	30	39	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	114.74	3671.68	9
4906	30	42	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	40	83.70	3348.00	11
4907	30	49	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	23	126.39	2906.97	16
4908	30	51	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	39	85.14	3320.46	8
4909	30	63	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	29	109.37	3171.73	7
4910	30	72	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	76.12	2359.72	2
4911	30	89	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	46	60.28	2772.88	17
4912	30	95	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	51.55	1752.70	15
4913	30	97	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	50	61.34	3067.00	3
4914	30	99	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	38	73.62	2797.56	10
4915	30	102	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	43	62.16	2672.88	1
4916	30	106	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	99.17	3173.44	4
4917	30	107	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	30	87.39	2621.70	5
4918	30	110	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	35	48.05	1681.75	6
4919	76	5	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	118.32	2603.04	9
4920	76	22	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	39	135.61	5288.79	1
4921	76	37	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	31	71.40	2213.40	7
4922	76	48	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	48	92.11	4421.28	6
4923	76	69	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	25	58.23	1455.75	2
4924	76	75	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	64.44	1417.68	3
4925	76	77	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	75.47	1660.34	8
4926	76	100	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	81.47	2769.98	5
4927	76	109	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	44.20	1502.80	4
4928	67	3	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	115.37	3922.58	2
4929	67	4	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	20	187.85	3757.00	1
4930	67	31	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	27	81.95	2212.65	7
4931	67	32	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	48.46	1647.64	3
4932	67	60	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	99.57	3086.67	9
4933	67	62	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	68.55	3221.85	4
4934	67	79	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	43	58.00	2494.00	16
4935	67	83	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	44	71.73	3156.12	8
4936	67	86	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	24	99.89	2397.36	5
4937	67	91	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	46	61.22	2816.12	10
4938	67	93	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	37.09	1743.23	11
4939	67	98	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	73.07	1534.47	12
4940	67	101	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	35	88.75	3106.25	14
4941	67	104	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	100.85	3126.35	6
4942	67	105	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	79.20	1663.20	13
4943	67	108	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	39	62.93	2454.27	15
4944	5	1	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	41	94.74	3884.34	5
4945	5	10	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	26	144.60	3759.60	4
4946	5	58	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	21	96.92	2035.32	6
4947	5	66	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	24	59.56	1429.44	2
4948	5	92	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	50	93.89	4694.50	3
4949	5	96	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	28	74.04	2073.12	1
4950	53	7	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	165.38	5457.54	10
4951	53	12	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	105.70	2536.80	8
4952	53	14	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	77.41	3793.09	11
4953	53	16	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	25	101.34	2533.50	7
4954	53	18	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	37	128.80	4765.60	2
4955	53	24	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	20	66.99	1339.80	6
4956	53	25	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	129.45	3106.80	1
4957	53	40	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	48	159.18	7640.64	3
4958	53	43	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	27	70.76	1910.52	13
4959	53	45	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	122.00	5978.00	12
4960	53	47	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	42	59.06	2480.52	16
4961	53	54	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	40	133.92	5356.80	15
4962	53	71	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	33.23	1096.59	4
4963	53	74	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	38	50.21	1907.98	9
4964	53	78	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	45	139.03	6256.35	5
4965	53	84	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	75.18	3683.82	14
4966	53	87	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	36	38.62	1390.32	17
4967	11	21	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	29	124.44	3608.76	9
4968	11	34	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	114.84	4938.12	10
4969	11	46	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	32	134.22	4295.04	11
4970	11	50	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	41	92.03	3773.23	1
4971	11	55	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	66.99	1674.75	2
4972	11	56	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	26	70.55	1834.30	6
4973	11	59	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	45	48.80	2196.00	8
4974	11	67	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	28	89.05	2493.40	4
4975	11	70	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	116.27	4999.61	3
4976	11	73	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	85.61	2140.25	5
4977	11	76	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	46	91.02	4186.92	7
4978	6	2	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	214.30	10286.40	3
4979	6	17	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	32	101.50	3248.00	2
4980	6	19	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	43	102.74	4417.82	10
4981	6	20	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	43.67	1091.75	9
4982	6	23	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	146.20	7017.60	17
4983	6	27	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	30	48.43	1452.90	16
4984	6	29	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	111.87	3467.97	14
4985	6	33	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	150.19	3754.75	11
4986	6	35	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	37	91.18	3373.66	4
4987	6	36	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	35	54.34	1901.90	6
4988	6	38	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	38	93.20	3541.60	5
4989	6	44	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	33	84.33	2782.89	8
4990	6	53	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	44.27	1726.53	1
4991	6	61	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	27.88	1087.32	13
4992	6	64	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	23	43.46	999.58	12
4993	6	80	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	40.21	1246.51	15
4994	6	82	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	44	96.42	4242.48	7
4995	34	6	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	40	141.83	5673.20	7
4996	34	9	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	21	131.20	2755.20	11
4997	34	28	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	29	109.23	3167.67	2
4998	34	30	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	52.87	1797.58	5
4999	34	40	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	25	143.94	3598.50	3
5000	34	52	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	28	110.18	3085.04	8
5001	34	65	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	42	102.23	4293.66	4
5002	34	85	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	27	96.31	2600.37	6
5003	34	88	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	38	48.70	1850.60	1
5004	34	90	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	55.59	1890.06	10
5005	34	103	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	30	96.09	2882.70	9
5006	43	8	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	176.63	6711.94	5
5007	43	11	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	46	125.40	5768.40	6
5008	43	13	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	36	169.56	6104.16	4
5009	43	15	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	45	95.99	4319.55	14
5010	43	26	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	42	135.90	5707.80	13
5011	43	39	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	20	129.76	2595.20	1
5012	43	42	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	84.71	1948.33	3
5013	43	49	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	29	129.26	3748.54	8
5014	43	57	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	44	51.44	2263.36	11
5015	43	68	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	39	31.82	1240.98	15
5016	43	81	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	111.18	4224.84	10
5017	43	89	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	35	58.41	2044.35	9
5018	43	94	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	28	115.75	3241.00	12
5019	43	95	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	50.38	1914.44	7
5020	43	99	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	83.15	1912.45	2
5021	4	51	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	36	78.12	2812.32	7
5022	4	63	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	35	111.83	3914.05	6
5023	4	72	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	24	78.77	1890.48	1
5024	4	97	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	41	60.67	2487.47	2
5025	4	106	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	31	99.17	3074.27	3
5026	4	107	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	37	88.39	3270.43	4
5027	4	110	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	40	51.32	2052.80	5
5028	47	5	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	33	126.48	4173.84	17
5029	47	22	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	27	140.34	3789.18	9
5030	47	37	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	21	72.26	1517.46	15
5031	47	48	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	89.99	4229.53	14
5032	47	60	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	93.01	2325.25	1
5033	47	69	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	67.14	2282.76	10
5034	47	75	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	55.23	2595.81	11
5035	47	77	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	77.15	1928.75	16
5036	47	79	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	30	67.56	2026.80	8
5037	47	91	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	24	59.16	1419.84	2
5038	47	93	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	36.66	1246.44	3
5039	47	98	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	74.90	2546.60	4
5040	47	100	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	45	73.32	3299.40	13
5041	47	101	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	23	85.76	1972.48	6
5042	47	102	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	67.22	3226.56	18
5043	47	105	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	77.60	3724.80	5
5044	47	108	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	44	68.11	2996.84	7
5045	47	109	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	43.70	1485.80	12
5046	18	83	7	1	428	10317	Shipped	2004-11-02	2004-11-12	2004-11-08	35	69.55	2434.25	1
5047	17	1	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	46	84.22	3874.12	1
5048	17	3	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	45	102.29	4603.05	4
5049	17	4	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	37	189.79	7022.23	3
5050	17	31	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	31	81.95	2540.45	9
5051	17	32	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	42	49.67	2086.14	5
5052	17	58	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	48	93.54	4489.92	2
5053	17	62	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	26	60.94	1584.44	6
5054	17	86	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	47	81.91	3849.77	7
5055	17	104	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	50	102.04	5102.00	8
5056	106	10	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	30	134.05	4021.50	9
5057	106	43	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	46	77.19	3550.74	1
5058	106	47	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	44	54.71	2407.24	4
5059	106	54	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	120.53	5423.85	3
5060	106	66	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	31	65.80	2039.80	7
5061	106	84	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	43	78.41	3371.63	2
5062	106	87	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	29	35.00	1015.00	5
5063	106	92	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	22	96.95	2132.90	8
5064	106	96	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	79.73	3587.85	6
5065	12	7	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	31	184.84	5730.04	3
5066	12	12	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	35	102.17	3575.95	1
5067	12	14	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	38	63.84	2425.92	4
5068	12	45	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	25	139.64	3491.00	5
5069	12	74	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	26	60.62	1576.12	2
5070	109	16	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	24	105.95	2542.80	15
5071	109	18	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	41	123.14	5048.74	10
5072	109	21	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	44	120.71	5311.24	6
5073	109	24	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	73.92	2735.04	14
5074	109	25	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	25	142.25	3556.25	9
5075	109	34	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	27	126.72	3421.44	7
5076	109	40	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	33	164.26	5420.58	11
5077	109	46	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	28	138.45	3876.60	8
5078	109	56	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	68.35	2050.50	3
5079	109	59	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	48	42.76	2052.48	5
5080	109	67	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	74.51	2235.30	1
5081	109	71	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	31.72	1173.64	12
5082	109	73	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	39	81.33	3171.87	2
5083	109	76	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	21	103.87	2181.27	4
5084	109	78	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	26	137.62	3578.12	13
5085	86	2	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	40	180.01	7200.40	1
5086	86	6	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	46	141.83	6524.18	8
5087	86	9	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	27	136.67	3690.09	9
5088	86	17	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	22	101.50	2233.00	10
5089	86	19	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	43	92.47	3976.21	14
5090	86	20	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	44.21	1812.61	5
5091	86	29	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	50	120.77	6038.50	6
5092	86	30	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	35	57.12	1999.20	11
5093	86	33	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	36	158.63	5710.68	2
5094	86	35	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	33	100.30	3309.90	12
5095	86	36	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	54.34	2227.94	13
5096	86	38	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	48	90.06	4322.88	7
5097	86	61	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	20	26.55	531.00	3
5098	86	64	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	30	40.77	1223.10	4
5099	8	44	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	33	88.30	2913.90	2
5100	8	52	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	47	96.86	4552.42	1
5101	28	11	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	148.06	3997.62	1
5102	28	15	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	26	100.73	2618.98	7
5103	28	26	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	47	142.45	6695.15	8
5104	28	28	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	105.55	3483.15	10
5105	28	40	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	137.17	3703.59	12
5106	28	49	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	49	120.64	5911.36	13
5107	28	53	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	38	49.81	1892.78	6
5108	28	57	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	25	49.71	1242.75	14
5109	28	65	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	31	107.34	3327.54	2
5110	28	68	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	30	29.35	880.50	9
5111	28	82	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	95.44	3149.52	3
5112	28	85	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	20	91.49	1829.80	11
5113	28	90	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	48	60.76	2916.48	4
5114	28	103	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	34	80.92	2751.28	5
5115	5	5	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	47	111.52	5241.44	6
5116	5	8	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	42	193.25	8116.50	8
5117	5	13	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	166.10	3986.40	1
5118	5	39	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	114.74	2753.76	9
5119	5	81	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	114.73	5048.12	5
5120	5	88	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	44.37	1686.06	3
5121	5	89	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	28	55.30	1548.40	2
5122	5	94	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	99.55	3782.90	4
5123	5	95	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	56.24	2474.56	7
5124	12	42	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	32	94.79	3033.28	6
5125	12	51	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	50	73.73	3686.50	5
5126	12	63	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	120.43	4937.63	4
5127	12	72	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	86.74	3556.34	3
5128	12	77	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	20	81.34	1626.80	2
5129	12	97	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	39	60.67	2366.13	1
5130	13	22	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	154.54	3863.50	6
5131	13	31	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	45	74.34	3345.30	8
5132	13	37	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	74.84	1871.00	5
5133	13	99	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	20	79.68	1593.60	7
5134	13	102	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	21	65.05	1366.05	1
5135	13	106	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	43	85.14	3661.02	2
5136	13	107	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	83.42	3086.54	3
5137	13	110	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	48.05	1777.85	4
5138	57	48	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	104.81	3563.54	6
5139	57	60	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	47	87.54	4114.38	14
5140	57	69	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	48	67.82	3255.36	1
5141	57	75	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	20	56.55	1131.00	2
5142	57	79	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	35	55.96	1958.60	3
5143	57	83	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	43	69.55	2990.65	4
5144	57	91	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	24	57.10	1370.40	5
5145	57	93	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	42.33	1439.22	7
5146	57	98	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	27	84.03	2268.81	8
5147	57	100	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	41	75.13	3080.33	9
5148	57	101	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	37	95.73	3542.01	10
5149	57	104	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	117.46	3876.18	11
5150	57	105	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	71.20	2349.60	13
5151	57	108	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	39	69.59	2714.01	12
5152	10	1	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	42	80.39	3376.38	1
5153	10	3	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	20	109.42	2188.40	2
5154	10	4	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	26	164.61	4279.86	3
5155	10	7	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	41	182.90	7498.90	5
5156	10	10	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	24	128.03	3072.72	6
5157	10	12	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	46	117.44	5402.24	13
5158	10	14	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	33	74.21	2448.93	14
5159	10	16	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	39	102.49	3997.11	15
5160	10	24	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	29	66.22	1920.38	9
5161	10	32	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	55.72	2117.36	12
5162	10	43	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	65.13	2474.94	10
5163	10	58	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	30	104.81	3144.30	7
5164	10	62	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	37	71.60	2649.20	4
5165	10	86	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	45	80.91	3640.95	11
5166	10	109	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	44	41.22	1813.68	8
5167	92	45	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	37	136.70	5057.90	3
5168	92	47	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	29	59.06	1712.74	2
5169	92	54	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	50	133.92	6696.00	4
5170	92	66	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	42	56.10	2356.20	1
5171	118	18	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	46	120.31	5534.26	6
5172	118	21	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	99.55	4380.20	14
5173	118	23	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	154.70	6806.80	7
5174	118	25	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	30	135.14	4054.20	8
5175	118	34	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	130.68	3397.68	10
5176	118	40	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	169.34	4572.18	11
5177	118	46	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	132.80	3452.80	12
5178	118	71	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	37.00	999.00	13
5179	118	74	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	25	55.11	1377.75	9
5180	118	78	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	21	139.03	2919.63	1
5181	118	84	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	41	70.33	2883.53	2
5182	118	87	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	28	33.39	934.92	3
5183	118	92	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	32	100.01	3200.32	4
5184	118	96	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	20	74.04	1480.80	5
5185	30	19	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	46	89.38	4111.48	15
5186	30	20	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	27	51.21	1382.67	16
5187	30	27	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	38	53.88	2047.44	9
5188	30	29	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	35	116.96	4093.60	8
5189	30	33	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	24	138.38	3321.12	1
5190	30	36	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	53.09	1380.34	17
5191	30	38	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	40	100.53	4021.20	18
5192	30	50	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	50	92.03	4601.50	2
5193	30	55	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	21	70.56	1481.76	3
5194	30	56	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	23	61.73	1419.79	4
5195	30	59	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	20	47.29	945.80	5
5196	30	61	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	29.87	1344.15	6
5197	30	64	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	43.01	1118.26	10
5198	30	67	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	39	84.51	3295.89	7
5199	30	70	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	44	108.04	4753.76	11
5200	30	73	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	77.91	3505.95	12
5201	30	76	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	31	94.23	2921.13	13
5202	30	80	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	41	34.47	1413.27	14
5203	9	2	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	26	188.58	4903.08	3
5204	9	9	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	121.64	4014.12	6
5205	9	17	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	29	110.84	3214.36	7
5206	9	35	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	31	95.23	2952.13	5
5207	9	44	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	46	95.24	4381.04	2
5208	9	53	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	24	42.26	1014.24	8
5209	9	82	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	39	95.44	3722.16	1
5210	9	90	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	62.05	2047.65	4
5211	12	6	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	26	130.01	3380.26	2
5212	12	28	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	46	108.00	4968.00	6
5213	12	30	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	34	52.87	1797.58	1
5214	12	40	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	20	147.33	2946.60	3
5215	12	52	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	49	101.71	4983.79	4
5216	12	65	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	42	117.57	4937.94	5
5217	6	68	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	33	32.88	1085.04	2
5218	6	85	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	44	77.05	3390.20	1
5219	6	88	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	40	49.78	1991.20	3
5220	24	8	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	176.63	5828.79	10
5221	24	11	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	126.91	4188.03	11
5222	24	13	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	141.88	6952.12	1
5223	24	15	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	38	95.99	3647.62	3
5224	24	26	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	153.91	7541.59	6
5225	24	39	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	48	135.22	6490.56	12
5226	24	42	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	21	100.84	2117.64	7
5227	24	57	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	45	49.71	2236.95	4
5228	24	81	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	113.55	3520.05	5
5229	24	89	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	59.03	1829.93	9
5230	24	94	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	23	109.96	2529.08	8
5231	24	103	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	46	94.07	4327.22	2
5232	99	5	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	25	131.92	3298.00	8
5233	99	49	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	140.75	5067.00	3
5234	99	51	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	76.36	2214.44	2
5235	99	63	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	119.20	3456.80	4
5236	99	95	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	21	54.48	1144.08	6
5237	99	99	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	73.62	2650.32	9
5238	99	106	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	31	84.14	2608.34	1
5239	99	107	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	83.42	3003.12	7
5240	99	110	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	42	49.14	2063.88	5
5241	90	22	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	41	137.19	5624.79	1
5242	90	37	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	28	80.86	2264.08	3
5243	90	48	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	45	93.17	4192.65	2
5244	94	3	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	40	117.75	4710.00	4
5245	94	4	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	39	178.17	6948.63	3
5246	94	31	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	79.41	2144.07	2
5247	94	32	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	30	48.46	1453.80	1
5248	94	58	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	96.92	2616.84	10
5249	94	60	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	21	106.14	2228.94	7
5250	94	69	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	67.82	3730.10	12
5251	94	72	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	73.46	4040.30	13
5252	94	75	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	29	57.86	1677.94	14
5253	94	77	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	42	72.96	3064.32	16
5254	94	79	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	45	57.32	2579.40	11
5255	94	97	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	22	53.34	1173.48	5
5256	94	100	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	86.90	4779.50	15
5257	94	102	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	62.16	3108.00	9
5258	94	108	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	66.63	3331.50	8
5259	94	109	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	49.66	1340.82	6
5260	40	62	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	62.46	3435.30	8
5261	40	83	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	63.76	2550.40	1
5262	40	86	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	95.89	5273.95	2
5263	40	91	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	39	67.41	2628.99	3
5264	40	93	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	37.09	1483.60	4
5265	40	98	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	30	73.99	2219.70	5
5266	40	101	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	81.77	4497.35	7
5267	40	104	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	29	98.48	2855.92	6
5268	91	1	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	41	84.22	3453.02	9
5269	91	7	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	45	192.62	8667.90	2
5270	91	10	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	120.50	6627.50	8
5271	91	12	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	44	111.57	4909.08	1
5272	91	14	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	36	77.41	2786.76	10
5273	91	16	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	109.40	6017.00	7
5274	91	66	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	32	63.03	2016.96	6
5275	91	92	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	31	95.93	2973.83	4
5276	91	96	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	38	78.11	2968.18	3
5277	91	105	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	34	70.40	2393.60	5
5278	3	18	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	40	118.89	4755.60	2
5279	3	24	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	63.14	3472.70	1
5280	3	25	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	22	115.22	2534.84	3
5281	3	40	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	30	167.65	5029.50	4
5282	3	43	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	25	76.39	1909.75	5
5283	3	45	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	136.70	7518.50	7
5284	3	47	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	26	57.82	1503.32	8
5285	3	54	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	38	124.99	4749.62	11
5286	3	71	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	39	30.59	1193.01	9
5287	3	74	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	48	60.01	2880.48	10
5288	3	78	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	42	112.34	4718.28	6
5289	81	21	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	36	109.51	3942.36	4
5290	81	34	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	25	118.80	2970.00	3
5291	81	46	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	44	127.15	5594.60	2
5292	81	59	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	27	44.78	1209.06	6
5293	81	84	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	30	76.80	2304.00	1
5294	81	87	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	29	37.41	1084.89	5
5295	80	23	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	45	168.30	7573.50	1
5296	80	27	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	40	49.04	1961.60	2
5297	80	29	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	30	118.23	3546.90	3
5298	80	50	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	21	80.99	1700.79	4
5299	80	55	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	26	68.42	1778.92	5
5300	80	56	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	29	61.00	1769.00	7
5301	80	61	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	20	27.88	557.60	6
5302	1	64	14	4	450	10345	Shipped	2004-11-25	2004-12-01	2004-11-26	43	38.98	1676.14	1
5303	2	19	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	42	88.36	3711.12	3
5304	2	67	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	25	87.24	2181.00	1
5305	2	70	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	117.44	2818.56	5
5306	2	73	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	80.47	1931.28	2
5307	2	76	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	26	103.87	2700.62	6
5308	2	80	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	22	38.57	848.54	4
5309	3	2	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	30	188.58	5657.40	1
5310	3	6	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	27	132.97	3590.19	2
5311	3	9	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	29	132.57	3844.53	3
5312	3	17	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	42	113.17	4753.14	5
5313	3	20	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	46.36	973.56	7
5314	3	30	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	50	51.05	2552.50	8
5315	3	33	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	136.69	2870.49	6
5316	3	35	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	48	84.09	4036.32	9
5317	3	36	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	34	60.59	2060.06	10
5318	3	38	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	95.30	4288.50	11
5319	3	44	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	26	84.33	2192.58	12
5320	3	52	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	115.03	5176.35	4
5321	107	8	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	48	207.80	9974.40	8
5322	107	11	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	47	122.37	5751.39	4
5323	107	53	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	29	43.77	1269.33	6
5324	107	65	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	37	107.34	3971.58	1
5325	107	82	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	39	82.78	3228.42	2
5326	107	85	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	42	90.53	3802.26	3
5327	107	90	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	31	62.70	1943.70	5
5328	107	103	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	32	100.14	3204.48	7
5329	16	13	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	26	166.10	4318.60	10
5330	16	15	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	114.95	5517.60	9
5331	16	26	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	142.45	5413.10	8
5332	16	28	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	117.82	4477.16	7
5333	16	40	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	164.26	7884.48	6
5334	16	49	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	34	140.75	4785.50	5
5335	16	57	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	50.29	2413.92	4
5336	16	68	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	36	31.47	1132.92	3
5337	16	81	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	23	111.18	2557.14	2
5338	16	88	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	33	44.37	1464.21	1
5339	11	5	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	26	110.16	2864.16	5
5340	11	37	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	43	84.30	3624.90	6
5341	11	39	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	135.22	5949.68	1
5342	11	42	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	41	94.79	3886.39	2
5343	11	51	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	70.22	2106.60	3
5344	11	63	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	34	98.31	3342.54	7
5345	11	72	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	86.74	2602.20	9
5346	11	77	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	77.15	1928.75	10
5347	11	89	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	27	61.52	1661.04	14
5348	11	94	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	104.18	3229.58	8
5349	11	95	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	56.82	2500.08	17
5350	11	97	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	46	56.00	2576.00	11
5351	11	99	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	28	76.22	2134.16	4
5352	11	102	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	29	68.67	1991.43	12
5353	11	106	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	87.15	2701.65	13
5354	11	107	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	97.32	2433.00	16
5355	11	110	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	20	48.05	961.00	15
5356	71	22	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	39	143.50	5596.50	1
5357	71	48	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	20	104.81	2096.20	2
5358	71	69	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	25	64.40	1610.00	5
5359	71	75	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	38	53.92	2048.96	4
5360	71	79	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	34	68.24	2320.16	3
5361	32	100	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	23	75.13	1727.99	3
5362	32	101	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	87.75	4299.75	2
5363	32	108	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	22	62.19	1368.18	1
5364	32	109	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	46.18	2262.82	4
5365	101	31	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	27	71.81	1938.87	1
5366	101	60	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	28	107.23	3002.44	2
5367	101	83	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	35	69.55	2434.25	3
5368	101	86	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	46	86.90	3997.40	5
5369	101	91	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	68.10	2724.00	7
5370	101	93	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	35.78	1431.20	8
5371	101	98	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	39	73.07	2849.73	9
5372	101	104	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	48	98.48	4727.04	4
5373	101	105	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	43	74.40	3199.20	6
5374	70	1	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	84.22	3537.24	6
5375	70	3	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	20	95.15	1903.00	2
5376	70	4	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	178.17	7483.14	3
5377	70	7	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	31	157.60	4885.60	9
5378	70	10	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	35	141.58	4955.30	4
5379	70	12	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	29	98.65	2860.85	11
5380	70	14	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	23	76.61	1762.03	12
5381	70	16	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	100.19	2805.32	13
5382	70	24	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	76.23	1600.83	8
5383	70	32	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	49.06	1373.68	10
5384	70	43	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	36	69.15	2489.40	7
5385	70	58	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	96.92	2035.32	5
5386	70	62	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	62.46	1748.88	1
5387	11	45	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	23	117.59	2704.57	7
5388	11	47	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	31	60.30	1869.30	1
5389	11	54	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	25	124.99	3124.75	2
5390	11	66	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	41	56.10	2300.10	3
5391	11	71	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	36	37.38	1345.68	4
5392	11	74	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	44	60.62	2667.28	6
5393	11	78	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	32	137.62	4403.84	8
5394	11	84	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	28	75.18	2105.04	9
5395	11	87	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	38	32.99	1253.62	10
5396	11	92	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	40	93.89	3755.60	5
5397	51	18	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	43	120.31	5173.33	8
5398	51	19	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	50	82.19	4109.50	9
5399	51	20	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	22	44.75	984.50	6
5400	51	25	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	27	130.87	3533.49	2
5401	51	29	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	29	106.79	3096.91	3
5402	51	33	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	30	158.63	4758.90	1
5403	51	61	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	48	31.86	1529.28	5
5404	51	64	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	42.11	1094.86	7
5405	51	96	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	78.11	2030.86	4
5406	6	2	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	32	199.30	6377.60	10
5407	6	6	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	43	135.92	5844.56	9
5408	6	9	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	109.34	5357.66	8
5409	6	17	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	39	112.00	4368.00	1
5410	6	30	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	58.95	2416.95	7
5411	6	35	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	91.18	3738.38	6
5412	6	36	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	59.34	2907.66	5
5413	6	38	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	44	104.72	4607.68	4
5414	6	44	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	25	84.33	2108.25	3
5415	6	52	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	28	105.34	2949.52	2
5416	11	11	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	49	129.93	6366.57	5
5417	11	15	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	42	98.36	4131.12	9
5418	11	26	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	142.45	2849.00	10
5419	11	28	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	99.41	1988.20	11
5420	11	40	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	32	137.17	4389.44	12
5421	11	49	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	25	117.77	2944.25	13
5422	11	53	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	30	46.29	1388.70	8
5423	11	57	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	44	56.07	2467.08	14
5424	11	65	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	127.79	5239.39	7
5425	11	68	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	33.59	1209.24	4
5426	11	82	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	88.62	3633.42	6
5427	11	85	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	82.83	3396.03	1
5428	11	90	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	51.71	1861.56	2
5429	11	103	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	27	85.98	2321.46	3
5430	81	5	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	48	122.40	5875.20	6
5431	81	8	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	42	180.79	7593.18	8
5432	81	13	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	49	162.64	7969.36	5
5433	81	81	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	108.82	2394.04	7
5434	81	88	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	36	45.45	1636.20	3
5435	81	89	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	62.14	1367.08	1
5436	81	94	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	46	99.55	4579.30	2
5437	81	95	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	25	47.45	1186.25	4
5438	122	22	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	50	126.15	6307.50	12
5439	122	31	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	41	68.43	2805.63	13
5440	122	37	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	46	71.40	3284.40	14
5441	122	39	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	122.93	3564.97	8
5442	122	42	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	94.79	2748.91	18
5443	122	48	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	101.64	4065.60	15
5444	122	51	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	76.36	3054.40	1
5445	122	60	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	106.14	2335.08	17
5446	122	63	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	100.77	3123.87	2
5447	122	69	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	49	55.49	2719.01	16
5448	122	72	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	36	70.81	2549.16	3
5449	122	77	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	78.83	1734.26	4
5450	122	97	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	32	64.67	2069.44	5
5451	122	99	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	26	86.61	2251.86	6
5452	122	102	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	30	70.11	2103.30	7
5453	122	106	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	35	83.14	2909.90	9
5454	122	107	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	92.36	2863.16	10
5455	122	110	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	54.05	1675.55	11
5456	58	1	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	92.83	1856.60	13
5457	58	3	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	114.18	2968.68	8
5458	58	75	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	34	62.46	2123.64	6
5459	58	79	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	61.42	1596.92	7
5460	58	83	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	25	68.83	1720.75	1
5461	58	91	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	49	56.41	2764.09	2
5462	58	93	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	33	35.78	1180.74	3
5463	58	98	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	88.60	1772.00	4
5464	58	100	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	24	85.99	2063.76	14
5465	58	101	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	91.74	2385.24	9
5466	58	104	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	107.97	4750.68	5
5467	58	105	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	76.80	3379.20	10
5468	58	108	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	35	62.19	2176.65	11
5469	58	109	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	23	47.67	1096.41	12
5470	18	4	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	182.04	4004.88	4
5471	18	10	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	131.04	2882.88	1
5472	18	32	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	23	53.91	1239.93	3
5473	18	58	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	50	91.29	4564.50	2
5474	74	7	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	33	180.95	5971.35	3
5475	74	12	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	106.87	3633.58	4
5476	74	14	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	68.63	2333.42	5
5477	74	16	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	103.64	4767.44	6
5478	74	24	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	22	61.60	1355.20	7
5479	74	43	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	69.15	3180.90	10
5480	74	45	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	24	124.94	2998.56	11
5481	74	47	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	32	52.22	1671.04	12
5482	74	54	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	28	123.50	3458.00	13
5483	74	62	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	70.08	1471.68	8
5484	74	66	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	56.10	2412.30	14
5485	74	74	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	52.05	1093.05	15
5486	74	78	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	31	113.75	3526.25	1
5487	74	84	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	75.99	3267.57	9
5488	74	86	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	50	92.90	4645.00	2
5489	80	87	13	4	479	10364	Shipped	2005-01-06	2005-01-17	2005-01-09	48	38.22	1834.56	1
5490	68	18	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	30	116.06	3481.80	1
5491	68	92	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	22	82.66	1818.52	3
5492	68	96	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	44	68.34	3006.96	2
5493	90	25	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	116.65	3966.10	3
5494	90	34	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	49	105.60	5174.40	2
5495	90	40	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	154.10	5239.40	1
5496	36	21	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	49	105.77	5182.73	1
5497	36	23	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	37	144.50	5346.50	3
5498	36	27	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	45	50.25	2261.25	4
5499	36	29	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	27	124.59	3363.93	5
5500	36	33	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	32	140.06	4481.92	7
5501	36	46	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	46	131.39	6043.94	6
5502	36	50	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	43	77.31	3324.33	8
5503	36	55	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	44	66.99	2947.56	9
5504	36	56	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	21	72.76	1527.96	10
5505	36	59	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	38	50.31	1911.78	11
5506	36	61	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	23	29.54	679.42	13
5507	36	64	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	28	43.01	1204.28	12
5508	36	71	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	36	36.25	1305.00	2
5509	6	67	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	40	73.60	2944.00	2
5510	6	70	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	31	115.09	3567.79	5
5511	6	73	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	83.04	3819.84	1
5512	6	76	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	20	93.16	1863.20	4
5513	6	80	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	36.52	1679.92	3
5514	89	2	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	41	195.01	7995.41	2
5515	89	19	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	44	89.38	3932.72	8
5516	89	20	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	32	46.36	1483.52	7
5517	89	35	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	42	100.30	4212.60	1
5518	89	36	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	28	51.84	1451.52	6
5519	89	38	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	21	90.06	1891.26	5
5520	89	44	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	45	80.36	3616.20	4
5521	89	82	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	40	93.49	3739.60	3
5522	56	6	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	35	128.53	4498.55	4
5523	56	9	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	49	128.47	6295.03	8
5524	56	17	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	100.34	2709.18	1
5525	56	28	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	101.87	2241.14	5
5526	56	30	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	60.16	1323.52	7
5527	56	40	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	167.65	4526.55	9
5528	56	52	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	29	105.34	3054.86	6
5529	56	53	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	20	41.76	835.20	2
5530	56	90	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	25	63.99	1599.75	3
5531	6	8	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	32	178.71	5718.72	6
5532	6	15	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	49	104.28	5109.72	4
5533	6	26	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	160.46	4011.50	7
5534	6	57	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	53.75	1343.75	12
5535	6	65	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	126.51	2530.20	5
5536	6	68	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	45	35.01	1575.45	8
5537	6	81	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	28	95.81	2682.68	9
5538	6	85	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	26	82.83	2153.58	1
5539	6	88	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	44.37	887.40	2
5540	6	89	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	30	53.44	1603.20	11
5541	6	94	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	48	97.23	4667.04	10
5542	6	103	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	34	83.95	2854.30	3
5543	94	11	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	40	146.55	5862.00	4
5544	94	13	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	34	140.15	4765.10	1
5545	94	39	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	28	131.13	3671.64	3
5546	94	42	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	25	91.76	2294.00	5
5547	94	49	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	48	119.20	5721.60	6
5548	94	51	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	41	78.99	3238.59	7
5549	94	63	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	37	102.00	3774.00	8
5550	94	95	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	24	56.82	1363.68	9
5551	94	99	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	44	74.48	3277.12	2
5552	65	5	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	118.32	4614.48	3
5553	65	22	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	28	143.50	4018.00	4
5554	65	37	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	22	75.70	1665.40	5
5555	65	48	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	50	99.52	4976.00	6
5556	65	69	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	38	58.92	2238.96	7
5557	65	72	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	33	82.31	2716.23	12
5558	65	75	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	46	53.92	2480.32	11
5559	65	77	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	23	83.86	1928.78	10
5560	65	79	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	62.10	2421.90	13
5561	65	97	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	44	58.00	2552.00	14
5562	65	100	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	32	76.94	2462.08	15
5563	65	102	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	41	69.39	2844.99	16
5564	65	106	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	34	94.16	3201.44	2
5565	65	107	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	37	83.42	3086.54	8
5566	65	108	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	45	68.11	3064.95	17
5567	65	109	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	25	44.20	1105.00	9
5568	65	110	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	29	48.05	1393.45	1
5569	73	3	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	39	115.37	4499.43	5
5570	73	4	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	158.80	3493.60	1
5571	73	31	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	42	75.19	3157.98	2
5572	73	32	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	48.46	1066.12	4
5573	73	58	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	38	112.70	4282.60	6
5574	73	60	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	46	107.23	4932.58	3
5575	4	1	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	21	76.56	1607.76	12
5576	4	7	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	45	184.84	8317.80	7
5577	4	10	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	150.62	7380.38	13
5578	4	62	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	23	67.03	1541.69	9
5579	4	66	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	20	60.26	1205.20	14
5580	4	83	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	43	60.13	2585.59	2
5581	4	86	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	87.90	3252.30	3
5582	4	91	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	59.85	2633.40	4
5583	4	92	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	41	96.95	3974.95	15
5584	4	93	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	36.22	1774.78	5
5585	4	96	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	69.16	3388.84	8
5586	4	98	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	86.77	3210.49	6
5587	4	101	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	33	94.73	3126.09	1
5588	4	104	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	25	98.48	2462.00	10
5589	4	105	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	69.60	3062.40	11
5590	41	12	8	1	503	10376	Shipped	2005-02-08	2005-02-18	2005-02-13	35	98.65	3452.75	1
5591	29	14	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	24	65.44	1570.56	5
5592	29	16	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	50	112.86	5643.00	1
5593	29	18	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	35	124.56	4359.60	2
5594	29	24	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	31	61.60	1909.60	4
5595	29	25	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	36	125.18	4506.48	6
5596	29	40	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	39	143.94	5613.66	3
5597	11	21	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	34	121.95	4146.30	5
5598	11	43	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	22	66.74	1468.28	4
5599	11	45	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	43	146.99	6320.57	10
5600	11	47	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	28	60.30	1688.40	9
5601	11	54	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	49	122.02	5978.98	8
5602	11	71	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	30.59	1254.19	7
5603	11	74	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	46	52.66	2422.36	6
5604	11	78	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	33	129.20	4263.60	3
5605	11	84	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	80.84	3314.44	2
5606	11	87	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	40	35.80	1432.00	1
5607	11	23	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	39	156.40	6099.60	2
5608	11	27	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	27	50.85	1372.95	1
5609	11	34	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	29	113.52	3292.08	5
5610	11	46	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	134.22	4295.04	4
5611	11	59	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	48.80	1561.60	3
5612	11	19	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	88.36	2385.72	13
5613	11	29	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	40	119.50	4780.00	10
5614	11	33	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	21	156.94	3295.74	8
5615	11	50	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	78.23	2503.36	1
5616	11	55	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	24	66.99	1607.76	2
5617	11	56	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	66.88	2273.92	3
5618	11	61	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	29.87	955.84	4
5619	11	64	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	37.63	1016.01	5
5620	11	67	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	36	77.24	2780.64	6
5621	11	70	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	111.57	4909.08	7
5622	11	73	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	77.05	3390.20	9
5623	11	76	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	91.02	3094.68	11
5624	11	80	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	43	32.82	1411.26	12
5625	69	2	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	36	182.16	6557.76	3
5626	69	6	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	37	138.88	5138.56	6
5627	69	9	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	20	132.57	2651.40	1
5628	69	17	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	48	114.34	5488.32	2
5629	69	20	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	25	49.60	1240.00	9
5630	69	30	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	60.77	2126.95	7
5631	69	35	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	41	100.30	4112.30	8
5632	69	36	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	40	51.22	2048.80	4
5633	69	38	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	93.20	3262.00	5
5634	6	8	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	166.24	5652.16	10
5635	6	11	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	37	145.04	5366.48	11
5636	6	13	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	143.61	4882.74	12
5637	6	15	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	32	103.10	3299.20	13
5638	6	26	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	25	160.46	4011.50	5
5639	6	44	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	50	84.33	4216.50	7
5640	6	52	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	115.03	4486.17	1
5641	6	53	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	46.29	1805.31	2
5642	6	65	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	20	120.12	2402.40	3
5643	6	82	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	33	97.39	3213.87	4
5644	6	85	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	26	85.72	2228.72	6
5645	6	90	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	48	57.53	2761.44	8
5646	6	103	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	101.15	3439.10	9
5647	11	28	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	27	119.05	3214.35	11
5648	11	39	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	24	125.66	3015.84	9
5649	11	40	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	47	155.79	7322.13	6
5650	11	42	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	26	83.70	2176.20	12
5651	11	49	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	137.88	5239.44	1
5652	11	51	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	28	77.24	2162.72	7
5653	11	57	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	22	52.60	1157.20	2
5654	11	68	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	40	33.24	1329.60	3
5655	11	81	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	21	117.10	2459.10	4
5656	11	88	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	32	53.57	1714.24	5
5657	11	89	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	44	55.93	2460.92	8
5658	11	94	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	29	94.92	2752.68	13
5659	11	95	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	48.62	1847.56	10
5660	69	5	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	34	129.20	4392.80	4
5661	69	63	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	28	114.29	3200.12	3
5662	69	72	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	43	71.69	3082.67	2
5663	69	99	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	49	71.02	3479.98	1
5664	6	77	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	37	78.83	2916.71	2
5665	6	97	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	25	62.00	1550.00	1
5666	11	22	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	25	130.88	3272.00	7
5667	11	31	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	21	72.65	1525.65	18
5668	11	37	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	73.12	2705.44	5
5669	11	48	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	22	100.58	2212.76	6
5670	11	60	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	33	101.76	3358.08	11
5671	11	69	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	39	56.86	2217.54	1
5672	11	75	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	35	54.57	1909.95	9
5673	11	79	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	41	55.96	2294.36	12
5674	11	83	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	71.73	3586.50	8
5675	11	100	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	29	85.09	2467.61	13
5676	11	101	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	90.75	3357.75	14
5677	11	102	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	67.22	2487.14	10
5678	11	105	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	32	68.00	2176.00	17
5679	11	106	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	45	83.14	3741.30	2
5680	11	107	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	30	80.44	2413.20	3
5681	11	108	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	44	59.22	2605.68	15
5682	11	109	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	47.67	2383.50	16
5683	11	110	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	43	52.42	2254.06	4
5684	15	86	21	5	522	10387	Shipped	2005-03-02	2005-03-09	2005-03-06	44	79.91	3516.04	1
5685	109	1	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	42	80.39	3376.38	4
5686	109	3	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	118.94	5947.00	5
5687	109	4	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	21	156.86	3294.06	7
5688	109	10	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	44	125.01	5500.44	6
5689	109	91	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	35	58.47	2046.45	8
5690	109	93	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	27	41.02	1107.54	1
5691	109	98	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	46	74.90	3445.40	2
5692	109	104	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	111.53	5576.50	3
5693	102	7	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	26	182.90	4755.40	4
5694	102	12	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	25	95.13	2378.25	6
5695	102	14	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	36	76.61	2757.96	7
5696	102	16	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	47	102.49	4817.03	8
5697	102	24	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	63.91	3131.59	3
5698	102	32	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	39	52.09	2031.51	5
5699	102	58	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	45	112.70	5071.50	1
5700	102	62	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	61.70	3023.30	2
5701	6	18	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	117.48	4229.28	14
5702	6	25	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	34	132.29	4497.86	15
5703	6	29	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	31	102.98	3192.38	16
5704	6	33	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	26	162.00	4212.00	7
5705	6	43	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	40	75.59	3023.60	9
5706	6	45	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	50	135.23	6761.50	1
5707	6	47	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	54.09	1947.24	2
5708	6	54	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	49	122.02	5978.98	3
5709	6	66	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	35	67.87	2375.45	4
5710	6	71	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	37	35.87	1327.19	5
5711	6	74	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	46	51.43	2365.78	6
5712	6	78	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	134.81	6066.45	8
5713	6	84	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	30	66.29	1988.70	10
5714	6	87	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	41	39.02	1599.82	11
5715	6	92	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	101.03	4546.35	12
5716	6	96	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	22	81.36	1789.92	13
5717	56	2	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	195.01	4680.24	4
5718	56	6	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	37	121.15	4482.55	7
5719	56	9	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	39	110.70	4317.30	9
5720	56	17	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	29	114.34	3315.86	10
5721	56	19	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	35	102.74	3595.90	2
5722	56	20	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	42	47.44	1992.48	3
5723	56	30	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	44	57.73	2540.12	5
5724	56	35	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	32	99.28	3176.96	6
5725	56	61	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	33	26.55	876.15	8
5726	56	64	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	36.29	870.96	1
5727	104	36	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	37	61.21	2264.77	3
5728	104	38	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	29	103.67	3006.43	2
5729	104	44	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	36	98.22	3535.92	1
5730	70	11	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	35	145.04	5076.40	8
5731	70	15	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	32	99.54	3185.28	10
5732	70	26	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	20	137.53	2750.60	11
5733	70	28	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	104.32	3964.16	7
5734	70	52	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	30	106.55	3196.50	9
5735	70	53	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	44	41.76	1837.44	1
5736	70	65	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	112.46	3711.18	2
5737	70	82	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	88.62	2924.46	3
5738	70	85	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	84.75	3220.50	4
5739	70	90	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	31	63.35	1963.85	5
5740	70	103	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	21	83.95	1762.95	6
5741	11	40	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	22	135.47	2980.34	5
5742	11	49	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	124.95	4623.15	1
5743	11	57	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	31	53.18	1648.58	2
5744	11	68	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	46	35.36	1626.56	6
5745	11	81	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	104.09	3851.33	7
5746	11	88	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	36	47.08	1694.88	3
5747	11	89	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	30	55.93	1677.90	4
5748	51	5	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	32	125.12	4003.84	2
5749	51	8	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	33	205.72	6788.76	1
5750	51	94	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	46	98.39	4525.94	4
5751	51	95	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	45	57.99	2609.55	3
5752	6	13	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	155.72	5138.76	3
5753	6	39	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	129.76	4282.08	2
5754	6	42	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	24	91.76	2202.24	4
5755	6	51	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	45	83.38	3752.10	5
5756	6	63	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	49	100.77	4937.73	6
5757	6	72	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	27	77.00	2079.00	7
5758	6	77	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	37	77.99	2885.63	8
5759	6	97	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	39	62.00	2418.00	1
5760	48	99	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	32	69.29	2217.28	5
5761	48	102	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	22	62.88	1383.36	4
5762	48	106	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	48	86.15	4135.20	3
5763	48	107	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	36	80.44	2895.84	2
5764	48	110	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	34	52.96	1800.64	1
5765	81	22	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	33	130.88	4319.04	11
5766	81	31	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	82.79	2814.86	15
5767	81	37	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	70.54	1975.12	18
5768	81	48	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	92.11	4144.95	17
5769	81	60	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	43	100.67	4328.81	16
5770	81	69	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	60.29	1688.12	3
5771	81	75	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	61.15	2079.10	13
5772	81	79	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	41	56.64	2322.24	2
5773	81	83	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	65.93	2966.85	14
5774	81	91	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	60.54	1331.88	4
5775	81	93	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	49	38.84	1903.16	5
5776	81	98	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	47	78.55	3691.85	6
5777	81	100	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	75.13	2704.68	7
5778	81	101	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	98.72	2171.84	8
5779	81	104	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	23	102.04	2346.92	9
5780	81	105	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	29	76.80	2227.20	10
5781	81	108	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	62.19	2238.84	12
5782	81	109	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	41.22	1401.48	1
5783	122	1	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	40	77.52	3100.80	8
5784	122	3	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	51	99.91	5095.41	7
5785	122	4	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	22	156.86	3450.92	6
5786	122	10	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	29	123.51	3581.79	5
5787	122	32	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	30	51.48	1544.40	4
5788	122	58	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	57	104.81	5974.17	3
5789	122	62	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	58	75.41	4373.78	2
5790	122	86	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	32	97.89	3132.48	1
5791	103	5	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	64	134.64	8616.96	9
5792	103	22	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	34	129.31	4396.54	1
5793	103	37	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	30	74.84	2245.20	7
5794	103	48	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	58	88.93	5157.94	6
5795	103	69	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	24	55.49	1331.76	2
5796	103	75	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	38	59.18	2248.84	3
5797	103	77	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	42	74.64	3134.88	8
5798	103	100	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	46	82.37	3789.02	5
5799	103	109	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	20	41.71	834.20	4
5800	72	31	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	42	75.19	3157.98	3
5801	72	60	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	38	87.54	3326.52	5
5802	72	79	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	64	59.37	3799.68	12
5803	72	83	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	52	65.93	3428.36	4
5804	72	86	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	49	81.91	4013.59	1
5805	72	91	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	62	62.60	3881.20	6
5806	72	93	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	56	41.46	2321.76	7
5807	72	98	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	11	77.64	854.04	8
5808	72	101	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	85	98.72	8391.20	10
5809	72	104	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	21	96.11	2018.31	2
5810	72	105	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	77	73.60	5667.20	9
5811	72	108	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	40	66.63	2665.20	11
5812	95	3	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	45	118.94	5352.30	1
5813	95	32	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	55	58.15	3198.25	2
5814	95	62	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	59	61.70	3640.30	3
5815	33	1	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	24	85.17	2044.08	7
5816	33	4	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	174.29	11503.14	9
5817	33	10	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	122.00	8052.00	6
5818	33	47	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	36	55.33	1991.88	1
5819	33	58	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	46	109.32	5028.72	8
5820	33	66	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	27	57.49	1552.23	4
5821	33	87	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	30	35.80	1074.00	2
5822	33	92	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	45	88.78	3995.10	5
5823	33	96	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	31	65.09	2017.79	3
5824	70	7	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	64	163.44	10460.16	3
5825	70	12	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	43	102.17	4393.31	1
5826	70	14	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	77	67.03	5161.31	4
5827	70	43	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	90	67.54	6078.60	6
5828	70	45	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	28	127.88	3580.64	5
5829	70	54	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	124.99	5999.52	8
5830	70	74	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	49	53.27	2610.23	2
5831	70	84	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	65.48	3143.04	7
5832	38	16	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	97	115.16	11170.52	5
5833	38	24	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	61	72.38	4415.18	4
5834	38	40	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	55	147.33	8103.15	1
5835	38	71	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	47	37.38	1756.86	2
5836	38	78	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	76	127.79	9712.04	3
5837	13	18	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	61	124.56	7598.16	3
5838	13	25	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	48	133.72	6418.56	2
5839	13	46	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	65	117.26	7621.90	1
5840	103	21	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	114.48	6754.32	11
5841	103	23	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	141.10	10723.60	2
5842	103	27	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	42	58.12	2441.04	1
5843	103	34	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	41	132.00	5412.00	12
5844	103	50	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	6	91.11	546.66	3
5845	103	55	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	66	64.14	4233.24	4
5846	103	56	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	26	68.35	1777.10	8
5847	103	59	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	64	45.78	2929.92	10
5848	103	67	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	81.78	6215.28	6
5849	103	70	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	98.65	5820.35	5
5850	103	73	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	13	77.05	1001.65	7
5851	103	76	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	43	101.73	4374.39	9
5852	94	80	21	5	560	10408	Shipped	2005-04-22	2005-04-29	2005-04-27	15	41.03	615.45	1
5853	19	29	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	6	104.25	625.50	2
5854	19	61	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	61	27.88	1700.68	1
5855	83	19	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	65	99.66	6477.90	7
5856	83	20	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	51.21	2253.24	6
5857	83	33	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	56	145.13	8127.28	8
5858	83	35	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	47	93.21	4380.87	1
5859	83	36	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	53	49.97	2648.41	3
5860	83	38	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	34	84.82	2883.88	2
5861	83	44	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	81.35	3579.40	5
5862	83	64	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	31	42.56	1319.36	9
5863	83	82	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	50	95.44	4772.00	4
5864	44	2	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	23	205.73	4731.79	9
5865	44	6	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	144.79	3909.33	2
5866	44	9	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	40	110.70	4428.00	6
5867	44	17	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	109.67	2961.09	8
5868	44	52	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	46	106.55	4901.30	3
5869	44	53	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	35	41.25	1443.75	7
5870	44	85	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	26	78.01	2028.26	1
5871	44	90	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	60.76	1640.52	5
5872	44	103	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	34	89.01	3026.34	4
5873	11	15	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	54	100.73	5439.42	5
5874	11	26	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	41	150.63	6175.83	4
5875	11	28	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	56	120.28	6735.68	8
5876	11	30	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	47	49.83	2342.01	11
5877	11	40	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	60	157.49	9449.40	9
5878	11	57	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	21	47.40	995.40	2
5879	11	65	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	70	109.90	7693.00	10
5880	11	68	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	30	32.88	986.40	6
5881	11	81	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	31	108.82	3373.42	1
5882	11	88	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	19	50.86	966.34	7
5883	11	94	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	26	105.33	2738.58	3
5884	26	8	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	36	201.57	7256.52	2
5885	26	11	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	47	145.04	6816.88	3
5886	26	13	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	22	173.02	3806.44	1
5887	26	49	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	49	133.57	6544.93	5
5888	26	89	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	24	56.55	1357.20	6
5889	26	95	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	51	53.31	2718.81	4
5890	85	5	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	49	114.24	5597.76	3
5891	85	37	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	44	77.42	3406.48	1
5892	85	39	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	41	128.39	5263.99	12
5893	85	42	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	48	85.71	4114.08	14
5894	85	51	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	56	83.38	4669.28	11
5895	85	63	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	43	108.14	4650.02	10
5896	85	72	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	60	72.58	4354.80	5
5897	85	77	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	51	72.96	3720.96	2
5898	85	97	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	37	62.00	2294.00	6
5899	85	99	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	34	74.48	2532.32	13
5900	85	102	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	31	61.44	1904.64	4
5901	85	106	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	28	84.14	2355.92	7
5902	85	107	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	40	84.41	3376.40	8
5903	85	110	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	47	54.60	2566.20	9
5904	111	48	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	51	86.81	4427.31	5
5905	111	69	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	21	60.97	1280.37	1
5906	111	75	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	18	59.83	1076.94	2
5907	111	100	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	32	73.32	2346.24	4
5908	111	109	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	42	43.20	1814.40	3
5909	93	22	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	24	129.31	3103.44	14
5910	93	31	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	15	70.96	1064.40	4
5911	93	60	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	47	90.82	4268.54	6
5912	93	62	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	32	62.46	1998.72	1
5913	93	79	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	18	64.83	1166.94	13
5914	93	83	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	48	70.28	3373.44	5
5915	93	86	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	45	86.90	3910.50	2
5916	93	91	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	26	68.10	1770.60	7
5917	93	93	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	37	39.71	1469.27	8
5918	93	98	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	23	88.60	2037.80	9
5919	93	101	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	22	84.76	1864.72	11
5920	93	104	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	41	98.48	4037.68	3
5921	93	105	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	39	65.60	2558.40	10
5922	93	108	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	43	63.67	2737.81	12
5923	11	1	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	66	79.43	5242.38	2
5924	11	3	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	45	116.56	5245.20	5
5925	11	4	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	56	162.67	9109.52	4
5926	11	10	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	21	144.60	3036.60	1
5927	11	32	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	36	58.75	2115.00	6
5928	11	58	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	35	109.32	3826.20	3
5929	97	43	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	16	70.76	1132.16	2
5930	97	45	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	27	139.64	3770.28	1
5931	97	47	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	33	56.57	1866.81	5
5932	97	54	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	28	120.53	3374.84	4
5933	97	66	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	52	64.41	3349.32	8
5934	97	84	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	10	66.29	662.90	3
5935	97	87	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	43	36.61	1574.23	6
5936	97	92	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	50	100.01	5000.50	9
5937	97	96	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	40	72.41	2896.40	7
5938	91	7	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	12	182.90	2194.80	13
5939	91	12	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	10	111.57	1115.70	11
5940	91	14	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	64.64	2197.76	14
5941	91	16	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	32	99.04	3169.28	10
5942	91	18	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	38	117.48	4464.24	5
5943	91	21	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	37	100.80	3729.60	1
5944	91	24	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	39	67.76	2642.64	9
5945	91	25	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	133.72	4546.48	4
5946	91	34	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	116.16	6388.80	2
5947	91	40	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	35	165.95	5808.25	6
5948	91	46	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	43	114.44	4920.92	3
5949	91	71	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	15	32.10	481.50	7
5950	91	74	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	52.66	2896.30	12
5951	91	78	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	70	112.34	7863.80	8
5952	58	23	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	153.00	5661.00	5
5953	58	27	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	52.06	1874.16	4
5954	58	29	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	116.96	5263.20	2
5955	58	50	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	66	73.62	4858.92	6
5956	58	55	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	68.42	2463.12	7
5957	58	56	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	60	60.26	3615.60	11
5958	58	59	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	48.80	1805.60	13
5959	58	61	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	32.19	1448.55	1
5960	58	67	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	39	76.33	2976.87	9
5961	58	70	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	55	115.09	6329.95	8
5962	58	73	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	35	77.05	2696.75	10
5963	58	76	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	26	104.94	2728.44	12
5964	58	80	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	15	35.29	529.35	3
5965	6	33	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	35	167.06	5847.10	1
5966	6	64	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	40	44.80	1792.00	2
5967	17	19	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	51	91.44	4663.44	2
5968	17	20	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	25	47.44	1186.00	1
5969	66	35	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	10	89.15	891.50	1
5970	66	36	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	31	56.21	1742.51	3
5971	66	38	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	98.44	2067.24	2
5972	66	44	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	80.36	1687.56	5
5973	66	82	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	28	78.89	2208.92	4
5974	11	2	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	50	201.44	10072.00	6
5975	11	9	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	49	121.64	5960.36	3
5976	11	17	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	54	108.50	5859.00	5
5977	11	53	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	26	40.25	1046.50	4
5978	11	90	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	44	54.94	2417.36	2
5979	11	103	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	46	85.98	3955.08	1
5980	4	6	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	131.49	4996.62	12
5981	4	15	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	33	95.99	3167.67	4
5982	4	26	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	147.36	4126.08	3
5983	4	28	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	117.82	4477.16	7
5984	4	30	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	19	48.62	923.78	10
5985	4	40	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	140.55	3935.40	8
5986	4	52	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	107.76	4094.88	13
5987	4	57	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	55	53.75	2956.25	1
5988	4	65	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	49	127.79	6261.71	9
5989	4	68	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	31	31.82	986.42	5
5990	4	85	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	41	83.79	3435.39	11
5991	4	88	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	11	50.32	553.52	6
5992	4	94	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	18	94.92	1708.56	2
5993	86	23	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	30	136.00	4080.00	3
5994	86	27	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	50	55.09	2754.50	2
5995	86	50	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	22	75.46	1660.12	4
5996	86	80	10	2	1	10100	Shipped	2003-01-06	2003-01-13	2003-01-10	49	35.29	1729.21	1
5997	8	29	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	25	108.06	2701.50	4
5998	8	33	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	26	167.06	4343.56	1
5999	8	61	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	45	32.53	1463.85	3
6000	8	64	17	7	2	10101	Shipped	2003-01-09	2003-01-18	2003-01-11	46	44.35	2040.10	2
6001	28	19	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	39	95.55	3726.45	2
6002	28	20	11	3	3	10102	Shipped	2003-01-10	2003-01-18	2003-01-14	41	43.13	1768.33	1
6003	5	2	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	26	214.30	5571.80	11
6004	5	6	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	119.67	5026.14	4
6005	5	9	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	121.64	3284.28	8
6006	5	17	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	94.50	3307.50	10
6007	5	30	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	22	58.34	1283.48	2
6008	5	35	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	27	92.19	2489.13	12
6009	5	36	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	35	61.84	2164.40	14
6010	5	38	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	86.92	2173.00	13
6011	5	44	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	46	86.31	3970.26	16
6012	5	52	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	98.07	3530.52	5
6013	5	53	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	41	40.75	1670.75	9
6014	5	65	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	36	107.34	3864.24	1
6015	5	82	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	25	88.62	2215.50	15
6016	5	85	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	31	92.46	2866.26	3
6017	5	90	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	45	63.35	2850.75	7
6018	5	103	17	7	8	10103	Shipped	2003-01-29	2003-02-07	2003-02-02	42	94.07	3950.94	6
6019	11	11	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	34	131.44	4468.96	1
6020	11	15	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	41	111.39	4566.99	9
6021	11	26	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	24	135.90	3261.60	8
6022	11	28	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	29	122.73	3559.17	12
6023	11	40	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	23	165.95	3816.85	13
6024	11	49	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	38	119.20	4529.60	3
6025	11	57	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	52.02	1820.70	6
6026	11	68	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	44	30.41	1338.04	10
6027	11	81	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	26	106.45	2767.70	5
6028	11	88	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	35	51.95	1818.25	11
6029	11	89	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	49	56.55	2770.95	4
6030	11	94	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	33	114.59	3781.47	7
6031	11	95	14	4	9	10104	Shipped	2003-01-31	2003-02-09	2003-02-01	32	53.31	1705.92	2
6032	13	5	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	127.84	6392.00	2
6033	13	8	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	205.72	8434.52	15
6034	13	13	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	141.88	4114.52	14
6035	13	39	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	136.59	3004.98	11
6036	13	42	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	38	87.73	3333.74	13
6037	13	51	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	75.48	3094.68	10
6038	13	63	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	43	117.97	5072.71	9
6039	13	72	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	44	73.46	3232.24	4
6040	13	77	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	50	75.47	3773.50	1
6041	13	97	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	41	54.00	2214.00	5
6042	13	99	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	29	86.61	2511.69	12
6043	13	102	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	31	60.72	1882.32	3
6044	13	106	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	39	92.16	3594.24	6
6045	13	107	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	22	99.31	2184.82	7
6046	13	110	15	4	14	10105	Shipped	2003-02-11	2003-02-21	2003-02-12	25	44.77	1119.25	8
6047	57	22	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	36	134.04	4825.44	12
6048	57	31	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	81.10	2757.40	2
6049	57	37	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	80.86	3315.26	18
6050	57	48	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	41	94.22	3863.02	17
6051	57	60	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	28	107.23	3002.44	4
6052	57	69	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	49	65.77	3222.73	13
6053	57	75	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	55.89	1732.59	14
6054	57	79	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	50	55.96	2798.00	11
6055	57	83	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	26	71.00	1846.00	3
6056	57	91	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	33	65.35	2156.55	5
6057	57	93	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	39	35.78	1395.42	6
6058	57	98	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	31	91.34	2831.54	7
6059	57	100	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	30	85.09	2552.70	16
6060	57	101	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	34	99.72	3390.48	9
6061	57	104	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	32	113.90	3644.80	1
6062	57	105	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	44	76.00	3344.00	8
6063	57	108	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	70.33	3375.84	10
6064	57	109	15	4	16	10106	Shipped	2003-02-17	2003-02-24	2003-02-21	48	43.70	2097.60	15
6065	10	1	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	30	81.35	2440.50	2
6066	10	3	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	39	105.86	4128.54	5
6067	10	4	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	27	172.36	4653.72	4
6068	10	10	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	21	122.00	2562.00	1
6069	10	32	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	29	52.70	1528.30	6
6070	10	58	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	25	96.92	2423.00	3
6071	10	62	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	38	73.12	2778.56	7
6072	10	86	12	3	19	10107	Shipped	2003-02-24	2003-03-03	2003-02-26	20	88.90	1778.00	8
6073	92	7	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	33	165.38	5457.54	6
6074	92	12	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	45	96.30	4333.50	4
6075	92	14	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	39	75.81	2956.59	7
6076	92	16	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	36	107.10	3855.60	3
6077	92	24	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	38	67.76	2574.88	2
6078	92	43	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	26	73.17	1902.42	9
6079	92	45	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	29	132.29	3836.41	8
6080	92	47	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	43	52.84	2272.12	12
6081	92	54	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	44	139.87	6154.28	11
6082	92	66	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	35	64.41	2254.35	15
6083	92	74	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	30	60.01	1800.30	5
6084	92	78	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	40	132.00	5280.00	1
6085	92	84	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	67.10	2080.10	10
6086	92	87	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	27	36.21	977.67	13
6087	92	92	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	31	87.76	2720.56	16
6088	92	96	21	5	21	10108	Shipped	2003-03-03	2003-03-12	2003-03-08	34	74.85	2544.90	14
6089	118	18	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	117.48	3054.48	4
6090	118	25	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	38	137.98	5243.24	3
6091	118	34	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	26	126.72	3294.72	1
6092	118	40	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	46	160.87	7400.02	5
6093	118	46	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	47	125.74	5909.78	2
6094	118	71	12	3	24	10109	Shipped	2003-03-10	2003-03-19	2003-03-11	29	32.10	930.90	6
6095	30	21	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	118.22	4374.14	16
6096	30	23	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	153.00	6426.00	7
6097	30	27	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	32	51.46	1646.72	6
6098	30	29	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	33	115.69	3817.77	4
6099	30	33	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	31	163.69	5074.39	1
6100	30	50	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	28	81.91	2293.48	8
6101	30	55	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	42	62.00	2604.00	9
6102	30	56	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	36	72.02	2592.72	13
6103	30	59	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	29	43.27	1254.83	15
6104	30	61	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	20	28.88	577.60	3
6105	30	64	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	39	40.77	1590.03	2
6106	30	67	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	43	82.69	3555.67	11
6107	30	70	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	46	112.74	5186.04	10
6108	30	73	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	27	80.47	2172.69	12
6109	30	76	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	37	96.37	3565.69	14
6110	30	80	16	7	27	10110	Shipped	2003-03-18	2003-03-24	2003-03-20	48	35.29	1693.92	5
6111	9	19	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	33	87.33	2881.89	6
6112	9	20	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	48	48.52	2328.96	5
6113	9	36	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	28	53.09	1486.52	2
6114	9	38	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	43	94.25	4052.75	1
6115	9	44	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	39	91.27	3559.53	4
6116	9	82	7	1	31	10111	Shipped	2003-03-25	2003-03-31	2003-03-30	26	85.70	2228.20	3
6117	12	2	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	29	197.16	5717.64	1
6118	12	35	17	7	30	10112	Shipped	2003-03-24	2003-04-03	2003-03-29	23	85.10	1957.30	2
6119	6	9	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	21	121.64	2554.44	2
6120	6	17	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	49	101.50	4973.50	4
6121	6	53	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	50	43.27	2163.50	3
6122	6	90	7	1	32	10113	Shipped	2003-03-26	2003-04-02	2003-03-27	23	58.82	1352.86	1
6123	24	6	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	31	128.53	3984.43	8
6124	24	28	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	39	106.78	4164.42	3
6125	24	30	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	45	53.48	2406.60	6
6126	24	40	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	48	169.34	8128.32	4
6127	24	52	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	41	105.34	4318.94	9
6128	24	65	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	21	102.23	2146.83	5
6129	24	68	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	24	28.64	687.36	1
6130	24	85	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	32	88.61	2835.52	7
6131	24	88	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	28	43.83	1227.24	2
6132	24	103	13	4	37	10114	Shipped	2003-04-01	2003-04-07	2003-04-02	42	82.94	3483.48	10
6133	99	15	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	111.39	5123.94	5
6134	99	26	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	46	140.81	6477.26	4
6135	99	57	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	47	56.64	2662.08	2
6136	99	81	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	44	106.45	4683.80	1
6137	99	94	11	3	40	10115	Shipped	2003-04-04	2003-04-12	2003-04-07	27	100.70	2718.90	3
6138	90	89	15	4	42	10116	Shipped	2003-04-11	2003-04-19	2003-04-13	27	60.28	1627.56	1
6139	15	8	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	33	195.33	6445.89	9
6140	15	11	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	43	148.06	6366.58	10
6141	15	13	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	39	173.02	6747.78	8
6142	15	39	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	26	121.57	3160.82	5
6143	15	42	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	81.68	1715.28	7
6144	15	49	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	22	122.08	2685.76	12
6145	15	51	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	23	73.73	1695.79	4
6146	15	63	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	41	119.20	4887.20	3
6147	15	95	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	21	55.65	1168.65	11
6148	15	99	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	38	75.35	2863.30	6
6149	15	107	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	45	89.38	4022.10	1
6150	15	110	21	5	45	10117	Shipped	2003-04-16	2003-04-24	2003-04-17	50	52.42	2621.00	2
6151	40	106	23	4	48	10118	Shipped	2003-04-21	2003-04-29	2003-04-26	36	86.15	3101.40	1
6152	91	5	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	46	112.88	5192.48	11
6153	91	22	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	43	151.38	6509.34	3
6154	91	37	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	21	74.84	1571.64	9
6155	91	48	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	27	95.28	2572.56	8
6156	91	69	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	41	64.40	2640.40	4
6157	91	72	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	72.58	2540.30	13
6158	91	75	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	20	63.12	1262.40	5
6159	91	77	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	35	82.18	2876.30	10
6160	91	79	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	62.10	1738.80	2
6161	91	97	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	25	57.34	1433.50	14
6162	91	100	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	29	74.23	2152.67	7
6163	91	102	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	38	67.22	2554.36	12
6164	91	108	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	26	63.67	1655.42	1
6165	91	109	15	4	52	10119	Shipped	2003-04-28	2003-05-05	2003-05-02	28	40.22	1126.16	6
6166	3	3	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	118.94	3449.26	3
6167	3	4	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	158.80	7304.80	2
6168	3	31	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	82.79	2400.91	8
6169	3	32	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	46	57.54	2646.84	4
6170	3	58	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	35	110.45	3865.75	1
6171	3	60	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	39	93.01	3627.39	10
6172	3	62	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	34	72.36	2460.24	5
6173	3	83	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	71.73	2080.17	9
6174	3	86	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	22	94.90	2087.80	6
6175	3	91	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	29	68.79	1994.91	11
6176	3	93	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	49	41.46	2031.54	12
6177	3	98	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	47	91.34	4292.98	13
6178	3	101	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	81.77	1962.48	15
6179	3	104	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	24	106.79	2562.96	7
6180	3	105	18	6	53	10120	Shipped	2003-04-29	2003-05-08	2003-05-01	43	72.00	3096.00	14
6181	81	1	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	34	86.13	2928.42	5
6182	81	10	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	50	126.52	6326.00	4
6183	81	66	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	32	58.18	1861.76	2
6184	81	92	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	25	95.93	2398.25	3
6185	81	96	13	4	58	10121	Shipped	2003-05-07	2003-05-13	2003-05-13	44	72.41	3186.04	1
6186	80	7	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	42	155.66	6537.72	10
6187	80	12	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	37	113.92	4215.04	8
6188	80	14	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	32	65.44	2094.08	11
6189	80	16	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	20	104.80	2096.00	7
6190	80	18	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	114.65	3898.10	2
6191	80	24	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	62.37	2681.91	6
6192	80	25	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	113.80	3527.80	1
6193	80	40	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	25	137.17	3429.25	3
6194	80	43	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	69.15	1452.15	13
6195	80	45	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	21	133.76	2808.96	12
6196	80	47	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	35	59.06	2067.10	16
6197	80	54	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	28	145.82	4082.96	15
6198	80	71	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	39	34.74	1354.86	4
6199	80	74	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	34	50.82	1727.88	9
6200	80	78	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	43	136.22	5857.46	5
6201	80	84	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	29	67.10	1945.90	14
6202	80	87	13	4	59	10122	Shipped	2003-05-08	2003-05-16	2003-05-13	31	33.79	1047.49	17
6203	1	21	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	26	120.71	3138.46	2
6204	1	34	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	46	114.84	5282.64	3
6205	1	46	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	34	117.26	3986.84	4
6206	1	59	14	4	63	10123	Shipped	2003-05-20	2003-05-29	2003-05-22	50	43.27	2163.50	1
6207	2	23	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	21	153.00	3213.00	6
6208	2	27	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	58.12	2441.04	5
6209	2	29	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	42	111.87	4698.54	3
6210	2	50	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	36	75.46	2716.56	7
6211	2	55	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	23	66.28	1524.44	8
6212	2	56	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	62.47	1374.34	12
6213	2	61	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	45	30.53	1373.85	2
6214	2	64	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	22	36.29	798.38	1
6215	2	67	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	32	74.51	2384.32	10
6216	2	70	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	25	93.95	2348.75	9
6217	2	73	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	49	76.19	3733.31	11
6218	2	76	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	43	101.73	4374.39	13
6219	2	80	8	1	64	10124	Shipped	2003-05-21	2003-05-29	2003-05-25	46	36.11	1661.06	4
6220	3	19	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	32	89.38	2860.16	1
6221	3	33	18	6	64	10125	Shipped	2003-05-21	2003-05-27	2003-05-24	34	138.38	4704.92	2
6222	107	2	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	205.73	7817.74	11
6223	107	6	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	22	122.62	2697.64	4
6224	107	9	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	21	135.30	2841.30	8
6225	107	17	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	116.67	4433.46	10
6226	107	20	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	42	51.21	2150.82	17
6227	107	30	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	51.05	2195.15	2
6228	107	35	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	31	93.21	2889.51	12
6229	107	36	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	46	61.84	2844.64	14
6230	107	38	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	30	93.20	2796.00	13
6231	107	44	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	38	94.25	3581.50	16
6232	107	52	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	50	102.92	5146.00	5
6233	107	53	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	47.29	2033.47	9
6234	107	65	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	27	122.68	3312.36	1
6235	107	82	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	34	83.76	2847.84	15
6236	107	85	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	43	82.83	3561.69	3
6237	107	90	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	26	62.05	1613.30	7
6238	107	103	23	4	69	10126	Shipped	2003-05-28	2003-06-07	2003-06-02	45	97.10	4369.50	6
6239	16	8	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	193.25	8889.50	2
6240	16	11	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	140.50	6463.00	3
6241	16	13	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	42	169.56	7121.52	1
6242	16	15	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	24	100.73	2417.52	11
6243	16	26	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	140.81	6336.45	10
6244	16	28	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	114.14	5136.30	14
6245	16	40	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	22	149.02	3278.44	15
6246	16	49	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	25	126.39	3159.75	5
6247	16	57	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	50.86	1017.20	8
6248	16	68	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	39	34.30	1337.70	12
6249	16	81	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	20	107.63	2152.60	7
6250	16	88	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	45	46.53	2093.85	13
6251	16	89	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	29	60.90	1766.10	6
6252	16	94	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	111.12	5111.52	9
6253	16	95	11	3	72	10127	Shipped	2003-06-03	2003-06-09	2003-06-06	46	55.65	2559.90	4
6254	11	39	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	120.20	4928.20	2
6255	11	42	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	41	80.67	3307.47	4
6256	11	51	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	43	77.24	3321.32	1
6257	11	99	14	4	74	10128	Shipped	2003-06-06	2003-06-12	2003-06-11	32	72.75	2328.00	3
6258	71	5	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	33	123.76	4084.08	2
6259	71	63	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	113.06	5087.70	9
6260	71	72	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	41	81.43	3338.63	4
6261	71	77	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	50	76.31	3815.50	1
6262	71	97	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	31	58.67	1818.77	5
6263	71	102	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	45	72.28	3252.60	3
6264	71	106	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	42	90.15	3786.30	6
6265	71	107	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	30	94.34	2830.20	7
6266	71	110	16	7	78	10129	Shipped	2003-06-12	2003-06-18	2003-06-14	32	44.23	1415.36	8
6267	32	37	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	40	68.82	2752.80	2
6268	32	48	10	2	80	10130	Shipped	2003-06-16	2003-06-24	2003-06-21	33	99.52	3284.16	1
6269	101	22	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	141.92	2980.32	4
6270	101	69	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	35	60.97	2133.95	5
6271	101	75	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	29	52.60	1525.40	6
6272	101	79	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	50	54.59	2729.50	3
6273	101	100	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	22	76.94	1692.68	8
6274	101	101	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	40	86.76	3470.40	1
6275	101	108	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	26	63.67	1655.42	2
6276	101	109	12	3	80	10131	Shipped	2003-06-16	2003-06-25	2003-06-21	21	40.22	844.62	7
6277	70	105	19	6	84	10132	Shipped	2003-06-25	2003-07-01	2003-06-28	36	80.00	2880.00	1
6278	11	31	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	80.26	3932.74	3
6279	11	60	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	41	109.42	4486.22	5
6280	11	83	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	46	61.58	2832.68	4
6281	11	86	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	23	80.91	1860.93	1
6282	11	91	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	49	67.41	3303.09	6
6283	11	93	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	37.09	1001.43	7
6284	11	98	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	24	76.73	1841.52	8
6285	11	104	14	4	85	10133	Shipped	2003-06-27	2003-07-04	2003-07-03	27	115.09	3107.43	2
6286	51	1	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	41	90.92	3727.72	2
6287	51	3	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	27	116.56	3147.12	5
6288	51	4	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	31	187.85	5823.35	4
6289	51	10	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	20	131.04	2620.80	1
6290	51	32	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	30	51.48	1544.40	6
6291	51	58	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	35	94.67	3313.45	3
6292	51	62	13	4	87	10134	Shipped	2003-07-01	2003-07-10	2003-07-05	43	75.41	3242.63	7
6293	6	7	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	173.17	7273.14	7
6294	6	12	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	110.39	5298.72	5
6295	6	14	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	24	72.62	1742.88	8
6296	6	16	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	103.64	3005.56	4
6297	6	24	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	48	66.99	3215.52	3
6298	6	43	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	65.94	2967.30	10
6299	6	45	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	42	139.64	5864.88	9
6300	6	47	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	45	49.74	2238.30	13
6301	6	54	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	31	133.92	4151.52	12
6302	6	66	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	29	67.18	1948.22	16
6303	6	71	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	20	34.36	687.20	1
6304	6	74	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	27	52.05	1405.35	6
6305	6	78	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	47	139.03	6534.41	2
6306	6	84	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	23	76.80	1766.40	11
6307	6	87	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	33	38.62	1274.46	14
6308	6	92	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	30	91.85	2755.50	17
6309	6	96	7	1	88	10135	Shipped	2003-07-02	2003-07-12	2003-07-03	44	78.92	3472.48	15
6310	48	18	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	25	117.48	2937.00	2
6311	48	25	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	36	120.91	4352.76	1
6312	48	40	14	4	90	10136	Shipped	2003-07-04	2003-07-14	2003-07-06	41	169.34	6942.94	3
6313	81	21	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	44	115.73	5092.12	2
6314	81	34	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	37	110.88	4102.56	3
6315	81	46	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	31	118.68	3679.08	4
6316	81	59	13	4	94	10137	Shipped	2003-07-10	2003-07-20	2003-07-14	26	40.25	1046.50	1
6317	122	23	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	149.60	4936.80	6
6318	122	27	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	51.46	1132.12	5
6319	122	29	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	38	114.42	4347.96	3
6320	122	50	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	47	79.15	3720.05	7
6321	122	55	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	23	64.86	1491.78	8
6322	122	56	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	45	59.53	2678.85	12
6323	122	61	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	22	33.19	730.18	2
6324	122	64	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	33	38.53	1271.49	1
6325	122	67	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	28	73.60	2060.80	10
6326	122	70	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	30	96.30	2889.00	9
6327	122	73	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	49	77.05	3775.45	11
6328	122	76	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	21	99.58	2091.18	13
6329	122	80	19	6	93	10138	Shipped	2003-07-07	2003-07-16	2003-07-13	29	32.82	951.78	4
6330	58	19	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	31	89.38	2770.78	7
6331	58	20	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	49	52.83	2588.67	6
6332	58	33	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	41	151.88	6227.08	8
6333	58	35	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	46	91.18	4194.28	1
6334	58	36	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	52.47	1049.40	3
6335	58	38	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	20	101.58	2031.60	2
6336	58	44	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	30	81.35	2440.50	5
6337	58	82	18	6	98	10139	Shipped	2003-07-16	2003-07-23	2003-07-21	29	93.49	2711.21	4
6338	18	2	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	37	186.44	6898.28	11
6339	18	6	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	131.49	3418.74	4
6340	18	9	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	38	118.90	4518.20	8
6341	18	17	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	32	95.67	3061.44	10
6342	18	30	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	46	51.05	2348.30	2
6343	18	52	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	40	100.50	4020.00	5
6344	18	53	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	29	40.25	1167.25	9
6345	18	65	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	47	118.84	5585.48	1
6346	18	85	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	26	87.64	2278.64	3
6347	18	90	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	28	62.05	1737.40	7
6348	18	103	7	1	102	10140	Shipped	2003-07-24	2003-08-02	2003-07-30	36	101.15	3641.40	6
6349	74	15	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	114.95	2413.95	5
6350	74	26	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	39	160.46	6257.94	4
6351	74	28	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	47	103.09	4845.23	8
6352	74	40	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	34	143.94	4893.96	9
6353	74	57	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	20	50.86	1017.20	2
6354	74	68	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	21	32.18	675.78	6
6355	74	81	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	40	104.09	4163.60	1
6356	74	88	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	24	53.03	1272.72	7
6357	74	94	16	7	104	10141	Shipped	2003-08-01	2003-08-09	2003-08-04	44	94.92	4176.48	3
6358	6	8	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	166.24	5485.92	12
6359	6	11	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	140.50	4636.50	13
6360	6	13	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	46	167.83	7720.18	11
6361	6	39	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	47	129.76	6098.72	8
6362	6	42	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	22	95.80	2107.60	10
6363	6	49	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	122.08	2929.92	15
6364	6	51	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	24	79.87	1916.88	7
6365	6	63	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	33	114.29	3771.57	6
6366	6	72	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	49	74.35	3643.15	1
6367	6	89	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	60.90	2557.80	16
6368	6	95	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	42	56.24	2362.08	14
6369	6	97	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	41	55.34	2268.94	2
6370	6	99	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	43	77.08	3314.44	9
6371	6	106	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	21	92.16	1935.36	3
6372	6	107	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	38	91.37	3472.06	4
6373	6	110	7	1	108	10142	Shipped	2003-08-08	2003-08-16	2003-08-13	39	46.96	1831.44	5
6374	68	5	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	49	133.28	6530.72	15
6375	68	22	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	32	126.15	4036.80	7
6376	68	37	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	46	70.54	3244.84	13
6377	68	48	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	99.52	3383.68	12
6378	68	69	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	27	63.71	1720.17	8
6379	68	75	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	33	59.83	1974.39	9
6380	68	77	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	23	74.64	1716.72	14
6381	68	79	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	55.96	1566.88	6
6382	68	93	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	34.91	1186.94	1
6383	68	98	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	36	86.77	3123.72	2
6384	68	100	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	87.80	2282.80	11
6385	68	101	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	26	79.78	2074.28	4
6386	68	102	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	31	69.39	2151.09	16
6387	68	105	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	28	70.40	1971.20	3
6388	68	108	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	34	65.15	2215.10	5
6389	68	109	9	2	110	10143	Shipped	2003-08-10	2003-08-18	2003-08-12	37	49.66	1837.42	10
6390	90	91	15	4	113	10144	Shipped	2003-08-13	2003-08-21	2003-08-14	20	56.41	1128.20	1
6391	36	1	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	45	76.56	3445.20	6
6392	36	3	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	37	104.67	3872.79	9
6393	36	4	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	154.93	5112.69	8
6394	36	10	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	49	146.10	7158.90	5
6395	36	31	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	71.81	2154.30	14
6396	36	32	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	30	52.70	1581.00	10
6397	36	58	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	43	103.68	4458.24	7
6398	36	60	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	40	87.54	3501.60	16
6399	36	62	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	47	63.98	3007.06	11
6400	36	66	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	56.10	1514.70	3
6401	36	83	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	71.73	2367.09	15
6402	36	86	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	33	99.89	3296.37	12
6403	36	87	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	31	39.43	1222.33	1
6404	36	92	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	27	95.93	2590.11	4
6405	36	96	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	38	73.22	2782.36	2
6406	36	104	8	1	120	10145	Shipped	2003-08-25	2003-09-02	2003-08-31	20	113.90	2278.00	13
6407	101	47	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	47	60.30	2834.10	2
6408	101	54	12	3	123	10146	Shipped	2003-09-03	2003-09-13	2003-09-06	29	130.94	3797.26	1
6409	89	7	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	48	161.49	7751.52	7
6410	89	12	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	110.39	3422.09	5
6411	89	14	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	21	74.21	1558.41	8
6412	89	16	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	33	97.89	3230.37	4
6413	89	24	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	26	70.84	1841.84	3
6414	89	43	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	36	74.78	2692.08	10
6415	89	45	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	37	129.35	4785.95	9
6416	89	71	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	25	33.23	830.75	1
6417	89	74	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	30	48.98	1469.40	6
6418	89	78	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	23	123.58	2842.34	2
6419	89	84	9	2	124	10147	Shipped	2003-09-05	2003-09-12	2003-09-09	31	72.76	2255.56	11
6420	56	18	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	23	114.65	2636.95	13
6421	56	21	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	108.26	5088.22	9
6422	56	25	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	136.56	3414.00	12
6423	56	34	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	113.52	3065.04	10
6424	56	40	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	32	143.94	4606.08	14
6425	56	46	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	28	135.63	3797.64	11
6426	56	50	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	83.75	2847.50	1
6427	56	55	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	29	66.28	1922.12	2
6428	56	56	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	25	65.41	1635.25	6
6429	56	59	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	47	46.29	2175.63	8
6430	56	67	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	21	77.24	1622.04	4
6431	56	70	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	34	115.09	3913.06	3
6432	56	73	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	31	71.91	2229.21	5
6433	56	76	18	6	128	10148	Shipped	2003-09-11	2003-09-21	2003-09-15	27	96.37	2601.99	7
6434	119	19	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	50	87.33	4366.50	4
6435	119	20	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	30	48.52	1455.60	3
6436	119	23	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	34	156.40	5317.60	11
6437	119	27	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	24	50.85	1220.40	10
6438	119	29	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	33	125.86	4153.38	8
6439	119	33	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	23	167.06	3842.38	5
6440	119	44	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	42	89.29	3750.18	2
6441	119	61	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	36	31.20	1123.20	7
6442	119	64	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	49	39.87	1953.63	6
6443	119	80	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	26	38.57	1002.82	9
6444	119	82	7	1	129	10149	Shipped	2003-09-12	2003-09-18	2003-09-17	20	90.57	1811.40	1
6445	15	2	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	45	182.16	8197.20	8
6446	15	6	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	121.15	2423.00	1
6447	15	9	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	135.30	4059.00	5
6448	15	17	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	34	95.67	3252.78	7
6449	15	35	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	47	93.21	4380.87	9
6450	15	36	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	56.21	1686.30	11
6451	15	38	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	26	97.39	2532.14	10
6452	15	52	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	111.39	5458.11	2
6453	15	53	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	30	47.29	1418.70	6
6454	15	90	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	49	62.05	3040.45	4
6455	15	103	21	5	135	10150	Shipped	2003-09-19	2003-09-27	2003-09-21	20	95.08	1901.60	3
6456	65	15	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	24	114.95	2758.80	3
6457	65	26	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	43	152.27	6547.61	2
6458	65	28	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	49	106.78	5232.22	6
6459	65	30	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	39	58.34	2275.26	9
6460	65	40	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	21	167.65	3520.65	7
6461	65	65	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	42	109.90	4615.80	8
6462	65	68	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	30	29.35	880.50	4
6463	65	85	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	27	84.75	2288.25	10
6464	65	88	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	41	43.29	1774.89	5
6465	65	94	16	7	136	10151	Shipped	2003-09-21	2003-09-30	2003-09-24	26	108.81	2829.06	1
6466	73	49	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	35	117.77	4121.95	1
6467	73	57	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	25	49.13	1228.25	4
6468	73	81	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	23	112.37	2584.51	3
6469	73	89	18	6	138	10152	Shipped	2003-09-25	2003-10-03	2003-10-01	33	57.17	1886.61	2
6470	11	8	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	201.57	4031.40	11
6471	11	11	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	42	128.42	5393.64	12
6472	11	13	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	49	155.72	7630.28	10
6473	11	39	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	125.66	3895.46	7
6474	11	42	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	29	82.69	2398.01	9
6475	11	51	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	22	82.50	1815.00	6
6476	11	63	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	40	111.83	4473.20	5
6477	11	95	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	53.31	1652.61	13
6478	11	97	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	43	58.00	2494.00	1
6479	11	99	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	31	80.55	2497.05	8
6480	11	106	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	87.15	4357.50	2
6481	11	107	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	20	85.41	1708.20	3
6482	11	110	14	4	140	10153	Shipped	2003-09-28	2003-10-05	2003-10-03	50	51.87	2593.50	4
6483	41	72	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	31	75.23	2332.13	2
6484	41	102	8	1	143	10154	Shipped	2003-10-02	2003-10-12	2003-10-08	36	59.27	2133.72	1
6485	29	5	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	129.20	4134.40	13
6486	29	22	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	38	138.77	5273.26	5
6487	29	37	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	83.44	3671.36	11
6488	29	48	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	29	105.87	3070.23	10
6489	29	69	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	23	62.34	1433.82	6
6490	29	75	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	56.55	1922.70	7
6491	29	77	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	37	76.31	2823.47	12
6492	29	79	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	58.69	2582.36	4
6493	29	100	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	32	89.61	2867.52	9
6494	29	101	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	20	87.75	1755.00	2
6495	29	105	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	43	76.80	3302.40	1
6496	29	108	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	44	70.33	3094.52	3
6497	29	109	16	7	147	10155	Shipped	2003-10-06	2003-10-13	2003-10-07	34	49.16	1671.44	8
6498	11	93	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	20	43.64	872.80	1
6499	11	98	14	4	149	10156	Shipped	2003-10-08	2003-10-17	2003-10-11	48	77.64	3726.72	2
6500	112	31	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	69.27	2285.91	3
6501	112	60	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	40	89.72	3588.80	5
6502	112	83	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	33	66.65	2199.45	4
6503	112	86	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	34	83.91	2852.94	1
6504	112	91	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	28	56.41	1579.48	6
6505	112	104	15	4	150	10157	Shipped	2003-10-09	2003-10-15	2003-10-14	48	109.16	5239.68	2
6506	5	62	17	7	151	10158	Shipped	2003-10-10	2003-10-18	2003-10-15	22	67.79	1491.38	1
6507	69	1	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	49	81.35	3986.15	14
6508	69	3	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	37	101.10	3740.70	17
6509	69	4	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	22	170.42	3749.24	16
6510	69	7	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	41	188.73	7737.93	2
6511	69	10	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	38	131.04	4979.52	13
6512	69	14	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	24	67.03	1608.72	3
6513	69	32	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	42	51.48	2162.16	18
6514	69	43	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	66.74	1401.54	5
6515	69	45	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	25	129.35	3233.75	4
6516	69	47	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	21	54.71	1148.91	8
6517	69	54	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	32	142.85	4571.20	7
6518	69	58	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	44	100.30	4413.20	15
6519	69	66	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	27	67.18	1813.86	11
6520	69	74	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	50	49.60	2480.00	1
6521	69	84	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	80.84	1859.32	6
6522	69	87	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	35	39.43	1380.05	9
6523	69	92	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	23	86.74	1995.02	12
6524	69	96	7	1	151	10159	Shipped	2003-10-10	2003-10-19	2003-10-16	31	78.11	2421.41	10
6525	78	12	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	46	96.30	4429.80	6
6526	78	16	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	50	93.28	4664.00	5
6527	78	24	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	38	70.84	2691.92	4
6528	78	40	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	20	140.55	2811.00	1
6529	78	71	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	42	30.59	1284.78	2
6530	78	78	8	1	152	10160	Shipped	2003-10-11	2003-10-17	2003-10-17	35	130.60	4571.00	3
6531	43	18	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	28	121.72	3408.16	12
6532	43	21	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	43	102.04	4387.72	8
6533	43	25	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	48	139.41	6691.68	11
6534	43	34	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	125.40	2884.20	9
6535	43	46	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	36	132.80	4780.80	10
6536	43	55	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	62.72	1568.00	1
6537	43	56	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	37	73.49	2719.13	5
6538	43	59	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	23	47.29	1087.67	7
6539	43	67	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	82.69	1653.80	3
6540	43	70	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	25	108.04	2701.00	2
6541	43	73	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	20	72.77	1455.40	4
6542	43	76	15	4	158	10161	Shipped	2003-10-17	2003-10-25	2003-10-20	30	94.23	2826.90	6
6543	69	19	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	87.33	4191.84	2
6544	69	20	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	45	45.28	2037.60	1
6545	69	23	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	29	141.10	4091.90	9
6546	69	27	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	27	53.28	1438.56	8
6547	69	29	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	38	113.15	4299.70	6
6548	69	33	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	48	156.94	7533.12	3
6549	69	50	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	39	86.51	3373.89	10
6550	69	61	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	27.55	1019.35	5
6551	69	64	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	43	38.98	1676.14	4
6552	69	80	7	1	159	10162	Shipped	2003-10-18	2003-10-26	2003-10-19	37	32.82	1214.34	7
6553	99	2	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	21	212.16	4455.36	1
6554	99	35	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	31	101.31	3140.61	2
6555	99	36	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	48	59.96	2878.08	4
6556	99	38	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	40	101.58	4063.20	3
6557	99	44	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	43	80.36	3455.48	6
6558	99	82	11	3	161	10163	Shipped	2003-10-20	2003-10-27	2003-10-24	42	96.42	4049.64	5
6559	104	6	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	21	143.31	3009.51	2
6560	104	9	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	121.64	5960.36	6
6561	104	17	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	36	103.84	3738.24	8
6562	104	52	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	45	107.76	4849.20	3
6563	104	53	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	25	46.29	1157.25	7
6564	104	85	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	24	91.49	2195.76	1
6565	104	90	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	49	57.53	2818.97	5
6566	104	103	15	4	162	10164	Resolved	2003-10-21	2003-10-30	2003-10-23	39	86.99	3392.61	4
6567	15	8	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	168.32	7406.08	3
6568	15	11	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	34	123.89	4212.26	4
6569	15	13	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	152.26	4111.02	2
6570	15	15	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	109.02	5232.96	12
6571	15	26	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	29	134.26	3893.54	11
6572	15	28	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	46	120.28	5532.88	15
6573	15	30	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	31	60.77	1883.87	18
6574	15	40	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	47	154.10	7242.70	16
6575	15	42	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	50	84.71	4235.50	1
6576	15	49	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	28	123.51	3458.28	6
6577	15	57	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	25	46.82	1170.50	9
6578	15	65	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	32	117.57	3762.24	17
6579	15	68	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	27	31.12	840.24	13
6580	15	81	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	24	106.45	2554.80	8
6581	15	88	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	50.86	2441.28	14
6582	15	89	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	44	55.30	2433.20	7
6583	15	94	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	48	106.49	5111.52	10
6584	15	95	21	5	163	10165	Shipped	2003-10-22	2003-10-31	2003-12-26	38	49.21	1869.98	5
6585	109	39	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	43	136.59	5873.37	2
6586	109	51	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	26	72.85	1894.10	1
6587	109	99	10	2	162	10166	Shipped	2003-10-21	2003-10-30	2003-10-27	29	76.22	2210.38	3
6588	102	5	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	44	123.76	5445.44	9
6589	102	22	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	141.92	6102.56	1
6590	102	37	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	69.68	3205.28	7
6591	102	48	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	34	84.70	2879.80	6
6592	102	63	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	33	110.60	3649.80	16
6593	102	69	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	21	54.81	1151.01	2
6594	102	72	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	20	77.00	1540.00	11
6595	102	75	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	32	64.44	2062.08	3
6596	102	77	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	73.80	2140.20	8
6597	102	97	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	43	66.00	2838.00	12
6598	102	100	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	29	87.80	2546.20	5
6599	102	102	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	46	62.16	2859.36	10
6600	102	106	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	24	85.14	2043.36	13
6601	102	107	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	28	83.42	2335.76	14
6602	102	109	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	40	42.71	1708.40	4
6603	102	110	17	7	164	10167	Cancelled	2003-10-23	2003-10-30	\N	38	43.68	1659.84	15
6604	18	1	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.74	3410.64	1
6605	18	3	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	97.53	2633.31	4
6606	18	4	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	20	160.74	3214.80	3
6607	18	31	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	21	75.19	1578.99	9
6608	18	32	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	46	49.06	2256.76	5
6609	18	58	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	50	103.68	5184.00	2
6610	18	60	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	49	93.01	4557.49	11
6611	18	62	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	29	72.36	2098.44	6
6612	18	79	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	27	57.32	1547.64	18
6613	18	83	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	68.10	3268.80	10
6614	18	86	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	89.90	2517.20	7
6615	18	91	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	57.78	1791.18	12
6616	18	93	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	39.71	1906.08	13
6617	18	98	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	28	91.34	2557.52	14
6618	18	101	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	31	87.75	2720.25	16
6619	18	104	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	36	94.92	3417.12	8
6620	18	105	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	48	72.00	3456.00	15
6621	18	108	7	1	169	10168	Shipped	2003-10-28	2003-11-03	2003-11-01	39	67.37	2627.43	17
6622	56	7	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	30	163.44	4903.20	2
6623	56	10	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	35	126.52	4428.20	13
6624	56	14	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	71.82	2585.52	3
6625	56	43	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	32	65.13	2084.16	5
6626	56	45	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	36	136.70	4921.20	4
6627	56	47	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	52.84	2007.92	8
6628	56	54	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	33	120.53	3977.49	7
6629	56	66	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	38	66.49	2526.62	11
6630	56	74	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	53.27	1811.18	1
6631	56	84	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	24	77.61	1862.64	6
6632	56	87	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	26	37.01	962.26	9
6633	56	92	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	34	83.68	2845.12	12
6634	56	96	18	6	174	10169	Shipped	2003-11-04	2003-11-14	2003-11-09	48	75.66	3631.68	10
6635	104	12	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	47	116.27	5464.69	4
6636	104	16	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	41	93.28	3824.48	3
6637	104	24	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	20	70.07	1401.40	2
6638	104	78	15	4	174	10170	Shipped	2003-11-04	2003-11-12	2003-11-07	34	130.60	4440.40	1
6639	44	18	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	134.46	4706.10	2
6640	44	25	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	35	128.03	4481.05	1
6641	44	40	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	39	165.95	6472.05	3
6642	44	71	11	3	175	10171	Shipped	2003-11-05	2003-11-13	2003-11-07	36	34.74	1250.64	4
6643	26	21	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	42	109.51	4599.42	6
6644	26	34	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	39	117.48	4581.72	7
6645	26	46	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	48	139.87	6713.76	8
6646	26	56	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	32	61.00	1952.00	3
6647	26	59	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	34	43.27	1471.18	5
6648	26	67	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	79.97	1759.34	1
6649	26	73	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	24	77.91	1869.84	2
6650	26	76	12	3	175	10172	Shipped	2003-11-05	2003-11-14	2003-11-11	22	87.81	1931.82	4
6651	57	19	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	43	101.71	4373.53	6
6652	57	20	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	48	51.75	2484.00	5
6653	57	23	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	24	168.30	4039.20	13
6654	57	27	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	26	55.09	1432.34	12
6655	57	29	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	127.13	3941.03	10
6656	57	33	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	140.06	3081.32	7
6657	57	36	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	28	56.84	1591.52	2
6658	57	38	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	86.92	2694.52	1
6659	57	44	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	29	90.28	2618.12	4
6660	57	50	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	21	77.31	1623.51	14
6661	57	55	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	39	58.44	2279.16	15
6662	57	61	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	31	29.87	925.97	9
6663	57	64	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	27	39.42	1064.34	8
6664	57	70	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	23	98.65	2268.95	16
6665	57	80	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	35	35.70	1249.50	11
6666	57	82	15	4	175	10173	Shipped	2003-11-05	2003-11-15	2003-11-09	22	93.49	2056.78	3
6667	73	2	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	34	207.87	7067.58	4
6668	73	9	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	43	113.44	4877.92	1
6669	73	17	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	48	108.50	5208.00	3
6670	73	35	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	46	100.30	4613.80	5
6671	73	53	18	6	176	10174	Shipped	2003-11-06	2003-11-15	2003-11-10	49	44.27	2169.23	2
6672	71	6	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	33	119.67	3949.11	9
6673	71	15	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	26	109.02	2834.52	1
6674	71	28	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	48	101.87	4889.76	4
6675	71	30	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	41	59.55	2441.55	7
6676	71	40	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	150.71	4370.59	5
6677	71	52	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	47	102.92	4837.24	10
6678	71	65	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	28	121.40	3399.20	6
6679	71	68	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	37	32.18	1190.66	2
6680	71	85	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	22	89.57	1970.54	8
6681	71	88	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	50	50.86	2543.00	3
6682	71	90	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	29	56.24	1630.96	12
6683	71	103	16	7	176	10175	Shipped	2003-11-06	2003-11-14	2003-11-09	42	80.92	3398.64	11
6684	93	8	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	33	166.24	5485.92	2
6685	93	11	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	47	145.04	6816.88	3
6686	93	13	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	50	160.91	8045.50	1
6687	93	26	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	20	139.17	2783.40	10
6688	93	49	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	36	140.75	5067.00	5
6689	93	57	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	27	55.49	1498.23	8
6690	93	81	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	29	101.72	2949.88	7
6691	93	89	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	22	62.14	1367.08	6
6692	93	94	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	23	109.96	2529.08	9
6693	93	95	15	4	176	10176	Shipped	2003-11-06	2003-11-15	2003-11-12	38	52.14	1981.32	4
6694	77	39	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	23	113.37	2607.51	9
6695	77	42	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	29	92.77	2690.33	11
6696	77	51	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	35	82.50	2887.50	8
6697	77	63	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	50	115.52	5776.00	7
6698	77	72	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	45	79.66	3584.70	2
6699	77	97	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	58.67	1408.08	3
6700	77	99	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	31	77.95	2416.45	10
6701	77	102	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	32	64.33	2058.56	1
6702	77	106	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	44	88.15	3878.60	4
6703	77	107	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	24	83.42	2002.08	5
6704	77	110	23	4	177	10177	Shipped	2003-11-07	2003-11-17	2003-11-12	40	52.96	2118.40	6
6705	48	5	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	24	131.92	3166.08	12
6706	48	22	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	42	127.73	5364.66	4
6707	48	37	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	41	70.54	2892.14	10
6708	48	48	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	48	104.81	5030.88	9
6709	48	69	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	67.82	2305.88	5
6710	48	75	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	27	65.75	1775.25	6
6711	48	77	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	21	68.77	1444.17	11
6712	48	79	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	30	64.15	1924.50	3
6713	48	100	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	34	86.90	2954.60	8
6714	48	101	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	22	91.74	2018.28	1
6715	48	108	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	68.11	3064.95	2
6716	48	109	14	4	178	10178	Shipped	2003-11-08	2003-11-16	2003-11-10	45	41.71	1876.95	7
6717	122	31	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	82.79	1986.96	3
6718	122	60	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	47	105.04	4936.88	5
6719	122	83	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	27	66.65	1799.55	4
6720	122	86	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	45	86.90	3910.50	1
6721	122	91	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	24	63.97	1535.28	6
6722	122	93	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	34	43.20	1468.80	7
6723	122	98	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	23	75.81	1743.63	8
6724	122	104	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	25	98.48	2462.00	2
6725	122	105	19	6	181	10179	Cancelled	2003-11-11	2003-11-17	2003-11-13	39	80.00	3120.00	9
6726	23	1	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	29	76.56	2220.24	9
6727	23	3	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	42	99.91	4196.22	12
6728	23	4	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	41	164.61	6749.01	11
6729	23	10	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	40	131.04	5241.60	8
6730	23	32	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	25	48.46	1211.50	13
6731	23	47	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	59.06	1240.26	3
6732	23	54	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	44	147.31	6481.64	2
6733	23	58	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	48	98.05	4706.40	10
6734	23	62	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	61.70	1727.60	14
6735	23	66	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	35	60.95	2133.25	6
6736	23	84	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	28	68.71	1923.88	1
6737	23	87	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	34	33.39	1135.26	4
6738	23	92	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	22	102.05	2245.10	7
6739	23	96	14	4	181	10180	Shipped	2003-11-11	2003-11-19	2003-11-14	21	74.85	1571.85	5
6740	20	7	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	155.66	4202.82	14
6741	20	12	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	28	113.92	3189.76	12
6742	20	14	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	20	67.03	1340.60	15
6743	20	16	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	36	107.10	3855.60	11
6744	20	18	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	44	124.56	5480.64	6
6745	20	21	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	42	124.44	5226.48	2
6746	20	24	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	74.69	1643.18	10
6747	20	25	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	21	129.45	2718.45	5
6748	20	34	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	27	130.68	3528.36	3
6749	20	40	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	45	147.33	6629.85	7
6750	20	43	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	30	73.17	2195.10	17
6751	20	45	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	22	120.53	2651.66	16
6752	20	46	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	39	137.04	5344.56	4
6753	20	59	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	34	45.28	1539.52	1
6754	20	71	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	37	32.85	1215.45	8
6755	20	74	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	23	54.49	1253.27	13
6756	20	78	17	7	182	10181	Shipped	2003-11-12	2003-11-19	2003-11-15	25	122.17	3054.25	9
6757	6	19	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	25	83.22	2080.50	3
6758	6	20	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	32	44.21	1414.72	2
6759	6	23	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	159.80	7031.20	10
6760	6	27	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	38	54.49	2070.62	9
6761	6	29	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	105.52	2110.40	7
6762	6	33	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	21	135.00	2835.00	4
6763	6	44	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	86.31	2848.23	1
6764	6	50	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	88.35	3180.60	11
6765	6	55	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	44	61.29	2696.76	12
6766	6	56	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	47	63.20	2970.40	16
6767	6	61	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	39	31.86	1242.54	6
6768	6	64	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	31	39.87	1235.97	5
6769	6	67	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	36	87.24	3140.64	14
6770	6	70	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	20	116.27	2325.40	13
6771	6	73	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	33	73.62	2429.46	15
6772	6	76	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	49	95.30	4669.70	17
6773	6	80	7	1	182	10182	Shipped	2003-11-12	2003-11-21	2003-11-18	23	34.88	802.24	8
6774	76	2	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	180.01	4140.23	8
6775	76	6	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	28	127.06	3557.68	1
6776	76	9	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	41	114.80	4706.80	5
6777	76	17	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	108.50	2278.50	7
6778	76	35	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	37	91.18	3373.66	9
6779	76	36	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	39	51.22	1997.58	11
6780	76	38	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	22	90.06	1981.32	10
6781	76	52	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	21	118.66	2491.86	2
6782	76	53	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	40	42.26	1690.40	6
6783	76	82	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	47	81.81	3845.07	12
6784	76	90	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	49	52.36	2565.64	4
6785	76	103	9	2	183	10183	Shipped	2003-11-13	2003-11-22	2003-11-15	23	85.98	1977.54	3
6786	117	15	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	37	105.47	3902.39	6
6787	117	26	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	145.72	6703.12	5
6788	117	28	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	119.05	5476.30	9
6789	117	30	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	44	60.77	2673.88	12
6790	117	40	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	28	165.95	4646.60	10
6791	117	57	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	31	57.22	1773.82	3
6792	117	65	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	24	117.57	2821.68	11
6793	117	68	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	42	30.06	1262.52	7
6794	117	81	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	49	114.73	5621.77	2
6795	117	85	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	46	84.75	3898.50	13
6796	117	88	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	33	52.49	1732.17	8
6797	117	89	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	48	59.03	2833.44	1
6798	117	94	23	4	184	10184	Shipped	2003-11-14	2003-11-22	2003-11-20	45	92.60	4167.00	4
6799	68	8	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	195.33	4101.93	13
6800	68	11	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	146.55	4836.15	14
6801	68	13	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	43	147.07	6324.01	12
6802	68	39	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	124.30	3480.40	9
6803	68	42	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	49	94.79	4644.71	11
6804	68	49	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	127.82	4984.98	16
6805	68	51	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	47	87.77	4125.19	8
6806	68	63	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	105.69	3170.70	7
6807	68	72	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	33	83.20	2745.60	2
6808	68	95	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	20	46.86	937.20	15
6809	68	97	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	21	64.67	1358.07	3
6810	68	99	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	30	79.68	2390.40	10
6811	68	102	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	39	61.44	2396.16	1
6812	68	106	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	37	99.17	3669.29	4
6813	68	107	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	22	93.35	2053.70	5
6814	68	110	9	2	184	10185	Shipped	2003-11-14	2003-11-21	2003-11-20	28	47.50	1330.00	6
6815	120	5	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	26	108.80	2828.80	9
6816	120	22	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	137.19	4390.08	1
6817	120	37	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	32	73.12	2339.84	7
6818	120	48	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	46	98.46	4529.16	6
6819	120	69	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	22	60.29	1326.38	2
6820	120	75	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	21	59.83	1256.43	3
6821	120	77	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	36	68.77	2475.72	8
6822	120	100	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	24	80.56	1933.44	5
6823	120	109	16	7	184	10186	Shipped	2003-11-14	2003-11-20	2003-11-18	28	42.71	1195.88	4
6824	39	31	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	45	70.12	3155.40	1
6825	39	60	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	46	96.29	4429.34	3
6826	39	79	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	43	55.96	2406.28	10
6827	39	83	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	33	64.48	2127.84	2
6828	39	91	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	31	61.22	1897.82	4
6829	39	93	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	41	39.71	1628.11	5
6830	39	98	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	84.95	2888.30	6
6831	39	101	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	95.73	4212.12	8
6832	39	105	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	34	72.00	2448.00	7
6833	39	108	21	5	185	10187	Shipped	2003-11-15	2003-11-24	2003-11-16	44	70.33	3094.52	9
6834	20	1	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	48	95.70	4593.60	1
6835	20	3	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	38	111.80	4248.40	4
6836	20	4	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	45	182.04	8191.80	3
6837	20	32	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	32	52.09	1666.88	5
6838	20	58	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	25	95.80	2395.00	2
6839	20	62	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	40	61.70	2468.00	6
6840	20	86	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	44	81.91	3604.04	7
6841	20	104	17	7	188	10188	Shipped	2003-11-18	2003-11-26	2003-11-24	29	96.11	2787.19	8
6842	36	10	8	1	188	10189	Shipped	2003-11-18	2003-11-25	2003-11-24	28	138.57	3879.96	1
6843	11	66	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	58.87	2472.54	3
6844	11	87	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	46	38.62	1776.52	1
6845	11	92	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	42	89.80	3771.60	4
6846	11	96	14	4	189	10190	Shipped	2003-11-19	2003-11-29	2003-11-20	40	67.53	2701.20	2
6847	53	7	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	21	155.66	3268.86	3
6848	53	12	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	40	104.52	4180.80	1
6849	53	14	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	30	70.22	2106.60	4
6850	53	43	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	36	75.59	2721.24	6
6851	53	45	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	23	119.06	2738.38	5
6852	53	47	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	43	60.93	2619.99	9
6853	53	54	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	32	136.90	4380.80	8
6854	53	74	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	48	53.27	2556.96	2
6855	53	84	17	7	190	10191	Shipped	2003-11-20	2003-11-30	2003-11-24	44	77.61	3414.84	7
6856	86	16	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	27	99.04	2674.08	16
6857	86	18	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	22	140.12	3082.64	11
6858	86	21	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	29	100.80	2923.20	7
6859	86	24	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	70.84	3187.80	15
6860	86	25	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	128.03	6017.41	10
6861	86	34	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	38	110.88	4213.44	8
6862	86	40	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	26	137.17	3566.42	12
6863	86	46	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	125.74	5658.30	9
6864	86	56	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	37	72.02	2664.74	4
6865	86	59	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	47	49.30	2317.10	6
6866	86	67	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	86.33	3971.18	2
6867	86	70	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	23	112.74	2593.02	1
6868	86	71	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	30	33.23	996.90	13
6869	86	73	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	32	69.34	2218.88	3
6870	86	76	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	46	93.16	4285.36	5
6871	86	78	10	2	190	10192	Shipped	2003-11-20	2003-11-29	2003-11-25	45	112.34	5055.30	14
6872	111	19	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	92.47	2589.16	7
6873	111	20	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	46	46.36	2132.56	6
6874	111	23	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	21	153.00	3213.00	14
6875	111	27	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	42	60.54	2542.68	13
6876	111	29	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	44	115.69	5090.36	11
6877	111	33	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	143.44	3155.68	8
6878	111	35	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	28	87.13	2439.64	1
6879	111	36	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	53.09	1274.16	3
6880	111	38	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	23	97.39	2239.97	2
6881	111	44	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	32	79.37	2539.84	5
6882	111	50	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	24	92.03	2208.72	15
6883	111	55	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	25	66.28	1657.00	16
6884	111	61	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	26	32.19	836.94	10
6885	111	64	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	44.80	896.00	9
6886	111	80	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	22	38.16	839.52	12
6887	111	82	18	6	191	10193	Shipped	2003-11-21	2003-11-28	2003-11-27	20	92.52	1850.40	4
6888	14	2	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	42	203.59	8550.78	11
6889	14	6	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	134.44	3495.44	4
6890	14	9	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	38	124.37	4726.06	8
6891	14	17	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	21	103.84	2180.64	10
6892	14	30	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	45	51.05	2297.25	2
6893	14	52	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	32	113.82	3642.24	5
6894	14	53	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	41	47.79	1959.39	9
6895	14	65	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	49	112.46	5510.54	1
6896	14	85	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	37	77.05	2850.85	3
6897	14	90	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	39	61.41	2394.99	7
6898	14	103	13	4	195	10194	Shipped	2003-11-25	2003-12-02	2003-11-26	26	80.92	2103.92	6
6899	67	15	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	118.50	5806.50	6
6900	67	26	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	27	139.17	3757.59	5
6901	67	28	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	35	112.91	3951.85	9
6902	67	40	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	50	150.71	7535.50	10
6903	67	57	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	44	54.33	2390.52	3
6904	67	68	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	31.82	1018.24	7
6905	67	81	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	34	95.81	3257.54	2
6906	67	88	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	32	51.95	1662.40	8
6907	67	89	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	33	59.03	1947.99	1
6908	67	94	12	3	195	10195	Shipped	2003-11-25	2003-12-01	2003-11-28	49	97.23	4764.27	4
6909	105	8	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	47	203.64	9571.08	5
6910	105	11	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	24	151.08	3625.92	6
6911	105	13	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	38	147.07	5588.66	4
6912	105	39	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	49	127.03	6224.47	1
6913	105	42	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	35	81.68	2858.80	3
6914	105	49	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	27	126.39	3412.53	8
6915	105	95	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	46	56.82	2613.72	7
6916	105	99	11	3	196	10196	Shipped	2003-11-26	2003-12-03	2003-12-01	50	84.88	4244.00	2
6917	40	5	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	45	118.32	5324.40	6
6918	40	37	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	46	83.44	3838.24	4
6919	40	48	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	85.75	1886.50	3
6920	40	51	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	78.99	3949.50	14
6921	40	63	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	41	109.37	4484.17	13
6922	40	72	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	47	83.20	3910.40	8
6923	40	77	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	22	67.93	1494.46	5
6924	40	97	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	23	60.00	1380.00	9
6925	40	100	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	24	78.75	1890.00	2
6926	40	102	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	50	66.50	3325.00	7
6927	40	106	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	27	100.17	2704.59	10
6928	40	107	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	35	88.39	3093.65	11
6929	40	109	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	29	39.73	1152.17	1
6930	40	110	23	4	196	10197	Shipped	2003-11-26	2003-12-02	2003-12-01	42	48.59	2040.78	12
6931	92	22	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	149.81	6292.02	4
6932	92	69	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	48	60.97	2926.56	5
6933	92	75	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	27	61.81	1668.87	6
6934	92	79	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	43	65.51	2816.93	3
6935	92	101	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	42	94.73	3978.66	1
6936	92	108	21	5	197	10198	Shipped	2003-11-27	2003-12-06	2003-12-03	40	74.03	2961.20	2
6937	113	93	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	29	37.97	1101.13	1
6938	113	98	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	48	81.29	3901.92	2
6939	113	105	8	1	201	10199	Shipped	2003-12-01	2003-12-10	2003-12-06	38	70.40	2675.20	3
6940	39	31	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	28	74.34	2081.52	3
6941	39	60	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	33	99.57	3285.81	5
6942	39	83	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	70.28	2740.92	4
6943	39	86	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	35	80.91	2831.85	1
6944	39	91	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	27	65.35	1764.45	6
6945	39	104	21	5	201	10200	Shipped	2003-12-01	2003-12-09	2003-12-06	39	115.09	4488.51	2
6946	9	1	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	22	82.30	1810.60	2
6947	9	3	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	24	116.56	2797.44	5
6948	9	4	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	49	191.72	9394.28	4
6949	9	10	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	126.52	3163.00	1
6950	9	32	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	30	48.46	1453.80	6
6951	9	58	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	39	93.54	3648.06	3
6952	9	62	7	1	201	10201	Shipped	2003-12-01	2003-12-11	2003-12-02	25	66.27	1656.75	7
6953	83	47	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	30	55.33	1659.90	3
6954	83	54	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	43	124.99	5374.57	2
6955	83	66	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	56.10	2805.00	6
6956	83	84	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	50	75.18	3759.00	1
6957	83	87	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	27	33.39	901.53	4
6958	83	92	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	31	81.64	2530.84	7
6959	83	96	19	6	202	10202	Shipped	2003-12-02	2003-12-09	2003-12-06	40	79.73	3189.20	5
6960	11	7	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	161.49	3229.80	8
6961	11	12	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	20	111.57	2231.40	6
6962	11	14	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	44	63.84	2808.96	9
6963	11	16	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	115.16	5412.52	5
6964	11	24	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	45	73.15	3291.75	4
6965	11	40	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	48	157.49	7559.52	1
6966	11	43	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	33	66.74	2202.42	11
6967	11	45	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	32	127.88	4092.16	10
6968	11	71	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	21	33.23	697.83	2
6969	11	74	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	34	56.94	1935.96	7
6970	11	78	14	4	202	10203	Shipped	2003-12-02	2003-12-11	2003-12-07	47	140.43	6600.21	3
6971	16	18	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	114.65	4815.30	17
6972	16	21	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	113.24	4529.60	13
6973	16	23	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	33	153.00	5049.00	4
6974	16	25	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	38	133.72	5081.36	16
6975	16	27	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	23	59.33	1364.59	3
6976	16	29	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	26	119.50	3107.00	1
6977	16	34	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	27	106.92	2886.84	14
6978	16	46	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	35	132.80	4648.00	15
6979	16	50	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	29	83.75	2428.75	5
6980	16	55	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	69.84	3142.80	6
6981	16	56	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	20	69.82	1396.40	10
6982	16	59	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	45	46.79	2105.55	12
6983	16	67	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	47	79.06	3715.82	8
6984	16	70	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	42	112.74	4735.08	7
6985	16	73	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	40	84.75	3390.00	9
6986	16	76	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	48	104.94	5037.12	11
6987	16	80	11	3	202	10204	Shipped	2003-12-02	2003-12-10	2003-12-04	39	34.88	1360.32	2
6988	11	19	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	36	98.63	3550.68	2
6989	11	20	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	48	45.82	2199.36	1
6990	11	33	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	40	138.38	5535.20	3
6991	11	61	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	32	27.88	892.16	5
6992	11	64	14	4	203	10205	Shipped	2003-12-03	2003-12-09	2003-12-07	24	36.74	881.76	4
6993	34	2	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	47	203.59	9568.73	6
6994	34	9	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	109.34	3061.52	3
6995	34	17	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	34	115.50	3927.00	5
6996	34	35	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	37	98.27	3635.99	7
6997	34	36	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	51.84	1451.52	9
6998	34	38	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	30	102.63	3078.90	8
6999	34	44	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	28	99.21	2777.88	11
7000	34	53	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	21	45.78	961.38	4
7001	34	82	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	95.44	3149.52	10
7002	34	90	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	36	54.94	1977.84	2
7003	34	103	12	3	205	10206	Shipped	2003-12-05	2003-12-13	2003-12-08	33	89.01	2937.33	1
7004	121	6	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	31	125.58	3892.98	15
7005	121	15	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	34	95.99	3263.66	7
7006	121	26	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	44	140.81	6195.64	6
7007	121	28	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	43	109.23	4696.89	10
7008	121	30	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	37	60.77	2248.49	13
7009	121	40	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	25	140.55	3513.75	11
7010	121	49	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	40	143.62	5744.80	1
7011	121	52	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	47	119.87	5633.89	16
7012	121	57	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	57.80	2832.20	4
7013	121	65	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	46	127.79	5878.34	12
7014	121	68	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	42	30.76	1291.92	8
7015	121	81	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	108.82	3046.96	3
7016	121	85	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	49	84.75	4152.75	14
7017	121	88	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	27	51.95	1402.65	9
7018	121	89	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	45	55.30	2488.50	2
7019	121	94	9	2	209	10207	Shipped	2003-12-09	2003-12-17	2003-12-11	28	106.49	2981.72	5
7020	14	8	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	176.63	8124.98	13
7021	14	11	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	26	128.42	3338.92	14
7022	14	13	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	152.26	3045.20	12
7023	14	39	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	24	117.47	2819.28	9
7024	14	42	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	48	96.81	4646.88	11
7025	14	51	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	45	72.85	3278.25	8
7026	14	63	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	35	122.89	4301.15	7
7027	14	72	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	20	80.54	1610.80	2
7028	14	95	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	30	57.99	1739.70	15
7029	14	97	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	38	56.67	2153.46	3
7030	14	99	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	40	73.62	2944.80	10
7031	14	102	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	46	63.61	2926.06	1
7032	14	106	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	37	95.16	3520.92	4
7033	14	107	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	33	95.34	3146.22	5
7034	14	110	13	4	215	10208	Shipped	2004-01-02	2004-01-11	2004-01-04	42	48.05	2018.10	6
7035	78	5	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	39	129.20	5038.80	8
7036	78	37	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	28	82.58	2312.24	6
7037	78	48	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	20	97.40	1948.00	5
7038	78	69	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	43	66.45	2857.35	1
7039	78	75	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	36	56.55	2035.80	2
7040	78	77	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	22	79.67	1752.74	7
7041	78	100	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	33	90.52	2987.16	4
7042	78	109	8	1	218	10209	Shipped	2004-01-09	2004-01-15	2004-01-12	48	44.20	2121.60	3
7043	27	3	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	23	112.99	2598.77	2
7044	27	4	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	34	189.79	6452.86	1
7045	27	22	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	141.92	4399.52	17
7046	27	31	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	50	68.43	3421.50	7
7047	27	32	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	51.48	2059.20	3
7048	27	60	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	27	100.67	2718.09	9
7049	27	62	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	30	63.22	1896.60	4
7050	27	79	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	29	56.64	1642.56	16
7051	27	83	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	40	68.10	2724.00	8
7052	27	86	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	46	84.91	3905.86	5
7053	27	91	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	39	57.10	2226.90	10
7054	27	93	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	43	43.20	1857.60	11
7055	27	98	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	21	87.69	1841.49	12
7056	27	101	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	26	93.74	2437.24	14
7057	27	104	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	25	98.48	2462.00	6
7058	27	105	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	31	64.00	1984.00	13
7059	27	108	21	5	220	10210	Shipped	2004-01-12	2004-01-22	2004-01-20	42	60.70	2549.40	15
7060	95	1	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	90.92	3727.72	14
7061	95	7	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	171.22	7020.02	2
7062	95	10	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	36	126.52	4554.72	13
7063	95	14	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	79.80	2234.40	3
7064	95	43	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	35	73.17	2560.95	5
7065	95	45	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	28	138.17	3868.76	4
7066	95	47	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	46	60.30	2773.80	8
7067	95	54	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	148.80	6100.80	7
7068	95	58	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	25	109.32	2733.00	15
7069	95	66	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	21	62.33	1308.93	11
7070	95	74	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	48	52.66	2527.68	1
7071	95	84	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	22	80.84	1778.48	6
7072	95	87	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	41	39.83	1633.03	9
7073	95	92	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	37	94.91	3511.67	12
7074	95	96	13	4	222	10211	Shipped	2004-01-15	2004-01-25	2004-01-18	40	70.78	2831.20	10
7075	11	12	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	39	99.82	3892.98	16
7076	11	16	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	33	110.55	3648.15	15
7077	11	18	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	29	117.48	3406.92	10
7078	11	21	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	38	105.77	4019.26	6
7079	11	24	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	20	64.68	1293.60	14
7080	11	25	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	133.72	5482.52	9
7081	11	34	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	117.48	4699.20	7
7082	11	40	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	40	155.79	6231.60	11
7083	11	46	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	115.85	5213.25	8
7084	11	56	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	41	61.73	2530.93	3
7085	11	59	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	43.27	1947.15	5
7086	11	67	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	45	81.78	3680.10	1
7087	11	71	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	34	37.38	1270.92	12
7088	11	73	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	27	77.91	2103.57	2
7089	11	76	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	46	100.66	4630.36	4
7090	11	78	14	4	223	10212	Shipped	2004-01-16	2004-01-24	2004-01-18	49	117.96	5780.04	13
7091	120	50	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	38	84.67	3217.46	1
7092	120	55	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	25	58.44	1461.00	2
7093	120	70	16	7	226	10213	Shipped	2004-01-22	2004-01-28	2004-01-27	27	97.48	2631.96	3
7094	107	23	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	30	166.60	4998.00	7
7095	107	27	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	21	53.28	1118.88	6
7096	107	29	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	27	125.86	3398.22	4
7097	107	33	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	50	167.06	8353.00	1
7098	107	61	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	20	32.19	643.80	3
7099	107	64	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	49	39.87	1953.63	2
7100	107	80	23	4	229	10214	Shipped	2004-01-26	2004-02-04	2004-01-29	44	38.57	1697.08	5
7101	113	2	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	35	205.73	7200.55	3
7102	113	17	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	100.34	4615.64	2
7103	113	19	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	27	92.47	2496.69	10
7104	113	20	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	33	53.91	1779.03	9
7105	113	35	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	97.26	4765.74	4
7106	113	36	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	31	56.21	1742.51	6
7107	113	38	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	49	89.01	4361.49	5
7108	113	44	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	41	84.33	3457.53	8
7109	113	53	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	46	42.76	1966.96	1
7110	113	82	8	1	232	10215	Shipped	2004-01-29	2004-02-08	2004-02-01	39	94.47	3684.33	7
7111	52	9	14	4	234	10216	Shipped	2004-02-02	2004-02-10	2004-02-04	43	133.94	5759.42	1
7112	19	6	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	48	132.97	6382.56	4
7113	19	30	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	35	58.34	2041.90	2
7114	19	52	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	38	118.66	4509.08	5
7115	19	65	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	28	103.51	2898.28	1
7116	19	85	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	21	78.97	1658.37	3
7117	19	90	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	39	56.24	2193.36	7
7118	19	103	19	6	235	10217	Shipped	2004-02-04	2004-02-14	2004-02-06	31	90.02	2790.62	6
7119	112	28	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	22	110.46	2430.12	1
7120	112	40	15	4	238	10218	Shipped	2004-02-09	2004-02-16	2004-02-11	34	152.41	5181.94	2
7121	119	15	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	48	94.80	4550.40	2
7122	119	26	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	43	132.62	5702.66	1
7123	119	68	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	21	31.12	653.52	3
7124	119	88	7	1	239	10219	Shipped	2004-02-10	2004-02-17	2004-02-12	35	47.62	1666.70	4
7125	31	8	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	32	189.10	6051.20	2
7126	31	11	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	151.08	4532.40	3
7127	31	13	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	27	166.10	4484.70	1
7128	31	49	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	50	126.39	6319.50	5
7129	31	57	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	26	48.55	1262.30	8
7130	31	81	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	101.72	3763.64	7
7131	31	89	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	20	49.71	994.20	6
7132	31	94	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	37	92.60	3426.20	9
7133	31	95	17	7	241	10220	Shipped	2004-02-12	2004-02-19	2004-02-16	30	56.82	1704.60	4
7134	66	39	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	33	133.86	4417.38	3
7135	66	42	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	89.75	2064.25	5
7136	66	51	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	39	84.26	3286.14	2
7137	66	63	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	49	113.06	5539.94	1
7138	66	99	15	4	245	10221	Shipped	2004-02-18	2004-02-26	2004-02-19	23	69.29	1593.67	4
7139	46	5	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	133.28	6530.72	12
7140	46	22	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	137.19	6722.31	4
7141	46	37	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	49	79.14	3877.86	10
7142	46	48	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	45	88.93	4001.85	9
7143	46	69	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	32	56.86	1819.52	5
7144	46	72	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	47	74.35	3494.45	14
7145	46	75	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	61.15	2629.45	6
7146	46	77	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	46	77.99	3587.54	11
7147	46	79	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	48	55.27	2652.96	3
7148	46	97	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	58.67	1818.77	15
7149	46	100	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	26	80.56	2094.56	8
7150	46	101	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	37	90.75	3357.75	1
7151	46	102	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	69.39	2498.04	13
7152	46	106	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	38	84.14	3197.32	16
7153	46	107	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	81.43	2524.33	17
7154	46	108	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	43	66.63	2865.09	2
7155	46	109	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	31	45.19	1400.89	7
7156	46	110	8	1	246	10222	Shipped	2004-02-19	2004-02-27	2004-02-20	36	48.59	1749.24	18
7157	3	1	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	37	80.39	2974.43	1
7158	3	3	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	110.61	5198.67	4
7159	3	4	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	49	189.79	9299.71	3
7160	3	31	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	47	67.58	3176.26	9
7161	3	32	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	28	58.75	1645.00	5
7162	3	58	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	32	104.81	3353.92	2
7163	3	60	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	34	87.54	2976.36	11
7164	3	62	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	38	60.94	2315.72	6
7165	3	83	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	23	68.10	1566.30	10
7166	3	86	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	21	90.90	1908.90	7
7167	3	91	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	20	66.73	1334.60	12
7168	3	93	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	41	41.02	1681.82	13
7169	3	98	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	25	84.03	2100.75	14
7170	3	104	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	29	113.90	3303.10	8
7171	3	105	18	6	247	10223	Shipped	2004-02-20	2004-02-29	2004-02-24	26	79.20	2059.20	15
7172	23	10	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	141.58	6087.94	6
7173	23	47	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	38	57.20	2173.60	1
7174	23	66	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	37	60.26	2229.62	4
7175	23	87	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	43	37.01	1591.43	2
7176	23	92	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	30	94.91	2847.30	5
7177	23	96	14	4	248	10224	Shipped	2004-02-21	2004-03-02	2004-02-26	50	81.36	4068.00	3
7178	61	7	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	157.60	4255.20	9
7179	61	12	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	25	101.00	2525.00	7
7180	61	14	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	64.64	2391.68	10
7181	61	16	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	21	100.19	2103.99	6
7182	61	18	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	32	116.06	3713.92	1
7183	61	24	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	47	71.61	3365.67	5
7184	61	40	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	43	162.57	6990.51	2
7185	61	43	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	37	69.96	2588.52	12
7186	61	45	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	27	119.06	3214.62	11
7187	61	54	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	35	135.41	4739.35	14
7188	61	71	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	42	34.74	1459.08	3
7189	61	74	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	24	51.43	1234.32	8
7190	61	78	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	40	130.60	5224.00	4
7191	61	84	23	4	249	10225	Shipped	2004-02-22	2004-03-01	2004-02-24	46	77.61	3570.06	13
7192	46	21	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	38	108.26	4113.88	4
7193	46	25	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	129.45	3106.80	7
7194	46	34	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	24	125.40	3009.60	5
7195	46	46	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	46	122.91	5653.86	6
7196	46	56	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	21	65.41	1373.61	1
7197	46	59	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	36	47.79	1720.44	3
7198	46	76	8	1	252	10226	Shipped	2004-02-26	2004-03-06	2004-03-02	48	95.30	4574.40	2
7199	14	19	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	25	85.27	2131.75	3
7200	14	20	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	31	50.14	1554.34	2
7201	14	23	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	26	136.00	3536.00	10
7202	14	27	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	28	59.93	1678.04	9
7203	14	29	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	46	118.23	5438.58	7
7204	14	33	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	29	146.81	4257.49	4
7205	14	44	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	99.21	3273.93	1
7206	14	50	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	34	87.43	2972.62	11
7207	14	55	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	37	70.56	2610.72	12
7208	14	61	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	42	27.22	1143.24	6
7209	14	64	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	24	39.42	946.08	5
7210	14	67	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	47	84.51	3971.97	14
7211	14	70	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	33	102.17	3371.61	13
7212	14	73	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	40	78.76	3150.40	15
7213	14	80	13	4	256	10227	Shipped	2004-03-02	2004-03-12	2004-03-08	27	34.88	941.76	8
7214	25	2	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	29	214.30	6214.70	2
7215	25	17	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	32	100.34	3210.88	1
7216	25	35	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	24	101.31	2431.44	3
7217	25	36	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	45	57.46	2585.70	5
7218	25	38	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	31	100.53	3116.43	4
7219	25	82	9	2	259	10228	Shipped	2004-03-10	2004-03-18	2004-03-13	33	84.73	2796.09	6
7220	6	6	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	138.88	6944.00	9
7221	6	9	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	110.70	2767.50	13
7222	6	15	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	36	95.99	3455.64	1
7223	6	28	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	26	104.32	2712.32	4
7224	6	30	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	28	53.48	1497.44	7
7225	6	40	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	22	157.49	3464.78	5
7226	6	52	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	41	119.87	4914.67	10
7227	6	53	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	39	43.77	1707.03	14
7228	6	65	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	48	115.01	5520.48	6
7229	6	68	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	33	34.65	1143.45	2
7230	6	85	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	25	78.97	1974.25	8
7231	6	88	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	23	49.78	1144.94	3
7232	6	90	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	30	52.36	1570.80	12
7233	6	103	7	1	260	10229	Shipped	2004-03-11	2004-03-20	2004-03-12	50	91.04	4552.00	11
7234	8	11	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	128.42	5522.06	1
7235	8	26	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	49	153.91	7541.59	8
7236	8	49	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	42	142.18	5971.56	3
7237	8	57	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	36	47.40	1706.40	6
7238	8	81	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	45	99.36	4471.20	5
7239	8	89	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	46	59.03	2715.38	4
7240	8	94	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	34	100.70	3423.80	7
7241	8	95	17	7	263	10230	Shipped	2004-03-15	2004-03-24	2004-03-20	43	57.41	2468.63	2
7242	77	8	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	42	193.25	8116.50	2
7243	77	13	23	4	266	10231	Shipped	2004-03-19	2004-03-26	2004-03-25	49	147.07	7206.43	1
7244	47	39	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	22	133.86	2944.92	6
7245	47	42	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	97.81	4694.88	8
7246	47	51	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	23	78.12	1796.76	5
7247	47	63	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	46	113.06	5200.76	4
7248	47	99	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	26	84.88	2206.88	7
7249	47	106	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	48	86.15	4135.20	1
7250	47	107	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	35	81.43	2850.05	2
7251	47	110	16	7	267	10232	Shipped	2004-03-20	2004-03-30	2004-03-25	24	48.59	1166.16	3
7252	72	72	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	40	70.81	2832.40	2
7253	72	97	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	36	66.00	2376.00	3
7254	72	102	12	3	271	10233	Shipped	2004-03-29	2004-04-04	2004-04-02	29	67.94	1970.26	1
7255	97	5	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	118.32	5679.36	9
7256	97	22	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	50	146.65	7332.50	1
7257	97	37	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	48	84.30	4046.40	7
7258	97	48	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	39	85.75	3344.25	6
7259	97	69	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	44	67.14	2954.16	2
7260	97	75	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	25	65.09	1627.25	3
7261	97	77	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	31	78.83	2443.73	8
7262	97	100	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	29	83.28	2415.12	5
7263	97	109	19	6	272	10234	Shipped	2004-03-30	2004-04-05	2004-04-02	40	45.69	1827.60	4
7264	54	31	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	24	81.95	1966.80	3
7265	54	60	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	23	89.72	2063.56	5
7266	54	79	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	33	55.27	1823.91	12
7267	54	83	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	40	63.03	2521.20	4
7268	54	86	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	90.90	3726.90	1
7269	54	91	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	66.73	2268.82	6
7270	54	93	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	41	37.09	1520.69	7
7271	54	98	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	88.60	2215.00	8
7272	54	101	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	38	92.74	3524.12	10
7273	54	104	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	25	116.28	2907.00	2
7274	54	105	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	32	73.60	2355.20	9
7275	54	108	12	3	273	10235	Shipped	2004-04-02	2004-04-12	2004-04-06	34	70.33	2391.22	11
7276	118	3	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	22	105.86	2328.92	1
7277	118	32	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	23	52.70	1212.10	2
7278	118	62	12	3	274	10236	Shipped	2004-04-03	2004-04-11	2004-04-08	36	65.51	2358.36	3
7279	28	1	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	23	91.87	2113.01	7
7280	28	4	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	39	158.80	6193.20	9
7281	28	10	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	32	129.53	4144.96	6
7282	28	47	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	49.74	1293.24	1
7283	28	58	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	109.32	2186.40	8
7284	28	66	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	62.33	1620.58	4
7285	28	87	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	26	35.00	910.00	2
7286	28	92	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	27	94.91	2562.57	5
7287	28	96	11	3	276	10237	Shipped	2004-04-05	2004-04-12	2004-04-10	20	78.92	1578.40	3
7288	13	7	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	28	161.49	4521.72	3
7289	13	12	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	29	104.52	3031.08	1
7290	13	14	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	20	73.42	1468.40	4
7291	13	43	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	41	68.35	2802.35	6
7292	13	45	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	49	144.05	7058.45	5
7293	13	54	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	44	120.53	5303.32	8
7294	13	74	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	47	53.88	2532.36	2
7295	13	84	15	4	279	10238	Shipped	2004-04-09	2004-04-16	2004-04-10	22	67.91	1494.02	7
7296	65	16	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	21	100.19	2103.99	5
7297	65	24	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	46	70.07	3223.22	4
7298	65	40	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	47	135.47	6367.09	1
7299	65	71	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	20	32.47	649.40	2
7300	65	78	16	7	282	10239	Shipped	2004-04-12	2004-04-21	2004-04-17	29	133.41	3868.89	3
7301	27	18	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	41	125.97	5164.77	3
7302	27	25	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	136.56	5052.72	2
7303	27	46	21	5	283	10240	Shipped	2004-04-13	2004-04-20	2004-04-20	37	134.22	4966.14	1
7304	38	21	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	119.46	2508.66	11
7305	38	23	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	41	153.00	6273.00	2
7306	38	27	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	33	55.70	1838.10	1
7307	38	34	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	44	126.72	5575.68	12
7308	38	50	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	42	77.31	3247.02	3
7309	38	55	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	30	62.72	1881.60	4
7310	38	56	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	22	72.02	1584.44	8
7311	38	59	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	21	47.29	993.09	10
7312	38	67	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	47	89.05	4185.35	6
7313	38	70	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	28	117.44	3288.32	5
7314	38	73	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	26	69.34	1802.84	7
7315	38	76	14	4	283	10241	Shipped	2004-04-13	2004-04-20	2004-04-19	27	107.08	2891.16	9
7316	106	80	11	3	288	10242	Shipped	2004-04-20	2004-04-28	2004-04-25	46	36.52	1679.92	1
7317	121	29	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	47	111.87	5257.89	2
7318	121	61	9	2	291	10243	Shipped	2004-04-26	2004-05-03	2004-04-28	33	30.87	1018.71	1
7319	11	19	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	99.66	3986.40	7
7320	11	20	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	20	48.52	970.40	6
7321	11	33	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	43	141.75	6095.25	8
7322	11	35	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	30	87.13	2613.90	1
7323	11	36	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	24	54.96	1319.04	3
7324	11	38	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	29	85.87	2490.23	2
7325	11	44	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	36	87.30	3142.80	5
7326	11	64	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	39	42.11	1642.29	9
7327	11	82	14	4	293	10244	Shipped	2004-04-29	2004-05-09	2004-05-04	40	97.39	3895.60	4
7328	105	2	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	34	195.01	6630.34	9
7329	105	6	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	28	147.74	4136.72	2
7330	105	9	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	38	120.27	4570.26	6
7331	105	17	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	29	114.34	3315.86	8
7332	105	52	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	21	111.39	2339.19	3
7333	105	53	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	45	48.80	2196.00	7
7334	105	85	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	37	81.86	3028.82	1
7335	105	90	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	54.94	2417.36	5
7336	105	103	11	3	295	10245	Shipped	2004-05-04	2004-05-12	2004-05-09	44	81.93	3604.92	4
7337	11	15	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	99.54	4578.84	5
7338	11	26	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	40	144.08	5763.20	4
7339	11	28	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	100.64	2214.08	8
7340	11	30	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	30	57.73	1731.90	11
7341	11	40	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	36	145.63	5242.68	9
7342	11	57	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	44	46.24	2034.56	2
7343	11	65	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	29	118.84	3446.36	10
7344	11	68	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	49	34.65	1697.85	6
7345	11	81	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	46	100.54	4624.84	1
7346	11	88	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	35	45.45	1590.75	7
7347	11	94	14	4	296	10246	Shipped	2004-05-05	2004-05-13	2004-05-06	22	113.44	2495.68	3
7348	74	8	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	44	195.33	8594.52	2
7349	74	11	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	25	140.50	3512.50	3
7350	74	13	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	27	167.83	4531.41	1
7351	74	49	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	48	143.62	6893.76	5
7352	74	89	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	40	58.41	2336.40	6
7353	74	95	16	7	296	10247	Shipped	2004-05-05	2004-05-11	2004-05-08	49	51.55	2525.95	4
7354	10	5	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	20	126.48	2529.60	3
7355	10	37	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	21	80.86	1698.06	1
7356	10	39	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	133.86	4283.52	12
7357	10	42	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	95.80	4023.60	14
7358	10	51	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	42	87.77	3686.34	11
7359	10	63	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	48	122.89	5898.72	10
7360	10	72	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	85.85	2575.50	5
7361	10	77	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	83.02	1909.46	2
7362	10	97	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	36	66.00	2376.00	6
7363	10	99	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	40	81.41	3256.40	13
7364	10	102	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	32	69.39	2220.48	4
7365	10	106	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	30	84.14	2524.20	7
7366	10	107	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	35	92.36	3232.60	8
7367	10	110	12	3	298	10248	Cancelled	2004-05-07	2004-05-14	\N	23	53.51	1230.73	9
7368	25	48	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	46	88.93	4090.78	5
7369	25	69	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	20	54.81	1096.20	1
7370	25	75	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	25	65.75	1643.75	2
7371	25	100	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	40	85.99	3439.60	4
7372	25	109	9	2	299	10249	Shipped	2004-05-08	2004-05-17	2004-05-11	32	49.16	1573.12	3
7373	103	22	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	45	148.23	6670.35	14
7374	103	31	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	27	84.48	2280.96	4
7375	103	60	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	95.20	2951.20	6
7376	103	62	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	32	63.22	2023.04	1
7377	103	79	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	40	61.42	2456.80	13
7378	103	83	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	37	72.45	2680.65	5
7379	103	86	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	99.89	3096.59	2
7380	103	91	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	50	62.60	3130.00	7
7381	103	93	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	36	36.66	1319.76	8
7382	103	98	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	31	91.34	2831.54	9
7383	103	101	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	35	90.75	3176.25	11
7384	103	104	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	98.48	4333.12	3
7385	103	105	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	44	76.00	3344.00	10
7386	103	108	7	1	301	10250	Shipped	2004-05-11	2004-05-19	2004-05-15	38	65.89	2503.82	12
7387	72	1	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	59	93.79	5533.61	2
7388	72	3	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	115.37	5076.28	5
7389	72	4	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	43	172.36	7411.48	4
7390	72	10	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	46	129.53	5958.38	1
7391	72	32	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	44	58.15	2558.60	6
7392	72	58	12	3	307	10251	Shipped	2004-05-18	2004-05-24	2004-05-24	50	91.29	4564.50	3
7393	95	43	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	20	74.78	1495.60	2
7394	95	45	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	41	145.52	5966.32	1
7395	95	47	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	31	50.36	1561.16	5
7396	95	54	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	26	127.97	3327.22	4
7397	95	66	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	47	63.03	2962.41	8
7398	95	84	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	38	69.52	2641.76	3
7399	95	87	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	36	36.21	1303.56	6
7400	95	92	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	25	93.89	2347.25	9
7401	95	96	13	4	311	10252	Shipped	2004-05-26	2004-06-04	2004-05-29	48	72.41	3475.68	7
7402	33	7	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	157.60	3782.40	13
7403	33	12	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	22	102.17	2247.74	11
7404	33	14	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	25	67.03	1675.75	14
7405	33	16	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	41	109.40	4485.40	10
7406	33	18	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	26	130.22	3385.72	5
7407	33	21	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	103.29	2478.96	1
7408	33	24	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	23	67.76	1558.48	9
7409	33	25	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	33	130.87	4318.71	4
7410	33	34	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	37	114.84	4249.08	2
7411	33	40	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	145.63	5825.20	6
7412	33	46	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	31	139.87	4335.97	3
7413	33	71	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	40	34.74	1389.60	7
7414	33	74	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	24	50.82	1219.68	12
7415	33	78	16	7	313	10253	Cancelled	2004-06-01	2004-06-09	2004-06-02	39	115.15	4490.85	8
7416	70	23	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	137.70	6747.30	5
7417	70	27	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	36	55.09	1983.24	4
7418	70	29	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	41	102.98	4222.18	2
7419	70	50	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	80.99	2753.66	6
7420	70	55	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	30	59.87	1796.10	7
7421	70	56	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	34	66.88	2273.92	11
7422	70	59	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	32	43.27	1384.64	13
7423	70	61	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	38	28.88	1097.44	1
7424	70	67	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	31	85.42	2648.02	9
7425	70	70	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	33	111.57	3681.81	8
7426	70	73	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	42	69.34	2912.28	10
7427	70	76	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	49	101.73	4984.77	12
7428	70	80	19	6	315	10254	Shipped	2004-06-03	2004-06-13	2004-06-04	20	39.80	796.00	3
7429	38	33	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	24	135.00	3240.00	1
7430	38	64	14	4	316	10255	Shipped	2004-06-04	2004-06-12	2004-06-09	37	37.63	1392.31	2
7431	13	19	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	34	93.49	3178.66	2
7432	13	20	15	4	317	10256	Shipped	2004-06-08	2004-06-16	2004-06-10	29	52.83	1532.07	1
7433	103	35	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	50	92.19	4609.50	1
7434	103	36	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	49	59.34	2907.66	3
7435	103	38	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	37	83.78	3099.86	2
7436	103	44	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	26	91.27	2373.02	5
7437	103	82	7	1	322	10257	Shipped	2004-06-14	2004-06-24	2004-06-15	46	81.81	3763.26	4
7438	94	2	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	32	177.87	5691.84	6
7439	94	9	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	133.94	5491.54	3
7440	94	17	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	41	113.17	4639.97	5
7441	94	53	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	21	49.81	1046.01	4
7442	94	90	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	20	62.70	1254.00	2
7443	94	103	21	5	323	10258	Shipped	2004-06-15	2004-06-25	2004-06-23	45	86.99	3914.55	1
7444	19	6	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	26	121.15	3149.90	12
7445	19	15	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	46	117.32	5396.72	4
7446	19	26	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	134.26	4027.80	3
7447	19	28	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	34	120.28	4089.52	7
7448	19	30	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	30	59.55	1786.50	10
7449	19	40	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	27	152.41	4115.07	8
7450	19	52	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	41	107.76	4418.16	13
7451	19	57	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	28	46.82	1310.96	1
7452	19	65	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	47	121.40	5705.80	9
7453	19	68	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	31	31.47	975.57	5
7454	19	85	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	45	95.35	4290.75	11
7455	19	88	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	40	45.99	1839.60	6
7456	19	94	19	6	323	10259	Shipped	2004-06-15	2004-06-22	2004-06-17	29	105.33	3054.57	2
7457	83	8	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	46	180.79	8316.34	5
7458	83	11	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	30	140.50	4215.00	6
7459	83	13	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	44	169.56	7460.64	4
7460	83	39	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	32	121.57	3890.24	1
7461	83	42	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	29	92.77	2690.33	3
7462	83	49	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	137.88	3171.24	8
7463	83	81	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	23	117.10	2693.30	10
7464	83	89	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	27	55.30	1493.10	9
7465	83	95	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	21	56.24	1181.04	7
7466	83	99	19	6	324	10260	Cancelled	2004-06-16	2004-06-22	\N	33	80.55	2658.15	2
7467	44	5	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	27	116.96	3157.92	1
7468	44	51	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	20	80.75	1615.00	9
7469	44	63	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	36	105.69	3804.84	8
7470	44	72	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	22	79.66	1752.52	3
7471	44	97	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	34	64.00	2176.00	4
7472	44	102	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	44	58.55	2576.20	2
7473	44	106	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	25	89.15	2228.75	5
7474	44	107	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	50	88.39	4419.50	6
7475	44	110	11	3	325	10261	Shipped	2004-06-17	2004-06-25	2004-06-22	29	43.68	1266.72	7
7476	11	22	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	157.69	7726.81	9
7477	11	37	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	32	81.72	2615.04	15
7478	11	48	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	85.75	2915.50	14
7479	11	60	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	34	98.48	3348.32	1
7480	11	69	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	24	63.71	1529.04	10
7481	11	75	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	46	65.75	3024.50	11
7482	11	77	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	82.18	4026.82	16
7483	11	79	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	48	58.69	2817.12	8
7484	11	91	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	63.97	2558.80	2
7485	11	93	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	49	35.78	1753.22	3
7486	11	98	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	40	87.69	3507.60	4
7487	11	100	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	44	83.28	3664.32	13
7488	11	101	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	33	81.77	2698.41	6
7489	11	105	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	27	64.80	1749.60	5
7490	11	108	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	35	64.41	2254.35	7
7491	11	109	14	4	329	10262	Cancelled	2004-06-24	2004-07-01	\N	21	41.71	875.91	12
7492	26	1	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	89.00	3026.00	2
7493	26	3	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	40	107.05	4282.00	5
7494	26	4	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	41	193.66	7940.06	4
7495	26	10	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	48	123.51	5928.48	1
7496	26	31	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	33	67.58	2230.14	10
7497	26	32	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	34	50.27	1709.18	6
7498	26	58	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	42	109.32	4591.44	3
7499	26	62	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	37	67.03	2480.11	7
7500	26	83	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	24	59.41	1425.84	11
7501	26	86	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	31	93.90	2910.90	8
7502	26	104	12	3	331	10263	Shipped	2004-06-28	2004-07-04	2004-07-02	47	117.46	5520.62	9
7503	85	47	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	48	58.44	2805.12	3
7504	85	54	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	124.99	2499.80	2
7505	85	66	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	37	61.64	2280.68	6
7506	85	84	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	75.18	3533.46	1
7507	85	87	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	20	39.02	780.40	4
7508	85	92	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	34	100.01	3400.34	7
7509	85	96	10	2	332	10264	Shipped	2004-06-30	2004-07-06	2004-07-01	47	67.53	3173.91	5
7510	111	43	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	45	74.78	3365.10	2
7511	111	45	18	6	334	10265	Shipped	2004-07-02	2004-07-09	2004-07-07	49	123.47	6050.03	1
7512	93	7	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	44	188.73	8304.12	14
7513	93	12	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	22	110.39	2428.58	12
7514	93	14	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	35	67.83	2374.05	15
7515	93	16	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	40	112.86	4514.40	11
7516	93	18	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	21	131.63	2764.23	6
7517	93	21	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	36	99.55	3583.80	2
7518	93	24	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	77.00	2541.00	10
7519	93	25	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	49	139.41	6831.09	5
7520	93	34	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	20	113.52	2270.40	3
7521	93	40	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	29	137.17	3977.93	7
7522	93	46	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	33	127.15	4195.95	4
7523	93	59	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	28	40.25	1127.00	1
7524	93	71	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	34	35.12	1194.08	8
7525	93	74	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	47	56.33	2647.51	13
7526	93	78	15	4	336	10266	Shipped	2004-07-06	2004-07-14	2004-07-10	24	119.37	2864.88	9
7527	16	55	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	36	71.27	2565.72	1
7528	16	56	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	40	72.02	2880.80	5
7529	16	67	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	38	76.33	2900.54	3
7530	16	70	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	93.95	4039.85	2
7531	16	73	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	44	83.90	3691.60	4
7532	16	76	11	3	337	10267	Shipped	2004-07-07	2004-07-17	2004-07-09	43	98.51	4235.93	6
7533	97	19	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	49	93.49	4581.01	3
7534	97	20	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	26	45.82	1191.32	2
7535	97	23	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	34	164.90	5606.60	10
7536	97	27	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	31	60.54	1876.74	9
7537	97	29	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	50	124.59	6229.50	7
7538	97	33	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	148.50	5197.50	4
7539	97	44	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	39	96.23	3752.97	1
7540	97	50	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	35	84.67	2963.45	11
7541	97	61	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	33	31.86	1051.38	6
7542	97	64	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	40	36.29	1451.60	5
7543	97	80	19	6	340	10268	Shipped	2004-07-12	2004-07-18	2004-07-14	30	37.75	1132.50	8
7544	91	36	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	32	57.46	1838.72	1
7545	91	82	15	4	342	10269	Shipped	2004-07-16	2004-07-22	2004-07-18	48	95.44	4581.12	2
7546	58	2	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	171.44	3600.24	9
7547	58	6	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	124.10	3971.20	2
7548	58	9	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	28	135.30	3788.40	6
7549	58	17	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	43	94.50	4063.50	8
7550	58	35	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	31	81.05	2512.55	10
7551	58	38	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	85.87	3263.06	11
7552	58	52	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	38	107.76	4094.88	3
7553	58	53	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	44	40.25	1771.00	7
7554	58	85	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	32	93.42	2989.44	1
7555	58	90	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	21	52.36	1099.56	5
7556	58	103	18	6	345	10270	Shipped	2004-07-19	2004-07-27	2004-07-24	46	101.15	4652.90	4
7557	6	15	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	31	99.54	3085.74	5
7558	6	26	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	147.36	7368.00	4
7559	6	28	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	50	121.50	6075.00	8
7560	6	30	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	25	59.55	1488.75	11
7561	6	40	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	20	169.34	3386.80	9
7562	6	57	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	45	49.71	2236.95	2
7563	6	65	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	43	122.68	5275.24	10
7564	6	68	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	38	28.64	1088.32	6
7565	6	81	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	22	110.00	2420.00	1
7566	6	88	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	35	51.95	1818.25	7
7567	6	94	7	1	346	10271	Shipped	2004-07-20	2004-07-29	2004-07-23	34	93.76	3187.84	3
7568	17	8	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	35	187.02	6545.70	2
7569	17	11	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	27	123.89	3345.03	3
7570	17	13	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	39	148.80	5803.20	1
7571	17	49	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	25	126.39	3159.75	5
7572	17	89	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	45	56.55	2544.75	6
7573	17	95	10	2	346	10272	Shipped	2004-07-20	2004-07-26	2004-07-22	43	53.89	2317.27	4
7574	66	5	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	30	136.00	4080.00	4
7575	66	37	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	34	84.30	2866.20	2
7576	66	39	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	117.47	4698.80	13
7577	66	42	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	47	87.73	4123.31	15
7578	66	48	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	50	105.87	5293.50	1
7579	66	51	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	33	72.85	2404.05	12
7580	66	63	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	22	103.23	2271.06	11
7581	66	72	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	27	84.08	2270.16	6
7582	66	77	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	48	83.86	4025.28	3
7583	66	97	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	66.00	1386.00	7
7584	66	99	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	21	77.95	1636.95	14
7585	66	102	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	42	57.82	2428.44	5
7586	66	106	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	40	91.15	3646.00	8
7587	66	107	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	26	89.38	2323.88	9
7588	66	110	15	4	347	10273	Shipped	2004-07-21	2004-07-28	2004-07-22	37	51.32	1898.84	10
7589	89	22	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	41	129.31	5301.71	1
7590	89	69	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	40	56.86	2274.40	2
7591	89	75	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	65.09	1562.16	3
7592	89	100	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	24	75.13	1803.12	5
7593	89	109	9	2	347	10274	Shipped	2004-07-21	2004-07-29	2004-07-22	32	49.66	1589.12	4
7594	4	1	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	45	81.35	3660.75	1
7595	4	3	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	22	115.37	2538.14	4
7596	4	4	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	36	154.93	5577.48	3
7597	4	31	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	35	70.12	2454.20	9
7598	4	32	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	37	52.09	1927.33	5
7599	4	58	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	21	105.94	2224.74	2
7600	4	60	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	25	97.38	2434.50	11
7601	4	62	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	30	61.70	1851.00	6
7602	4	79	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	41	58.00	2378.00	18
7603	4	83	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	27	67.38	1819.26	10
7604	4	86	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	23	89.90	2067.70	7
7605	4	91	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	28	58.47	1637.16	12
7606	4	93	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	38	40.15	1525.70	13
7607	4	98	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	32	85.86	2747.52	14
7608	4	101	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	39	82.77	3228.03	16
7609	4	104	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	48	102.04	4897.92	8
7610	4	105	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	43	72.00	3096.00	15
7611	4	108	14	4	349	10275	Shipped	2004-07-23	2004-08-02	2004-07-29	31	59.96	1858.76	17
7612	35	7	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	50	184.84	9242.00	3
7613	35	10	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	43	150.62	6476.66	14
7614	35	12	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	47	104.52	4912.44	1
7615	35	14	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	67.83	2577.54	4
7616	35	43	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	78.00	2964.00	6
7617	35	45	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	30	139.64	4189.20	5
7618	35	47	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	33	54.71	1805.43	9
7619	35	54	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	120.53	5785.44	8
7620	35	66	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	46	61.64	2835.44	12
7621	35	74	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	20	58.17	1163.40	2
7622	35	84	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	48	67.10	3220.80	7
7623	35	87	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	27	35.40	955.80	10
7624	35	92	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	38	94.91	3606.58	13
7625	35	96	9	2	356	10276	Shipped	2004-08-02	2004-08-11	2004-08-08	21	67.53	1418.13	11
7626	15	16	21	5	357	10277	Shipped	2004-08-04	2004-08-12	2004-08-05	28	93.28	2611.84	1
7627	2	18	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	34	114.65	3898.10	6
7628	2	21	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	23	107.02	2461.46	2
7629	2	24	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	73.15	2121.35	10
7630	2	25	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	29	118.07	3424.03	5
7631	2	34	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	39	117.48	4581.72	3
7632	2	40	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	42	167.65	7041.30	7
7633	2	46	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	114.44	3547.64	4
7634	2	59	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	35	48.80	1708.00	1
7635	2	71	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	31	37.38	1158.78	8
7636	2	78	8	1	359	10278	Shipped	2004-08-06	2004-08-16	2004-08-09	25	136.22	3405.50	9
7637	11	55	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	26	68.42	1778.92	1
7638	11	56	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	32	68.35	2187.20	5
7639	11	67	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	49	76.33	3740.17	3
7640	11	70	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	106.87	5129.76	2
7641	11	73	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	33	78.76	2599.08	4
7642	11	76	14	4	361	10279	Shipped	2004-08-09	2004-08-19	2004-08-15	48	95.30	4574.40	6
7643	50	2	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	205.73	6994.82	2
7644	50	17	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	24	98.00	2352.00	1
7645	50	19	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	50	87.33	4366.50	9
7646	50	20	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	27	47.44	1280.88	8
7647	50	23	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	26	161.50	4199.00	16
7648	50	27	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	25	53.28	1332.00	15
7649	50	29	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	37	109.33	4045.21	13
7650	50	33	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	22	158.63	3489.86	10
7651	50	35	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	46	82.06	3774.76	3
7652	50	36	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	43	54.34	2336.62	5
7653	50	38	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	29	102.63	2976.27	4
7654	50	44	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	34	99.21	3373.14	7
7655	50	50	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	35	77.31	2705.85	17
7656	50	61	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	20	29.87	597.40	12
7657	50	64	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	45	36.29	1633.05	11
7658	50	80	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	33	35.29	1164.57	14
7659	50	82	15	4	366	10280	Shipped	2004-08-17	2004-08-27	2004-08-19	21	79.86	1677.06	6
7660	17	6	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	132.97	5850.68	9
7661	17	9	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	127.10	3177.50	13
7662	17	15	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	41	98.36	4032.76	1
7663	17	28	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	48	114.14	5478.72	4
7664	17	30	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	56.52	1639.08	7
7665	17	40	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	135.47	3386.75	5
7666	17	52	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	96.86	2421.50	10
7667	17	53	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	44	42.76	1881.44	14
7668	17	65	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	25	112.46	2811.50	6
7669	17	68	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	20	33.95	679.00	2
7670	17	85	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	29	80.90	2346.10	8
7671	17	88	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	31	44.91	1392.21	3
7672	17	90	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	36	59.47	2140.92	12
7673	17	103	10	2	367	10281	Shipped	2004-08-19	2004-08-28	2004-08-23	27	89.01	2403.27	11
7674	6	8	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	41	176.63	7241.83	5
7675	6	11	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	27	142.02	3834.54	6
7676	6	13	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	24	169.56	4069.44	4
7677	6	26	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	23	147.36	3389.28	13
7678	6	39	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	122.93	5285.99	1
7679	6	42	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	88.74	3194.64	3
7680	6	49	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	31	132.13	4096.03	8
7681	6	57	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	29	49.71	1441.59	11
7682	6	81	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	39	96.99	3782.61	10
7683	6	89	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	36	51.58	1856.88	9
7684	6	94	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	38	114.59	4354.42	12
7685	6	95	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	37	56.24	2080.88	7
7686	6	99	7	1	368	10282	Shipped	2004-08-20	2004-08-26	2004-08-22	43	77.95	3351.85	2
7687	54	5	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	25	130.56	3264.00	6
7688	54	37	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	21	78.28	1643.88	4
7689	54	48	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	46	100.58	4626.68	3
7690	54	51	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	71.97	2446.98	14
7691	54	63	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	42	99.54	4180.68	13
7692	54	72	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	34	80.54	2738.36	8
7693	54	77	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	77.15	2545.95	5
7694	54	97	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	45	62.00	2790.00	9
7695	54	100	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	20	74.23	1484.60	2
7696	54	102	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	47	68.67	3227.49	7
7697	54	106	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	22	88.15	1939.30	10
7698	54	107	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	38	85.41	3245.58	11
7699	54	109	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	43	41.22	1772.46	1
7700	54	110	12	3	368	10283	Shipped	2004-08-20	2004-08-30	2004-08-23	33	49.14	1621.62	12
7701	62	22	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	137.19	6173.55	11
7702	62	31	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	31	68.43	2121.33	1
7703	62	60	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	22	101.76	2238.72	3
7704	62	69	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	30	65.08	1952.40	12
7705	62	75	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	39	59.83	2333.37	13
7706	62	79	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	65.51	1375.71	10
7707	62	83	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	21	66.65	1399.65	2
7708	62	91	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	50	60.54	3027.00	4
7709	62	93	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	33	35.78	1180.74	5
7710	62	98	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	24	87.69	2104.56	6
7711	62	101	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	45	95.73	4307.85	8
7712	62	105	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	25	68.00	1700.00	7
7713	62	108	17	7	369	10284	Shipped	2004-08-21	2004-08-29	2004-08-26	32	73.29	2345.28	9
7714	59	1	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	36	95.70	3445.20	6
7715	59	3	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	47	110.61	5198.67	9
7716	59	4	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	27	166.55	4496.85	8
7717	59	10	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	49	131.04	6420.96	5
7718	59	32	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	20	50.88	1017.60	10
7719	59	58	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	34	91.29	3103.86	7
7720	59	62	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	61.70	2406.30	11
7721	59	66	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	38	64.41	2447.58	3
7722	59	86	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	82.91	3067.67	12
7723	59	87	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	37	36.61	1354.57	1
7724	59	92	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	26	100.01	2600.26	4
7725	59	96	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	39	76.48	2982.72	2
7726	59	104	10	2	374	10285	Shipped	2004-08-27	2004-09-04	2004-08-31	45	102.04	4591.80	13
7727	24	47	13	4	375	10286	Shipped	2004-08-28	2004-09-06	2004-09-01	38	51.60	1960.80	1
7728	61	7	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	21	190.68	4004.28	12
7729	61	12	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	45	117.44	5284.80	10
7730	61	14	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	74.21	3042.61	13
7731	61	16	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	23	107.10	2463.30	9
7732	61	18	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	41	113.23	4642.43	4
7733	61	24	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	61.60	2710.40	8
7734	61	25	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	24	123.76	2970.24	3
7735	61	34	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	44	114.84	5052.96	1
7736	61	40	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.17	4938.12	5
7737	61	43	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	43	68.35	2939.05	15
7738	61	45	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	127.88	5115.20	14
7739	61	46	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	27	139.87	3776.49	2
7740	61	54	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	34	119.04	4047.36	17
7741	61	71	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	31.34	1128.24	6
7742	61	74	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	20	58.17	1163.40	11
7743	61	78	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	36	137.62	4954.32	7
7744	61	84	23	4	377	10287	Shipped	2004-08-30	2004-09-06	2004-09-01	40	79.22	3168.80	16
7745	19	21	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	20	120.71	2414.20	14
7746	19	23	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	32	168.30	5385.60	5
7747	19	27	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	28	50.25	1407.00	4
7748	19	29	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	31	102.98	3192.38	2
7749	19	50	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	90.19	3156.65	6
7750	19	55	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	23	57.02	1311.46	7
7751	19	56	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	36	66.88	2407.68	11
7752	19	59	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	50	49.30	2465.00	13
7753	19	61	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	29	32.19	933.51	1
7754	19	67	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	35	81.78	2862.30	9
7755	19	70	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	48	109.22	5242.56	8
7756	19	73	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	34	76.19	2590.46	10
7757	19	76	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	41	101.73	4170.93	12
7758	19	80	19	6	379	10288	Shipped	2004-09-01	2004-09-11	2004-09-05	33	37.75	1245.75	3
7759	20	19	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	38	92.47	3513.86	2
7760	20	20	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	24	44.75	1074.00	1
7761	20	33	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	43	141.75	6095.25	3
7762	20	64	17	7	380	10289	Shipped	2004-09-03	2004-09-13	2004-09-04	45	41.22	1854.90	4
7763	32	44	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	26	80.36	2089.36	2
7764	32	82	10	2	384	10290	Shipped	2004-09-07	2004-09-15	2004-09-13	45	83.76	3769.20	1
7765	102	2	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	210.01	7770.37	11
7766	102	6	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	30	141.83	4254.90	4
7767	102	9	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	123.00	5043.00	8
7768	102	17	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	41	96.84	3970.44	10
7769	102	30	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	52.26	1358.76	2
7770	102	35	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	47	99.28	4666.16	12
7771	102	36	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	37	56.21	2079.77	14
7772	102	38	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	23	93.20	2143.60	13
7773	102	52	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	96.86	4649.28	5
7774	102	53	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	29	45.28	1313.12	9
7775	102	65	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	48	109.90	5275.20	1
7776	102	85	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	26	82.83	2153.58	3
7777	102	90	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	32	53.00	1696.00	7
7778	102	103	17	7	385	10291	Shipped	2004-09-08	2004-09-17	2004-09-14	28	86.99	2435.72	6
7779	10	15	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	94.80	1990.80	8
7780	10	26	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	26	140.81	3661.06	7
7781	10	28	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	103.09	4226.69	11
7782	10	40	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	21	147.33	3093.93	12
7783	10	49	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	44	114.90	5055.60	2
7784	10	57	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	40	48.55	1942.00	5
7785	10	68	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	39	34.30	1337.70	9
7786	10	81	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	27	113.55	3065.85	4
7787	10	88	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	50	54.11	2705.50	10
7788	10	89	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	31	59.65	1849.15	3
7789	10	94	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	41	113.44	4651.04	6
7790	10	95	12	3	385	10292	Shipped	2004-09-08	2004-09-18	2004-09-11	35	49.79	1742.65	1
7791	50	8	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	46	187.02	8602.92	8
7792	50	11	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	129.93	3118.32	9
7793	50	13	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	45	171.29	7708.05	7
7794	50	39	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	24	110.64	2655.36	4
7795	50	42	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	22	91.76	2018.72	6
7796	50	51	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	49	72.85	3569.65	3
7797	50	63	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	21	111.83	2348.43	2
7798	50	99	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	29	77.95	2260.55	5
7799	50	110	15	4	386	10293	Shipped	2004-09-09	2004-09-18	2004-09-14	32	51.32	1642.24	1
7800	35	107	9	2	387	10294	Shipped	2004-09-10	2004-09-17	2004-09-14	45	98.32	4424.40	1
7801	85	5	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	24	136.00	3264.00	1
7802	85	72	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	46	84.08	3867.68	3
7803	85	97	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	26	62.00	1612.00	4
7804	85	102	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	44	71.56	3148.64	2
7805	85	106	10	2	387	10295	Shipped	2004-09-10	2004-09-17	2004-09-14	34	93.16	3167.44	5
7806	98	22	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	36	146.65	5279.40	7
7807	98	37	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	69.68	1463.28	13
7808	98	48	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	105.87	2329.14	12
7809	98	69	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	60.97	1280.37	8
7810	98	75	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	31	63.78	1977.18	9
7811	98	77	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	83.02	1826.44	14
7812	98	79	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	32	63.46	2030.72	6
7813	98	93	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	26	41.02	1066.52	1
7814	98	98	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	42	75.81	3184.02	2
7815	98	100	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	34	89.61	3046.74	11
7816	98	101	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	24	96.73	2321.52	4
7817	98	105	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	22	74.40	1636.80	3
7818	98	108	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	47	61.44	2887.68	5
7819	98	109	17	7	391	10296	Shipped	2004-09-15	2004-09-22	2004-09-16	21	46.68	980.28	10
7820	31	31	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	25	81.95	2048.75	4
7821	31	60	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	107.23	3431.36	6
7822	31	62	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	32	70.08	2242.56	1
7823	31	83	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	23	71.73	1649.79	5
7824	31	86	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	26	88.90	2311.40	2
7825	31	91	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	28	63.29	1772.12	7
7826	31	104	17	7	392	10297	Shipped	2004-09-16	2004-09-22	2004-09-21	35	111.53	3903.55	3
7827	1	3	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	39	105.86	4128.54	1
7828	1	32	14	4	398	10298	Shipped	2004-09-27	2004-10-05	2004-10-01	32	60.57	1938.24	2
7829	29	1	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	23	76.56	1760.88	9
7830	29	4	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	29	164.61	4773.69	11
7831	29	10	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	123.51	2964.24	8
7832	29	47	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	39	62.17	2424.63	3
7833	29	54	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	49	119.04	5832.96	2
7834	29	58	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	47	107.07	5032.29	10
7835	29	66	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	33	58.87	1942.71	6
7836	29	84	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	32	66.29	2121.28	1
7837	29	87	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	24	36.21	869.04	4
7838	29	92	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	38	84.70	3218.60	7
7839	29	96	16	7	400	10299	Shipped	2004-09-30	2004-10-10	2004-10-01	44	77.29	3400.76	5
7840	8	7	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	33	184.84	6099.72	5
7841	8	12	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	29	116.27	3371.83	3
7842	8	14	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	22	76.61	1685.42	6
7843	8	16	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	95.58	2198.34	2
7844	8	24	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	41	63.14	2588.74	1
7845	8	43	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	49	65.94	3231.06	8
7846	8	45	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	23	144.05	3313.15	7
7847	8	74	17	7	145	10300	Shipped	2003-10-04	2003-10-13	2003-10-09	31	52.05	1613.55	4
7848	62	18	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	37	114.65	4242.05	8
7849	62	21	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	32	118.22	3783.04	4
7850	62	25	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	47	119.49	5616.03	7
7851	62	34	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	113.52	2497.44	5
7852	62	40	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	23	135.47	3115.81	9
7853	62	46	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	39	137.04	5344.56	6
7854	62	56	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	27	64.67	1746.09	1
7855	62	59	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	40.75	896.50	3
7856	62	71	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	48	32.10	1540.80	10
7857	62	76	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	22	86.73	1908.06	2
7858	62	78	17	7	146	10301	Shipped	2003-10-05	2003-10-15	2003-10-08	50	122.17	6108.50	11
7859	33	23	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	43	166.60	7163.80	1
7860	33	50	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	38	82.83	3147.54	2
7861	33	55	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	23	70.56	1622.88	3
7862	33	67	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	49	75.42	3695.58	5
7863	33	70	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	45	104.52	4703.40	4
7864	33	73	16	7	147	10302	Shipped	2003-10-06	2003-10-16	2003-10-07	48	74.48	3575.04	6
7865	117	27	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	46	56.91	2617.86	2
7866	117	80	23	4	404	10303	Shipped	2004-10-06	2004-10-14	2004-10-09	24	35.70	856.80	1
7867	52	2	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	47	201.44	9467.68	6
7868	52	9	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	39	117.54	4584.06	3
7869	52	17	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	106.17	4883.82	5
7870	52	19	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	95.55	3535.35	13
7871	52	20	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	37	46.90	1735.30	12
7872	52	29	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	102.98	2471.52	17
7873	52	33	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	20	141.75	2835.00	14
7874	52	35	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	46	98.27	4520.42	7
7875	52	36	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	24	54.34	1304.16	9
7876	52	38	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	26	90.06	2341.56	8
7877	52	44	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	38	95.24	3619.12	11
7878	52	53	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	34	44.27	1505.18	4
7879	52	61	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	23	29.21	671.83	16
7880	52	64	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	44	42.11	1852.84	15
7881	52	82	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	33	80.83	2667.39	10
7882	52	90	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	36	52.36	1884.96	2
7883	52	103	14	4	407	10304	Shipped	2004-10-11	2004-10-20	2004-10-17	40	80.92	3236.80	1
7884	59	6	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	130.01	4940.38	13
7885	59	15	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	38	107.84	4097.92	5
7886	59	26	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	27	132.62	3580.74	4
7887	59	28	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	117.82	4241.52	8
7888	59	30	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	41	58.95	2416.95	11
7889	59	40	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	37	160.87	5952.19	9
7890	59	52	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	22	112.60	2477.20	14
7891	59	57	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	45	48.55	2184.75	2
7892	59	65	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	24	107.34	2576.16	10
7893	59	68	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	48	30.76	1476.48	6
7894	59	81	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	36	118.28	4258.08	1
7895	59	85	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	28	94.38	2642.64	12
7896	59	88	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	40	48.70	1948.00	7
7897	59	94	10	2	409	10305	Shipped	2004-10-13	2004-10-22	2004-10-15	42	109.96	4618.32	3
7898	30	8	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	182.86	5668.66	13
7899	30	11	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	145.04	4931.36	14
7900	30	13	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	20	145.34	2906.80	12
7901	30	39	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	114.74	3671.68	9
7902	30	42	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	40	83.70	3348.00	11
7903	30	49	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	23	126.39	2906.97	16
7904	30	51	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	39	85.14	3320.46	8
7905	30	63	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	29	109.37	3171.73	7
7906	30	72	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	31	76.12	2359.72	2
7907	30	89	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	46	60.28	2772.88	17
7908	30	95	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	34	51.55	1752.70	15
7909	30	97	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	50	61.34	3067.00	3
7910	30	99	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	38	73.62	2797.56	10
7911	30	102	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	43	62.16	2672.88	1
7912	30	106	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	32	99.17	3173.44	4
7913	30	107	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	30	87.39	2621.70	5
7914	30	110	16	7	410	10306	Shipped	2004-10-14	2004-10-21	2004-10-17	35	48.05	1681.75	6
7915	76	5	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	118.32	2603.04	9
7916	76	22	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	39	135.61	5288.79	1
7917	76	37	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	31	71.40	2213.40	7
7918	76	48	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	48	92.11	4421.28	6
7919	76	69	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	25	58.23	1455.75	2
7920	76	75	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	64.44	1417.68	3
7921	76	77	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	22	75.47	1660.34	8
7922	76	100	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	81.47	2769.98	5
7923	76	109	9	2	410	10307	Shipped	2004-10-14	2004-10-23	2004-10-20	34	44.20	1502.80	4
7924	67	3	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	115.37	3922.58	2
7925	67	4	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	20	187.85	3757.00	1
7926	67	31	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	27	81.95	2212.65	7
7927	67	32	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	34	48.46	1647.64	3
7928	67	60	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	99.57	3086.67	9
7929	67	62	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	68.55	3221.85	4
7930	67	79	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	43	58.00	2494.00	16
7931	67	83	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	44	71.73	3156.12	8
7932	67	86	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	24	99.89	2397.36	5
7933	67	91	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	46	61.22	2816.12	10
7934	67	93	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	47	37.09	1743.23	11
7935	67	98	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	73.07	1534.47	12
7936	67	101	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	35	88.75	3106.25	14
7937	67	104	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	31	100.85	3126.35	6
7938	67	105	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	21	79.20	1663.20	13
7939	67	108	12	3	411	10308	Shipped	2004-10-15	2004-10-24	2004-10-20	39	62.93	2454.27	15
7940	5	1	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	41	94.74	3884.34	5
7941	5	10	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	26	144.60	3759.60	4
7942	5	58	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	21	96.92	2035.32	6
7943	5	66	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	24	59.56	1429.44	2
7944	5	92	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	50	93.89	4694.50	3
7945	5	96	17	7	411	10309	Shipped	2004-10-15	2004-10-24	2004-10-18	28	74.04	2073.12	1
7946	53	7	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	165.38	5457.54	10
7947	53	12	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	105.70	2536.80	8
7948	53	14	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	77.41	3793.09	11
7949	53	16	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	25	101.34	2533.50	7
7950	53	18	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	37	128.80	4765.60	2
7951	53	24	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	20	66.99	1339.80	6
7952	53	25	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	24	129.45	3106.80	1
7953	53	40	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	48	159.18	7640.64	3
7954	53	43	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	27	70.76	1910.52	13
7955	53	45	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	122.00	5978.00	12
7956	53	47	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	42	59.06	2480.52	16
7957	53	54	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	40	133.92	5356.80	15
7958	53	71	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	33	33.23	1096.59	4
7959	53	74	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	38	50.21	1907.98	9
7960	53	78	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	45	139.03	6256.35	5
7961	53	84	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	49	75.18	3683.82	14
7962	53	87	17	7	412	10310	Shipped	2004-10-16	2004-10-24	2004-10-18	36	38.62	1390.32	17
7963	11	21	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	29	124.44	3608.76	9
7964	11	34	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	114.84	4938.12	10
7965	11	46	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	32	134.22	4295.04	11
7966	11	50	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	41	92.03	3773.23	1
7967	11	55	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	66.99	1674.75	2
7968	11	56	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	26	70.55	1834.30	6
7969	11	59	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	45	48.80	2196.00	8
7970	11	67	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	28	89.05	2493.40	4
7971	11	70	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	43	116.27	4999.61	3
7972	11	73	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	25	85.61	2140.25	5
7973	11	76	14	4	412	10311	Shipped	2004-10-16	2004-10-23	2004-10-20	46	91.02	4186.92	7
7974	6	2	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	214.30	10286.40	3
7975	6	17	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	32	101.50	3248.00	2
7976	6	19	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	43	102.74	4417.82	10
7977	6	20	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	43.67	1091.75	9
7978	6	23	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	48	146.20	7017.60	17
7979	6	27	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	30	48.43	1452.90	16
7980	6	29	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	111.87	3467.97	14
7981	6	33	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	25	150.19	3754.75	11
7982	6	35	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	37	91.18	3373.66	4
7983	6	36	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	35	54.34	1901.90	6
7984	6	38	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	38	93.20	3541.60	5
7985	6	44	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	33	84.33	2782.89	8
7986	6	53	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	44.27	1726.53	1
7987	6	61	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	39	27.88	1087.32	13
7988	6	64	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	23	43.46	999.58	12
7989	6	80	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	31	40.21	1246.51	15
7990	6	82	7	1	416	10312	Shipped	2004-10-21	2004-10-27	2004-10-23	44	96.42	4242.48	7
7991	34	6	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	40	141.83	5673.20	7
7992	34	9	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	21	131.20	2755.20	11
7993	34	28	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	29	109.23	3167.67	2
7994	34	30	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	52.87	1797.58	5
7995	34	40	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	25	143.94	3598.50	3
7996	34	52	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	28	110.18	3085.04	8
7997	34	65	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	42	102.23	4293.66	4
7998	34	85	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	27	96.31	2600.37	6
7999	34	88	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	38	48.70	1850.60	1
8000	34	90	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	34	55.59	1890.06	10
8001	34	103	12	3	417	10313	Shipped	2004-10-22	2004-10-28	2004-10-25	30	96.09	2882.70	9
8002	43	8	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	176.63	6711.94	5
8003	43	11	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	46	125.40	5768.40	6
8004	43	13	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	36	169.56	6104.16	4
8005	43	15	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	45	95.99	4319.55	14
8006	43	26	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	42	135.90	5707.80	13
8007	43	39	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	20	129.76	2595.20	1
8008	43	42	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	84.71	1948.33	3
8009	43	49	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	29	129.26	3748.54	8
8010	43	57	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	44	51.44	2263.36	11
8011	43	68	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	39	31.82	1240.98	15
8012	43	81	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	111.18	4224.84	10
8013	43	89	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	35	58.41	2044.35	9
8014	43	94	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	28	115.75	3241.00	12
8015	43	95	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	38	50.38	1914.44	7
8016	43	99	15	4	417	10314	Shipped	2004-10-22	2004-11-01	2004-10-23	23	83.15	1912.45	2
8017	4	51	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	36	78.12	2812.32	7
8018	4	63	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	35	111.83	3914.05	6
8019	4	72	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	24	78.77	1890.48	1
8020	4	97	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	41	60.67	2487.47	2
8021	4	106	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	31	99.17	3074.27	3
8022	4	107	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	37	88.39	3270.43	4
8023	4	110	14	4	424	10315	Shipped	2004-10-29	2004-11-08	2004-10-30	40	51.32	2052.80	5
8024	47	5	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	33	126.48	4173.84	17
8025	47	22	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	27	140.34	3789.18	9
8026	47	37	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	21	72.26	1517.46	15
8027	47	48	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	89.99	4229.53	14
8028	47	60	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	93.01	2325.25	1
8029	47	69	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	67.14	2282.76	10
8030	47	75	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	47	55.23	2595.81	11
8031	47	77	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	25	77.15	1928.75	16
8032	47	79	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	30	67.56	2026.80	8
8033	47	91	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	24	59.16	1419.84	2
8034	47	93	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	36.66	1246.44	3
8035	47	98	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	74.90	2546.60	4
8036	47	100	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	45	73.32	3299.40	13
8037	47	101	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	23	85.76	1972.48	6
8038	47	102	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	67.22	3226.56	18
8039	47	105	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	48	77.60	3724.80	5
8040	47	108	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	44	68.11	2996.84	7
8041	47	109	16	7	427	10316	Shipped	2004-11-01	2004-11-09	2004-11-07	34	43.70	1485.80	12
8042	18	83	7	1	428	10317	Shipped	2004-11-02	2004-11-12	2004-11-08	35	69.55	2434.25	1
8043	17	1	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	46	84.22	3874.12	1
8044	17	3	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	45	102.29	4603.05	4
8045	17	4	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	37	189.79	7022.23	3
8046	17	31	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	31	81.95	2540.45	9
8047	17	32	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	42	49.67	2086.14	5
8048	17	58	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	48	93.54	4489.92	2
8049	17	62	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	26	60.94	1584.44	6
8050	17	86	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	47	81.91	3849.77	7
8051	17	104	10	2	428	10318	Shipped	2004-11-02	2004-11-09	2004-11-07	50	102.04	5102.00	8
8052	106	10	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	30	134.05	4021.50	9
8053	106	43	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	46	77.19	3550.74	1
8054	106	47	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	44	54.71	2407.24	4
8055	106	54	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	120.53	5423.85	3
8056	106	66	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	31	65.80	2039.80	7
8057	106	84	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	43	78.41	3371.63	2
8058	106	87	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	29	35.00	1015.00	5
8059	106	92	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	22	96.95	2132.90	8
8060	106	96	11	3	429	10319	Shipped	2004-11-03	2004-11-11	2004-11-06	45	79.73	3587.85	6
8061	12	7	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	31	184.84	5730.04	3
8062	12	12	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	35	102.17	3575.95	1
8063	12	14	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	38	63.84	2425.92	4
8064	12	45	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	25	139.64	3491.00	5
8065	12	74	17	7	429	10320	Shipped	2004-11-03	2004-11-13	2004-11-07	26	60.62	1576.12	2
8066	109	16	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	24	105.95	2542.80	15
8067	109	18	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	41	123.14	5048.74	10
8068	109	21	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	44	120.71	5311.24	6
8069	109	24	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	73.92	2735.04	14
8070	109	25	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	25	142.25	3556.25	9
8071	109	34	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	27	126.72	3421.44	7
8072	109	40	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	33	164.26	5420.58	11
8073	109	46	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	28	138.45	3876.60	8
8074	109	56	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	68.35	2050.50	3
8075	109	59	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	48	42.76	2052.48	5
8076	109	67	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	30	74.51	2235.30	1
8077	109	71	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	37	31.72	1173.64	12
8078	109	73	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	39	81.33	3171.87	2
8079	109	76	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	21	103.87	2181.27	4
8080	109	78	10	2	430	10321	Shipped	2004-11-04	2004-11-12	2004-11-07	26	137.62	3578.12	13
8081	86	2	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	40	180.01	7200.40	1
8082	86	6	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	46	141.83	6524.18	8
8083	86	9	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	27	136.67	3690.09	9
8084	86	17	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	22	101.50	2233.00	10
8085	86	19	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	43	92.47	3976.21	14
8086	86	20	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	44.21	1812.61	5
8087	86	29	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	50	120.77	6038.50	6
8088	86	30	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	35	57.12	1999.20	11
8089	86	33	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	36	158.63	5710.68	2
8090	86	35	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	33	100.30	3309.90	12
8091	86	36	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	41	54.34	2227.94	13
8092	86	38	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	48	90.06	4322.88	7
8093	86	61	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	20	26.55	531.00	3
8094	86	64	10	2	430	10322	Shipped	2004-11-04	2004-11-12	2004-11-10	30	40.77	1223.10	4
8095	8	44	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	33	88.30	2913.90	2
8096	8	52	17	7	431	10323	Shipped	2004-11-05	2004-11-12	2004-11-09	47	96.86	4552.42	1
8097	28	11	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	148.06	3997.62	1
8098	28	15	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	26	100.73	2618.98	7
8099	28	26	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	47	142.45	6695.15	8
8100	28	28	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	105.55	3483.15	10
8101	28	40	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	27	137.17	3703.59	12
8102	28	49	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	49	120.64	5911.36	13
8103	28	53	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	38	49.81	1892.78	6
8104	28	57	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	25	49.71	1242.75	14
8105	28	65	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	31	107.34	3327.54	2
8106	28	68	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	30	29.35	880.50	9
8107	28	82	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	33	95.44	3149.52	3
8108	28	85	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	20	91.49	1829.80	11
8109	28	90	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	48	60.76	2916.48	4
8110	28	103	11	3	431	10324	Shipped	2004-11-05	2004-11-11	2004-11-08	34	80.92	2751.28	5
8111	5	5	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	47	111.52	5241.44	6
8112	5	8	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	42	193.25	8116.50	8
8113	5	13	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	166.10	3986.40	1
8114	5	39	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	24	114.74	2753.76	9
8115	5	81	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	114.73	5048.12	5
8116	5	88	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	44.37	1686.06	3
8117	5	89	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	28	55.30	1548.40	2
8118	5	94	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	38	99.55	3782.90	4
8119	5	95	17	7	431	10325	Shipped	2004-11-05	2004-11-13	2004-11-08	44	56.24	2474.56	7
8120	12	42	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	32	94.79	3033.28	6
8121	12	51	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	50	73.73	3686.50	5
8122	12	63	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	120.43	4937.63	4
8123	12	72	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	41	86.74	3556.34	3
8124	12	77	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	20	81.34	1626.80	2
8125	12	97	17	7	435	10326	Shipped	2004-11-09	2004-11-16	2004-11-10	39	60.67	2366.13	1
8126	13	22	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	154.54	3863.50	6
8127	13	31	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	45	74.34	3345.30	8
8128	13	37	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	25	74.84	1871.00	5
8129	13	99	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	20	79.68	1593.60	7
8130	13	102	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	21	65.05	1366.05	1
8131	13	106	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	43	85.14	3661.02	2
8132	13	107	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	83.42	3086.54	3
8133	13	110	15	4	436	10327	Resolved	2004-11-10	2004-11-19	2004-11-13	37	48.05	1777.85	4
8134	57	48	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	104.81	3563.54	6
8135	57	60	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	47	87.54	4114.38	14
8136	57	69	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	48	67.82	3255.36	1
8137	57	75	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	20	56.55	1131.00	2
8138	57	79	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	35	55.96	1958.60	3
8139	57	83	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	43	69.55	2990.65	4
8140	57	91	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	24	57.10	1370.40	5
8141	57	93	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	34	42.33	1439.22	7
8142	57	98	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	27	84.03	2268.81	8
8143	57	100	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	41	75.13	3080.33	9
8144	57	101	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	37	95.73	3542.01	10
8145	57	104	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	117.46	3876.18	11
8146	57	105	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	33	71.20	2349.60	13
8147	57	108	15	4	438	10328	Shipped	2004-11-12	2004-11-21	2004-11-18	39	69.59	2714.01	12
8148	10	1	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	42	80.39	3376.38	1
8149	10	3	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	20	109.42	2188.40	2
8150	10	4	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	26	164.61	4279.86	3
8151	10	7	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	41	182.90	7498.90	5
8152	10	10	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	24	128.03	3072.72	6
8153	10	12	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	46	117.44	5402.24	13
8154	10	14	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	33	74.21	2448.93	14
8155	10	16	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	39	102.49	3997.11	15
8156	10	24	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	29	66.22	1920.38	9
8157	10	32	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	55.72	2117.36	12
8158	10	43	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	38	65.13	2474.94	10
8159	10	58	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	30	104.81	3144.30	7
8160	10	62	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	37	71.60	2649.20	4
8161	10	86	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	45	80.91	3640.95	11
8162	10	109	12	3	440	10329	Shipped	2004-11-15	2004-11-24	2004-11-16	44	41.22	1813.68	8
8163	92	45	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	37	136.70	5057.90	3
8164	92	47	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	29	59.06	1712.74	2
8165	92	54	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	50	133.92	6696.00	4
8166	92	66	21	5	441	10330	Shipped	2004-11-16	2004-11-25	2004-11-21	42	56.10	2356.20	1
8167	118	18	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	46	120.31	5534.26	6
8168	118	21	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	99.55	4380.20	14
8169	118	23	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	44	154.70	6806.80	7
8170	118	25	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	30	135.14	4054.20	8
8171	118	34	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	130.68	3397.68	10
8172	118	40	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	169.34	4572.18	11
8173	118	46	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	26	132.80	3452.80	12
8174	118	71	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	27	37.00	999.00	13
8175	118	74	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	25	55.11	1377.75	9
8176	118	78	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	21	139.03	2919.63	1
8177	118	84	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	41	70.33	2883.53	2
8178	118	87	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	28	33.39	934.92	3
8179	118	92	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	32	100.01	3200.32	4
8180	118	96	12	3	442	10331	Shipped	2004-11-17	2004-11-23	2004-11-23	20	74.04	1480.80	5
8181	30	19	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	46	89.38	4111.48	15
8182	30	20	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	27	51.21	1382.67	16
8183	30	27	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	38	53.88	2047.44	9
8184	30	29	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	35	116.96	4093.60	8
8185	30	33	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	24	138.38	3321.12	1
8186	30	36	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	53.09	1380.34	17
8187	30	38	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	40	100.53	4021.20	18
8188	30	50	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	50	92.03	4601.50	2
8189	30	55	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	21	70.56	1481.76	3
8190	30	56	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	23	61.73	1419.79	4
8191	30	59	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	20	47.29	945.80	5
8192	30	61	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	29.87	1344.15	6
8193	30	64	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	26	43.01	1118.26	10
8194	30	67	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	39	84.51	3295.89	7
8195	30	70	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	44	108.04	4753.76	11
8196	30	73	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	45	77.91	3505.95	12
8197	30	76	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	31	94.23	2921.13	13
8198	30	80	16	7	442	10332	Shipped	2004-11-17	2004-11-25	2004-11-18	41	34.47	1413.27	14
8199	9	2	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	26	188.58	4903.08	3
8200	9	9	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	121.64	4014.12	6
8201	9	17	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	29	110.84	3214.36	7
8202	9	35	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	31	95.23	2952.13	5
8203	9	44	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	46	95.24	4381.04	2
8204	9	53	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	24	42.26	1014.24	8
8205	9	82	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	39	95.44	3722.16	1
8206	9	90	7	1	443	10333	Shipped	2004-11-18	2004-11-27	2004-11-20	33	62.05	2047.65	4
8207	12	6	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	26	130.01	3380.26	2
8208	12	28	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	46	108.00	4968.00	6
8209	12	30	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	34	52.87	1797.58	1
8210	12	40	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	20	147.33	2946.60	3
8211	12	52	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	49	101.71	4983.79	4
8212	12	65	17	7	444	10334	On Hold	2004-11-19	2004-11-28	\N	42	117.57	4937.94	5
8213	6	68	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	33	32.88	1085.04	2
8214	6	85	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	44	77.05	3390.20	1
8215	6	88	7	1	444	10335	Shipped	2004-11-19	2004-11-29	2004-11-23	40	49.78	1991.20	3
8216	24	8	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	176.63	5828.79	10
8217	24	11	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	33	126.91	4188.03	11
8218	24	13	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	141.88	6952.12	1
8219	24	15	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	38	95.99	3647.62	3
8220	24	26	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	49	153.91	7541.59	6
8221	24	39	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	48	135.22	6490.56	12
8222	24	42	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	21	100.84	2117.64	7
8223	24	57	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	45	49.71	2236.95	4
8224	24	81	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	113.55	3520.05	5
8225	24	89	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	31	59.03	1829.93	9
8226	24	94	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	23	109.96	2529.08	8
8227	24	103	13	4	445	10336	Shipped	2004-11-20	2004-11-26	2004-11-24	46	94.07	4327.22	2
8228	99	5	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	25	131.92	3298.00	8
8229	99	49	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	140.75	5067.00	3
8230	99	51	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	76.36	2214.44	2
8231	99	63	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	29	119.20	3456.80	4
8232	99	95	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	21	54.48	1144.08	6
8233	99	99	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	73.62	2650.32	9
8234	99	106	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	31	84.14	2608.34	1
8235	99	107	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	36	83.42	3003.12	7
8236	99	110	11	3	446	10337	Shipped	2004-11-21	2004-11-30	2004-11-26	42	49.14	2063.88	5
8237	90	22	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	41	137.19	5624.79	1
8238	90	37	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	28	80.86	2264.08	3
8239	90	48	15	4	447	10338	Shipped	2004-11-22	2004-12-02	2004-11-27	45	93.17	4192.65	2
8240	94	3	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	40	117.75	4710.00	4
8241	94	4	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	39	178.17	6948.63	3
8242	94	31	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	79.41	2144.07	2
8243	94	32	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	30	48.46	1453.80	1
8244	94	58	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	96.92	2616.84	10
8245	94	60	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	21	106.14	2228.94	7
8246	94	69	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	67.82	3730.10	12
8247	94	72	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	73.46	4040.30	13
8248	94	75	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	29	57.86	1677.94	14
8249	94	77	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	42	72.96	3064.32	16
8250	94	79	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	45	57.32	2579.40	11
8251	94	97	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	22	53.34	1173.48	5
8252	94	100	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	55	86.90	4779.50	15
8253	94	102	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	62.16	3108.00	9
8254	94	108	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	50	66.63	3331.50	8
8255	94	109	21	5	448	10339	Shipped	2004-11-23	2004-11-30	2004-11-30	27	49.66	1340.82	6
8256	40	62	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	62.46	3435.30	8
8257	40	83	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	63.76	2550.40	1
8258	40	86	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	95.89	5273.95	2
8259	40	91	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	39	67.41	2628.99	3
8260	40	93	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	40	37.09	1483.60	4
8261	40	98	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	30	73.99	2219.70	5
8262	40	101	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	55	81.77	4497.35	7
8263	40	104	23	4	449	10340	Shipped	2004-11-24	2004-12-01	2004-11-25	29	98.48	2855.92	6
8264	91	1	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	41	84.22	3453.02	9
8265	91	7	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	45	192.62	8667.90	2
8266	91	10	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	120.50	6627.50	8
8267	91	12	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	44	111.57	4909.08	1
8268	91	14	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	36	77.41	2786.76	10
8269	91	16	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	55	109.40	6017.00	7
8270	91	66	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	32	63.03	2016.96	6
8271	91	92	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	31	95.93	2973.83	4
8272	91	96	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	38	78.11	2968.18	3
8273	91	105	15	4	449	10341	Shipped	2004-11-24	2004-12-01	2004-11-29	34	70.40	2393.60	5
8274	3	18	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	40	118.89	4755.60	2
8275	3	24	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	63.14	3472.70	1
8276	3	25	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	22	115.22	2534.84	3
8277	3	40	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	30	167.65	5029.50	4
8278	3	43	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	25	76.39	1909.75	5
8279	3	45	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	55	136.70	7518.50	7
8280	3	47	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	26	57.82	1503.32	8
8281	3	54	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	38	124.99	4749.62	11
8282	3	71	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	39	30.59	1193.01	9
8283	3	74	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	48	60.01	2880.48	10
8284	3	78	18	6	449	10342	Shipped	2004-11-24	2004-12-01	2004-11-29	42	112.34	4718.28	6
8285	81	21	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	36	109.51	3942.36	4
8286	81	34	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	25	118.80	2970.00	3
8287	81	46	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	44	127.15	5594.60	2
8288	81	59	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	27	44.78	1209.06	6
8289	81	84	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	30	76.80	2304.00	1
8290	81	87	13	4	449	10343	Shipped	2004-11-24	2004-12-01	2004-11-26	29	37.41	1084.89	5
8291	80	23	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	45	168.30	7573.50	1
8292	80	27	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	40	49.04	1961.60	2
8293	80	29	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	30	118.23	3546.90	3
8294	80	50	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	21	80.99	1700.79	4
8295	80	55	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	26	68.42	1778.92	5
8296	80	56	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	29	61.00	1769.00	7
8297	80	61	13	4	450	10344	Shipped	2004-11-25	2004-12-02	2004-11-29	20	27.88	557.60	6
8298	1	64	14	4	450	10345	Shipped	2004-11-25	2004-12-01	2004-11-26	43	38.98	1676.14	1
8299	2	19	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	42	88.36	3711.12	3
8300	2	67	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	25	87.24	2181.00	1
8301	2	70	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	117.44	2818.56	5
8302	2	73	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	24	80.47	1931.28	2
8303	2	76	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	26	103.87	2700.62	6
8304	2	80	8	1	454	10346	Shipped	2004-11-29	2004-12-05	2004-11-30	22	38.57	848.54	4
8305	3	2	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	30	188.58	5657.40	1
8306	3	6	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	27	132.97	3590.19	2
8307	3	9	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	29	132.57	3844.53	3
8308	3	17	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	42	113.17	4753.14	5
8309	3	20	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	46.36	973.56	7
8310	3	30	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	50	51.05	2552.50	8
8311	3	33	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	21	136.69	2870.49	6
8312	3	35	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	48	84.09	4036.32	9
8313	3	36	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	34	60.59	2060.06	10
8314	3	38	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	95.30	4288.50	11
8315	3	44	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	26	84.33	2192.58	12
8316	3	52	18	6	454	10347	Shipped	2004-11-29	2004-12-07	2004-11-30	45	115.03	5176.35	4
8317	107	8	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	48	207.80	9974.40	8
8318	107	11	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	47	122.37	5751.39	4
8319	107	53	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	29	43.77	1269.33	6
8320	107	65	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	37	107.34	3971.58	1
8321	107	82	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	39	82.78	3228.42	2
8322	107	85	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	42	90.53	3802.26	3
8323	107	90	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	31	62.70	1943.70	5
8324	107	103	23	4	427	10348	Shipped	2004-11-01	2004-11-08	2004-11-05	32	100.14	3204.48	7
8325	16	13	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	26	166.10	4318.60	10
8326	16	15	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	114.95	5517.60	9
8327	16	26	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	142.45	5413.10	8
8328	16	28	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	38	117.82	4477.16	7
8329	16	40	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	164.26	7884.48	6
8330	16	49	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	34	140.75	4785.50	5
8331	16	57	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	48	50.29	2413.92	4
8332	16	68	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	36	31.47	1132.92	3
8333	16	81	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	23	111.18	2557.14	2
8334	16	88	11	3	456	10349	Shipped	2004-12-01	2004-12-07	2004-12-03	33	44.37	1464.21	1
8335	11	5	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	26	110.16	2864.16	5
8336	11	37	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	43	84.30	3624.90	6
8337	11	39	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	135.22	5949.68	1
8338	11	42	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	41	94.79	3886.39	2
8339	11	51	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	70.22	2106.60	3
8340	11	63	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	34	98.31	3342.54	7
8341	11	72	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	30	86.74	2602.20	9
8342	11	77	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	77.15	1928.75	10
8343	11	89	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	27	61.52	1661.04	14
8344	11	94	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	104.18	3229.58	8
8345	11	95	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	44	56.82	2500.08	17
8346	11	97	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	46	56.00	2576.00	11
8347	11	99	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	28	76.22	2134.16	4
8348	11	102	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	29	68.67	1991.43	12
8349	11	106	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	31	87.15	2701.65	13
8350	11	107	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	25	97.32	2433.00	16
8351	11	110	14	4	457	10350	Shipped	2004-12-02	2004-12-08	2004-12-05	20	48.05	961.00	15
8352	71	22	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	39	143.50	5596.50	1
8353	71	48	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	20	104.81	2096.20	2
8354	71	69	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	25	64.40	1610.00	5
8355	71	75	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	38	53.92	2048.96	4
8356	71	79	16	7	458	10351	Shipped	2004-12-03	2004-12-11	2004-12-07	34	68.24	2320.16	3
8357	32	100	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	23	75.13	1727.99	3
8358	32	101	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	87.75	4299.75	2
8359	32	108	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	22	62.19	1368.18	1
8360	32	109	10	2	458	10352	Shipped	2004-12-03	2004-12-12	2004-12-09	49	46.18	2262.82	4
8361	101	31	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	27	71.81	1938.87	1
8362	101	60	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	28	107.23	3002.44	2
8363	101	83	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	35	69.55	2434.25	3
8364	101	86	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	46	86.90	3997.40	5
8365	101	91	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	68.10	2724.00	7
8366	101	93	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	40	35.78	1431.20	8
8367	101	98	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	39	73.07	2849.73	9
8368	101	104	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	48	98.48	4727.04	4
8369	101	105	12	3	459	10353	Shipped	2004-12-04	2004-12-11	2004-12-05	43	74.40	3199.20	6
8370	70	1	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	84.22	3537.24	6
8371	70	3	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	20	95.15	1903.00	2
8372	70	4	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	42	178.17	7483.14	3
8373	70	7	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	31	157.60	4885.60	9
8374	70	10	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	35	141.58	4955.30	4
8375	70	12	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	29	98.65	2860.85	11
8376	70	14	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	23	76.61	1762.03	12
8377	70	16	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	100.19	2805.32	13
8378	70	24	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	76.23	1600.83	8
8379	70	32	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	49.06	1373.68	10
8380	70	43	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	36	69.15	2489.40	7
8381	70	58	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	21	96.92	2035.32	5
8382	70	62	19	6	459	10354	Shipped	2004-12-04	2004-12-10	2004-12-05	28	62.46	1748.88	1
8383	11	45	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	23	117.59	2704.57	7
8384	11	47	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	31	60.30	1869.30	1
8385	11	54	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	25	124.99	3124.75	2
8386	11	66	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	41	56.10	2300.10	3
8387	11	71	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	36	37.38	1345.68	4
8388	11	74	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	44	60.62	2667.28	6
8389	11	78	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	32	137.62	4403.84	8
8390	11	84	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	28	75.18	2105.04	9
8391	11	87	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	38	32.99	1253.62	10
8392	11	92	14	4	461	10355	Shipped	2004-12-07	2004-12-14	2004-12-13	40	93.89	3755.60	5
8393	51	18	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	43	120.31	5173.33	8
8394	51	19	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	50	82.19	4109.50	9
8395	51	20	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	22	44.75	984.50	6
8396	51	25	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	27	130.87	3533.49	2
8397	51	29	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	29	106.79	3096.91	3
8398	51	33	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	30	158.63	4758.90	1
8399	51	61	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	48	31.86	1529.28	5
8400	51	64	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	42.11	1094.86	7
8401	51	96	13	4	463	10356	Shipped	2004-12-09	2004-12-15	2004-12-12	26	78.11	2030.86	4
8402	6	2	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	32	199.30	6377.60	10
8403	6	6	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	43	135.92	5844.56	9
8404	6	9	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	109.34	5357.66	8
8405	6	17	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	39	112.00	4368.00	1
8406	6	30	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	58.95	2416.95	7
8407	6	35	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	41	91.18	3738.38	6
8408	6	36	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	49	59.34	2907.66	5
8409	6	38	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	44	104.72	4607.68	4
8410	6	44	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	25	84.33	2108.25	3
8411	6	52	7	1	464	10357	Shipped	2004-12-10	2004-12-16	2004-12-14	28	105.34	2949.52	2
8412	11	11	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	49	129.93	6366.57	5
8413	11	15	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	42	98.36	4131.12	9
8414	11	26	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	142.45	2849.00	10
8415	11	28	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	20	99.41	1988.20	11
8416	11	40	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	32	137.17	4389.44	12
8417	11	49	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	25	117.77	2944.25	13
8418	11	53	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	30	46.29	1388.70	8
8419	11	57	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	44	56.07	2467.08	14
8420	11	65	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	127.79	5239.39	7
8421	11	68	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	33.59	1209.24	4
8422	11	82	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	88.62	3633.42	6
8423	11	85	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	41	82.83	3396.03	1
8424	11	90	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	36	51.71	1861.56	2
8425	11	103	14	4	464	10358	Shipped	2004-12-10	2004-12-16	2004-12-16	27	85.98	2321.46	3
8426	81	5	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	48	122.40	5875.20	6
8427	81	8	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	42	180.79	7593.18	8
8428	81	13	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	49	162.64	7969.36	5
8429	81	81	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	108.82	2394.04	7
8430	81	88	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	36	45.45	1636.20	3
8431	81	89	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	22	62.14	1367.08	1
8432	81	94	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	46	99.55	4579.30	2
8433	81	95	13	4	469	10359	Shipped	2004-12-15	2004-12-23	2004-12-18	25	47.45	1186.25	4
8434	122	22	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	50	126.15	6307.50	12
8435	122	31	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	41	68.43	2805.63	13
8436	122	37	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	46	71.40	3284.40	14
8437	122	39	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	122.93	3564.97	8
8438	122	42	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	29	94.79	2748.91	18
8439	122	48	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	101.64	4065.60	15
8440	122	51	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	40	76.36	3054.40	1
8441	122	60	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	106.14	2335.08	17
8442	122	63	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	100.77	3123.87	2
8443	122	69	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	49	55.49	2719.01	16
8444	122	72	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	36	70.81	2549.16	3
8445	122	77	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	22	78.83	1734.26	4
8446	122	97	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	32	64.67	2069.44	5
8447	122	99	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	26	86.61	2251.86	6
8448	122	102	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	30	70.11	2103.30	7
8449	122	106	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	35	83.14	2909.90	9
8450	122	107	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	92.36	2863.16	10
8451	122	110	19	6	470	10360	Shipped	2004-12-16	2004-12-22	2004-12-18	31	54.05	1675.55	11
8452	58	1	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	92.83	1856.60	13
8453	58	3	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	114.18	2968.68	8
8454	58	75	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	34	62.46	2123.64	6
8455	58	79	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	61.42	1596.92	7
8456	58	83	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	25	68.83	1720.75	1
8457	58	91	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	49	56.41	2764.09	2
8458	58	93	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	33	35.78	1180.74	3
8459	58	98	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	20	88.60	1772.00	4
8460	58	100	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	24	85.99	2063.76	14
8461	58	101	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	26	91.74	2385.24	9
8462	58	104	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	107.97	4750.68	5
8463	58	105	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	44	76.80	3379.20	10
8464	58	108	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	35	62.19	2176.65	11
8465	58	109	18	6	471	10361	Shipped	2004-12-17	2004-12-24	2004-12-20	23	47.67	1096.41	12
8466	18	4	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	182.04	4004.88	4
8467	18	10	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	22	131.04	2882.88	1
8468	18	32	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	23	53.91	1239.93	3
8469	18	58	7	1	478	10362	Shipped	2005-01-05	2005-01-16	2005-01-10	50	91.29	4564.50	2
8470	74	7	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	33	180.95	5971.35	3
8471	74	12	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	106.87	3633.58	4
8472	74	14	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	34	68.63	2333.42	5
8473	74	16	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	103.64	4767.44	6
8474	74	24	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	22	61.60	1355.20	7
8475	74	43	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	46	69.15	3180.90	10
8476	74	45	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	24	124.94	2998.56	11
8477	74	47	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	32	52.22	1671.04	12
8478	74	54	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	28	123.50	3458.00	13
8479	74	62	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	70.08	1471.68	8
8480	74	66	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	56.10	2412.30	14
8481	74	74	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	21	52.05	1093.05	15
8482	74	78	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	31	113.75	3526.25	1
8483	74	84	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	43	75.99	3267.57	9
8484	74	86	16	7	479	10363	Shipped	2005-01-06	2005-01-12	2005-01-10	50	92.90	4645.00	2
8485	80	87	13	4	479	10364	Shipped	2005-01-06	2005-01-17	2005-01-09	48	38.22	1834.56	1
8486	68	18	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	30	116.06	3481.80	1
8487	68	92	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	22	82.66	1818.52	3
8488	68	96	9	2	480	10365	Shipped	2005-01-07	2005-01-18	2005-01-11	44	68.34	3006.96	2
8489	90	25	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	116.65	3966.10	3
8490	90	34	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	49	105.60	5174.40	2
8491	90	40	15	4	482	10366	Shipped	2005-01-10	2005-01-19	2005-01-12	34	154.10	5239.40	1
8492	36	21	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	49	105.77	5182.73	1
8493	36	23	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	37	144.50	5346.50	3
8494	36	27	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	45	50.25	2261.25	4
8495	36	29	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	27	124.59	3363.93	5
8496	36	33	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	32	140.06	4481.92	7
8497	36	46	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	46	131.39	6043.94	6
8498	36	50	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	43	77.31	3324.33	8
8499	36	55	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	44	66.99	2947.56	9
8500	36	56	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	21	72.76	1527.96	10
8501	36	59	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	38	50.31	1911.78	11
8502	36	61	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	23	29.54	679.42	13
8503	36	64	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	28	43.01	1204.28	12
8504	36	71	8	1	484	10367	Resolved	2005-01-12	2005-01-21	2005-01-16	36	36.25	1305.00	2
8505	6	67	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	40	73.60	2944.00	2
8506	6	70	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	31	115.09	3567.79	5
8507	6	73	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	83.04	3819.84	1
8508	6	76	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	20	93.16	1863.20	4
8509	6	80	7	1	488	10368	Shipped	2005-01-19	2005-01-27	2005-01-24	46	36.52	1679.92	3
8510	89	2	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	41	195.01	7995.41	2
8511	89	19	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	44	89.38	3932.72	8
8512	89	20	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	32	46.36	1483.52	7
8513	89	35	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	42	100.30	4212.60	1
8514	89	36	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	28	51.84	1451.52	6
8515	89	38	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	21	90.06	1891.26	5
8516	89	44	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	45	80.36	3616.20	4
8517	89	82	9	2	489	10369	Shipped	2005-01-20	2005-01-28	2005-01-24	40	93.49	3739.60	3
8518	56	6	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	35	128.53	4498.55	4
8519	56	9	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	49	128.47	6295.03	8
8520	56	17	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	100.34	2709.18	1
8521	56	28	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	101.87	2241.14	5
8522	56	30	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	22	60.16	1323.52	7
8523	56	40	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	27	167.65	4526.55	9
8524	56	52	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	29	105.34	3054.86	6
8525	56	53	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	20	41.76	835.20	2
8526	56	90	18	6	489	10370	Shipped	2005-01-20	2005-02-01	2005-01-25	25	63.99	1599.75	3
8527	6	8	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	32	178.71	5718.72	6
8528	6	15	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	49	104.28	5109.72	4
8529	6	26	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	160.46	4011.50	7
8530	6	57	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	25	53.75	1343.75	12
8531	6	65	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	126.51	2530.20	5
8532	6	68	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	45	35.01	1575.45	8
8533	6	81	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	28	95.81	2682.68	9
8534	6	85	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	26	82.83	2153.58	1
8535	6	88	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	20	44.37	887.40	2
8536	6	89	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	30	53.44	1603.20	11
8537	6	94	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	48	97.23	4667.04	10
8538	6	103	7	1	491	10371	Shipped	2005-01-23	2005-02-03	2005-01-25	34	83.95	2854.30	3
8539	94	11	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	40	146.55	5862.00	4
8540	94	13	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	34	140.15	4765.10	1
8541	94	39	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	28	131.13	3671.64	3
8542	94	42	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	25	91.76	2294.00	5
8543	94	49	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	48	119.20	5721.60	6
8544	94	51	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	41	78.99	3238.59	7
8545	94	63	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	37	102.00	3774.00	8
8546	94	95	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	24	56.82	1363.68	9
8547	94	99	21	5	494	10372	Shipped	2005-01-26	2005-02-05	2005-01-28	44	74.48	3277.12	2
8548	65	5	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	118.32	4614.48	3
8549	65	22	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	28	143.50	4018.00	4
8550	65	37	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	22	75.70	1665.40	5
8551	65	48	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	50	99.52	4976.00	6
8552	65	69	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	38	58.92	2238.96	7
8553	65	72	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	33	82.31	2716.23	12
8554	65	75	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	46	53.92	2480.32	11
8555	65	77	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	23	83.86	1928.78	10
8556	65	79	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	39	62.10	2421.90	13
8557	65	97	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	44	58.00	2552.00	14
8558	65	100	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	32	76.94	2462.08	15
8559	65	102	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	41	69.39	2844.99	16
8560	65	106	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	34	94.16	3201.44	2
8561	65	107	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	37	83.42	3086.54	8
8562	65	108	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	45	68.11	3064.95	17
8563	65	109	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	25	44.20	1105.00	9
8564	65	110	16	7	497	10373	Shipped	2005-01-31	2005-02-08	2005-02-06	29	48.05	1393.45	1
8565	73	3	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	39	115.37	4499.43	5
8566	73	4	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	158.80	3493.60	1
8567	73	31	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	42	75.19	3157.98	2
8568	73	32	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	22	48.46	1066.12	4
8569	73	58	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	38	112.70	4282.60	6
8570	73	60	18	6	499	10374	Shipped	2005-02-02	2005-02-09	2005-02-03	46	107.23	4932.58	3
8571	4	1	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	21	76.56	1607.76	12
8572	4	7	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	45	184.84	8317.80	7
8573	4	10	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	150.62	7380.38	13
8574	4	62	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	23	67.03	1541.69	9
8575	4	66	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	20	60.26	1205.20	14
8576	4	83	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	43	60.13	2585.59	2
8577	4	86	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	87.90	3252.30	3
8578	4	91	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	59.85	2633.40	4
8579	4	92	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	41	96.95	3974.95	15
8580	4	93	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	36.22	1774.78	5
8581	4	96	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	49	69.16	3388.84	8
8582	4	98	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	37	86.77	3210.49	6
8583	4	101	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	33	94.73	3126.09	1
8584	4	104	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	25	98.48	2462.00	10
8585	4	105	14	4	500	10375	Shipped	2005-02-03	2005-02-10	2005-02-06	44	69.60	3062.40	11
8586	41	12	8	1	503	10376	Shipped	2005-02-08	2005-02-18	2005-02-13	35	98.65	3452.75	1
8587	29	14	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	24	65.44	1570.56	5
8588	29	16	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	50	112.86	5643.00	1
8589	29	18	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	35	124.56	4359.60	2
8590	29	24	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	31	61.60	1909.60	4
8591	29	25	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	36	125.18	4506.48	6
8592	29	40	16	7	504	10377	Shipped	2005-02-09	2005-02-21	2005-02-12	39	143.94	5613.66	3
8593	11	21	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	34	121.95	4146.30	5
8594	11	43	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	22	66.74	1468.28	4
8595	11	45	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	43	146.99	6320.57	10
8596	11	47	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	28	60.30	1688.40	9
8597	11	54	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	49	122.02	5978.98	8
8598	11	71	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	30.59	1254.19	7
8599	11	74	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	46	52.66	2422.36	6
8600	11	78	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	33	129.20	4263.60	3
8601	11	84	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	41	80.84	3314.44	2
8602	11	87	14	4	505	10378	Shipped	2005-02-10	2005-02-18	2005-02-11	40	35.80	1432.00	1
8603	11	23	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	39	156.40	6099.60	2
8604	11	27	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	27	50.85	1372.95	1
8605	11	34	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	29	113.52	3292.08	5
8606	11	46	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	134.22	4295.04	4
8607	11	59	14	4	505	10379	Shipped	2005-02-10	2005-02-18	2005-02-11	32	48.80	1561.60	3
8608	11	19	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	88.36	2385.72	13
8609	11	29	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	40	119.50	4780.00	10
8610	11	33	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	21	156.94	3295.74	8
8611	11	50	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	78.23	2503.36	1
8612	11	55	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	24	66.99	1607.76	2
8613	11	56	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	66.88	2273.92	3
8614	11	61	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	32	29.87	955.84	4
8615	11	64	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	27	37.63	1016.01	5
8616	11	67	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	36	77.24	2780.64	6
8617	11	70	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	111.57	4909.08	7
8618	11	73	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	44	77.05	3390.20	9
8619	11	76	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	34	91.02	3094.68	11
8620	11	80	14	4	510	10380	Shipped	2005-02-16	2005-02-24	2005-02-18	43	32.82	1411.26	12
8621	69	2	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	36	182.16	6557.76	3
8622	69	6	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	37	138.88	5138.56	6
8623	69	9	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	20	132.57	2651.40	1
8624	69	17	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	48	114.34	5488.32	2
8625	69	20	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	25	49.60	1240.00	9
8626	69	30	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	60.77	2126.95	7
8627	69	35	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	41	100.30	4112.30	8
8628	69	36	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	40	51.22	2048.80	4
8629	69	38	7	1	511	10381	Shipped	2005-02-17	2005-02-25	2005-02-18	35	93.20	3262.00	5
8630	6	8	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	166.24	5652.16	10
8631	6	11	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	37	145.04	5366.48	11
8632	6	13	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	143.61	4882.74	12
8633	6	15	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	32	103.10	3299.20	13
8634	6	26	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	25	160.46	4011.50	5
8635	6	44	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	50	84.33	4216.50	7
8636	6	52	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	115.03	4486.17	1
8637	6	53	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	39	46.29	1805.31	2
8638	6	65	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	20	120.12	2402.40	3
8639	6	82	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	33	97.39	3213.87	4
8640	6	85	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	26	85.72	2228.72	6
8641	6	90	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	48	57.53	2761.44	8
8642	6	103	7	1	511	10382	Shipped	2005-02-17	2005-02-23	2005-02-18	34	101.15	3439.10	9
8643	11	28	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	27	119.05	3214.35	11
8644	11	39	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	24	125.66	3015.84	9
8645	11	40	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	47	155.79	7322.13	6
8646	11	42	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	26	83.70	2176.20	12
8647	11	49	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	137.88	5239.44	1
8648	11	51	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	28	77.24	2162.72	7
8649	11	57	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	22	52.60	1157.20	2
8650	11	68	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	40	33.24	1329.60	3
8651	11	81	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	21	117.10	2459.10	4
8652	11	88	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	32	53.57	1714.24	5
8653	11	89	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	44	55.93	2460.92	8
8654	11	94	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	29	94.92	2752.68	13
8655	11	95	14	4	515	10383	Shipped	2005-02-22	2005-03-02	2005-02-25	38	48.62	1847.56	10
8656	69	5	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	34	129.20	4392.80	4
8657	69	63	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	28	114.29	3200.12	3
8658	69	72	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	43	71.69	3082.67	2
8659	69	99	7	1	516	10384	Shipped	2005-02-23	2005-03-06	2005-02-27	49	71.02	3479.98	1
8660	6	77	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	37	78.83	2916.71	2
8661	6	97	7	1	520	10385	Shipped	2005-02-28	2005-03-09	2005-03-01	25	62.00	1550.00	1
8662	11	22	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	25	130.88	3272.00	7
8663	11	31	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	21	72.65	1525.65	18
8664	11	37	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	73.12	2705.44	5
8665	11	48	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	22	100.58	2212.76	6
8666	11	60	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	33	101.76	3358.08	11
8667	11	69	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	39	56.86	2217.54	1
8668	11	75	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	35	54.57	1909.95	9
8669	11	79	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	41	55.96	2294.36	12
8670	11	83	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	71.73	3586.50	8
8671	11	100	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	29	85.09	2467.61	13
8672	11	101	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	90.75	3357.75	14
8673	11	102	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	37	67.22	2487.14	10
8674	11	105	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	32	68.00	2176.00	17
8675	11	106	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	45	83.14	3741.30	2
8676	11	107	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	30	80.44	2413.20	3
8677	11	108	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	44	59.22	2605.68	15
8678	11	109	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	50	47.67	2383.50	16
8679	11	110	14	4	521	10386	Resolved	2005-03-01	2005-03-09	2005-03-06	43	52.42	2254.06	4
8680	15	86	21	5	522	10387	Shipped	2005-03-02	2005-03-09	2005-03-06	44	79.91	3516.04	1
8681	109	1	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	42	80.39	3376.38	4
8682	109	3	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	118.94	5947.00	5
8683	109	4	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	21	156.86	3294.06	7
8684	109	10	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	44	125.01	5500.44	6
8685	109	91	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	35	58.47	2046.45	8
8686	109	93	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	27	41.02	1107.54	1
8687	109	98	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	46	74.90	3445.40	2
8688	109	104	10	2	523	10388	Shipped	2005-03-03	2005-03-11	2005-03-09	50	111.53	5576.50	3
8689	102	7	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	26	182.90	4755.40	4
8690	102	12	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	25	95.13	2378.25	6
8691	102	14	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	36	76.61	2757.96	7
8692	102	16	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	47	102.49	4817.03	8
8693	102	24	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	63.91	3131.59	3
8694	102	32	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	39	52.09	2031.51	5
8695	102	58	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	45	112.70	5071.50	1
8696	102	62	17	7	523	10389	Shipped	2005-03-03	2005-03-09	2005-03-08	49	61.70	3023.30	2
8697	6	18	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	117.48	4229.28	14
8698	6	25	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	34	132.29	4497.86	15
8699	6	29	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	31	102.98	3192.38	16
8700	6	33	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	26	162.00	4212.00	7
8701	6	43	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	40	75.59	3023.60	9
8702	6	45	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	50	135.23	6761.50	1
8703	6	47	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	36	54.09	1947.24	2
8704	6	54	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	49	122.02	5978.98	3
8705	6	66	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	35	67.87	2375.45	4
8706	6	71	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	37	35.87	1327.19	5
8707	6	74	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	46	51.43	2365.78	6
8708	6	78	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	134.81	6066.45	8
8709	6	84	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	30	66.29	1988.70	10
8710	6	87	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	41	39.02	1599.82	11
8711	6	92	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	45	101.03	4546.35	12
8712	6	96	7	1	524	10390	Shipped	2005-03-04	2005-03-11	2005-03-07	22	81.36	1789.92	13
8713	56	2	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	195.01	4680.24	4
8714	56	6	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	37	121.15	4482.55	7
8715	56	9	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	39	110.70	4317.30	9
8716	56	17	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	29	114.34	3315.86	10
8717	56	19	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	35	102.74	3595.90	2
8718	56	20	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	42	47.44	1992.48	3
8719	56	30	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	44	57.73	2540.12	5
8720	56	35	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	32	99.28	3176.96	6
8721	56	61	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	33	26.55	876.15	8
8722	56	64	18	6	528	10391	Shipped	2005-03-09	2005-03-20	2005-03-15	24	36.29	870.96	1
8723	104	36	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	37	61.21	2264.77	3
8724	104	38	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	29	103.67	3006.43	2
8725	104	44	15	4	529	10392	Shipped	2005-03-10	2005-03-18	2005-03-12	36	98.22	3535.92	1
8726	70	11	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	35	145.04	5076.40	8
8727	70	15	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	32	99.54	3185.28	10
8728	70	26	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	20	137.53	2750.60	11
8729	70	28	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	104.32	3964.16	7
8730	70	52	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	30	106.55	3196.50	9
8731	70	53	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	44	41.76	1837.44	1
8732	70	65	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	112.46	3711.18	2
8733	70	82	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	33	88.62	2924.46	3
8734	70	85	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	38	84.75	3220.50	4
8735	70	90	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	31	63.35	1963.85	5
8736	70	103	19	6	530	10393	Shipped	2005-03-11	2005-03-22	2005-03-14	21	83.95	1762.95	6
8737	11	40	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	22	135.47	2980.34	5
8738	11	49	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	124.95	4623.15	1
8739	11	57	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	31	53.18	1648.58	2
8740	11	68	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	46	35.36	1626.56	6
8741	11	81	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	37	104.09	3851.33	7
8742	11	88	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	36	47.08	1694.88	3
8743	11	89	14	4	533	10394	Shipped	2005-03-15	2005-03-25	2005-03-19	30	55.93	1677.90	4
8744	51	5	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	32	125.12	4003.84	2
8745	51	8	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	33	205.72	6788.76	1
8746	51	94	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	46	98.39	4525.94	4
8747	51	95	13	4	534	10395	Shipped	2005-03-17	2005-03-24	2005-03-23	45	57.99	2609.55	3
8748	6	13	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	155.72	5138.76	3
8749	6	39	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	33	129.76	4282.08	2
8750	6	42	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	24	91.76	2202.24	4
8751	6	51	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	45	83.38	3752.10	5
8752	6	63	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	49	100.77	4937.73	6
8753	6	72	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	27	77.00	2079.00	7
8754	6	77	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	37	77.99	2885.63	8
8755	6	97	7	1	539	10396	Shipped	2005-03-23	2005-04-02	2005-03-28	39	62.00	2418.00	1
8756	48	99	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	32	69.29	2217.28	5
8757	48	102	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	22	62.88	1383.36	4
8758	48	106	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	48	86.15	4135.20	3
8759	48	107	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	36	80.44	2895.84	2
8760	48	110	14	4	542	10397	Shipped	2005-03-28	2005-04-09	2005-04-01	34	52.96	1800.64	1
8761	81	22	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	33	130.88	4319.04	11
8762	81	31	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	82.79	2814.86	15
8763	81	37	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	70.54	1975.12	18
8764	81	48	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	92.11	4144.95	17
8765	81	60	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	43	100.67	4328.81	16
8766	81	69	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	28	60.29	1688.12	3
8767	81	75	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	61.15	2079.10	13
8768	81	79	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	41	56.64	2322.24	2
8769	81	83	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	45	65.93	2966.85	14
8770	81	91	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	60.54	1331.88	4
8771	81	93	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	49	38.84	1903.16	5
8772	81	98	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	47	78.55	3691.85	6
8773	81	100	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	75.13	2704.68	7
8774	81	101	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	22	98.72	2171.84	8
8775	81	104	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	23	102.04	2346.92	9
8776	81	105	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	29	76.80	2227.20	10
8777	81	108	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	36	62.19	2238.84	12
8778	81	109	13	4	543	10398	Shipped	2005-03-30	2005-04-09	2005-03-31	34	41.22	1401.48	1
8779	122	1	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	40	77.52	3100.80	8
8780	122	3	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	51	99.91	5095.41	7
8781	122	4	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	22	156.86	3450.92	6
8782	122	10	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	29	123.51	3581.79	5
8783	122	32	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	30	51.48	1544.40	4
8784	122	58	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	57	104.81	5974.17	3
8785	122	62	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	58	75.41	4373.78	2
8786	122	86	19	6	545	10399	Shipped	2005-04-01	2005-04-12	2005-04-03	32	97.89	3132.48	1
8787	103	5	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	64	134.64	8616.96	9
8788	103	22	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	34	129.31	4396.54	1
8789	103	37	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	30	74.84	2245.20	7
8790	103	48	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	58	88.93	5157.94	6
8791	103	69	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	24	55.49	1331.76	2
8792	103	75	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	38	59.18	2248.84	3
8793	103	77	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	42	74.64	3134.88	8
8794	103	100	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	46	82.37	3789.02	5
8795	103	109	7	1	545	10400	Shipped	2005-04-01	2005-04-11	2005-04-04	20	41.71	834.20	4
8796	72	31	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	42	75.19	3157.98	3
8797	72	60	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	38	87.54	3326.52	5
8798	72	79	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	64	59.37	3799.68	12
8799	72	83	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	52	65.93	3428.36	4
8800	72	86	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	49	81.91	4013.59	1
8801	72	91	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	62	62.60	3881.20	6
8802	72	93	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	56	41.46	2321.76	7
8803	72	98	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	11	77.64	854.04	8
8804	72	101	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	85	98.72	8391.20	10
8805	72	104	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	21	96.11	2018.31	2
8806	72	105	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	77	73.60	5667.20	9
8807	72	108	12	3	547	10401	On Hold	2005-04-03	2005-04-14	\N	40	66.63	2665.20	11
8808	95	3	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	45	118.94	5352.30	1
8809	95	32	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	55	58.15	3198.25	2
8810	95	62	13	4	550	10402	Shipped	2005-04-07	2005-04-14	2005-04-12	59	61.70	3640.30	3
8811	33	1	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	24	85.17	2044.08	7
8812	33	4	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	174.29	11503.14	9
8813	33	10	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	66	122.00	8052.00	6
8814	33	47	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	36	55.33	1991.88	1
8815	33	58	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	46	109.32	5028.72	8
8816	33	66	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	27	57.49	1552.23	4
8817	33	87	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	30	35.80	1074.00	2
8818	33	92	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	45	88.78	3995.10	5
8819	33	96	16	7	551	10403	Shipped	2005-04-08	2005-04-18	2005-04-11	31	65.09	2017.79	3
8820	70	7	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	64	163.44	10460.16	3
8821	70	12	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	43	102.17	4393.31	1
8822	70	14	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	77	67.03	5161.31	4
8823	70	43	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	90	67.54	6078.60	6
8824	70	45	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	28	127.88	3580.64	5
8825	70	54	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	124.99	5999.52	8
8826	70	74	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	49	53.27	2610.23	2
8827	70	84	19	6	551	10404	Shipped	2005-04-08	2005-04-14	2005-04-11	48	65.48	3143.04	7
8828	38	16	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	97	115.16	11170.52	5
8829	38	24	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	61	72.38	4415.18	4
8830	38	40	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	55	147.33	8103.15	1
8831	38	71	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	47	37.38	1756.86	2
8832	38	78	14	4	555	10405	Shipped	2005-04-14	2005-04-24	2005-04-20	76	127.79	9712.04	3
8833	13	18	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	61	124.56	7598.16	3
8834	13	25	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	48	133.72	6418.56	2
8835	13	46	15	4	556	10406	Disputed	2005-04-15	2005-04-25	2005-04-21	65	117.26	7621.90	1
8836	103	21	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	114.48	6754.32	11
8837	103	23	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	141.10	10723.60	2
8838	103	27	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	42	58.12	2441.04	1
8839	103	34	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	41	132.00	5412.00	12
8840	103	50	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	6	91.11	546.66	3
8841	103	55	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	66	64.14	4233.24	4
8842	103	56	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	26	68.35	1777.10	8
8843	103	59	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	64	45.78	2929.92	10
8844	103	67	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	76	81.78	6215.28	6
8845	103	70	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	59	98.65	5820.35	5
8846	103	73	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	13	77.05	1001.65	7
8847	103	76	7	1	560	10407	On Hold	2005-04-22	2005-05-04	\N	43	101.73	4374.39	9
8848	94	80	21	5	560	10408	Shipped	2005-04-22	2005-04-29	2005-04-27	15	41.03	615.45	1
8849	19	29	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	6	104.25	625.50	2
8850	19	61	19	6	561	10409	Shipped	2005-04-23	2005-05-05	2005-04-24	61	27.88	1700.68	1
8851	83	19	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	65	99.66	6477.90	7
8852	83	20	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	51.21	2253.24	6
8853	83	33	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	56	145.13	8127.28	8
8854	83	35	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	47	93.21	4380.87	1
8855	83	36	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	53	49.97	2648.41	3
8856	83	38	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	34	84.82	2883.88	2
8857	83	44	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	44	81.35	3579.40	5
8858	83	64	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	31	42.56	1319.36	9
8859	83	82	19	6	565	10410	Shipped	2005-04-29	2005-05-10	2005-04-30	50	95.44	4772.00	4
8860	44	2	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	23	205.73	4731.79	9
8861	44	6	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	144.79	3909.33	2
8862	44	9	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	40	110.70	4428.00	6
8863	44	17	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	109.67	2961.09	8
8864	44	52	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	46	106.55	4901.30	3
8865	44	53	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	35	41.25	1443.75	7
8866	44	85	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	26	78.01	2028.26	1
8867	44	90	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	27	60.76	1640.52	5
8868	44	103	11	3	567	10411	Shipped	2005-05-01	2005-05-08	2005-05-06	34	89.01	3026.34	4
8869	11	15	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	54	100.73	5439.42	5
8870	11	26	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	41	150.63	6175.83	4
8871	11	28	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	56	120.28	6735.68	8
8872	11	30	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	47	49.83	2342.01	11
8873	11	40	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	60	157.49	9449.40	9
8874	11	57	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	21	47.40	995.40	2
8875	11	65	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	70	109.90	7693.00	10
8876	11	68	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	30	32.88	986.40	6
8877	11	81	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	31	108.82	3373.42	1
8878	11	88	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	19	50.86	966.34	7
8879	11	94	14	4	568	10412	Shipped	2005-05-03	2005-05-13	2005-05-05	26	105.33	2738.58	3
8880	26	8	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	36	201.57	7256.52	2
8881	26	11	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	47	145.04	6816.88	3
8882	26	13	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	22	173.02	3806.44	1
8883	26	49	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	49	133.57	6544.93	5
8884	26	89	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	24	56.55	1357.20	6
8885	26	95	12	3	570	10413	Shipped	2005-05-05	2005-05-14	2005-05-09	51	53.31	2718.81	4
8886	85	5	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	49	114.24	5597.76	3
8887	85	37	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	44	77.42	3406.48	1
8888	85	39	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	41	128.39	5263.99	12
8889	85	42	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	48	85.71	4114.08	14
8890	85	51	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	56	83.38	4669.28	11
8891	85	63	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	43	108.14	4650.02	10
8892	85	72	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	60	72.58	4354.80	5
8893	85	77	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	51	72.96	3720.96	2
8894	85	97	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	37	62.00	2294.00	6
8895	85	99	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	34	74.48	2532.32	13
8896	85	102	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	31	61.44	1904.64	4
8897	85	106	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	28	84.14	2355.92	7
8898	85	107	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	40	84.41	3376.40	8
8899	85	110	10	2	571	10414	On Hold	2005-05-06	2005-05-13	\N	47	54.60	2566.20	9
8900	111	48	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	51	86.81	4427.31	5
8901	111	69	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	21	60.97	1280.37	1
8902	111	75	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	18	59.83	1076.94	2
8903	111	100	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	32	73.32	2346.24	4
8904	111	109	18	6	573	10415	Disputed	2005-05-09	2005-05-20	2005-05-12	42	43.20	1814.40	3
8905	93	22	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	24	129.31	3103.44	14
8906	93	31	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	15	70.96	1064.40	4
8907	93	60	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	47	90.82	4268.54	6
8908	93	62	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	32	62.46	1998.72	1
8909	93	79	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	18	64.83	1166.94	13
8910	93	83	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	48	70.28	3373.44	5
8911	93	86	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	45	86.90	3910.50	2
8912	93	91	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	26	68.10	1770.60	7
8913	93	93	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	37	39.71	1469.27	8
8914	93	98	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	23	88.60	2037.80	9
8915	93	101	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	22	84.76	1864.72	11
8916	93	104	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	41	98.48	4037.68	3
8917	93	105	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	39	65.60	2558.40	10
8918	93	108	15	4	574	10416	Shipped	2005-05-10	2005-05-16	2005-05-14	43	63.67	2737.81	12
8919	11	1	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	66	79.43	5242.38	2
8920	11	3	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	45	116.56	5245.20	5
8921	11	4	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	56	162.67	9109.52	4
8922	11	10	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	21	144.60	3036.60	1
8923	11	32	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	36	58.75	2115.00	6
8924	11	58	14	4	576	10417	Disputed	2005-05-13	2005-05-19	2005-05-19	35	109.32	3826.20	3
8925	97	43	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	16	70.76	1132.16	2
8926	97	45	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	27	139.64	3770.28	1
8927	97	47	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	33	56.57	1866.81	5
8928	97	54	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	28	120.53	3374.84	4
8929	97	66	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	52	64.41	3349.32	8
8930	97	84	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	10	66.29	662.90	3
8931	97	87	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	43	36.61	1574.23	6
8932	97	92	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	50	100.01	5000.50	9
8933	97	96	19	6	578	10418	Shipped	2005-05-16	2005-05-24	2005-05-20	40	72.41	2896.40	7
8934	91	7	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	12	182.90	2194.80	13
8935	91	12	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	10	111.57	1115.70	11
8936	91	14	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	64.64	2197.76	14
8937	91	16	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	32	99.04	3169.28	10
8938	91	18	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	38	117.48	4464.24	5
8939	91	21	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	37	100.80	3729.60	1
8940	91	24	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	39	67.76	2642.64	9
8941	91	25	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	34	133.72	4546.48	4
8942	91	34	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	116.16	6388.80	2
8943	91	40	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	35	165.95	5808.25	6
8944	91	46	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	43	114.44	4920.92	3
8945	91	71	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	15	32.10	481.50	7
8946	91	74	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	55	52.66	2896.30	12
8947	91	78	15	4	579	10419	Shipped	2005-05-17	2005-05-28	2005-05-19	70	112.34	7863.80	8
8948	58	23	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	153.00	5661.00	5
8949	58	27	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	52.06	1874.16	4
8950	58	29	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	116.96	5263.20	2
8951	58	50	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	66	73.62	4858.92	6
8952	58	55	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	36	68.42	2463.12	7
8953	58	56	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	60	60.26	3615.60	11
8954	58	59	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	37	48.80	1805.60	13
8955	58	61	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	45	32.19	1448.55	1
8956	58	67	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	39	76.33	2976.87	9
8957	58	70	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	55	115.09	6329.95	8
8958	58	73	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	35	77.05	2696.75	10
8959	58	76	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	26	104.94	2728.44	12
8960	58	80	18	6	584	10420	In Process	2005-05-29	2005-06-07	\N	15	35.29	529.35	3
8961	6	33	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	35	167.06	5847.10	1
8962	6	64	7	1	584	10421	In Process	2005-05-29	2005-06-06	\N	40	44.80	1792.00	2
8963	17	19	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	51	91.44	4663.44	2
8964	17	20	10	2	585	10422	In Process	2005-05-30	2005-06-11	\N	25	47.44	1186.00	1
8965	66	35	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	10	89.15	891.50	1
8966	66	36	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	31	56.21	1742.51	3
8967	66	38	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	98.44	2067.24	2
8968	66	44	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	21	80.36	1687.56	5
8969	66	82	15	4	585	10423	In Process	2005-05-30	2005-06-05	\N	28	78.89	2208.92	4
8970	11	2	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	50	201.44	10072.00	6
8971	11	9	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	49	121.64	5960.36	3
8972	11	17	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	54	108.50	5859.00	5
8973	11	53	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	26	40.25	1046.50	4
8974	11	90	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	44	54.94	2417.36	2
8975	11	103	14	4	586	10424	In Process	2005-05-31	2005-06-08	\N	46	85.98	3955.08	1
8976	4	6	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	131.49	4996.62	12
8977	4	15	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	33	95.99	3167.67	4
8978	4	26	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	147.36	4126.08	3
8979	4	28	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	117.82	4477.16	7
8980	4	30	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	19	48.62	923.78	10
8981	4	40	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	28	140.55	3935.40	8
8982	4	52	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	38	107.76	4094.88	13
8983	4	57	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	55	53.75	2956.25	1
8984	4	65	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	49	127.79	6261.71	9
8985	4	68	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	31	31.82	986.42	5
8986	4	85	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	41	83.79	3435.39	11
8987	4	88	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	11	50.32	553.52	6
8988	4	94	14	4	586	10425	In Process	2005-05-31	2005-06-07	\N	18	94.92	1708.56	2
\.


--
-- Name: dim_cliente_cliente_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_cliente_cliente_key_seq', 366, true);


--
-- Name: dim_empleado_empleado_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_empleado_empleado_key_seq', 159, true);


--
-- Name: dim_oficina_oficina_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_oficina_oficina_key_seq', 21, true);


--
-- Name: dim_producto_producto_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_producto_producto_key_seq', 330, true);


--
-- Name: dim_tiempo_tiempo_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tiempo_tiempo_key_seq', 1773, true);


--
-- Name: fact_llamadas_llamada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_llamadas_llamada_id_seq', 324, true);


--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_ventas_venta_id_seq', 8988, true);


--
-- Name: dim_cliente dim_cliente_customer_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_customer_number_key UNIQUE (customer_number);


--
-- Name: dim_cliente dim_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (cliente_key);


--
-- Name: dim_empleado dim_empleado_employee_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_empleado
    ADD CONSTRAINT dim_empleado_employee_number_key UNIQUE (employee_number);


--
-- Name: dim_empleado dim_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_empleado
    ADD CONSTRAINT dim_empleado_pkey PRIMARY KEY (empleado_key);


--
-- Name: dim_oficina dim_oficina_office_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_oficina
    ADD CONSTRAINT dim_oficina_office_code_key UNIQUE (office_code);


--
-- Name: dim_oficina dim_oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_oficina
    ADD CONSTRAINT dim_oficina_pkey PRIMARY KEY (oficina_key);


--
-- Name: dim_producto dim_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto
    ADD CONSTRAINT dim_producto_pkey PRIMARY KEY (producto_key);


--
-- Name: dim_producto dim_producto_product_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto
    ADD CONSTRAINT dim_producto_product_code_key UNIQUE (product_code);


--
-- Name: dim_tiempo dim_tiempo_fecha_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_fecha_key UNIQUE (fecha);


--
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (tiempo_key);


--
-- Name: fact_llamadas fact_llamadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas
    ADD CONSTRAINT fact_llamadas_pkey PRIMARY KEY (llamada_id);


--
-- Name: fact_ventas fact_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_pkey PRIMARY KEY (venta_id);


--
-- Name: fact_llamadas fact_llamadas_cliente_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas
    ADD CONSTRAINT fact_llamadas_cliente_key_fkey FOREIGN KEY (cliente_key) REFERENCES public.dim_cliente(cliente_key);


--
-- Name: fact_llamadas fact_llamadas_empleado_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas
    ADD CONSTRAINT fact_llamadas_empleado_key_fkey FOREIGN KEY (empleado_key) REFERENCES public.dim_empleado(empleado_key);


--
-- Name: fact_llamadas fact_llamadas_producto_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas
    ADD CONSTRAINT fact_llamadas_producto_key_fkey FOREIGN KEY (producto_key) REFERENCES public.dim_producto(producto_key);


--
-- Name: fact_llamadas fact_llamadas_tiempo_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_llamadas
    ADD CONSTRAINT fact_llamadas_tiempo_key_fkey FOREIGN KEY (tiempo_key) REFERENCES public.dim_tiempo(tiempo_key);


--
-- Name: fact_ventas fact_ventas_cliente_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_cliente_key_fkey FOREIGN KEY (cliente_key) REFERENCES public.dim_cliente(cliente_key);


--
-- Name: fact_ventas fact_ventas_empleado_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_empleado_key_fkey FOREIGN KEY (empleado_key) REFERENCES public.dim_empleado(empleado_key);


--
-- Name: fact_ventas fact_ventas_oficina_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_oficina_key_fkey FOREIGN KEY (oficina_key) REFERENCES public.dim_oficina(oficina_key);


--
-- Name: fact_ventas fact_ventas_producto_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_producto_key_fkey FOREIGN KEY (producto_key) REFERENCES public.dim_producto(producto_key);


--
-- Name: fact_ventas fact_ventas_tiempo_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_tiempo_key_fkey FOREIGN KEY (tiempo_key) REFERENCES public.dim_tiempo(tiempo_key);


--
-- PostgreSQL database dump complete
--

\unrestrict YMNtT6A0KEWzYusqTonavYwy9HTaTPZLWyiXtyKqEGJH8hpYz1aRtauAVtTOMLL

