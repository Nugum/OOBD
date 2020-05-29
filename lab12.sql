--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 12.2

-- Started on 2020-04-23 09:06:11 MSK

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
-- TOC entry 2434 (class 1262 OID 2917216)
-- Name: lab12; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE lab12;


ALTER DATABASE lab12 OWNER TO postgres;

connect lab12

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

--
-- TOC entry 185 (class 1259 OID 2917217)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    accountnumber character varying(20)
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 2917224)
-- Name: accounttransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounttransaction (
    id bigint NOT NULL,
    transactiondate timestamp without time zone,
    transationsum double precision,
    destantionaccount_id bigint,
    sourceaccount_id bigint
);


ALTER TABLE public.accounttransaction OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 2917222)
-- Name: accounttransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounttransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounttransaction_id_seq OWNER TO postgres;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 186
-- Name: accounttransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounttransaction_id_seq OWNED BY public.accounttransaction.id;


--
-- TOC entry 188 (class 1259 OID 2917230)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    address character varying(255),
    passport character varying(255),
    id bigint NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 2917238)
-- Name: client_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_account (
    client_id bigint NOT NULL,
    accounts_id bigint NOT NULL
);


ALTER TABLE public.client_account OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 2917248)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 2917241)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 2917250)
-- Name: person_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_seq OWNER TO postgres;

--
-- TOC entry 2288 (class 2604 OID 2917227)
-- Name: accounttransaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounttransaction ALTER COLUMN id SET DEFAULT nextval('public.accounttransaction_id_seq'::regclass);


--
-- TOC entry 2421 (class 0 OID 2917217)
-- Dependencies: 185
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account (id, accountnumber) VALUES (4, '0000000');
INSERT INTO public.account (id, accountnumber) VALUES (11, '33333333');
INSERT INTO public.account (id, accountnumber) VALUES (12, '33333333');


--
-- TOC entry 2423 (class 0 OID 2917224)
-- Dependencies: 187
-- Data for Name: accounttransaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2424 (class 0 OID 2917230)
-- Dependencies: 188
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client (address, passport, id) VALUES ('Москва', NULL, 1);


--
-- TOC entry 2425 (class 0 OID 2917238)
-- Dependencies: 189
-- Data for Name: client_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client_account (client_id, accounts_id) VALUES (1, 4);
INSERT INTO public.client_account (client_id, accounts_id) VALUES (1, 11);
INSERT INTO public.client_account (client_id, accounts_id) VALUES (1, 12);


--
-- TOC entry 2426 (class 0 OID 2917241)
-- Dependencies: 190
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, name) VALUES (1, 'Клиент 1');


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 186
-- Name: accounttransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounttransaction_id_seq', 1, false);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 191
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 28, true);


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 192
-- Name: person_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_seq', 5, true);


--
-- TOC entry 2290 (class 2606 OID 2917221)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 2917229)
-- Name: accounttransaction accounttransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounttransaction
    ADD CONSTRAINT accounttransaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2917237)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 2917245)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 2917247)
-- Name: client_account uk_38qrg00qt74c1jwlf4wmhxopb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_account
    ADD CONSTRAINT uk_38qrg00qt74c1jwlf4wmhxopb UNIQUE (accounts_id);


--
-- TOC entry 2301 (class 2606 OID 2917262)
-- Name: client fk2318bkniiewt2apqa3fctd91g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk2318bkniiewt2apqa3fctd91g FOREIGN KEY (id) REFERENCES public.person(id);


--
-- TOC entry 2302 (class 2606 OID 2917272)
-- Name: client_account fkatwtbdionrco2l5gtuxdjxmbw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_account
    ADD CONSTRAINT fkatwtbdionrco2l5gtuxdjxmbw FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 2300 (class 2606 OID 2917257)
-- Name: accounttransaction fke5dbw5uaryjr1d58h93710pyh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounttransaction
    ADD CONSTRAINT fke5dbw5uaryjr1d58h93710pyh FOREIGN KEY (sourceaccount_id) REFERENCES public.account(id);


--
-- TOC entry 2303 (class 2606 OID 2917277)
-- Name: client_account fkgjbkbp162w0o3ifqt8dinovhd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_account
    ADD CONSTRAINT fkgjbkbp162w0o3ifqt8dinovhd FOREIGN KEY (accounts_id) REFERENCES public.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2299 (class 2606 OID 2917252)
-- Name: accounttransaction fks23agqnpkek8o7ox75g9b6k69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounttransaction
    ADD CONSTRAINT fks23agqnpkek8o7ox75g9b6k69 FOREIGN KEY (destantionaccount_id) REFERENCES public.account(id);


-- Completed on 2020-04-23 09:06:11 MSK

--
-- PostgreSQL database dump complete
--

