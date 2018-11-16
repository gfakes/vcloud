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
-- Name: clinical_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('clinical_roles_id_seq', 21, true);


--
-- Data for Name: clinical_roles; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (1, 'radiologist', 1, 'clinical radiologist (including residents, attendings, etc.)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (2, 'resident', 1, 'resident', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (3, 'attending', 1, 'attending physician of any discipline (radiologist, ED doctor, pediatrician, etc)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (4, 'fellow-acgme', 1, 'fellow in an ACGME-accredited program', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (5, 'fellow-non-acgme', 1, 'fellow in a non-ACGME-accredited program', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (6, 'technologist', 1, 'technologists (modality techs, lab techs, etc)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (7, 'transcriptionist', 1, 'non-physician administrative role for those who transcribe and edit reports, handle corrections, etc.', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (8, 'scheduler-registrar', 1, 'clinical administrative role for employees who check in patients, verify patient information, etc.', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (9, 'finance', 1, 'non-clinical role for employees working in billing, accounting, etc.', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (10, 'admin-assistant', 1, 'general administrative, non-clinical role', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (11, 'it-staff', 1, 'technical administrators who support clinical systems (PACS admins, RIS admins, etc.)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (13, 'supervisor', 1, 'Those in a supervisory role in their position (tech supervisors, RIS/PACS manager, section chiefs)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (14, 'director', 1, 'Those in director positions for their given role (director titles)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (15, 'executive', 1, 'Those in executive positions (Hospital C level, Department chair, department administrator)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (16, 'power', 1, 'Senior or lead team members who are not supervisors, but have extra system privileges or leadership roles', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (17, 'billing-coding', 1, 'coders and others who work on billing, insurance, claims, etc.', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (18, 'nurse', 1, 'nursing staff', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (19, 'patient-transport', 1, 'staff who transport patients', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (20, 'ai-staff', 1, 'senior technical administrators or vendor support staff (synonym of deprecated support-staff)', now());
INSERT INTO clinical_roles (id, clinical_role, department_id, description, updated_at) VALUES (21, 'researcher', 1, 'researchers and other informaticians', now());


--
-- PostgreSQL database dump complete
--

