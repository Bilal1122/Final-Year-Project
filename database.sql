--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE attachments (
    id integer NOT NULL,
    attachable_id integer,
    attachable_type character varying,
    url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.attachments OWNER TO bilal;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO bilal;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: contact_us; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE contact_us (
    id integer NOT NULL,
    name character varying,
    email character varying,
    subject character varying,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contact_us OWNER TO bilal;

--
-- Name: contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE contact_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_id_seq OWNER TO bilal;

--
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE contact_us_id_seq OWNED BY contact_us.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE feedbacks (
    id integer NOT NULL,
    added_by_id integer,
    added_by_name character varying,
    subject character varying,
    feedback text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying
);


ALTER TABLE public.feedbacks OWNER TO bilal;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO bilal;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE feedbacks_id_seq OWNED BY feedbacks.id;


--
-- Name: gatepass; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE gatepass (
    id integer NOT NULL,
    order_id integer,
    to_who character varying,
    delivered_pcs character varying,
    total_amount character varying,
    made_by integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.gatepass OWNER TO bilal;

--
-- Name: gatepass_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE gatepass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gatepass_id_seq OWNER TO bilal;

--
-- Name: gatepass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE gatepass_id_seq OWNED BY gatepass.id;


--
-- Name: gatepasses; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE gatepasses (
    id integer NOT NULL,
    order_id integer,
    to_who character varying,
    delivered_pcs character varying,
    total_amount character varying,
    made_by integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.gatepasses OWNER TO bilal;

--
-- Name: gatepasses_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE gatepasses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gatepasses_id_seq OWNER TO bilal;

--
-- Name: gatepasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE gatepasses_id_seq OWNED BY gatepasses.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE invoices (
    id integer NOT NULL,
    personname character varying,
    invoice_type character varying,
    amount text,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


ALTER TABLE public.invoices OWNER TO bilal;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO bilal;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE invoices_id_seq OWNED BY invoices.id;


--
-- Name: leaves; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE leaves (
    id integer NOT NULL,
    person_id integer,
    person_name character varying,
    from_when timestamp without time zone,
    number_of_days character varying,
    subject character varying,
    description text,
    status character varying DEFAULT 'pending'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


ALTER TABLE public.leaves OWNER TO bilal;

--
-- Name: leaves_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE leaves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaves_id_seq OWNER TO bilal;

--
-- Name: leaves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE leaves_id_seq OWNED BY leaves.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    customer_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    phn_number character varying,
    nric character varying,
    company_name character varying,
    address character varying,
    quantity character varying,
    sizing character varying,
    fabric_type character varying,
    delivery_date character varying,
    order_status character varying DEFAULT 'pending'::character varying,
    description text,
    created_by_id integer,
    created_by_name character varying,
    extra_note text,
    price_per_piece integer,
    image character varying,
    image1 character varying
);


ALTER TABLE public.orders OWNER TO bilal;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO bilal;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    product_name character varying,
    status character varying,
    gender character varying,
    price character varying,
    description text,
    quantity character varying,
    product_image character varying,
    created_by integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO bilal;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO bilal;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: registers; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE registers (
    id integer NOT NULL,
    name character varying,
    email character varying,
    role character varying,
    password_hash character varying,
    password_salt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean
);


ALTER TABLE public.registers OWNER TO bilal;

--
-- Name: registers_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE registers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registers_id_seq OWNER TO bilal;

--
-- Name: registers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE registers_id_seq OWNED BY registers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bilal;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE stocks (
    id integer NOT NULL,
    accessory_name character varying,
    accessory_quantity integer,
    accessory_price_per_pcs integer,
    used_accessory integer,
    last_updated timestamp without time zone,
    added_by integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stocks OWNER TO bilal;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO bilal;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE stocks_id_seq OWNED BY stocks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO bilal;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bilal;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: ussers; Type: TABLE; Schema: public; Owner: bilal; Tablespace: 
--

CREATE TABLE ussers (
    id integer NOT NULL,
    admin boolean,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ussers OWNER TO bilal;

--
-- Name: ussers_id_seq; Type: SEQUENCE; Schema: public; Owner: bilal
--

CREATE SEQUENCE ussers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ussers_id_seq OWNER TO bilal;

--
-- Name: ussers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bilal
--

ALTER SEQUENCE ussers_id_seq OWNED BY ussers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY contact_us ALTER COLUMN id SET DEFAULT nextval('contact_us_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY gatepass ALTER COLUMN id SET DEFAULT nextval('gatepass_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY gatepasses ALTER COLUMN id SET DEFAULT nextval('gatepasses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY invoices ALTER COLUMN id SET DEFAULT nextval('invoices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY leaves ALTER COLUMN id SET DEFAULT nextval('leaves_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY registers ALTER COLUMN id SET DEFAULT nextval('registers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY stocks ALTER COLUMN id SET DEFAULT nextval('stocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bilal
--

ALTER TABLE ONLY ussers ALTER COLUMN id SET DEFAULT nextval('ussers_id_seq'::regclass);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY attachments (id, attachable_id, attachable_type, url, created_at, updated_at) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY contact_us (id, name, email, subject, message, created_at, updated_at) FROM stdin;
1	hbnkm	hbnkjm	h	hn	2015-11-21 06:41:32.038722	2015-11-21 06:41:32.038722
\.


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('contact_us_id_seq', 1, true);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY feedbacks (id, added_by_id, added_by_name, subject, feedback, created_at, updated_at, status) FROM stdin;
3	2	Bilal	Graphs in Reporting!	everything is working perfectly fine but! there should be some graphs or charts to show profile loss in reporting feature which will make easy to see profit and loss monthly. Thanks!	2015-11-22 14:42:15.631111	2015-11-22 14:42:15.631111	
\.


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('feedbacks_id_seq', 3, true);


--
-- Data for Name: gatepass; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY gatepass (id, order_id, to_who, delivered_pcs, total_amount, made_by, created_at, updated_at) FROM stdin;
\.


--
-- Name: gatepass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('gatepass_id_seq', 1, false);


--
-- Data for Name: gatepasses; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY gatepasses (id, order_id, to_who, delivered_pcs, total_amount, made_by, created_at, updated_at) FROM stdin;
1	13	company	277	33	2	2015-11-18 09:17:18.676085	2015-11-18 09:17:18.676085
\.


--
-- Name: gatepasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('gatepasses_id_seq', 1, true);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY invoices (id, personname, invoice_type, amount, description, created_at, updated_at, image) FROM stdin;
2	Me	Profit	200RM	!!	2015-10-03 14:59:22.845318	2015-10-03 14:59:22.845318	\N
3	Hsheem	payroll	100RM	li the is ki!!!!!	2015-10-04 20:54:20.030518	2015-10-04 20:55:03.221554	\N
1	Sheikh	Expense	20	toffie!!!!	2015-09-02 17:17:30	2015-10-26 12:17:56.533187	\N
4	The geradge	sales	200RM	we delivered!!! lol	2015-11-18 08:12:18.95321	2015-11-18 08:12:18.95321	\N
\.


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('invoices_id_seq', 4, true);


--
-- Data for Name: leaves; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY leaves (id, person_id, person_name, from_when, number_of_days, subject, description, status, created_at, updated_at, image) FROM stdin;
1	2	Bilal	2015-10-06 00:00:00	2	fghbnj	rdtfgyhkj	Rejected	2015-10-18 18:05:59.908111	2015-11-21 10:28:07.099883	11760143_10206595340714016_2143098513978407381_n.jpg
2	3	Super	\N	efef	sc	cdc	pending	2015-11-21 10:41:20.725476	2015-11-21 10:41:20.725476	Screenshot_from_2015-09-21_18_24_39.png
\.


--
-- Name: leaves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('leaves_id_seq', 2, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY orders (id, customer_name, created_at, updated_at, email, phn_number, nric, company_name, address, quantity, sizing, fabric_type, delivery_date, order_status, description, created_by_id, created_by_name, extra_note, price_per_piece, image, image1) FROM stdin;
14		2015-11-15 15:59:39.217886	2015-11-15 15:59:39.217886										pending	\N	2	Bilal tariq		\N	\N	\N
11	vghbnj	2015-10-03 12:39:38.088451	2015-11-18 09:12:41.343169	yghbjn	12356789	yghbj	ngyhbnj	gyhbnj	111	nghbj	nhbj	hjn	in_progress		2	Bilal tariq	what	122	\N	\N
9	ghbjnkm	2015-09-21 13:17:02.019128	2015-11-21 09:30:43.203444	ghkj	gvhbjnk	mhb	nmv	hbjn	hbnjgvhb	njmgvhbj	ngvhbj	nhbnj	in_progress		\N	\N	khbjnkm	\N	\N	\N
12	what	2015-10-03 12:41:45.416001	2015-10-03 13:48:12.402763	what	345678	xdrcfgvhb	fvghb	fgvhnbj	2345	3456	3456	4567fgvhbnj	pending	\N	2	Bilal tariq	rdgfvhbnj	444	\N	\N
13	cfgvhbnj	2015-10-03 13:51:42.376804	2015-10-04 20:41:13.645254	cfgvhbnj	cfgvhb	cfgv	hbcgv	hbftgvyhb	456	ftyghu	ftgyhu	yvghbn	completed	order completed on this	2	Bilal tariq	gh	44	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('orders_id_seq', 14, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY products (id, product_name, status, gender, price, description, quantity, product_image, created_by, created_at, updated_at) FROM stdin;
1	WOWO	available	Men	200RM	Design brilliantly with natural cotton! just kidding lol	200pcs	11760143_10206595340714016_2143098513978407381_n.jpg	2	2015-11-14 18:01:24.366737	2015-11-14 18:13:53.621575
2	NEW	available	Men	100RM	its just a test!!	12pcs	shirt.jpg	2	2015-11-14 18:14:45.667947	2015-11-14 18:14:45.667947
3	Blouse	limites	Womens	500RM	products for womens	10pcs	11707629_10153434433906552_7453281273288241109_n.jpg	2	2015-11-14 18:26:42.774428	2015-11-14 18:26:42.774428
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('products_id_seq', 3, true);


--
-- Data for Name: registers; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY registers (id, name, email, role, password_hash, password_salt, created_at, updated_at, admin) FROM stdin;
3	Super	super@live.com	Staff	superstaff	superstaff	2015-08-29 17:24:13.47337	2015-08-29 17:24:13.47337	f
2	Bilal tariq	bilal-tariq@live.com	Admin	super	super	2015-08-29 10:42:41.591072	2015-09-23 09:47:27.787362	t
\.


--
-- Name: registers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('registers_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY schema_migrations (version) FROM stdin;
20150828165000
20150829065820
20150829094549
20150829125846
20150830120243
20150920163427
20150920175223
20150920185455
20150921130621
20150921162924
20150921173420
20151002163708
20151003090900
20151003092601
20151003111104
20151003122039
20151003134911
20151003145344
20151003155808
20151003161423
20151114172520
20151121051625
20151121111607
20151121122900
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY stocks (id, accessory_name, accessory_quantity, accessory_price_per_pcs, used_accessory, last_updated, added_by, description, created_at, updated_at) FROM stdin;
1	Zip	2	3	1	2015-09-22 16:44:33.91141	2	cheap!	2015-09-21 17:53:06.678393	2015-09-22 16:44:33.912698
6	Pen	1	10	1	2015-09-22 16:51:34.656667	2	soft!	2015-09-21 18:31:00.011248	2015-09-22 16:51:34.658317
12	Pen drive	3	10	2	2015-09-23 08:49:12.564726	2	what!!	2015-09-23 08:48:29.824702	2015-09-23 08:49:12.565927
14	fgh	6	10	3	2015-10-04 20:56:38.260002	2	ftyghkj	2015-09-23 09:44:35.468105	2015-10-04 20:56:38.262103
\.


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('stocks_id_seq', 14, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY users (id, name, email, password, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: ussers; Type: TABLE DATA; Schema: public; Owner: bilal
--

COPY ussers (id, admin, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	\N	bilal-tariq@live.com	$2a$10$0F4qtJCnsip8zTVgdsNk0.OcdICnH3LtWS/35.3vMj5ARmezP86kW	\N	\N	\N	1	2015-08-29 13:06:08.334276	2015-08-29 13:06:08.334276	127.0.0.1	127.0.0.1	2015-08-29 13:06:08.319532	2015-08-29 13:06:08.335411
\.


--
-- Name: ussers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bilal
--

SELECT pg_catalog.setval('ussers_id_seq', 1, true);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: gatepass_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY gatepass
    ADD CONSTRAINT gatepass_pkey PRIMARY KEY (id);


--
-- Name: gatepasses_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY gatepasses
    ADD CONSTRAINT gatepasses_pkey PRIMARY KEY (id);


--
-- Name: invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: leaves_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY leaves
    ADD CONSTRAINT leaves_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: registers_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY registers
    ADD CONSTRAINT registers_pkey PRIMARY KEY (id);


--
-- Name: stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ussers_pkey; Type: CONSTRAINT; Schema: public; Owner: bilal; Tablespace: 
--

ALTER TABLE ONLY ussers
    ADD CONSTRAINT ussers_pkey PRIMARY KEY (id);


--
-- Name: index_ussers_on_email; Type: INDEX; Schema: public; Owner: bilal; Tablespace: 
--

CREATE UNIQUE INDEX index_ussers_on_email ON ussers USING btree (email);


--
-- Name: index_ussers_on_reset_password_token; Type: INDEX; Schema: public; Owner: bilal; Tablespace: 
--

CREATE UNIQUE INDEX index_ussers_on_reset_password_token ON ussers USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: bilal; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

