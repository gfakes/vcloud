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
-- Data for Name: cms_facility_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (1, 1, 'Pharmacy - A facility or location where drugs and other medically related items and services are sold, dispensed, or otherwise provided directly to patients', false, '2018-08-17 15:48:18.344251-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (2, 3, 'School - A facility whose primary purpose is education.', false, '2018-08-17 15:48:18.345717-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (3, 4, 'Homeless Shelter - A facility or location whose primary purpose is to provide temporary housing to homeless individuals (e.g., emergency shelters, individual or family shelters).', false, '2018-08-17 15:48:18.346433-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (4, 5, 'Indian Health Service Free-standing Facility - A facility or location, owned and operated by the Indian Health Service, which provides diagnostic, therapeutic (surgical and non-surgical), and rehabilitation services to American Indians and Alaska Natives who do not require hospitalization.', false, '2018-08-17 15:48:18.347071-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (5, 6, 'Indian Health Service Provider-based Facility - A facility or location, owned and operated by the Indian Health Service, which provides diagnostic, therapeutic (surgical and non-surgical), and rehabilitation services rendered by, or under the supervision of, physicians to American Indians and Alaska Natives admitted as inpatients or outpatients.', false, '2018-08-17 15:48:18.347739-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (6, 7, 'Tribal 638 Free-Standing Facility - A facility or location owned and operated by a federally recognized American Indian or Alaska Native tribe or tribal organization under a 638 agreement, which provides diagnostic, therapeutic (surgical and nonsurgical), and rehabilitation services to tribal members who do not require hospitalization.', false, '2018-08-17 15:48:18.348463-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (7, 8, 'Tribal 638 Provider-Based Facility - A facility or location owned and operated by a federally recognized American Indian or Alaska Native tribe or tribal organization under a 638 agreement, which provides diagnostic, therapeutic (surgical and nonsurgical), and rehabilitation services to tribal members admitted as inpatients or outpatients.', false, '2018-08-17 15:48:18.349089-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (8, 9, 'Prison/Correctional Facility - A prison, jail, reformatory, work farm, detention center, or any other similar facility maintained by either Federal, State or local authorities for the purpose of confinement or rehabilitation of adult or juvenile criminal offenders.', false, '2018-08-17 15:48:18.34965-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (9, 11, 'Office - Location, other than a hospital, skilled nursing facility (SNF), military treatment facility, community health center, State or local public health clinic, or intermediate care facility (ICF), where the health professional routinely provides health examinations, diagnosis, and treatment of illness or injury on an ambulatory basis.', false, '2018-08-17 15:48:18.350245-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (10, 12, 'Home - Location, other than a hospital or other facility, where the patient receives care in a private residence.', false, '2018-08-17 15:48:18.350837-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (11, 13, 'Assisted Living Facility - Congregate residential facility with self-contained living units providing assessment of each resident''s needs and on-site support 24 hours a day, 7 days a week, with the capacity to deliver or arrange for services including some health care and other services.', false, '2018-08-17 15:48:18.351416-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (12, 14, 'Group Home - A residence, with shared living areas, where clients receive supervision and other services such as social and/or behavioral services, custodial service, and minimal services (e.g., medication administration).', false, '2018-08-17 15:48:18.351978-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (13, 15, 'Mobile Unit - A facility/unit that moves from place-to-place equipped to provide preventive, screening, diagnostic, and/or treatment services.', false, '2018-08-17 15:48:18.352586-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (14, 20, 'Urgent Care Facility - Location, distinct from a hospital emergency room, an office, or a clinic, whose purpose is to diagnose and treat illness or injury for unscheduled, ambulatory patients seeking immediate medical attention.', false, '2018-08-17 15:48:18.35314-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (15, 21, 'Inpatient Hospital - A facility, other than psychiatric, which primarily provides diagnostic, therapeutic (both surgical and nonsurgical), and rehabilitation services by, or under, the supervision of physicians to patients admitted for a variety of medical conditions.', true, '2018-08-17 15:48:18.353717-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (16, 22, 'Outpatient Hospital - A portion of a hospital which provides diagnostic, therapeutic (both surgical and nonsurgical), and rehabilitation services to sick or injured persons who do not require hospitalization or institutionalization.', true, '2018-08-17 15:48:18.354233-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (17, 23, 'Emergency Room-Hospital - A portion of a hospital where emergency diagnosis and treatment of illness or injury is provided.', true, '2018-08-17 15:48:18.354785-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (18, 24, 'Ambulatory Surgical Center - A freestanding facility, other than a physician''s office, where surgical and diagnostic services are provided on an ambulatory basis.', false, '2018-08-17 15:48:18.355447-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (19, 25, 'Birthing Center - A facility, other than a hospital''s maternity facilities or a physician''s office, which provides a setting for labor, delivery, and immediate postpartum care as well as immediate care of newborn infants.', false, '2018-08-17 15:48:18.356082-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (20, 26, 'Military Treatment Facility - A medical facility operated by one or more of the Uniformed Services. Military Treatment Facility (MTF) also refers to certain former U.S. Public Health Service (USPHS) facilities now designated as Uniformed Service Treatment Facilities (USTF).', true, '2018-08-17 15:48:18.356656-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (21, 31, 'Skilled Nursing Facility - A facility which primarily provides inpatient skilled nursing care and related services to patients who require medical, nursing, or rehabilitative services but does not provide the level of care or treatment available in a hospital.', true, '2018-08-17 15:48:18.35723-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (22, 32, 'Nursing Facility - A facility which primarily provides to residents skilled nursing care and related services for the rehabilitation of injured, disabled, or sick persons, or, on a regular basis, health-related care services above the level of custodial care to other than mentally retarded individuals.', false, '2018-08-17 15:48:18.357819-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (23, 33, 'Custodial Care Facility - A facility which provides room, board and other personal assistance services, generally on a longterm basis, and which does not include a medical component.', false, '2018-08-17 15:48:18.358358-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (24, 34, 'Hospice - A facility, other than a patient''s home, in which palliative and supportive care for terminally ill patients and their families are provided.', true, '2018-08-17 15:48:18.358948-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (25, 41, 'Ambulance (Land) - A land vehicle specifically designed, equipped and staffed for lifesaving and transporting the sick or injured.', true, '2018-08-17 15:48:18.359519-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (26, 42, 'Ambulance (Air or Water) - An air or water vehicle specifically designed, equipped and staffed for lifesaving and transporting the sick or injured.', true, '2018-08-17 15:48:18.360081-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (27, 49, 'Independent Clinic - A location, not part of a hospital and not described by any other Place of Service code, that is organized and operated to provide preventive, diagnostic, therapeutic, rehabilitative, or palliative services to outpatients only.', false, '2018-08-17 15:48:18.360678-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (28, 50, 'Federally Qualified Health Center - A facility located in a medically underserved area that provides Medicare beneficiaries preventive primary medical care under the general direction of a physician.', false, '2018-08-17 15:48:18.361258-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (29, 51, 'Inpatient Psychiatric Facility - A facility that provides inpatient psychiatric services for the diagnosis and treatment of mental illness on a 24-hour basis, by or under the supervision of a physician.', true, '2018-08-17 15:48:18.361946-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (30, 52, 'Psychiatric Facility-Partial Hospitalization - A facility for the diagnosis and treatment of mental illness that provides a planned therapeutic program for patients who do not require full time hospitalization, but who need broader programs than are possible from outpatient visits to a hospital-based or hospital-affiliated facility.', true, '2018-08-17 15:48:18.362526-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (31, 53, 'Community Mental Health Center - A facility that provides the following services: outpatient services, including specialized outpatient services for children, the elderly, individuals who are chronically ill, and residents of the CMHC''s mental health services area who have been discharged from inpatient treatment at a mental health facility; 24 hour a day emergency care services; day treatment, other partial hospitalization services, or psychosocial rehabilitation services; screening for patients being considered for admission to State mental health facilities to determine the appropriateness of such admission; and consultation and education services.', true, '2018-08-17 15:48:18.363239-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (32, 54, 'Intermediate Care Facility/Mentally Retarded - A facility which primarily provides health-related care and services above the level of custodial care to mentally retarded individuals but does not provide the level of care or treatment available in a hospital or SNF.', false, '2018-08-17 15:48:18.363856-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (33, 55, 'Residential Substance Abuse Treatment Facility - A facility which provides treatment for substance (alcohol and drug) abuse to live-in residents who do not require acute medical care. Services include individual and group therapy and counseling, family counseling, laboratory tests, drugs and supplies, psychological testing, and room and board.', false, '2018-08-17 15:48:18.3646-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (34, 56, 'Psychiatric Residential Treatment Center - A facility or distinct part of a facility for psychiatric care which provides a total 24-hour therapeutically planned and professionally staffed group living and learning environment.', true, '2018-08-17 15:48:18.365237-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (35, 57, 'Non-residential Substance Abuse Treatment Facility - A location which provides treatment for substance (alcohol and drug) abuse on an ambulatory basis. Services include individual and group therapy and counseling', false, '2018-08-17 15:48:18.365845-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (36, 60, 'Mass Immunization Center - A location where providers administer pneumococcal pneumonia and influenza virus vaccinations and submit these services as electronic media claims, paper claims, or using the roster billing method. This generally takes place in a mass immunization setting, such as, a public health center, pharmacy, or mall but may include a physician office setting.', false, '2018-08-17 15:48:18.36641-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (37, 61, 'Comprehensive Inpatient Rehabilitation Facility - A facility that provides comprehensive rehabilitation services under the supervision of a physician to inpatients with physical disabilities. Services include physical therapy, occupational therapy, speech pathology, social or psychological services, and orthotics and prosthetics services.', true, '2018-08-17 15:48:18.367037-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (38, 62, 'Comprehensive Outpatient Rehabilitation Facility - A facility that provides comprehensive rehabilitation services under the supervision of a physician to outpatients with physical disabilities. Services include physical therapy, occupational therapy, and speech pathology services.', false, '2018-08-17 15:48:18.367615-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (39, 65, 'End-Stage Renal Disease Treatment Facility - A facility other than a hospital, which provides dialysis treatment, maintenance, and/or training to patients or caregivers on an ambulatory or home-care basis.', false, '2018-08-17 15:48:18.368256-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (40, 71, 'State or Local Public Health Clinic - A facility maintained by either State or local health departments that provides ambulatory primary medical care under the general direction of a physician.', false, '2018-08-17 15:48:18.368822-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (41, 72, 'Rural Health Clinic - A certified facility which is located in a rural medically underserved area that provides ambulatory primary medical care under the general direction of a physician.', false, '2018-08-17 15:48:18.369407-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (42, 81, 'Independent Laboratory - A laboratory certified to perform diagnostic and/or clinical tests independent of an institution or a physician''s office.', false, '2018-08-17 15:48:18.369913-05');
INSERT INTO public.cms_facility_types (id, pos_code, facility_type, cms_facility, updated_at) VALUES (43, 99, 'Other Place of Service - Other place of service not identified above', false, '2018-08-17 15:48:18.370482-05');


--
-- Name: cms_facility_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.cms_facility_types_id_seq', 43, true);


--
-- Data for Name: cms_hcpcs_code_revisions; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.cms_hcpcs_code_revisions (id, revision, active, updated_at) VALUES (1, 'RVU17A', true, '2018-08-17 15:48:19.947448-05');


--
-- Data for Name: cms_gpci; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (1, '10102', '00', 'ALABAMA', 1, 0.888000000000000012, 0.552000000000000046, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (2, '02102', '01', 'ALASKA**', 1.5, 1.1120000000000001, 0.709999999999999964, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (3, '03102', '00', 'ARIZONA', 1, 0.985999999999999988, 0.855999999999999983, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (4, '07102', '13', 'ARKANSAS', 1, 0.869999999999999996, 0.555000000000000049, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (5, '01112', '54', 'BAKERSFIELD, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (6, '01112', '55', 'CHICO, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (7, '01182', '71', 'EL CENTRO, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (8, '01112', '56', 'FRESNO, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (9, '01112', '57', 'HANFORD-CORCORAN, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (10, '01182', '18', 'LOS ANGELES-LONG BEACH-ANAHEIM (LOS ANGELES CNTY), CA', 1.04699999999999993, 1.16900000000000004, 0.801000000000000045, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (11, '01182', '26', 'LOS ANGELES-LONG BEACH-ANAHEIM (ORANGE CNTY), CA', 1.04099999999999993, 1.19700000000000006, 0.801000000000000045, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (12, '01112', '58', 'MADERA, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (13, '01112', '59', 'MERCED, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (14, '01112', '60', 'MODESTO, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (15, '01112', '51', 'NAPA, CA', 1.05699999999999994, 1.27099999999999991, 0.47699999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (16, '01182', '17', 'OXNARD-THOUSAND OAKS-VENTURA, CA', 1.02699999999999991, 1.17799999999999994, 0.754000000000000004, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (17, '01112', '61', 'REDDING, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (18, '01112', '62', 'RIVERSIDE-SAN BERNARDINO-ONTARIO, CA', 1.02400000000000002, 1.07899999999999996, 0.626000000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (19, '01112', '63', 'SACRAMENTO--ROSEVILLE--ARDEN-ARCADE, CA', 1.02400000000000002, 1.08000000000000007, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (20, '01112', '64', 'SALINAS, CA', 1.02400000000000002, 1.08299999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (21, '01182', '72', 'SAN DIEGO-CARLSBAD, CA', 1.02400000000000002, 1.08800000000000008, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (22, '01112', '07', 'SAN FRANCISCO-OAKLAND-HAYWARD (ALAMEDA/CONTRA COSTA CNTY), CA', 1.06800000000000006, 1.29299999999999993, 0.439000000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (23, '01112', '52', 'SAN FRANCISCO-OAKLAND-HAYWARD (MARIN CNTY), CA', 1.05800000000000005, 1.27099999999999991, 0.47699999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (24, '01112', '05', 'SAN FRANCISCO-OAKLAND-HAYWARD (SAN FRANCISCO CNTY), CA', 1.07699999999999996, 1.35699999999999998, 0.439000000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (25, '01112', '06', 'SAN FRANCISCO-OAKLAND-HAYWARD (SAN MATEO CNTY), CA', 1.07699999999999996, 1.34899999999999998, 0.418999999999999984, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (26, '01112', '65', 'SAN JOSE-SUNNYVALE-SANTA CLARA (SAN BENITO CNTY), CA', 1.03099999999999992, 1.121, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (27, '01112', '09', 'SAN JOSE-SUNNYVALE-SANTA CLARA (SANTA CLARA CNTY), CA', 1.08600000000000008, 1.35099999999999998, 0.402000000000000024, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (28, '01182', '73', 'SAN LUIS OBISPO-PASO ROBLES-ARROYO GRANDE, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (29, '01112', '66', 'SANTA CRUZ-WATSONVILLE, CA', 1.02400000000000002, 1.10299999999999998, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (30, '01182', '74', 'SANTA MARIA-SANTA BARBARA, CA', 1.02400000000000002, 1.09099999999999997, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (31, '01112', '67', 'SANTA ROSA, CA', 1.02400000000000002, 1.09299999999999997, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (32, '01112', '68', 'STOCKTON-LODI, CA ', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (33, '01112', '53', 'VALLEJO-FAIRFIELD, CA', 1.05699999999999994, 1.27099999999999991, 0.47699999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (34, '01112', '69', 'VISALIA-PORTERVILLE, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (35, '01112', '70', 'YUBA CITY, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (36, '01112', '75', 'REST OF CALIFORNIA, CA', 1.02400000000000002, 1.07899999999999996, 0.609999999999999987, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (37, '04112', '01', 'COLORADO', 1, 1.0149999999999999, 1.06600000000000006, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (38, '13102', '00', 'CONNECTICUT', 1.02299999999999991, 1.11699999999999999, 1.24399999999999999, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (39, '12202', '01', 'DC + MD/VA SUBURBS', 1.04800000000000004, 1.20500000000000007, 1.27099999999999991, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (40, '12102', '01', 'DELAWARE', 1.01000000000000001, 1.02499999999999991, 1.10099999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (41, '09102', '03', 'FORT LAUDERDALE, FL ', 1, 1.02099999999999991, 1.75600000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (42, '09102', '04', 'MIAMI, FL', 1, 1.03099999999999992, 2.52800000000000002, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (43, '09102', '99', 'REST OF FLORIDA', 1, 0.955999999999999961, 1.33699999999999997, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (44, '10202', '01', 'ATLANTA, GA', 1, 1.00099999999999989, 1.01600000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (45, '10202', '99', 'REST OF GEORGIA', 1, 0.899000000000000021, 0.98899999999999999, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (46, '01212', '01', 'HAWAII, GUAM', 1.002, 1.15399999999999991, 0.615999999999999992, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (47, '02202', '00', 'IDAHO', 1, 0.900000000000000022, 0.510000000000000009, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (48, '06102', '16', 'CHICAGO, IL', 1.01200000000000001, 1.03600000000000003, 1.97199999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (49, '06102', '12', 'EAST ST. LOUIS, IL', 1, 0.935000000000000053, 1.83499999999999996, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (50, '06102', '15', 'SUBURBAN CHICAGO, IL', 1.0109999999999999, 1.05499999999999994, 1.60099999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (51, '06102', '99', 'REST OF ILLINOIS', 1, 0.914000000000000035, 1.23100000000000009, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (52, '08102', '00', 'INDIANA', 1, 0.92000000000000004, 0.497999999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (53, '05102', '00', 'IOWA', 1, 0.902000000000000024, 0.458000000000000018, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (54, '05202', '00', 'KANSAS', 1, 0.907000000000000028, 0.639000000000000012, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (55, '15102', '00', 'KENTUCKY', 1, 0.876000000000000001, 0.807000000000000051, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (56, '07202', '01', 'NEW ORLEANS, LA', 1, 0.974999999999999978, 1.33200000000000007, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (57, '07202', '99', 'REST OF LOUISIANA', 1, 0.887000000000000011, 1.20199999999999996, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (58, '14112', '03', 'SOUTHERN MAINE', 1, 1.0069999999999999, 0.656000000000000028, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (59, '14112', '99', 'REST OF MAINE', 1, 0.92000000000000004, 0.656000000000000028, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (60, '12302', '01', 'BALTIMORE/SURR. CNTYS, MD', 1.02299999999999991, 1.09600000000000009, 1.23799999999999999, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (61, '12302', '99', 'REST OF MARYLAND', 1.01200000000000001, 1.03499999999999992, 1.02699999999999991, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (62, '14212', '01', 'METROPOLITAN BOSTON, MA', 1.02499999999999991, 1.17100000000000004, 0.838999999999999968, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (63, '14212', '99', 'REST OF MASSACHUSETTS', 1.01899999999999991, 1.06699999999999995, 0.838999999999999968, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (64, '08202', '01', 'DETROIT, MI', 1, 0.991999999999999993, 1.51000000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (65, '08202', '99', 'REST OF MICHIGAN', 1, 0.92000000000000004, 0.985999999999999988, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (66, '06202', '00', 'MINNESOTA', 1, 1.01600000000000001, 0.341000000000000025, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (67, '07302', '00', 'MISSISSIPPI', 1, 0.866999999999999993, 0.491999999999999993, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (68, '05302', '02', 'METROPOLITAN KANSAS CITY, MO', 1, 0.957999999999999963, 1.04899999999999993, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (69, '05302', '01', 'METROPOLITAN ST. LOUIS, MO', 1, 0.956999999999999962, 1.03899999999999992, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (70, '05302', '99', 'REST OF MISSOURI', 1, 0.855999999999999983, 0.969999999999999973, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (71, '03202', '01', 'MONTANA***', 1, 1, 1.42900000000000005, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (72, '05402', '00', 'NEBRASKA', 1, 0.90900000000000003, 0.340000000000000024, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (73, '01312', '00', 'NEVADA***', 1.004, 1.03400000000000003, 0.945999999999999952, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (74, '14312', '40', 'NEW HAMPSHIRE', 1, 1.05200000000000005, 0.961999999999999966, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (75, '12402', '01', 'NORTHERN NJ', 1.04099999999999993, 1.18100000000000005, 1.01400000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (76, '12402', '99', 'REST OF NEW JERSEY', 1.02499999999999991, 1.12400000000000011, 1.01400000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (77, '04212', '05', 'NEW MEXICO', 1, 0.92000000000000004, 1.20399999999999996, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (78, '13202', '01', 'MANHATTAN, NY', 1.05200000000000005, 1.17399999999999993, 1.68999999999999995, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (79, '13202', '02', 'NYC SUBURBS/LONG ISLAND, NY', 1.04400000000000004, 1.20700000000000007, 2.18199999999999994, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (80, '13202', '03', 'POUGHKPSIE/N NYC SUBURBS, NY', 1.0129999999999999, 1.07200000000000006, 1.39900000000000002, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (81, '13292', '04', 'QUEENS, NY', 1.05200000000000005, 1.19999999999999996, 2.1509999999999998, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (82, '13282', '99', 'REST OF NEW YORK', 1, 0.947999999999999954, 0.678000000000000047, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (83, '11502', '00', 'NORTH CAROLINA', 1, 0.93100000000000005, 0.731999999999999984, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (84, '03302', '01', 'NORTH DAKOTA***', 1, 1, 0.547000000000000042, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (85, '15202', '00', 'OHIO', 1, 0.918000000000000038, 0.998999999999999999, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (86, '04312', '00', 'OKLAHOMA', 1, 0.882000000000000006, 0.900000000000000022, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (87, '02302', '01', 'PORTLAND, OR', 1.00800000000000001, 1.05200000000000005, 0.745999999999999996, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (88, '02302', '99', 'REST OF OREGON', 1, 0.966999999999999971, 0.745999999999999996, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (89, '12502', '01', 'METROPOLITAN PHILADELPHIA, PA', 1.02200000000000002, 1.08099999999999996, 1.32200000000000006, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (90, '12502', '99', 'REST OF PENNSYLVANIA', 1, 0.933000000000000052, 1.01000000000000001, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (91, '09202', '20', 'PUERTO RICO', 1, 0.855999999999999983, 0.642000000000000015, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (92, '14412', '01', 'RHODE ISLAND', 1.02499999999999991, 1.05200000000000005, 0.879000000000000004, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (93, '11202', '01', 'SOUTH CAROLINA', 1, 0.912000000000000033, 0.634000000000000008, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (94, '03402', '02', 'SOUTH DAKOTA***', 1, 1, 0.395000000000000018, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (95, '10302', '35', 'TENNESSEE', 1, 0.900000000000000022, 0.525000000000000022, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (96, '04412', '31', 'AUSTIN, TX', 1, 1.02000000000000002, 0.757000000000000006, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (97, '04412', '20', 'BEAUMONT, TX', 1, 0.913000000000000034, 0.89700000000000002, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (98, '04412', '09', 'BRAZORIA, TX', 1.02000000000000002, 0.993999999999999995, 0.89700000000000002, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (99, '04412', '11', 'DALLAS, TX', 1.0149999999999999, 1.01200000000000001, 0.770000000000000018, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (100, '04412', '28', 'FORT WORTH, TX', 1.00600000000000001, 0.990999999999999992, 0.760000000000000009, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (101, '04412', '15', 'GALVESTON, TX', 1.02000000000000002, 1.01200000000000001, 0.89700000000000002, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (102, '04412', '18', 'HOUSTON, TX', 1.02000000000000002, 1.0089999999999999, 0.945999999999999952, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (103, '04412', '99', 'REST OF TEXAS', 1, 0.929000000000000048, 0.809000000000000052, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (104, '03502', '09', 'UTAH', 1, 0.925000000000000044, 1.16700000000000004, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (105, '14512', '50', 'VERMONT', 1, 1.01000000000000001, 0.639000000000000012, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (106, '11302', '00', 'VIRGINIA', 1, 0.984999999999999987, 0.865999999999999992, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (107, '09202', '50', 'VIRGIN ISLANDS', 1, 1.00600000000000001, 0.992999999999999994, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (108, '02402', '02', 'SEATTLE (KING CNTY), WA', 1.02600000000000002, 1.15100000000000002, 0.712999999999999967, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (109, '02402', '99', 'REST OF WASHINGTON', 1, 1.0129999999999999, 0.688999999999999946, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (110, '11402', '16', 'WEST VIRGINIA', 1, 0.846999999999999975, 1.28899999999999992, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (111, '06302', '00', 'WISCONSIN', 1, 0.955999999999999961, 0.457000000000000017, 1, '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_gpci (id, carrier, locality, locality_name, work_gpci, pe_gpci, mp_gpci, cms_hcpcs_code_revision_id, updated_at) VALUES (112, '03602', '21', 'WYOMING***', 1, 1, 1.05000000000000004, 1, '2018-08-17 15:48:19.947448-05');


--
-- Name: cms_gpci_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.cms_gpci_id_seq', 112, true);


--
-- Name: cms_hcpcs_code_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.cms_hcpcs_code_revisions_id_seq', 1, true);


--
-- Data for Name: cms_modifiers; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.cms_modifiers (id, modifier, updated_at) VALUES (1, '53', '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_modifiers (id, modifier, updated_at) VALUES (2, 'TC', '2018-08-17 15:48:19.947448-05');
INSERT INTO public.cms_modifiers (id, modifier, updated_at) VALUES (3, '26', '2018-08-17 15:48:19.947448-05');


--
-- Name: cms_modifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.cms_modifiers_id_seq', 3, true);


--
-- Data for Name: configuration_variables; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.configuration_variables (id, configuration_key, configuration_value, updated_at) VALUES (1, 'data-model-version', '3.6.1', '2018-08-17 15:48:19.749261-05');
INSERT INTO public.configuration_variables (id, configuration_key, configuration_value, updated_at) VALUES (2, 'bridge-version', '3.7.2', '2018-08-17 15:52:23.300282-05');
INSERT INTO public.configuration_variables (id, configuration_key, configuration_value, updated_at) VALUES (3, 'login-metasite', 'Vital Images', '2018-08-17 15:55:36.532902-05');
INSERT INTO public.configuration_variables (id, configuration_key, configuration_value, updated_at) VALUES (4, 'login-external-system', 'AD', '2018-08-17 15:55:36.532902-05');
INSERT INTO public.configuration_variables (id, configuration_key, configuration_value, updated_at) VALUES (5, 'login-identifier-type', 'Login', '2018-08-17 15:55:36.532902-05');


--
-- Name: configuration_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.configuration_variables_id_seq', 5, true);


--
-- Data for Name: demographic_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: demographic_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.demographic_types_id_seq', 1, false);


--
-- Data for Name: metasites; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.metasites (id, metasite, organizational, updated_at) VALUES (1, 'Vital Images', false, '2018-08-17 15:55:36.532902-05');
INSERT INTO public.metasites (id, metasite, organizational, updated_at) VALUES (2, 'National Provider Identifier Registry', false, '2018-08-17 15:55:36.532902-05');


--
-- Data for Name: external_systems; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.external_systems (id, external_system, metasite_id, integration_definition, identifier_padding_rules, updated_at) VALUES (1, 'AD', 1, NULL, NULL, '2018-08-17 15:55:36.532902-05');
INSERT INTO public.external_systems (id, external_system, metasite_id, integration_definition, identifier_padding_rules, updated_at) VALUES (2, 'NPI', 2, NULL, NULL, '2018-08-17 15:55:36.532902-05');


--
-- Data for Name: external_system_statuses; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: external_system_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.external_system_statuses_id_seq', 1, false);


--
-- Name: external_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.external_systems_id_seq', 2, true);


--
-- Data for Name: icd_code_revisions; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.icd_code_revisions (id, icd_code_version, icd_code_revision, active, updated_at) VALUES (1, 'ICD-9-CM', 'CMS31', true, '2018-08-17 15:48:47.163512-05');
INSERT INTO public.icd_code_revisions (id, icd_code_version, icd_code_revision, active, updated_at) VALUES (2, 'ICD-10-CM', '2017', true, '2018-08-17 15:48:53.347404-05');


--
-- Name: icd_code_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.icd_code_revisions_id_seq', 2, true);


--
-- Data for Name: identifier_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.identifier_types (id, identifier_type, updated_at) VALUES (1, 'Login', '2018-08-17 15:56:30.204461-05');


--
-- Name: identifier_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.identifier_types_id_seq', 1, true);


--
-- Data for Name: insurance_carrier_plan_groupings; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: insurance_carrier_plan_groupings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.insurance_carrier_plan_groupings_id_seq', 1, false);


--
-- Data for Name: insurance_carriers; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: insurance_carriers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.insurance_carriers_id_seq', 1, false);


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Data for Name: metasite_associations; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: metasite_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.metasite_associations_id_seq', 1, false);


--
-- Name: metasites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.metasites_id_seq', 2, true);


--
-- Data for Name: modalities; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: modalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.modalities_id_seq', 1, false);


--
-- Data for Name: patient_types; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.patient_types (id, patient_type, updated_at) VALUES (1, 'O', '2018-08-17 15:48:18.488696-05');
INSERT INTO public.patient_types (id, patient_type, updated_at) VALUES (2, 'I', '2018-08-17 15:48:18.489975-05');


--
-- Name: patient_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.patient_types_id_seq', 2, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: harbinger
--

INSERT INTO public.people (id, name, current_employee_id, updated_at) VALUES (1, 'VitreaAdmin', 1, '2018-08-17 15:56:30.204461-05');


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.people_id_seq', 1, true);


--
-- Data for Name: site_locations; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: site_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.site_locations_id_seq', 1, false);


--
-- Data for Name: site_sublocations; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: site_sublocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.site_sublocations_id_seq', 1, false);


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.sites_id_seq', 1, false);


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: harbinger
--



--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harbinger
--

SELECT pg_catalog.setval('public.specialties_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

