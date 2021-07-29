--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

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
-- Name: cities; Type: TABLE; Schema: public; Owner: redux
--

CREATE TABLE public.cities (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO redux;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: redux
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO redux;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redux
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: redux
--

CREATE TABLE public.stops (
    id integer NOT NULL,
    city_id integer,
    train_id integer
);


ALTER TABLE public.stops OWNER TO redux;

--
-- Name: stops_id_seq; Type: SEQUENCE; Schema: public; Owner: redux
--

CREATE SEQUENCE public.stops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_id_seq OWNER TO redux;

--
-- Name: stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redux
--

ALTER SEQUENCE public.stops_id_seq OWNED BY public.stops.id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: redux
--

CREATE TABLE public.trains (
    name character varying,
    "time" integer,
    id integer NOT NULL
);


ALTER TABLE public.trains OWNER TO redux;

--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: redux
--

CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_id_seq OWNER TO redux;

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redux
--

ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: stops id; Type: DEFAULT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.stops ALTER COLUMN id SET DEFAULT nextval('public.stops_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: redux
--

COPY public.cities (name, id) FROM stdin;
\.


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: redux
--

COPY public.stops (id, city_id, train_id) FROM stdin;
1	471	210
2	481	217
3	727	361
4	738	369
5	749	377
6	760	385
7	771	393
8	782	401
9	793	409
10	804	417
11	815	425
12	826	433
13	837	441
14	848	449
15	859	457
16	870	465
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: redux
--

COPY public.trains (name, "time", id) FROM stdin;
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redux
--

SELECT pg_catalog.setval('public.cities_id_seq', 871, true);


--
-- Name: stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redux
--

SELECT pg_catalog.setval('public.stops_id_seq', 16, true);


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redux
--

SELECT pg_catalog.setval('public.trains_id_seq', 472, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: stops stops_pkey; Type: CONSTRAINT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: redux
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

