--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: employee_clinical_role_mappings; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.employee_clinical_role_mappings (id, employee_id, clinical_role_id, updated_at) VALUES (1, 1, 20, '2018-08-17 15:56:30.204461-05');


--
-- Name: employee_clinical_role_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.employee_clinical_role_mappings_id_seq', 1, true);


--
-- Data for Name: employee_demos; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: employee_demos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.employee_demos_id_seq', 1, false);


--
-- Data for Name: employee_specialty_mappings; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: employee_specialty_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.employee_specialty_mappings_id_seq', 1, false);


--
-- Data for Name: external_system_role_mappings; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.external_system_role_mappings (id, external_system_id, external_system_role_id, updated_at) VALUES (1, 1, 17, '2018-08-17 15:55:36.532902-05');
INSERT INTO public.external_system_role_mappings (id, external_system_id, external_system_role_id, updated_at) VALUES (2, 2, 18, '2018-08-17 15:55:36.532902-05');


--
-- Name: external_system_role_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.external_system_role_mappings_id_seq', 2, true);


--
-- Data for Name: identifiers; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.identifiers (id, employee_id, identifier, identifier_type_id, external_system_id, updated_at) VALUES (1, 1, 'VitreaAdmin', 1, 1, '2018-08-17 15:56:30.204461-05');


--
-- Name: identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.identifiers_id_seq', 1, true);


--
-- Data for Name: insurance_carrier_demographics; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: insurance_carrier_demographics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.insurance_carrier_demographics_id_seq', 1, false);


--
-- Data for Name: insurance_carrier_plans; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: insurance_carrier_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.insurance_carrier_plans_id_seq', 1, false);


--
-- Data for Name: procedure_hcpcs_mappings; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: procedure_hcpcs_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.procedure_hcpcs_mappings_id_seq', 1, false);


--
-- Data for Name: rad_exam_departments; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: rad_exam_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.rad_exam_departments_id_seq', 1, false);


--
-- Data for Name: residents; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: residents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.residents_id_seq', 1, false);


--
-- Data for Name: site_classes; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: site_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.site_classes_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

