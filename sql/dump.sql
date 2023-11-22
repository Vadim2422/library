--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    surname_author character varying(255) NOT NULL,
    name_author character varying(255) NOT NULL,
    last_name_author character varying(255),
    date_birth_author date NOT NULL,
    date_die_author date,
    id_author integer NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_author_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_author_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_author_seq OWNER TO postgres;

--
-- Name: author_id_author_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_author_seq OWNED BY public.author.id_author;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    publisher_book character varying(255) NOT NULL,
    name_book character varying(255) NOT NULL,
    id_book integer NOT NULL,
    date_publish_book date
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_book_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_book_seq OWNER TO postgres;

--
-- Name: book_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_book_seq OWNED BY public.book.id_book;


--
-- Name: bookcopy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookcopy (
    quality_bc character varying(20) NOT NULL,
    serial_number_bc character varying(20) NOT NULL,
    id_book integer NOT NULL,
    id_unit integer NOT NULL
);


ALTER TABLE public.bookcopy OWNER TO postgres;

--
-- Name: fine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fine (
    cause_fine character varying(255) NOT NULL,
    summ_fine integer NOT NULL,
    id_fine integer NOT NULL,
    id_request integer NOT NULL
);


ALTER TABLE public.fine OWNER TO postgres;

--
-- Name: fine_id_fine_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fine_id_fine_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fine_id_fine_seq OWNER TO postgres;

--
-- Name: fine_id_fine_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fine_id_fine_seq OWNED BY public.fine.id_fine;


--
-- Name: reader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader (
    fio_reader character varying(255) NOT NULL,
    phone_reader character(10) NOT NULL,
    address_reader character varying(255) NOT NULL,
    id_reader integer NOT NULL
);


ALTER TABLE public.reader OWNER TO postgres;

--
-- Name: reader_id_reader_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reader_id_reader_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reader_id_reader_seq OWNER TO postgres;

--
-- Name: reader_id_reader_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reader_id_reader_seq OWNED BY public.reader.id_reader;


--
-- Name: request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request (
    date_receiving date NOT NULL,
    id_request integer NOT NULL,
    serial_number_bc character varying(20) NOT NULL,
    id_subscription integer NOT NULL,
    date_plan date NOT NULL,
    date_actual date
);


ALTER TABLE public.request OWNER TO postgres;

--
-- Name: request_id_request_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.request_id_request_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_id_request_seq OWNER TO postgres;

--
-- Name: request_id_request_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.request_id_request_seq OWNED BY public.request.id_request;


--
-- Name: sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sequence (
    id_book integer NOT NULL,
    id_author integer NOT NULL,
    number smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.sequence OWNER TO postgres;

--
-- Name: subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription (
    date_receiving date NOT NULL,
    date_ending date NOT NULL,
    id_subscription integer NOT NULL,
    id_reader integer NOT NULL
);


ALTER TABLE public.subscription OWNER TO postgres;

--
-- Name: subscription_id_subscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_id_subscription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_id_subscription_seq OWNER TO postgres;

--
-- Name: subscription_id_subscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_id_subscription_seq OWNED BY public.subscription.id_subscription;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    name_unit character varying(255) NOT NULL,
    id_unit integer NOT NULL
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- Name: unit_id_unit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_id_unit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_unit_seq OWNER TO postgres;

--
-- Name: unit_id_unit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_id_unit_seq OWNED BY public.unit.id_unit;


--
-- Name: author id_author; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id_author SET DEFAULT nextval('public.author_id_author_seq'::regclass);


--
-- Name: book id_book; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id_book SET DEFAULT nextval('public.book_id_book_seq'::regclass);


--
-- Name: fine id_fine; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine ALTER COLUMN id_fine SET DEFAULT nextval('public.fine_id_fine_seq'::regclass);


--
-- Name: reader id_reader; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader ALTER COLUMN id_reader SET DEFAULT nextval('public.reader_id_reader_seq'::regclass);


--
-- Name: request id_request; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request ALTER COLUMN id_request SET DEFAULT nextval('public.request_id_request_seq'::regclass);


--
-- Name: subscription id_subscription; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription ALTER COLUMN id_subscription SET DEFAULT nextval('public.subscription_id_subscription_seq'::regclass);


--
-- Name: unit id_unit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit ALTER COLUMN id_unit SET DEFAULT nextval('public.unit_id_unit_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (surname_author, name_author, last_name_author, date_birth_author, date_die_author, id_author) FROM stdin;
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (publisher_book, name_book, id_book, date_publish_book) FROM stdin;
\.


--
-- Data for Name: bookcopy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookcopy (quality_bc, serial_number_bc, id_book, id_unit) FROM stdin;
\.


--
-- Data for Name: fine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fine (cause_fine, summ_fine, id_fine, id_request) FROM stdin;
\.


--
-- Data for Name: reader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader (fio_reader, phone_reader, address_reader, id_reader) FROM stdin;
\.


--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request (date_receiving, id_request, serial_number_bc, id_subscription, date_plan, date_actual) FROM stdin;
\.


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sequence (id_book, id_author, number) FROM stdin;
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription (date_receiving, date_ending, id_subscription, id_reader) FROM stdin;
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit (name_unit, id_unit) FROM stdin;
Lipetsk	1
\.


--
-- Name: author_id_author_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_author_seq', 1, false);


--
-- Name: book_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_book_seq', 1, false);


--
-- Name: fine_id_fine_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fine_id_fine_seq', 1, false);


--
-- Name: reader_id_reader_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reader_id_reader_seq', 1, false);


--
-- Name: request_id_request_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_id_request_seq', 1, false);


--
-- Name: subscription_id_subscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_id_subscription_seq', 1, false);


--
-- Name: unit_id_unit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_id_unit_seq', 1, true);


--
-- Name: author pk_author; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT pk_author PRIMARY KEY (id_author);


--
-- Name: book pk_book; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT pk_book PRIMARY KEY (id_book);


--
-- Name: bookcopy pk_bookcopy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy
    ADD CONSTRAINT pk_bookcopy PRIMARY KEY (serial_number_bc);


--
-- Name: fine pk_fine; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT pk_fine PRIMARY KEY (id_fine);


--
-- Name: reader pk_reader; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT pk_reader PRIMARY KEY (id_reader);


--
-- Name: request pk_request; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT pk_request PRIMARY KEY (id_request);


--
-- Name: sequence pk_sequence; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT pk_sequence PRIMARY KEY (id_book, id_author);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id_subscription);


--
-- Name: unit pk_unit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT pk_unit PRIMARY KEY (id_unit);


--
-- Name: appointed_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX appointed_fk ON public.fine USING btree (id_request);


--
-- Name: author_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX author_pk ON public.author USING btree (id_author);


--
-- Name: book_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_pk ON public.book USING btree (id_book);


--
-- Name: bookcopy_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bookcopy_pk ON public.bookcopy USING btree (serial_number_bc);


--
-- Name: contains_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contains_fk ON public.request USING btree (serial_number_bc);


--
-- Name: fine_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fine_pk ON public.fine USING btree (id_fine);


--
-- Name: get_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX get_fk ON public.request USING btree (id_subscription);


--
-- Name: have_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX have_fk ON public.bookcopy USING btree (id_book);


--
-- Name: located_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX located_fk ON public.bookcopy USING btree (id_unit);


--
-- Name: name_book_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX name_book_idx ON public.book USING btree (name_book);


--
-- Name: reader_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reader_pk ON public.reader USING btree (id_reader);


--
-- Name: receives2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receives2_fk ON public.subscription USING btree (id_reader);


--
-- Name: relationship_6_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_6_fk ON public.sequence USING btree (id_author);


--
-- Name: relationship_7_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_7_fk ON public.sequence USING btree (id_book);


--
-- Name: request_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX request_pk ON public.request USING btree (id_request);


--
-- Name: sequence_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sequence_pk ON public.sequence USING btree (id_book, id_author);


--
-- Name: subscription_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX subscription_pk ON public.subscription USING btree (id_subscription);


--
-- Name: surname_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX surname_idx ON public.author USING btree (surname_author);


--
-- Name: unit_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unit_pk ON public.unit USING btree (id_unit);


--
-- Name: bookcopy fk_bookcopy_have_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy
    ADD CONSTRAINT fk_bookcopy_have_book FOREIGN KEY (id_book) REFERENCES public.book(id_book) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: bookcopy fk_bookcopy_located_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy
    ADD CONSTRAINT fk_bookcopy_located_unit FOREIGN KEY (id_unit) REFERENCES public.unit(id_unit) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fine fk_fine_appointed_request; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fk_fine_appointed_request FOREIGN KEY (id_request) REFERENCES public.request(id_request) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: request fk_request_contains_bookcopy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT fk_request_contains_bookcopy FOREIGN KEY (serial_number_bc) REFERENCES public.bookcopy(serial_number_bc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: request fk_request_get_subscrip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT fk_request_get_subscrip FOREIGN KEY (id_subscription) REFERENCES public.subscription(id_subscription) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sequence fk_sequence_relations_author; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT fk_sequence_relations_author FOREIGN KEY (id_author) REFERENCES public.author(id_author) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sequence fk_sequence_relations_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT fk_sequence_relations_book FOREIGN KEY (id_book) REFERENCES public.book(id_book) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: subscription fk_subscrip_receives2_reader; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT fk_subscrip_receives2_reader FOREIGN KEY (id_reader) REFERENCES public.reader(id_reader) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

