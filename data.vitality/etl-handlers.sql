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
-- Data for Name: data_manager_etl_handlers; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (1, 'hl7.radiology', 'etl_requests', 'hl7.radiology.{message_type}.{message_type_event}', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/route.clj', 1, '2011-12-16 10:48:14.416274-06', '2016-04-19 12:11:09.813-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (2, 'hl7.radiology.ORM.O01', 'etl_requests', 'hl7.radiology.transform', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/rad-exam.clj', 1, '2016-04-19 12:13:26.732-05', '2016-04-19 12:13:26.732-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (3, 'hl7.radiology.ORU.R01', 'etl_requests', 'hl7.radiology.transform', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/rad-result.clj', 1, '2016-04-19 12:14:31.542-05', '2016-04-19 12:14:31.542-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (4, 'hl7.radiology.transform', 'warehouse_updates', 'radiology.{message_type}.{exam_status}', '/servers/harbinger/et-scripts/hl7-transform.rb', '/servers/harbinger/config/site.config.json', 1, '2016-04-19 12:18:03.255-05', '2016-04-19 12:18:03.255-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (5, 'hl7.radiology.ADT.A01', 'etl_requests', 'hl7.patient.transform', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/patient-adt-event.clj', 1, '2016-04-19 12:20:00.283-05', '2016-04-19 12:20:00.283-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (6, 'hl7.radiology.ADT.A08', 'etl_requests', 'hl7.patient.transform', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/patient-adt-demographic-update.clj', 1, '2016-04-19 12:20:52.937-05', '2016-04-19 12:20:52.937-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (7, 'hl7.radiology.ADT.A18', 'etl_requests', 'hl7.patient.transform', '/servers/hl7-parser/et.py', '/servers/harbinger/hl7-configs/patient-adt-merge.clj', 1, '2016-04-19 12:21:44.661-05', '2016-04-19 12:21:44.661-05');
INSERT INTO public.data_manager_etl_handlers (id, routing_key, outgoing_exchange, outgoing_routing_key, command, config, weight, created_at, updated_at) VALUES (8, 'hl7.patient.transform', 'warehouse_updates', 'patient.{message_type}.{message_type_event}', '/servers/harbinger/et-scripts/hl7-transform.rb', '/servers/harbinger/config/site.config.json', 1, '2016-04-19 12:23:29.1-05', '2016-04-19 12:23:29.1-05');


--
-- Name: data_manager_etl_handlers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.data_manager_etl_handlers_id_seq', 8, true);


--
-- PostgreSQL database dump complete
--

