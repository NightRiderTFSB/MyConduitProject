--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

--
-- Name: conduit_schema; Type: SCHEMA; Schema: -; Owner: starboy
--

CREATE SCHEMA conduit_schema;


ALTER SCHEMA conduit_schema OWNER TO starboy;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: purchases; Type: TABLE; Schema: conduit_schema; Owner: starboy
--

CREATE TABLE conduit_schema.purchases (
    id integer NOT NULL,
    name character varying,
    price character varying,
    category character varying,
    id_user_fk integer
);


ALTER TABLE conduit_schema.purchases OWNER TO starboy;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: conduit_schema; Owner: starboy
--

CREATE SEQUENCE conduit_schema.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE conduit_schema.purchases_id_seq OWNER TO starboy;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: conduit_schema; Owner: starboy
--

ALTER SEQUENCE conduit_schema.purchases_id_seq OWNED BY conduit_schema.purchases.id;


--
-- Name: users; Type: TABLE; Schema: conduit_schema; Owner: starboy
--

CREATE TABLE conduit_schema.users (
    id integer NOT NULL,
    username character varying,
    email character varying,
    password character varying
);


ALTER TABLE conduit_schema.users OWNER TO starboy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: conduit_schema; Owner: starboy
--

CREATE SEQUENCE conduit_schema.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE conduit_schema.users_id_seq OWNER TO starboy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: conduit_schema; Owner: starboy
--

ALTER SEQUENCE conduit_schema.users_id_seq OWNED BY conduit_schema.users.id;


--
-- Name: _conduit_version_pgsql; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._conduit_version_pgsql (
    versionnumber integer NOT NULL,
    dateofupgrade timestamp without time zone NOT NULL
);


ALTER TABLE public._conduit_version_pgsql OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id bigint NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    user_id bigint,
    category_id bigint
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_id_seq OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: purchases id; Type: DEFAULT; Schema: conduit_schema; Owner: starboy
--

ALTER TABLE ONLY conduit_schema.purchases ALTER COLUMN id SET DEFAULT nextval('conduit_schema.purchases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: conduit_schema; Owner: starboy
--

ALTER TABLE ONLY conduit_schema.users ALTER COLUMN id SET DEFAULT nextval('conduit_schema.users_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: conduit_schema; Owner: starboy
--

COPY conduit_schema.purchases (id, name, price, category, id_user_fk) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: conduit_schema; Owner: starboy
--

COPY conduit_schema.users (id, username, email, password) FROM stdin;
1	tristan	tristan@gmail.com	1234
2	tristan	tristan@gmail.com	1234
\.


--
-- Data for Name: _conduit_version_pgsql; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._conduit_version_pgsql (versionnumber, dateofupgrade) FROM stdin;
1	2024-05-29 06:01:07.03375
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category, description) FROM stdin;
1	comida	comestible
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, name, price, user_id, category_id) FROM stdin;
1	Papas McDonals	12.59	1	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
1	tristan	tristan@gmail.com	1234
\.


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: conduit_schema; Owner: starboy
--

SELECT pg_catalog.setval('conduit_schema.purchases_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: conduit_schema; Owner: starboy
--

SELECT pg_catalog.setval('conduit_schema.users_id_seq', 2, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: conduit_schema; Owner: starboy
--

ALTER TABLE ONLY conduit_schema.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: conduit_schema; Owner: starboy
--

ALTER TABLE ONLY conduit_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: _conduit_version_pgsql _conduit_version_pgsql_versionnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._conduit_version_pgsql
    ADD CONSTRAINT _conduit_version_pgsql_versionnumber_key UNIQUE (versionnumber);


--
-- Name: categories categories_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_key UNIQUE (category);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: purchases_category_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchases_category_id_idx ON public.purchases USING btree (category_id);


--
-- Name: purchases_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchases_user_id_idx ON public.purchases USING btree (user_id);


--
-- Name: purchases fk_purchases_users; Type: FK CONSTRAINT; Schema: conduit_schema; Owner: starboy
--

ALTER TABLE ONLY conduit_schema.purchases
    ADD CONSTRAINT fk_purchases_users FOREIGN KEY (id_user_fk) REFERENCES conduit_schema.users(id);


--
-- Name: purchases purchases_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

