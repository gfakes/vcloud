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
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('departments_id_seq', 5, true);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO departments (id, department, updated_at) VALUES (1, 'Radiology', now());
INSERT INTO departments (id, department, updated_at) VALUES (2, 'Pathology', now());
INSERT INTO departments (id, department, updated_at) VALUES (3, 'Radiation Oncology', now());
INSERT INTO departments (id, department, updated_at) VALUES (4, 'Perioperative', now());
INSERT INTO departments (id, department, updated_at) VALUES (5, 'Orthopedic', now());


--
-- PostgreSQL database dump complete
--

