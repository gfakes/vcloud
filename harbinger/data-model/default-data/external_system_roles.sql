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
-- Name: external_system_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('external_system_roles_id_seq', 18, true);


--
-- Data for Name: external_system_roles; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (1, 'Registration', 'Admission, discharges, transfers, locations and MRN providers', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (2, 'HIS', 'Hospital-wide order/result and patient care tracking', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (3, 'EMR', 'Enterprise distribution of patient data', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (4, 'PACS', 'Diagnostic imaging system', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (5, 'RIS', 'Radiology-specific orders/results/workflow', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (6, 'VR', 'Dictation solution', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (7, 'Telemedicine', 'Used primarily for remote/outsourced care', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (8, 'Inpatient', 'Used primarily for inpatient care', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (9, 'Outpatient', 'Used primarily for outpatient care', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (10, 'Financial', 'Billing, charges, collections', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (11, 'SaaS', 'Remote/cloud hosted solution', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (12, 'Local', 'Locally hosted solution', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (13, 'Lab', 'Lab-specific orders/results/workflow', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (14, 'Path', 'Path-specific orders/results/workflow', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (15, 'Periop', 'Perio-specific orders/results/workflow', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (16, 'EMPI', 'Master patient index system to group and reconcile patient identifiers', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (17, 'Authentication', 'Authentication and/or authorization', now());
INSERT INTO external_system_roles (id, system_role, description, updated_at) VALUES (18, 'Credentialing', 'Provider identification and credentialing', now());


--
-- PostgreSQL database dump complete
--

