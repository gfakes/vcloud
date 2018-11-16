-- drop indexes

DROP INDEX patient_events_patient_event_type_id_idx;

DROP INDEX patient_events_patient_id_idx;

DROP INDEX patient_events_postevent_site_location_id_idx;

DROP INDEX procedures_site_id_idx;

DROP INDEX rad_exam_times_rad_exam_id_idx;

DROP INDEX rad_exam_visit_idx;

DROP INDEX rad_exams_accextsys_idx;

DROP INDEX rad_reports_exam_status_id_idx;

DROP INDEX site_locations_name_idx;

DROP INDEX sublocation_bed_idx;

DROP INDEX sublocation_room_idx;

DROP INDEX sublocation_sitelocation_idx;

DROP INDEX exam_statuses_external_system_id_idx;

DROP INDEX exam_statuses_status_idx;

DROP INDEX exam_statuses_trip_status_id_idx;

DROP INDEX rad_external_system_statuses_exam_status_id_idx;

DROP INDEX rad_external_system_statuses_external_system_id_idx;

DROP INDEX rad_external_system_statuses_rad_exam_id_idx;

-- drop tables/sequences/views

DROP VIEW quick_rad_exams;

DROP TABLE procedure_cpt_mappings;

DROP TABLE cpt_codes;

DROP TABLE patient_event_types;

DROP SEQUENCE cpt_codes_id_seq;

DROP SEQUENCE patient_event_types_id_seq;

DROP SEQUENCE procedure_cpt_mappings_id_seq;

-- rename tables/sequences

alter table trip_statuses rename to universal_event_types;

alter table rad_external_system_statuses rename to rad_exam_external_system_statuses;

alter table exam_statuses rename to external_system_statuses;

alter sequence exam_statuses_id_seq rename to external_system_statuses_id_seq;

alter sequence trip_statuses_id_seq rename to universal_event_types_id_seq;

alter sequence rad_external_system_statuses_id_seq rename to rad_exam_external_system_statuses_id_seq;

alter sequence rad_exam_department_id_seq rename to rad_exam_departments_id_seq;

-- drop/rename/alter columns

alter table universal_event_types
       rename column status to event_type; -- error

alter table external_system_statuses
       rename column trip_status_id to universal_event_type_id;

alter table rad_exam_external_system_statuses
       rename column exam_status_id to external_system_status_id;

ALTER TABLE patient_events
       DROP COLUMN patient_event_type_id,
       DROP COLUMN postevent_site_location_id,
       ALTER COLUMN external_system_status_id SET NOT NULL;

ALTER TABLE patient_events_history
       DROP COLUMN patient_event_type_id,
       DROP COLUMN postevent_site_location_id,
       ALTER COLUMN external_system_status_id SET NOT NULL;

ALTER TABLE procedures
       rename COLUMN fee to practice_fee;

update procedures set practice_fee = (practice_fee * 100.00) where practice_fee != 0;

ALTER TABLE procedures
       ALTER COLUMN practice_fee SET data type bigint;

ALTER TABLE rad_reports
       rename COLUMN exam_status_id to report_status_id;

ALTER TABLE reasons
       ALTER COLUMN external_system_id SET NOT NULL;

-- table rename PK fix

ALTER TABLE external_system_statuses
       DROP CONSTRAINT exam_status_id;

ALTER TABLE external_system_statuses
       ADD CONSTRAINT external_system_status_id PRIMARY KEY (id);

ALTER TABLE rad_exam_external_system_statuses
       DROP CONSTRAINT rad_external_system_statuses_id;

ALTER TABLE rad_exam_external_system_statuses
       ADD CONSTRAINT rad_exam_external_system_statuses_id PRIMARY KEY (id);

ALTER TABLE universal_event_types
       DROP CONSTRAINT trip_status_id;

ALTER TABLE universal_event_types
       ADD CONSTRAINT universal_event_type_id PRIMARY KEY (id);

-- add indexes

CREATE INDEX rad_exam_times_cancelled_idx ON rad_exam_times USING btree (cancelled);

CREATE INDEX rad_exam_fact_end_exam_day_idx ON rad_exam_facts USING btree (end_exam_day);

CREATE INDEX rad_exam_fact_end_exam_epoch_idx ON rad_exam_facts USING btree (end_exam_epoch);

CREATE INDEX rad_exam_fact_end_exam_hour_idx ON rad_exam_facts USING btree (end_exam_hour);

CREATE INDEX rad_exam_fact_end_exam_month_idx ON rad_exam_facts USING btree (end_exam_month);

CREATE INDEX rad_exam_fact_end_exam_year_idx ON rad_exam_facts USING btree (end_exam_year);

CREATE INDEX rad_exam_fact_modality_id_idx ON rad_exam_facts USING btree (modality_id);

CREATE INDEX rad_exam_fact_ordering_provider_id_idx ON rad_exam_facts USING btree (ordering_provider_id);

CREATE INDEX rad_exam_fact_patient_priority_idx ON rad_exam_facts USING btree (patient_priority);

CREATE INDEX rad_exam_fact_patient_priority_specified_date_idx ON rad_exam_facts USING btree (patient_priority_specified_date);

CREATE INDEX rad_exam_fact_patient_type_idx ON rad_exam_facts USING btree (patient_type);

CREATE INDEX rad_exam_fact_procedure_id_idx ON rad_exam_facts USING btree (procedure_id);

CREATE INDEX rad_exam_fact_procedure_specialty_id_idx ON rad_exam_facts USING btree (procedure_specialty_id);

CREATE INDEX rad_exam_fact_rad_exam_department_id_idx ON rad_exam_facts USING btree (rad_exam_department_id);

CREATE INDEX rad_exam_fact_rad_exam_id_idx ON rad_exam_facts USING btree (rad_exam_id);

CREATE INDEX rad_exam_fact_radiologist_id_idx ON rad_exam_facts USING btree (radiologist_id);

CREATE INDEX rad_exam_fact_radiologist_specialty_id_idx ON rad_exam_facts USING btree (radiologist_specialty_id);

CREATE INDEX rad_exam_fact_reportable_idx ON rad_exam_facts USING btree (reportable) WHERE (reportable IS TRUE);

CREATE INDEX rad_exam_fact_resource_id_idx ON rad_exam_facts USING btree (resource_id);

CREATE INDEX rad_exam_fact_site_class_id_idx ON rad_exam_facts USING btree (site_class_id);

CREATE INDEX rad_exam_fact_site_id_idx ON rad_exam_facts USING btree (site_id);

CREATE INDEX rad_exam_fact_technologist_id_idx ON rad_exam_facts USING btree (technologist_id);

CREATE INDEX radexam_lastprelimreportid_idx ON rad_exams USING btree (last_prelim_report_id);

CREATE INDEX claims_charge_post ON claims USING btree (charge_post);

CREATE INDEX claims_claim_create ON claims USING btree (claim_create);

CREATE INDEX claims_zero_balance ON claims USING btree (zero_balance);

CREATE INDEX fki_claim_current_carrier_fk ON claims USING btree (current_carrier_id);

CREATE INDEX fki_claim_first_claim_transaction_fk ON claims USING btree (first_claim_transaction_id);

CREATE INDEX claim_transactions_carrier_fk ON claim_transactions USING btree (carrier_id);

CREATE INDEX claim_transaction_cms_modifiers_claim_transaction_fk ON claim_transaction_cms_modifiers USING btree (claim_transaction_id);

CREATE INDEX claim_transaction_cms_modifiers_modifier_fk ON claim_transaction_cms_modifiers USING btree (cms_modifier_id);

CREATE INDEX claim_transaction_auth_number_idx ON claim_transactions USING btree (auth_number);

CREATE INDEX claim_transaction_diagnoses_icd_code_idx ON claim_transaction_diagnoses USING btree (icd_code_id);

CREATE INDEX fki_claim_transaction_diagnoses_claim_transaction_fk ON claim_transaction_diagnoses USING btree (claim_transaction_id);

CREATE INDEX claim_transaction_types_idx ON claim_transaction_types USING btree (transaction_type);

CREATE INDEX claim_transaction_post_idx ON claim_transactions USING btree (transaction_post);

CREATE INDEX claim_transaction_service_performed_idx ON claim_transactions USING btree (service_performed);

CREATE INDEX claim_transactions_insurance_policy_fk ON claim_transactions USING btree (insurance_policy_id);

CREATE INDEX fki_claim_transaction_billing_employee_fk ON claim_transactions USING btree (billing_employee_id);

CREATE INDEX fki_claim_transaction_claim_denial_reason_fk ON claim_transactions USING btree (claim_denial_reason_id);

CREATE INDEX fki_claim_transaction_claim_fk ON claim_transactions USING btree (claim_id);

CREATE INDEX fki_claim_transaction_cms_hcpcs_code_fk ON claim_transactions USING btree (cms_hcpcs_code_id);

CREATE INDEX fki_claim_transaction_external_system_status_fk ON claim_transactions USING btree (claim_status_id);

CREATE INDEX fki_claim_transaction_ordering_employee_fk ON claim_transactions USING btree (ordering_employee_id);

CREATE INDEX fki_claim_transaction_performing_employee_fk ON claim_transactions USING btree (performing_employee_id);

CREATE INDEX fki_claim_transaction_posting_employee_fk ON claim_transactions USING btree (posting_employee_id);

CREATE INDEX fki_claim_transaction_transaction_type_fk ON claim_transactions USING btree (claim_transaction_type_id);

CREATE INDEX claim_claim_number_idx ON claims USING btree (claim_number);

CREATE INDEX claim_external_system_fk ON claims USING btree (external_system_id);

CREATE INDEX fki_claim_current_claim_transaction_fk ON claims USING btree (current_claim_transaction_id);

CREATE INDEX fki_claim_current_external_system_status_fk ON claims USING btree (current_claim_status_id);

CREATE INDEX fki_claim_patient_mrn_fk ON claims USING btree (patient_mrn_id);

CREATE INDEX fki_claim_site_class_fk ON claims USING btree (site_class_id);

CREATE INDEX fki_claim_site_fk ON claims USING btree (site_id);

CREATE INDEX fki_claim_visit_fk ON claims USING btree (visit_id);

CREATE INDEX clinical_role_idx ON clinical_roles USING btree (clinical_role);

CREATE INDEX cms_facility_type_cms_facility_idx ON cms_facility_types USING btree (cms_facility);

CREATE INDEX cms_facility_type_facilty_type_idx ON cms_facility_types USING btree (facility_type);

CREATE INDEX cms_facility_type_pos_code_idx ON cms_facility_types USING btree (pos_code);

CREATE INDEX cms_gpci_locality_carrier_locality_idx ON cms_gpci USING btree (carrier, locality);

CREATE INDEX cms_gpci_locality_name_idx ON cms_gpci USING btree (locality_name);

CREATE INDEX fki_cms_gpci_revision_fk ON cms_gpci USING btree (cms_hcpcs_code_revision_id);

CREATE INDEX cms_hcpcs_codes_hcpcs_idx ON cms_hcpcs_codes USING btree (hcpcs);

CREATE INDEX cms_hcpcs_codes_modality_id_idx ON cms_hcpcs_codes USING btree (modality_id);

CREATE INDEX fki_cms_hcpcs_code_cms_hcpcs_code_revision_fk ON cms_hcpcs_codes USING btree (cms_hcpcs_code_revision_id);

CREATE INDEX fki_cms_hcpcs_code_cms_modifier_fk ON cms_hcpcs_codes USING btree (cms_modifier_id);

CREATE INDEX cms_hcpcs_code_revisions_active_idx ON cms_hcpcs_code_revisions USING btree (active);

CREATE INDEX cms_hcpcs_code_revisions_revision_idx ON cms_hcpcs_code_revisions USING btree (revision);

CREATE INDEX cms_modifiers_idx ON cms_modifiers USING btree (modifier);

CREATE INDEX demographic_type_idx ON demographic_types USING btree (demographic_type);

CREATE INDEX department_idx ON departments USING btree (department);

CREATE INDEX exam_metadata_types_idx ON exam_metadata_types USING btree (metadata_type);

CREATE INDEX external_system_role_mappings_external_system_id_idx ON external_system_role_mappings USING btree (external_system_id);

CREATE INDEX external_system_role_mappings_external_system_role_ididx ON external_system_role_mappings USING btree (external_system_role_id);

CREATE INDEX external_system_roles_idx ON external_system_roles USING btree (system_role);

CREATE INDEX external_system_status_idx ON external_system_statuses USING btree (status);

CREATE INDEX external_system_statuses_dm_idx ON external_system_statuses USING btree (external_system_id, status);

CREATE INDEX external_system_statuses_external_system_id_idx ON external_system_statuses USING btree (external_system_id);

CREATE INDEX external_system_statuses_swim_status_id_idx ON external_system_statuses USING btree (universal_event_type_id);

CREATE INDEX external_systems_dm_idx ON external_systems USING btree (external_system, metasite_id);

CREATE INDEX icd_code_revision_revision_idx ON icd_code_revisions USING btree (icd_code_revision);

CREATE INDEX icd_code_revision_version_idx ON icd_code_revisions USING btree (icd_code_version);

CREATE INDEX icd_code_revisions_active_fk ON icd_code_revisions USING btree (active);

CREATE INDEX claim_transactions_dm_idx ON claim_transactions USING btree (claim_id,claim_sequence);

CREATE INDEX claims_dm_idx ON claims USING btree (claim_number,external_system_id);

CREATE INDEX insurance_policy_dm_idx ON insurance_policies USING btree (group_number,policy_number,insurance_carrier_plan_id);

CREATE INDEX radonccases_dm_idx ON radonc_cases USING btree (case_number,external_system_id);

CREATE INDEX fki_icd_code_revision_fk ON icd_codes USING btree (icd_code_revision_id);

CREATE INDEX icd_code_code_idx ON icd_codes USING btree (code);

CREATE INDEX identifier_type_idx ON identifier_types USING btree (identifier_type);

CREATE INDEX fki_insurance_carrier_demographic_insurance_carrier_fk ON insurance_carrier_demographics USING btree (insurance_carrier_id);

CREATE INDEX fki_insurance_carrier_demographics_demographic_type_fk ON insurance_carrier_demographics USING btree (demographic_type_id);

CREATE INDEX fki_insurance_carrier_plan_insurance_carrier_fk ON insurance_carrier_plans USING btree (insurance_carrier_id);

CREATE INDEX insurance_carrier_plan_name_idx ON insurance_carrier_plans USING btree (plan_name);

CREATE INDEX insurance_carrier_plan_number_idx ON insurance_carrier_plans USING btree (plan_number);

CREATE INDEX insurance_carriers_carrier_idx ON insurance_carriers USING btree (carrier);

CREATE INDEX fki_insurance_policy_insurance_carrier_plan_fk ON insurance_policies USING btree (insurance_carrier_plan_id);

CREATE INDEX insurance_policy_group_number_idx ON insurance_policies USING btree (group_number);

CREATE INDEX insurance_policy_number_idx ON insurance_policies USING btree (policy_number);

CREATE INDEX insurance_policy_relationship_fk ON insurance_policies USING btree (relationship_type_id);

CREATE INDEX metasite_metasite_idx ON metasites USING btree (metasite);

CREATE INDEX orders_dm_idx ON orders USING btree (order_number, external_system_id);

CREATE INDEX patient_demos_dm_idx ON patient_demos USING btree (patient_mrn_id, demographic_type_id);

CREATE INDEX patient_demos_history_dm_idx ON patient_demos_history USING btree (patient_mrn_id, demographic_type_id);

CREATE INDEX patient_events_dm_idx ON patient_events USING btree (patient_mrn_id, visit_id);

CREATE INDEX patient_events_external_system_status_id_idx ON patient_events USING btree (external_system_status_id);

CREATE INDEX patient_events_patient_mrn_id_idx ON patient_events USING btree (patient_mrn_id);

CREATE INDEX patient_events_site_class_idx ON patient_events USING btree (site_class_id);

CREATE INDEX patient_events_site_sublocation_idx ON patient_events USING btree (postevent_site_sublocation_id);

CREATE INDEX patient_events_history_dm_idx ON patient_events_history USING btree (patient_mrn_id, visit_id);

CREATE INDEX patient_events_history_employee_idx ON patient_events_history USING btree (operator_employee_id);

CREATE INDEX patient_events_history_event_reason_idx ON patient_events_history USING btree (event_reason_id);

CREATE INDEX patient_events_history_external_system_status_idx ON patient_events_history USING btree (external_system_status_id);

CREATE INDEX patient_events_history_patient_mrn_idx ON patient_events_history USING btree (patient_mrn_id);

CREATE INDEX patient_events_history_site_class_idx ON patient_events_history USING btree (site_class_id);

CREATE INDEX patient_events_history_site_sublocation_idx ON patient_events_history USING btree (postevent_site_sublocation_id);

CREATE INDEX patient_events_history_visit_idx ON patient_events_history USING btree (visit_id);

CREATE INDEX patient_mrns_dm_idx ON patient_mrns USING btree (external_system_id, mrn);

CREATE INDEX procedure_hcpcs_mappings_cms_hcpcs_code_id_idx ON procedure_hcpcs_mappings USING btree (cms_hcpcs_code_id);

CREATE INDEX procedure_hcpcs_mappings_procedure_id_idx ON procedure_hcpcs_mappings USING btree (procedure_id);

CREATE INDEX procedure_dm_idx ON procedures USING btree (code, site_id);

CREATE INDEX rad_exam_claims_claim_id_idx ON rad_exam_claims USING btree (claim_id);

CREATE INDEX rad_exam_claims_radexam_id_idx ON rad_exam_claims USING btree (rad_exam_id);

CREATE INDEX rad_exam_depts_dm_idx ON rad_exam_departments USING btree (department, site_id);

CREATE INDEX rad_exam_external_system_statuses_dm_idx ON rad_exam_external_system_statuses USING btree (rad_exam_id, external_system_id);

CREATE INDEX rad_exam_external_system_statuses_external_system_id_idx ON rad_exam_external_system_statuses USING btree (external_system_id);

CREATE INDEX rad_exam_external_system_statuses_external_system_status_id_idx ON rad_exam_external_system_statuses USING btree (external_system_status_id);

CREATE INDEX rad_exam_external_system_statuses_rad_exam_id_idx ON rad_exam_external_system_statuses USING btree (rad_exam_id);

CREATE INDEX rad_exam_metadata_dm_idx ON rad_exam_metadata USING btree (rad_exam_id, exam_metadata_type_id, external_system_id);

CREATE INDEX rad_exam_personnel_begin_exam_id_idx ON rad_exam_personnel USING btree (begin_exam_id);

CREATE INDEX rad_exam_personnel_ordering_id_idx ON rad_exam_personnel USING btree (ordering_id);

CREATE INDEX rad_exam_times_rad_exam_idx ON rad_exam_times USING btree (rad_exam_id);

CREATE INDEX radexam_accextsys_idx ON rad_exams USING btree (external_system_id);

CREATE INDEX radexam_dm_idx ON rad_exams USING btree (accession, external_system_id);

CREATE INDEX radexam_radexamdept_idx ON rad_exams USING btree (rad_exam_department_id);

CREATE INDEX radexam_site_sublocation_idx ON rad_exams USING btree (site_sublocation_id);

CREATE INDEX radexam_visit_idx ON rad_exams USING btree (visit_id);

CREATE INDEX rad_pacs_metadata_extsys_idx ON rad_pacs_metadata USING btree (external_system_id);

CREATE INDEX rad_pacs_metadata_imgcount_idx ON rad_pacs_metadata USING btree (image_count);

CREATE INDEX rad_reports_external_system_status_id_idx ON rad_reports USING btree (report_status_id);

CREATE INDEX radonccases_accextsys_idx ON radonc_cases USING btree (external_system_id);

CREATE INDEX radonccases_case_number_idx ON radonc_cases USING btree (case_number);

CREATE INDEX radonccases_currentstatus_idx ON radonc_cases USING btree (current_status_id);

CREATE INDEX radonccases_orderid_idx ON radonc_cases USING btree (order_id);

CREATE INDEX radonccases_patient_mrn_id_idx ON radonc_cases USING btree (patient_mrn_id);

CREATE INDEX radonccases_priority_idx ON radonc_cases USING btree (exam_priority_id);

CREATE INDEX radonccases_proc_idx ON radonc_cases USING btree (procedure_id);

CREATE INDEX radonccases_site_idx ON radonc_cases USING btree (site_id);

CREATE INDEX radonccases_site_sublocation_idx ON radonc_cases USING btree (site_sublocation_id);

CREATE INDEX radonccases_siteclass_idx ON radonc_cases USING btree (site_class_id);

CREATE INDEX radonccases_visit_idx ON radonc_cases USING btree (visit_id);

CREATE INDEX radonccase_claims_claim_id_idx ON radonc_case_claims USING btree (claim_id);

CREATE INDEX radonccase_claims_radonccase_id_idx ON radonc_case_claims USING btree (radonc_case_id);

CREATE INDEX reasons_extsys_id_idx ON reasons USING btree (external_system_id);

CREATE INDEX relationship_type_idx ON relationship_types USING btree (relationship);

CREATE INDEX resource_dm_idx ON resources USING btree (resource, site_id);

CREATE INDEX site_class_dm_idx ON site_classes USING btree (site_class, external_system_id);

CREATE INDEX site_classes_cms_facility_type_idx ON site_classes USING btree (cms_facility_type_id);

CREATE INDEX site_locations_dm_idx ON site_locations USING btree (location, external_system_id);

CREATE INDEX site_sublocation_site_location_idx ON site_sublocations USING btree (site_location_id);

CREATE INDEX site_sublocations_dm_idx ON site_sublocations USING btree (site_location_id, room, bed);

CREATE INDEX fki_site_cms_gpci_fk ON sites USING btree (cms_gpci_id);

CREATE INDEX specialties_dm_idx ON specialties USING btree (department_id, specialty);

CREATE INDEX specialties_idx ON specialties USING btree (specialty);

CREATE INDEX universal_event_type_idx ON universal_event_types USING btree (event_type);

CREATE INDEX fki_visit_diagnoses_visit_fk ON visit_diagnoses USING btree (visit_id);

CREATE INDEX visit_diagonses_icd_code_idx ON visit_diagnoses USING btree (icd_code_id);

CREATE INDEX visit_insurance_policies_insurance_policy_idx ON visit_insurance_policies USING btree (insurance_policy_id);

CREATE INDEX visit_insurance_policies_visit_id_idx ON visit_insurance_policies USING btree (visit_id);

CREATE INDEX visits_dm_idx ON visits USING btree (external_system_id, visit_number);

CREATE INDEX radonccase_authorizations_auth_idx ON radonc_case_authorizations USING btree (auth_number);

CREATE INDEX radonccase_authorizations_insurance_policy_id_idx ON radonc_case_authorizations USING btree (insurance_policy_id);

CREATE INDEX raddoncase_authorizations_radonccase_id_idx ON radonc_case_authorizations USING btree (radonc_case_id);

CREATE INDEX rad_exam_authorizations_auth_idx ON rad_exam_authorizations USING btree (auth_number);

CREATE INDEX rad_exam_authorizations_insurance_policy_id_idx ON rad_exam_authorizations USING btree (insurance_policy_id);

CREATE INDEX rad_exam_authorizations_rad_exam_id_idx ON rad_exam_authorizations USING btree (rad_exam_id);

CREATE INDEX insurance_carrier_plan_grouping_idx ON insurance_carrier_plans USING btree (insurance_carrier_plan_grouping_id);

CREATE INDEX insurance_carrier_plan_grouping_name_idx ON insurance_carrier_plan_groupings USING btree (grouping_name);

CREATE INDEX insurance_carriers_extsys_idx ON insurance_carriers USING btree (external_system_id);

-- add FK constraints

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_modality_id_fk FOREIGN KEY (modality_id) REFERENCES modalities(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_ordering_provider_id_fk FOREIGN KEY (ordering_provider_id) REFERENCES employees(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_procedure_specialty_id_fk FOREIGN KEY (procedure_specialty_id) REFERENCES specialties(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_rad_exam_department_id_fk FOREIGN KEY (rad_exam_department_id) REFERENCES rad_exam_departments(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_rad_exam_id_fk FOREIGN KEY (rad_exam_id) REFERENCES rad_exams(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_radiologist_id_fk FOREIGN KEY (radiologist_id) REFERENCES employees(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_radiologist_specialty_id_fk FOREIGN KEY (radiologist_specialty_id) REFERENCES specialties(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_resource_id_fk FOREIGN KEY (resource_id) REFERENCES resources(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_site_class_id_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_site_id_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_technologist_id_fk FOREIGN KEY (technologist_id) REFERENCES employees(id);

ALTER TABLE rad_exams
        ADD CONSTRAINT rad_exam_last_prelim_report_fk FOREIGN KEY (last_prelim_report_id) REFERENCES rad_reports(id);

ALTER TABLE radonc_case_authorizations
        ADD CONSTRAINT radonc_case_authorizations_insurance_policy_fk FOREIGN KEY (insurance_policy_id) references insurance_policies(id);

ALTER TABLE radonc_case_authorizations
        ADD CONSTRAINT radonc_caseauthorizations_radonc_case_fk FOREIGN KEY (radonc_case_id) references radonc_cases(id);

ALTER TABLE rad_exam_authorizations
        ADD CONSTRAINT rad_exam_authorizations_insurance_policy_fk FOREIGN KEY (insurance_policy_id) references insurance_policies(id);

ALTER TABLE rad_exam_authorizations
        ADD CONSTRAINT rad_exam_authorizations_rad_exam_fk FOREIGN KEY (rad_exam_id) references rad_exams(id);

ALTER TABLE claim_transaction_cms_modifiers
        ADD CONSTRAINT claim_transaction_cms_modifiers_claim_fk FOREIGN KEY (claim_transaction_id) REFERENCES claim_transactions(id);

ALTER TABLE claim_transaction_cms_modifiers
        ADD CONSTRAINT claim_transaction_cms_modifiers_modifier_fk FOREIGN KEY (cms_modifier_id) REFERENCES cms_modifiers(id);

ALTER TABLE claim_transaction_diagnoses
        ADD CONSTRAINT claim_transaction_diagnoses_claim_transaction_fk FOREIGN KEY (claim_transaction_id) REFERENCES claim_transactions(id);

ALTER TABLE claim_transaction_diagnoses
        ADD CONSTRAINT claim_transaction_diagnoses_icd_code_fk FOREIGN KEY (icd_code_id) REFERENCES icd_codes(id);

ALTER TABLE claim_transactions
        ADD CONSTRAINT claim_transaction_billing_employee_fk FOREIGN KEY (billing_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_claim_denial_reason_fk FOREIGN KEY (claim_denial_reason_id) REFERENCES reasons(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_claim_fk FOREIGN KEY (claim_id) REFERENCES claims(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_claim_status_external_system_status_fk FOREIGN KEY (claim_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_claim_transaction_type_fk FOREIGN KEY (claim_transaction_type_id) REFERENCES claim_transaction_types(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_cms_hcpcs_code_fk FOREIGN KEY (cms_hcpcs_code_id) REFERENCES cms_hcpcs_codes(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_insurance_policy_fk FOREIGN KEY (insurance_policy_id) REFERENCES insurance_policies(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_ordering_employee_fk FOREIGN KEY (ordering_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_performing_employee_fk FOREIGN KEY (performing_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_posting_employee_fk FOREIGN KEY (posting_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transactions
        ADD CONSTRAINT claim_transaction_carrier_fk FOREIGN KEY (carrier_id) REFERENCES insurance_carriers(id);

ALTER TABLE claims
        ADD CONSTRAINT claim_first_claim_transaction_fk FOREIGN KEY (first_claim_transaction_id) REFERENCES claim_transactions(id);

ALTER TABLE claims
        ADD CONSTRAINT claim_current_carrier_fk FOREIGN KEY (current_carrier_id) REFERENCES insurance_carriers(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_current_claim_transaction_fk FOREIGN KEY (current_claim_transaction_id) REFERENCES claim_transactions(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_current_external_system_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_current_external_system_status_fk FOREIGN KEY (current_claim_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_patient_mrn_fk FOREIGN KEY (patient_mrn_id) REFERENCES patient_mrns(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_site_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE claims
	ADD CONSTRAINT claim_visit_fk FOREIGN KEY (visit_id) REFERENCES visits(id);

ALTER TABLE cms_gpci
	ADD CONSTRAINT cms_gpci_revision_fk FOREIGN KEY (cms_hcpcs_code_revision_id) REFERENCES cms_hcpcs_code_revisions(id);

ALTER TABLE cms_hcpcs_codes
	ADD CONSTRAINT cms_hcpcs_codes_cms_modifier_fk FOREIGN KEY (cms_modifier_id) REFERENCES cms_modifiers(id);

ALTER TABLE cms_hcpcs_codes
	ADD CONSTRAINT cms_hcpcs_codes_modality_fk FOREIGN KEY (modality_id) REFERENCES modalities(id);

ALTER TABLE cms_hcpcs_codes
	ADD CONSTRAINT cms_hcpcs_codes_revision_fk FOREIGN KEY (cms_hcpcs_code_revision_id) REFERENCES cms_hcpcs_code_revisions(id);

ALTER TABLE external_system_role_mappings
	ADD CONSTRAINT external_system_role_mappings_external_system_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE external_system_role_mappings
	ADD CONSTRAINT external_system_role_mappings_external_system_role_fk FOREIGN KEY (external_system_role_id) REFERENCES external_system_roles(id);

ALTER TABLE external_system_statuses
	ADD CONSTRAINT external_system_statuses_external_system_status_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE external_system_statuses
	ADD CONSTRAINT external_system_statuses_universal_event_type_fk FOREIGN KEY (universal_event_type_id) REFERENCES universal_event_types(id);

ALTER TABLE icd_codes
	ADD CONSTRAINT icd_code_revision_fk FOREIGN KEY (icd_code_revision_id) REFERENCES icd_code_revisions(id);

ALTER TABLE insurance_carrier_demographics
	ADD CONSTRAINT insurance_carrier_demographic_insurance_carrier_fk FOREIGN KEY (insurance_carrier_id) REFERENCES insurance_carriers(id);

ALTER TABLE insurance_carrier_demographics
	ADD CONSTRAINT insurance_carrier_demographics_demographic_type_fk FOREIGN KEY (demographic_type_id) REFERENCES demographic_types(id);

ALTER TABLE insurance_carrier_plans
	ADD CONSTRAINT insurance_carrier_plan_insurance_carrier_fk FOREIGN KEY (insurance_carrier_id) REFERENCES insurance_carriers(id);

ALTER TABLE insurance_policies
	ADD CONSTRAINT insurance_policy_insurance_carrier_plan_fk FOREIGN KEY (insurance_carrier_plan_id) REFERENCES insurance_carrier_plans(id);

ALTER TABLE insurance_policies
	ADD CONSTRAINT insurance_policy_relationship_type_fk FOREIGN KEY (relationship_type_id) REFERENCES relationship_types(id);

ALTER TABLE patient_events
	ADD CONSTRAINT patient_events_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE patient_events
	ADD CONSTRAINT patient_events_universal_event_type_fk FOREIGN KEY (external_system_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE patient_events
	ADD CONSTRAINT patient_events_visit_fk FOREIGN KEY (visit_id) REFERENCES visits(id);

ALTER TABLE patient_events_history
	ADD CONSTRAINT patient_events_history_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE patient_events_history
	ADD CONSTRAINT patient_events_history_universal_event_type_fk FOREIGN KEY (external_system_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE procedure_hcpcs_mappings
	ADD CONSTRAINT hcpcs_proc_hcpcs_mappings_fk FOREIGN KEY (cms_hcpcs_code_id) REFERENCES cms_hcpcs_codes(id);

ALTER TABLE procedure_hcpcs_mappings
	ADD CONSTRAINT procedures_proc_hcpcs_mappings_fk FOREIGN KEY (procedure_id) REFERENCES procedures(id);

ALTER TABLE rad_exam_claims
	ADD CONSTRAINT rad_exam_claims_claim_fk FOREIGN KEY (claim_id) REFERENCES claims(id);

ALTER TABLE rad_exam_claims
	ADD CONSTRAINT rad_exam_claims_rad_exam_fk FOREIGN KEY (rad_exam_id) REFERENCES rad_exams(id);

ALTER TABLE rad_exam_external_system_statuses
	ADD CONSTRAINT rad_exam_external_system_statuses_external_system_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE rad_exam_external_system_statuses
	ADD CONSTRAINT rad_exam_external_system_statuses_external_system_status_fk FOREIGN KEY (external_system_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE rad_exam_external_system_statuses
	ADD CONSTRAINT rad_exam_external_system_statuses_rad_exam_fk FOREIGN KEY (rad_exam_id) REFERENCES rad_exams(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_current_report_fk FOREIGN KEY (current_report_id) REFERENCES rad_reports(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_exam_priority_fk FOREIGN KEY (exam_priority_id) REFERENCES exam_priorities(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_external_system_status_fk FOREIGN KEY (current_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_extsys_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_first_final_report_fk FOREIGN KEY (first_final_report_id) REFERENCES rad_reports(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_first_prelim_report_fk FOREIGN KEY (first_prelim_report_id) REFERENCES rad_reports(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_last_final_report_fk FOREIGN KEY (last_final_report_id) REFERENCES rad_reports(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_order_fk FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_patient_mrn_fk FOREIGN KEY (patient_mrn_id) REFERENCES patient_mrns(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_procedure_fk FOREIGN KEY (procedure_id) REFERENCES procedures(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_rad_exam_dept_fk FOREIGN KEY (rad_exam_department_id) REFERENCES rad_exam_departments(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_resource_fk FOREIGN KEY (resource_id) REFERENCES resources(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_site_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_site_sublocation_fk FOREIGN KEY (site_sublocation_id) REFERENCES site_sublocations(id);

ALTER TABLE rad_reports
	ADD CONSTRAINT report_status_fk FOREIGN KEY (report_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_exam_priority_fk FOREIGN KEY (exam_priority_id) REFERENCES exam_priorities(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_external_system_status_fk FOREIGN KEY (current_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_extsys_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_order_fk FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_patient_mrn_fk FOREIGN KEY (patient_mrn_id) REFERENCES patient_mrns(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_procedure_fk FOREIGN KEY (procedure_id) REFERENCES procedures(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_site_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_site_sublocation_fk FOREIGN KEY (site_sublocation_id) REFERENCES site_sublocations(id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_visit_fk FOREIGN KEY (visit_id) REFERENCES visits(id);

ALTER TABLE radonc_case_claims
	ADD CONSTRAINT radonc_case_claims_claim_fk FOREIGN KEY (claim_id) REFERENCES claims(id);

ALTER TABLE radonc_case_claims
	ADD CONSTRAINT radonc_case_claims_radonc_case_fk FOREIGN KEY (radonc_case_id) REFERENCES radonc_cases(id);

ALTER TABLE reasons
	ADD CONSTRAINT reasons_extsys_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE site_classes
	ADD CONSTRAINT site_classes_cms_facility_type_fk FOREIGN KEY (cms_facility_type_id) REFERENCES cms_facility_types(id);

ALTER TABLE sites
	ADD CONSTRAINT site_cms_gpci_fk FOREIGN KEY (cms_gpci_id) REFERENCES cms_gpci(id);

ALTER TABLE visit_diagnoses
	ADD CONSTRAINT visit_diagnoses_icd_code_fk FOREIGN KEY (icd_code_id) REFERENCES icd_codes(id);

ALTER TABLE visit_diagnoses
	ADD CONSTRAINT visit_diagnoses_visit_fk FOREIGN KEY (visit_id) REFERENCES visits(id);

ALTER TABLE visit_insurance_policies
	ADD CONSTRAINT visit_insurance_policies_insurance_policy_fk FOREIGN KEY (insurance_policy_id) REFERENCES insurance_policies(id);

ALTER TABLE visit_insurance_policies
	ADD CONSTRAINT visit_insurance_policies_visit_fk FOREIGN KEY (visit_id) REFERENCES visits(id);

ALTER TABLE insurance_carrier_plans
	ADD CONSTRAINT insurance_carrier_plan_grouping_fk FOREIGN KEY (insurance_carrier_plan_grouping_id) REFERENCES insurance_carrier_plan_groupings(id);

ALTER TABLE insurance_carriers
	ADD CONSTRAINT insurance_carrier_external_system_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);
