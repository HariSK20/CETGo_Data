--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: cse; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.cse (
    id character varying NOT NULL,
    x character varying,
    y character varying,
    z character varying,
    val character varying,
    fx character varying,
    fy character varying
);


ALTER TABLE public.cse OWNER TO db_admin;

--
-- Name: cse_map; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.cse_map (
    id character varying(50) NOT NULL,
    x numeric(11,9),
    y numeric(11,9),
    z integer,
    val character varying(50)
);


ALTER TABLE public.cse_map OWNER TO db_admin;

--
-- Name: events; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.events (
    event_id character varying(20) NOT NULL,
    id character varying(10) NOT NULL,
    datetime timestamp with time zone,
    description character varying(100),
    location character varying(20),
    event_name character varying(50) NOT NULL
);


ALTER TABLE public.events OWNER TO db_admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.users (
    id character varying(10),
    username character varying(20),
    password character varying(30)
);


ALTER TABLE public.users OWNER TO db_admin;

--
-- Data for Name: cse; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.cse (id, x, y, z, val, fx, fy) FROM stdin;
gf_wp	76.90368875	8.545634353	0	 Water_Purifier	179.55	492.62
ff_wp	76.90369613	8.545571358	1	 Water_Purifier	215.17	559.78
CS_101	76.9040217	8.545684428	0	 Conference_Hall	668.34	468.84
CS_102	76.90403002	8.545608868	0	 Programming_lab	658.36	606.19
CS_103	76.90393717	8.545597559	0	 Skill_enhancement_lab	545.57	606.19
CS_104	76.90383349	8.545585528	0	 Network_lab	417.42	606.19
CS_105	76.90375809	8.545576777	0	 Faculty_room	324.58	606.19
CS_106	76.90372069	8.545572437	0	 Power_room	264.73	606.19
CS_107	76.90365729	8.545523271	0	 Toilet_(Gents)	98.22	606.19
CS_108	76.90367799	8.545626434	0	 Staff_room	90.54	480.35
CS_109	76.90367438	8.545652092	0	 Faculty_room	90.54	437.38
CS_110	76.90367141	8.545673118	0	 Faculty_room	90.54	401.31
CS_111	76.90366848	8.545693918	0	 Faculty_room	90.54	355.27
CS_112	76.90366483	8.545719807	0	 Faculty_room	90.54	321.51
CS_113	76.90362462	8.545779854	0	 Toilet_(ladies)	90.54	244.78
CS_114	76.90361402	8.545825856	0	 Toilet_(Disabled)	90.54	204.11
CS_115	76.90368975	8.545872977	0	 classroom	221.76	100.52
CS_116	76.90374832	8.54587877	0	 classroom	355.27	100.52
CS_117	76.90386419	8.545890233	0	 Library	496.46	100.52
CS_118	76.90399681	8.545910667	0	 TBI	657.6	100.52
CS_119	76.9040011	8.5458717	0	 HOD_Room	670.64	237.1
CS_201	76.9040217	8.545684428	1	 \tSeminar hall	655.42	360.27
CS_202	76.90403002	8.545608868	1	 \tB.tech(classroom)	655.42	478.16
CS_203	76.90393717	8.545597559	1	 \tadvanced networking lab	655.42	615.84
CS_204	76.90383349	8.545585528	1	  \tdigital lab	525.98	615.84
CS_205	76.90375809	8.545576777	1	 \tlab3(—)	406.44	615.84
CS_206	76.90372069	8.545572437	1	 \tlab4(—)	291.02	615.84
CS_207	76.90365729	8.545523271	1	 \tToilet (Gents)	88.21	615.84
CS_208	76.90367799	8.545626434	1	 \tStaff room	80.79	485.58
CS_209	76.90367438	8.545652092	1	 \tFaculty room	80.79	448.49
CS_210	76.90367141	8.545673118	1	 \tFaculty room	80.79	406.44
CS_211	76.90366848	8.545693918	1	 \tFaculty room	80.79	366.04
CS_212	76.90366483	8.545719807	1	 \tFaculty room	80.79	329.77
CS_213	76.90362462	8.545779854	1	 \tToilet (ladies)	80.79	266.29
CS_214	76.90361402	8.545825856	1	 \telective classroom	183.02	107.17
CS_215	76.90368975	8.545872977	1	 \telective classroom	242.38	107.17
CS_216	76.90374832	8.54587877	1	 \tclassroom (b.tech)	338.8	107.17
CS_217	76.90386419	8.545890233	1	 \tseminar hall	487.23	107.17
CS_218	76.9040011	8.5458717	1	 \tclassroom (b.tech)	639.75	107.17
CS_219	76.90399681	8.545910667	1	 \tclassroom(m.tech)	655.42	249.8
CS_301_B	76.90402129	8.545946756	2	  classroom(m.tech)	715.8	130.68
CS_301_A	76.90397404	8.54593353	2	  m.tech lab(1)	649.48	130.68
CS_302	76.90402397	8.54586652	2	  faculty room	694.13	264.65
CS_303	76.90403913	8.545778348	2	  research scholar	694.13	379.57
CS_304	76.90404804	8.545644327	2	  elective classroom	694.13	504.35
CS_305_A	76.9040204	8.545574671	2	  m.tech lab(2)	645.54	637.66
CS_305_B	76.90408103	8.545571144	2	  classroom(m.tech)	718.43	637.66
CS_S07	76.90370289	8.545532554	0	 Stairs	110.49	91.31
CS_S05	76.90364533	8.545868583	0	 Stairs	193.37	616.93
CS_S17	76.90370289	8.545532554	1	 \tStairs	100.58	106.35
CS_S15	76.90364533	8.545868583	1	 \tStairs	178.9	626.56
CS_S01	76.90394475	8.5457539	0	 Stairs	550.17	364.48
CS_S11	76.90394475	8.5457539	1	 Stairs	538.35	376.76
\.


--
-- Data for Name: cse_map; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.cse_map (id, x, y, z, val) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.events (event_id, id, datetime, description, location, event_name) FROM stdin;
1	1	2001-01-01 00:00:00+05:30	test event		Test event
2	2	2001-01-01 00:00:00+05:30	test event created using the api	CSE101	Test event2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.users (id, username, password) FROM stdin;
2	test_user	Password@123
1	admin	adminPassword@123
\.


--
-- Name: cse_map cse_map_pkey; Type: CONSTRAINT; Schema: public; Owner: db_admin
--

ALTER TABLE ONLY public.cse_map
    ADD CONSTRAINT cse_map_pkey PRIMARY KEY (id);


--
-- Name: cse cse_pk; Type: CONSTRAINT; Schema: public; Owner: db_admin
--

ALTER TABLE ONLY public.cse
    ADD CONSTRAINT cse_pk PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: db_admin
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- PostgreSQL database dump complete
--

