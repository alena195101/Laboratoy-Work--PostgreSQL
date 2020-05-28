--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: bank_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_income (
    id integer NOT NULL,
    ddate date,
    summ integer,
    client integer
);


ALTER TABLE public.bank_income OWNER TO postgres;

--
-- Name: bank_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_income_id_seq OWNER TO postgres;

--
-- Name: bank_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_income_id_seq OWNED BY public.bank_income.id;


--
-- Name: bank_recept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_recept (
    id integer NOT NULL,
    ddate date,
    summ integer,
    client integer
);


ALTER TABLE public.bank_recept OWNER TO postgres;

--
-- Name: bank_recept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_recept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_recept_id_seq OWNER TO postgres;

--
-- Name: bank_recept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_recept_id_seq OWNED BY public.bank_recept.id;


--
-- Name: cassa_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cassa_income (
    id integer NOT NULL,
    ddate date,
    summ integer,
    client integer
);


ALTER TABLE public.cassa_income OWNER TO postgres;

--
-- Name: cassa_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cassa_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cassa_income_id_seq OWNER TO postgres;

--
-- Name: cassa_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cassa_income_id_seq OWNED BY public.cassa_income.id;


--
-- Name: cassa_recept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cassa_recept (
    id integer NOT NULL,
    ddate date,
    summ integer,
    client integer
);


ALTER TABLE public.cassa_recept OWNER TO postgres;

--
-- Name: cassa_recept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cassa_recept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cassa_recept_id_seq OWNER TO postgres;

--
-- Name: cassa_recept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cassa_recept_id_seq OWNED BY public.cassa_recept.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    name text,
    region integer
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name text,
    address text,
    city integer
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: goods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods (
    id integer NOT NULL,
    g_group integer,
    name text,
    weight numeric(18,4),
    length numeric(18,4),
    height numeric(18,4),
    width numeric(18,4)
);


ALTER TABLE public.goods OWNER TO postgres;

--
-- Name: goods_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods_groups (
    id integer NOT NULL,
    name text,
    parent integer
);


ALTER TABLE public.goods_groups OWNER TO postgres;

--
-- Name: goods_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goods_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goods_groups_id_seq OWNER TO postgres;

--
-- Name: goods_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goods_groups_id_seq OWNED BY public.goods_groups.id;


--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goods_id_seq OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goods_id_seq OWNED BY public.goods.id;


--
-- Name: incgoods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incgoods (
    id integer NOT NULL,
    subid integer,
    goods integer,
    volume integer,
    price numeric(18,4)
);


ALTER TABLE public.incgoods OWNER TO postgres;

--
-- Name: income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.income (
    id integer NOT NULL,
    ddate date,
    ndoc integer,
    client integer,
    storage integer
);


ALTER TABLE public.income OWNER TO postgres;

--
-- Name: income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.income_id_seq OWNER TO postgres;

--
-- Name: income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.income_id_seq OWNED BY public.income.id;


--
-- Name: irlink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.irlink (
    id integer NOT NULL,
    i_id integer,
    i_subid integer,
    r_id integer,
    r_subid integer,
    goods integer,
    volume integer
);


ALTER TABLE public.irlink OWNER TO postgres;

--
-- Name: irlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.irlink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.irlink_id_seq OWNER TO postgres;

--
-- Name: irlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.irlink_id_seq OWNED BY public.irlink.id;


--
-- Name: recept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recept (
    id integer NOT NULL,
    ddate date,
    ndoc integer,
    client integer,
    storage integer
);


ALTER TABLE public.recept OWNER TO postgres;

--
-- Name: recept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recept_id_seq OWNER TO postgres;

--
-- Name: recept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recept_id_seq OWNED BY public.recept.id;


--
-- Name: recgoods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recgoods (
    id integer NOT NULL,
    subid integer,
    goods integer,
    volume integer,
    price numeric(18,4)
);


ALTER TABLE public.recgoods OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- Name: storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_id_seq OWNER TO postgres;

--
-- Name: storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_id_seq OWNED BY public.storage.id;


--
-- Name: bank_income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_income ALTER COLUMN id SET DEFAULT nextval('public.bank_income_id_seq'::regclass);


--
-- Name: bank_recept id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_recept ALTER COLUMN id SET DEFAULT nextval('public.bank_recept_id_seq'::regclass);


--
-- Name: cassa_income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_income ALTER COLUMN id SET DEFAULT nextval('public.cassa_income_id_seq'::regclass);


--
-- Name: cassa_recept id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_recept ALTER COLUMN id SET DEFAULT nextval('public.cassa_recept_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: goods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods ALTER COLUMN id SET DEFAULT nextval('public.goods_id_seq'::regclass);


--
-- Name: goods_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_groups ALTER COLUMN id SET DEFAULT nextval('public.goods_groups_id_seq'::regclass);


--
-- Name: income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.income ALTER COLUMN id SET DEFAULT nextval('public.income_id_seq'::regclass);


--
-- Name: irlink id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.irlink ALTER COLUMN id SET DEFAULT nextval('public.irlink_id_seq'::regclass);


--
-- Name: recept id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept ALTER COLUMN id SET DEFAULT nextval('public.recept_id_seq'::regclass);


--
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage ALTER COLUMN id SET DEFAULT nextval('public.storage_id_seq'::regclass);


--
-- Data for Name: bank_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_income (id, ddate, summ, client) FROM stdin;
1	2018-08-13	115995	39
2	2019-01-19	60648	10
3	2019-01-15	132768	13
4	2020-04-14	418336	34
5	2020-06-14	307725	20
6	2018-08-12	57050	38
7	2020-03-08	108630	28
8	2018-08-22	126168	38
9	2020-01-22	16905	5
10	2018-03-11	70104	1
11	2020-04-13	351936	29
12	2019-09-09	602730	34
13	2019-03-03	158103	28
14	2019-04-11	24969	2
15	2018-09-08	16750	3
16	2019-09-07	408307	22
17	2019-02-02	756258	12
18	2020-05-01	64108	33
19	2018-08-07	1875	4
20	2020-12-18	444636	23
21	2020-05-29	315276	4
22	2018-06-05	58539	34
23	2020-01-22	207900	33
24	2018-01-06	47396	11
25	2019-09-29	771936	28
26	2018-03-26	107604	4
27	2019-07-30	19065	5
28	2018-09-24	751928	21
29	2020-11-16	394109	17
30	2018-11-16	11250	14
31	2020-03-22	43632	30
32	2019-12-11	317240	6
33	2019-09-29	247760	31
34	2018-03-30	554976	39
35	2019-11-17	210105	25
36	2019-06-15	181300	12
37	2020-08-24	591314	23
38	2020-07-01	324762	11
39	2019-03-02	134225	32
40	2020-03-15	417760	28
41	2020-02-06	405802	14
42	2020-11-29	96390	32
43	2019-07-21	76180	37
44	2020-12-16	173499	1
45	2019-11-03	342360	12
46	2018-11-03	316526	28
47	2019-02-20	109620	6
48	2018-12-17	415410	26
49	2020-02-25	141680	15
50	2018-02-07	170173	23
51	2020-02-03	92382	36
52	2020-02-14	350196	18
53	2020-08-16	132871	26
54	2019-12-13	248474	26
55	2019-11-29	223668	20
56	2018-12-18	82992	32
57	2020-08-03	508200	30
58	2018-12-04	14145	5
59	2020-01-31	135954	28
60	2019-06-02	53700	12
61	2019-08-07	120466	5
62	2020-04-30	259900	16
63	2019-08-27	184836	16
64	2020-07-24	2948	25
65	2019-01-18	396240	28
66	2018-09-18	427710	26
67	2019-07-05	513009	27
68	2018-09-07	523534	19
69	2019-11-14	458280	16
70	2019-08-19	27778	5
71	2018-07-14	6620	20
72	2020-07-29	19719	40
73	2020-04-20	14529	26
74	2020-10-10	161070	38
75	2019-06-22	201600	33
76	2018-05-16	4860	14
77	2018-02-19	238632	8
78	2020-01-01	178959	37
79	2019-01-25	121069	35
80	2020-07-04	348664	22
81	2018-04-06	88950	3
82	2020-02-13	447966	4
83	2019-12-20	517335	3
84	2020-02-29	43904	36
85	2020-07-24	8721	16
86	2018-03-18	298155	10
87	2019-07-11	168888	20
88	2020-12-10	3913	9
89	2019-07-11	399212	1
90	2020-06-03	54057	6
91	2019-10-07	419936	2
92	2018-09-17	293266	20
93	2019-05-16	749824	18
94	2020-05-06	162782	25
95	2019-04-25	311225	34
96	2018-03-26	79625	28
97	2020-10-08	34286	8
98	2020-04-02	5060	8
99	2018-12-24	791721	36
100	2019-10-10	494960	22
\.


--
-- Data for Name: bank_recept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_recept (id, ddate, summ, client) FROM stdin;
1	2020-10-11	214682	30
2	2019-07-20	42432	15
3	2020-03-06	384800	34
4	2018-12-16	227360	36
5	2018-11-09	56316	19
6	2018-01-28	129250	11
7	2019-02-01	219125	5
8	2020-11-18	398722	8
9	2018-03-19	13181	17
10	2020-04-17	487552	39
11	2019-05-21	16055	18
12	2019-11-16	201492	24
13	2020-03-22	9856	34
14	2018-11-01	84410	2
15	2019-04-01	896584	2
16	2020-01-31	122016	18
17	2020-08-18	171456	35
18	2018-12-16	404382	9
19	2020-09-06	58512	29
20	2018-04-21	108204	31
21	2018-02-10	170312	9
22	2020-11-08	76059	23
23	2018-10-12	553910	23
24	2020-02-15	63312	40
25	2019-04-15	345744	35
26	2019-11-02	31486	32
27	2018-10-31	278544	32
28	2018-02-08	105850	14
29	2018-11-18	9840	9
30	2020-05-22	368212	5
31	2020-04-23	57085	7
32	2020-10-02	11844	38
33	2019-04-20	255644	37
34	2018-05-14	89964	11
35	2019-10-12	44982	10
36	2018-08-14	813540	14
37	2020-10-24	268380	39
38	2018-08-31	143306	20
39	2019-11-17	22999	29
40	2020-09-01	210870	6
41	2018-03-13	209196	22
42	2019-04-13	106190	25
43	2018-04-19	398940	22
44	2019-01-03	625650	6
45	2018-11-17	732060	9
46	2020-03-25	234110	35
47	2019-08-19	73667	38
48	2019-10-08	84318	19
49	2020-09-02	295191	3
50	2018-06-12	30702	21
51	2019-11-02	29972	19
52	2018-08-16	85012	3
53	2018-01-22	71398	27
54	2018-05-20	18144	14
55	2020-02-12	282951	33
56	2018-03-19	309672	3
57	2018-12-03	44415	11
58	2018-05-29	191250	20
59	2018-10-11	88400	16
60	2019-01-28	558558	28
61	2019-04-08	537315	11
62	2020-11-02	396240	5
63	2018-04-25	659634	5
64	2020-11-27	325653	39
65	2018-02-02	237046	23
66	2020-04-30	119770	34
67	2020-11-24	476850	20
68	2018-09-04	135584	15
69	2019-01-30	54912	2
70	2019-04-03	318	23
71	2020-07-20	65458	38
72	2020-09-21	216946	13
73	2020-09-15	603120	33
74	2018-08-04	110112	38
75	2019-01-11	280864	24
76	2019-02-03	73260	13
77	2019-03-03	81216	39
78	2018-12-10	628208	32
79	2018-04-23	182970	29
80	2018-11-19	116289	18
81	2019-05-27	694194	39
82	2019-05-16	238140	31
83	2020-01-18	2316	25
84	2019-11-03	86264	37
85	2019-09-30	48363	28
86	2020-02-15	633568	16
87	2018-07-15	614114	22
88	2019-06-30	94080	14
89	2019-07-20	180908	36
90	2019-09-27	46640	23
91	2020-05-25	12496	33
92	2018-05-24	251940	26
93	2019-01-29	144180	27
94	2018-03-17	4025	24
95	2019-10-06	307366	5
96	2018-05-29	96145	28
97	2018-05-06	405840	7
98	2019-02-05	81641	1
99	2018-02-14	189126	15
100	2020-06-07	175376	9
\.


--
-- Data for Name: cassa_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cassa_income (id, ddate, summ, client) FROM stdin;
\.


--
-- Data for Name: cassa_recept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cassa_recept (id, ddate, summ, client) FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, name, region) FROM stdin;
1	город 1	3
2	город 2	2
3	город 3	4
4	город 4	3
5	город 5	1
6	город 6	1
7	город 7	4
8	город 8	1
9	город 9	2
10	город 10	3
11	город 11	1
12	город 12	2
13	город 13	1
14	город 14	4
15	город 15	1
16	город 16	1
17	город 17	1
18	город 18	2
19	город 19	3
20	город 20	1
21	город 21	4
22	город 22	4
23	город 23	1
24	город 24	4
25	город 25	2
26	город 26	1
27	город 27	1
28	город 28	1
29	город 29	1
30	город 30	4
31	город 31	3
32	город 32	1
33	город 33	3
34	город 34	1
35	город 35	3
36	город 36	1
37	город 37	3
38	город 38	4
39	город 39	4
40	город 40	2
41	город 41	4
42	город 42	4
43	город 43	4
44	город 44	3
45	город 45	4
46	город 46	3
47	город 47	3
48	город 48	4
49	город 49	1
50	город 50	1
51	город 51	1
52	город 52	2
53	город 53	3
54	город 54	4
55	город 55	3
56	город 56	2
57	город 57	3
58	город 58	1
59	город 59	4
60	город 60	1
61	город 61	3
62	город 62	4
63	город 63	3
64	город 64	2
65	город 65	4
66	город 66	2
67	город 67	4
68	город 68	3
69	город 69	4
70	город 70	2
71	город 71	4
72	город 72	3
73	город 73	3
74	город 74	1
75	город 75	4
76	город 76	1
77	город 77	2
78	город 78	1
79	город 79	3
80	город 80	1
81	город 81	4
82	город 82	3
83	город 83	4
84	город 84	2
85	город 85	2
86	город 86	4
87	город 87	4
88	город 88	1
89	город 89	3
90	город 90	4
91	город 91	3
92	город 92	1
93	город 93	2
94	город 94	1
95	город 95	3
96	город 96	3
97	город 97	2
98	город 98	1
99	город 99	4
100	город 100	4
101	город 101	1
102	город 102	1
103	город 103	2
104	город 104	4
105	город 105	2
106	город 106	2
107	город 107	4
108	город 108	1
109	город 109	1
110	город 110	1
111	город 111	1
112	город 112	3
113	город 113	2
114	город 114	3
115	город 115	1
116	город 116	3
117	город 117	4
118	город 118	4
119	город 119	1
120	город 120	1
121	город 121	4
122	город 122	3
123	город 123	3
124	город 124	1
125	город 125	1
126	город 126	2
127	город 127	4
128	город 128	4
129	город 129	1
130	город 130	1
131	город 131	1
132	город 132	1
133	город 133	3
134	город 134	1
135	город 135	2
136	город 136	1
137	город 137	3
138	город 138	4
139	город 139	4
140	город 140	4
141	город 141	2
142	город 142	3
143	город 143	4
144	город 144	4
145	город 145	4
146	город 146	4
147	город 147	2
148	город 148	1
149	город 149	3
150	город 150	4
151	город 151	2
152	город 152	1
153	город 153	4
154	город 154	1
155	город 155	1
156	город 156	2
157	город 157	1
158	город 158	3
159	город 159	4
160	город 160	3
161	город 161	1
162	город 162	1
163	город 163	2
164	город 164	1
165	город 165	1
166	город 166	4
167	город 167	2
168	город 168	2
169	город 169	1
170	город 170	1
171	город 171	1
172	город 172	1
173	город 173	4
174	город 174	2
175	город 175	3
176	город 176	2
177	город 177	2
178	город 178	4
179	город 179	1
180	город 180	3
181	город 181	3
182	город 182	2
183	город 183	3
184	город 184	4
185	город 185	3
186	город 186	3
187	город 187	3
188	город 188	3
189	город 189	3
190	город 190	2
191	город 191	1
192	город 192	3
193	город 193	3
194	город 194	4
195	город 195	1
196	город 196	1
197	город 197	3
198	город 198	4
199	город 199	1
200	город 200	1
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, address, city) FROM stdin;
1	клиент1	адресс_2	23
2	клиент2	адресс_4	19
3	клиент3	адресс_6	113
4	клиент4	адресс_8	193
5	клиент5	адресс_10	188
6	клиент6	адресс_12	51
7	клиент7	адресс_14	30
8	клиент8	адресс_16	131
9	клиент9	адресс_18	165
10	клиент10	адресс_20	110
11	клиент11	адресс_22	24
12	клиент12	адресс_24	32
13	клиент13	адресс_26	118
14	клиент14	адресс_28	51
15	клиент15	адресс_30	63
16	клиент16	адресс_32	1
17	клиент17	адресс_34	17
18	клиент18	адресс_36	59
19	клиент19	адресс_38	114
20	клиент20	адресс_40	127
21	клиент21	адресс_42	29
22	клиент22	адресс_44	171
23	клиент23	адресс_46	52
24	клиент24	адресс_48	67
25	клиент25	адресс_50	3
26	клиент26	адресс_52	28
27	клиент27	адресс_54	195
28	клиент28	адресс_56	92
29	клиент29	адресс_58	69
30	клиент30	адресс_60	174
31	клиент31	адресс_62	133
32	клиент32	адресс_64	50
33	клиент33	адресс_66	21
34	клиент34	адресс_68	105
35	клиент35	адресс_70	2
36	клиент36	адресс_72	28
37	клиент37	адресс_74	143
38	клиент38	адресс_76	93
39	клиент39	адресс_78	63
40	клиент40	адресс_80	87
\.


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods (id, g_group, name, weight, length, height, width) FROM stdin;
1	1	товар 1	1.0000	2.0000	10.0000	7.0000
2	2	товар 2	10.0000	4.0000	22.0000	18.0000
3	5	товар 3	9.0000	16.0000	14.0000	13.0000
4	3	товар 4	10.0000	10.0000	36.0000	2.0000
5	3	товар 5	7.0000	17.0000	49.0000	6.0000
6	3	товар 6	10.0000	1.0000	17.0000	17.0000
7	1	товар 7	7.0000	13.0000	41.0000	13.0000
8	3	товар 8	7.0000	11.0000	23.0000	10.0000
9	1	товар 9	1.0000	13.0000	25.0000	20.0000
10	3	товар 10	8.0000	7.0000	18.0000	19.0000
11	5	товар 11	10.0000	6.0000	12.0000	2.0000
12	4	товар 12	6.0000	8.0000	31.0000	17.0000
13	3	товар 13	3.0000	12.0000	24.0000	4.0000
14	5	товар 14	8.0000	3.0000	36.0000	14.0000
15	5	товар 15	10.0000	20.0000	50.0000	13.0000
16	1	товар 16	6.0000	1.0000	16.0000	10.0000
17	1	товар 17	1.0000	10.0000	34.0000	20.0000
18	1	товар 18	7.0000	5.0000	48.0000	18.0000
19	2	товар 19	5.0000	1.0000	12.0000	6.0000
20	1	товар 20	1.0000	11.0000	33.0000	5.0000
\.


--
-- Data for Name: goods_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_groups (id, name, parent) FROM stdin;
1	группа товаров : 1	\N
2	группа товаров : 2	\N
3	группа товаров : 3	\N
4	группа товаров : 4	\N
5	группа товаров : 5	\N
\.


--
-- Data for Name: incgoods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incgoods (id, subid, goods, volume, price) FROM stdin;
1	1	9	359	598.0000
2	2	9	78	544.0000
3	3	12	400	962.0000
4	4	10	232	980.0000
5	5	12	156	361.0000
6	6	2	275	470.0000
7	7	5	125	1753.0000
8	8	9	218	1829.0000
9	9	15	269	49.0000
10	10	6	416	1172.0000
11	11	1	247	65.0000
12	12	14	386	522.0000
13	13	20	7	1408.0000
14	14	20	367	230.0000
15	15	2	481	1864.0000
16	16	3	496	246.0000
17	17	14	114	1504.0000
18	18	16	363	1114.0000
19	19	16	368	159.0000
20	20	1	284	381.0000
21	21	1	349	488.0000
22	22	12	313	243.0000
23	23	9	287	1930.0000
24	24	13	48	1319.0000
25	25	19	196	1764.0000
26	26	8	346	91.0000
27	27	8	168	1658.0000
28	28	15	145	730.0000
29	29	10	16	615.0000
30	30	5	388	949.0000
31	31	4	49	1165.0000
32	32	20	423	28.0000
33	33	4	316	809.0000
34	34	18	238	378.0000
35	35	10	189	238.0000
36	36	1	455	1788.0000
37	37	13	213	1260.0000
38	38	10	79	1814.0000
39	39	16	109	211.0000
40	40	9	297	710.0000
41	41	11	447	468.0000
42	42	19	70	1517.0000
43	43	3	366	1090.0000
44	44	11	485	1290.0000
45	45	19	415	1764.0000
46	46	17	410	571.0000
47	47	12	181	407.0000
48	48	17	141	598.0000
49	49	16	377	783.0000
50	50	20	238	129.0000
\.


--
-- Data for Name: income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.income (id, ddate, ndoc, client, storage) FROM stdin;
1	2020-10-11	1	30	1
2	2019-07-20	2	15	1
3	2020-03-06	3	34	1
5	2018-11-09	5	19	4
6	2018-01-28	6	11	2
7	2019-02-01	7	5	3
8	2020-11-18	8	8	4
9	2018-03-19	9	17	1
11	2019-05-21	11	18	2
12	2019-11-16	12	24	2
13	2020-03-22	13	34	4
14	2018-11-01	14	2	4
15	2019-04-01	15	2	2
16	2020-01-31	16	18	2
17	2020-08-18	17	35	3
18	2018-12-16	18	9	3
19	2020-09-06	19	29	2
20	2018-04-21	20	31	3
21	2018-02-10	21	9	1
23	2018-10-12	23	23	1
25	2019-04-15	25	35	4
27	2018-10-31	27	32	2
28	2018-02-08	28	14	1
29	2018-11-18	29	9	3
30	2020-05-22	30	5	3
31	2020-04-23	31	7	1
32	2020-10-02	32	38	4
33	2019-04-20	33	37	1
34	2018-05-14	34	11	3
35	2019-10-12	35	10	2
36	2018-08-14	36	14	4
37	2020-10-24	37	39	3
38	2018-08-31	38	20	3
39	2019-11-17	39	29	3
41	2018-03-13	41	22	1
43	2018-04-19	43	22	3
44	2019-01-03	44	6	3
45	2018-11-17	45	9	3
46	2020-03-25	46	35	4
47	2019-08-19	47	38	4
48	2019-10-08	48	19	1
49	2020-09-02	49	3	2
50	2018-06-12	50	21	2
10	2018-04-17	10	39	1
26	2018-01-02	26	32	4
40	2019-04-01	40	6	4
24	2018-02-01	24	40	4
4	2018-02-01	4	36	4
22	2019-01-08	22	23	2
42	2018-03-08	42	25	2
\.


--
-- Data for Name: irlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.irlink (id, i_id, i_subid, r_id, r_subid, goods, volume) FROM stdin;
1	36	36	4	4	1	272
2	10	10	48	48	6	410
3	27	27	9	9	8	100
4	26	26	50	50	8	167
5	23	23	7	7	9	102
6	40	40	16	16	9	229
7	4	4	26	26	10	84
8	4	4	8	8	10	84
9	41	41	37	37	11	346
10	22	22	2	2	12	42
11	5	5	13	13	12	99
12	28	28	1	1	15	145
13	9	9	1	1	15	40
14	9	9	14	14	15	41
15	46	46	12	12	17	370
16	42	42	10	10	19	15
17	42	42	44	44	19	15
18	45	45	36	36	19	245
19	25	25	15	15	19	134
20	14	14	41	41	20	362
\.


--
-- Data for Name: recept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recept (id, ddate, ndoc, client, storage) FROM stdin;
1	2018-08-13	1	39	1
2	2019-01-19	2	10	2
4	2020-04-14	4	34	4
7	2020-03-08	7	28	1
8	2018-08-22	8	38	4
9	2020-01-22	9	5	2
10	2018-03-11	10	1	2
12	2019-09-09	12	34	4
13	2019-03-03	13	28	4
14	2019-04-11	14	2	1
15	2018-09-08	15	3	4
16	2019-09-07	16	22	4
26	2018-03-26	26	4	4
36	2019-06-15	36	12	3
37	2020-08-24	37	23	1
41	2020-02-06	41	14	4
44	2020-12-16	44	1	2
48	2018-12-17	48	26	1
50	2018-02-07	50	23	4
\.


--
-- Data for Name: recgoods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recgoods (id, subid, goods, volume, price) FROM stdin;
1	1	15	185	627.0000
2	2	12	42	1444.0000
10	10	19	15	508.0000
4	4	1	272	1538.0000
44	44	19	15	383.0000
7	7	9	102	1065.0000
8	8	10	84	1502.0000
12	12	17	370	1629.0000
13	13	12	99	1597.0000
14	14	15	41	609.0000
15	15	19	134	125.0000
16	16	9	229	1783.0000
26	26	10	84	1281.0000
36	36	19	245	740.0000
37	37	11	346	1709.0000
41	41	20	362	1121.0000
50	50	8	167	1019.0000
48	48	6	410	915.0000
9	9	8	100	49.0000
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, name) FROM stdin;
1	регион 1
2	регион 2
3	регион 3
4	регион 4
\.


--
-- Data for Name: storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage (id, name) FROM stdin;
1	склад 1
2	склад 2
3	склад 3
4	склад 4
\.


--
-- Name: bank_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_income_id_seq', 100, true);


--
-- Name: bank_recept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_recept_id_seq', 100, true);


--
-- Name: cassa_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cassa_income_id_seq', 1, false);


--
-- Name: cassa_recept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cassa_recept_id_seq', 1, false);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 200, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 40, true);


--
-- Name: goods_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goods_groups_id_seq', 5, true);


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goods_id_seq', 20, true);


--
-- Name: income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.income_id_seq', 100, true);


--
-- Name: irlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.irlink_id_seq', 1, false);


--
-- Name: recept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recept_id_seq', 100, true);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 4, true);


--
-- Name: storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_id_seq', 4, true);


--
-- Name: bank_income bank_income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_income
    ADD CONSTRAINT bank_income_pkey PRIMARY KEY (id);


--
-- Name: bank_recept bank_recept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_recept
    ADD CONSTRAINT bank_recept_pkey PRIMARY KEY (id);


--
-- Name: cassa_income cassa_income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_income
    ADD CONSTRAINT cassa_income_pkey PRIMARY KEY (id);


--
-- Name: cassa_recept cassa_recept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_recept
    ADD CONSTRAINT cassa_recept_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: goods_groups goods_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_groups
    ADD CONSTRAINT goods_groups_pkey PRIMARY KEY (id);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: incgoods incgoods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incgoods
    ADD CONSTRAINT incgoods_pkey PRIMARY KEY (id);


--
-- Name: income income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.income
    ADD CONSTRAINT income_pkey PRIMARY KEY (id);


--
-- Name: irlink irlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.irlink
    ADD CONSTRAINT irlink_pkey PRIMARY KEY (id);


--
-- Name: recept recept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_pkey PRIMARY KEY (id);


--
-- Name: recgoods recgoods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recgoods
    ADD CONSTRAINT recgoods_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: storage storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (id);


--
-- Name: bank_income bank_income_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_income
    ADD CONSTRAINT bank_income_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: bank_recept bank_recept_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_recept
    ADD CONSTRAINT bank_recept_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: cassa_income cassa_income_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_income
    ADD CONSTRAINT cassa_income_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: cassa_recept cassa_recept_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cassa_recept
    ADD CONSTRAINT cassa_recept_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: city city_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_region_fkey FOREIGN KEY (region) REFERENCES public.region(id);


--
-- Name: client client_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_city_fkey FOREIGN KEY (city) REFERENCES public.city(id);


--
-- Name: goods goods_g_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_g_group_fkey FOREIGN KEY (g_group) REFERENCES public.goods_groups(id);


--
-- Name: goods_groups goods_groups_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_groups
    ADD CONSTRAINT goods_groups_parent_fkey FOREIGN KEY (parent) REFERENCES public.goods_groups(id);


--
-- Name: incgoods incgoods_goods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incgoods
    ADD CONSTRAINT incgoods_goods_fkey FOREIGN KEY (goods) REFERENCES public.goods(id);


--
-- Name: incgoods incgoods_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incgoods
    ADD CONSTRAINT incgoods_id_fkey FOREIGN KEY (id) REFERENCES public.income(id);


--
-- Name: income income_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.income
    ADD CONSTRAINT income_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: income income_storage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.income
    ADD CONSTRAINT income_storage_fkey FOREIGN KEY (storage) REFERENCES public.storage(id);


--
-- Name: irlink irlink_goods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.irlink
    ADD CONSTRAINT irlink_goods_fkey FOREIGN KEY (goods) REFERENCES public.goods(id);


--
-- Name: irlink irlink_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.irlink
    ADD CONSTRAINT irlink_i_id_fkey FOREIGN KEY (i_id) REFERENCES public.income(id);


--
-- Name: irlink irlink_r_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.irlink
    ADD CONSTRAINT irlink_r_id_fkey FOREIGN KEY (r_id) REFERENCES public.recept(id);


--
-- Name: recept recept_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: recept recept_storage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_storage_fkey FOREIGN KEY (storage) REFERENCES public.storage(id);


--
-- Name: recgoods recgoods_goods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recgoods
    ADD CONSTRAINT recgoods_goods_fkey FOREIGN KEY (goods) REFERENCES public.goods(id);


--
-- Name: recgoods recgoods_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recgoods
    ADD CONSTRAINT recgoods_id_fkey FOREIGN KEY (id) REFERENCES public.recept(id);


--
-- PostgreSQL database dump complete
--

