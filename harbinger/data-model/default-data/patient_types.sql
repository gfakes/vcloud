--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: patient_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('patient_types_id_seq', 2, true);


--
-- Data for Name: patient_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO patient_types (id, patient_type, updated_at) VALUES (1, 'O', now());
INSERT INTO patient_types (id, patient_type, updated_at) VALUES (2, 'I', now());


--
-- PostgreSQL database dump complete
--

