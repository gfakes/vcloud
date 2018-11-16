--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: universal_event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('universal_event_types_id_seq', 29, true);


--
-- Data for Name: universal_event_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (1, 'order', 'an electronic order is entered into the order placer system requesting an exam', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (2, 'arrived', 'patient check-in at the imaging facility', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (3, 'first image', 'the time when the imaging device begins to collect data that will be used to create the first image', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (4, 'complete', 'all images are acquired and reconstructed', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (5, 'prelim', 'a preliminary report was created', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (6, 'final', 'a final report was created', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (7, 'addendum', 'the final report is addended', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (8, 'cancelled', 'the exam is cancelled', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (9, 'begin', 'the exam process has been started', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (10, 'scheduled', 'the exam has been scheduled with an appointment time', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (11, 'dictated', 'the exam has been read and a report has been dictated, but not necessarily generally or elctronically available', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (12, 'charged', 'the charge has been sent to the billing company (but not necessarily coded or verified)', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (13, 'claimed', 'the claim has been sent to a carrier or individual', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (14, 'denied', 'the claim has been denied', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (15, 'appealed', 'the claim denial has been appealed', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (16, 'payment', 'a payment has been made on the claim', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (17, 'zero balance', 'the claim has been fully collected', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (18, 'admit', 'patient admitted to hospital', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (19, 'transfer', 'patient has been moved/transferred to another location', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (20, 'discharge', 'patient has been discharged', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (21, 'register', 'patient has been registered', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (22, 'pre-admit', 'patient is not yet admitted', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (23, 'cancel admit', 'patient admission has been cancelled', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (24, 'cancel discharge', 'patient discharge has been cancelled', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (26, 'corrections', 'report is being revised for corrections', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (27, 'adjustment', 'the claim has been adjusted', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (28, 'transfer in', 'money being transferred in', now());
INSERT INTO universal_event_types (id, event_type, description, updated_at) VALUES (29, 'transfer out', 'money being transferred out', now());

--
-- PostgreSQL database dump complete
--

