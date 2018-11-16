-- old: 3.2.4
-- new: 3.3.0

TRUNCATE rad_exam_facts;

DROP INDEX rad_exam_fact_reportable_idx;

CREATE SEQUENCE claim_transaction_facts_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE claim_transaction_facts (
	id bigint DEFAULT nextval('claim_transaction_facts_id_seq'::regclass) NOT NULL,
	service_performed_year smallint NOT NULL,
	service_performed_month smallint NOT NULL,
	service_performed_day smallint NOT NULL,
	service_performed_hour smallint NOT NULL,
	service_performed_minute smallint NOT NULL,
	service_performed_epoch bigint NOT NULL,
	service_performed_dow smallint NOT NULL,
	service_performed_woy smallint NOT NULL,
	transaction_post_month smallint NOT NULL,
	transaction_post_year smallint NOT NULL,
	transaction_post_day smallint NOT NULL,
	transaction_post_hour smallint NOT NULL,
	transaction_post_minute smallint NOT NULL,
	transaction_post_epoch bigint NOT NULL,
	transaction_post_dow smallint NOT NULL,
	transaction_post_woy smallint NOT NULL,
	claim_transaction_id bigint NOT NULL,
	claim_id bigint,
	site_id bigint,
	site_class_id bigint,
	cms_hcpcs_code_id bigint,
	insurance_policy_id bigint,
	insurance_carrier_plan_id bigint,
	insurance_carrier_plan_grouping_id bigint,
	insurance_carrier_id bigint,
	ordering_employee_id bigint,
	performing_employee_id bigint,
	billing_employee_id bigint,
	posting_employee_id bigint,
	claim_status_id bigint,
	universal_event_type_id bigint,
	claim_transaction_type_id bigint,
	claim_denial_reason_id bigint,
	self_pay boolean,
	unit_count integer,
	transaction_amount bigint,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE rad_exam_facts
	ADD COLUMN end_exam_minute smallint NOT NULL,
	ADD COLUMN end_exam_dow smallint NOT NULL,
	ADD COLUMN end_exam_woy smallint NOT NULL,
	ADD COLUMN first_report_year smallint,
	ADD COLUMN first_report_month smallint,
	ADD COLUMN first_report_day smallint,
	ADD COLUMN first_report_hour smallint,
	ADD COLUMN first_report_minute smallint,
	ADD COLUMN first_report_epoch bigint,
	ADD COLUMN first_report_dow smallint,
	ADD COLUMN first_report_woy smallint,
	ADD COLUMN prelim_report_year smallint,
	ADD COLUMN prelim_report_month smallint,
	ADD COLUMN prelim_report_day smallint,
	ADD COLUMN prelim_report_hour smallint,
	ADD COLUMN prelim_report_minute smallint,
	ADD COLUMN prelim_report_epoch bigint,
	ADD COLUMN prelim_report_dow smallint,
	ADD COLUMN prelim_report_woy smallint,
	ADD COLUMN final_report_year smallint,
	ADD COLUMN final_report_month smallint,
	ADD COLUMN final_report_day smallint,
	ADD COLUMN final_report_hour smallint,
	ADD COLUMN final_report_minute smallint,
	ADD COLUMN final_report_epoch bigint,
	ADD COLUMN final_report_dow smallint,
	ADD COLUMN final_report_woy smallint,
	ADD COLUMN resident_id bigint,
	ADD COLUMN site_location_id bigint,
	ADD COLUMN delay_reason_id bigint,
	ADD COLUMN first_report_turn_around bigint,
	ADD COLUMN charges bigint,
	ADD COLUMN payments bigint,
	ADD COLUMN adjustments bigint,
	ADD COLUMN accounts_receivable bigint,
	ALTER COLUMN rad_exam_id SET NOT NULL,
	ALTER COLUMN updated_at SET DEFAULT now();

ALTER TABLE rad_exam_metrics
	ADD COLUMN first_report_turn_around bigint;

ALTER TABLE rad_exams
	ADD COLUMN first_report_id bigint;

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_id PRIMARY KEY (id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_billing_employee_id_fk FOREIGN KEY (billing_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_claim_denial_reason_id_fk FOREIGN KEY (claim_denial_reason_id) REFERENCES reasons(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_claim_id_fk FOREIGN KEY (claim_id) REFERENCES claims(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_claim_status_id_fk FOREIGN KEY (claim_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_claim_transaction_id_fk FOREIGN KEY (claim_transaction_id) REFERENCES claim_transactions(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_claim_transaction_type_id_fk FOREIGN KEY (claim_transaction_type_id) REFERENCES claim_transaction_types(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_cms_hcpcs_code_id_fk FOREIGN KEY (cms_hcpcs_code_id) REFERENCES cms_hcpcs_codes(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_insurance_carrier_id_fk FOREIGN KEY (insurance_carrier_id) REFERENCES insurance_carriers(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_insurance_carrier_plan_grouping_id_fk FOREIGN KEY (insurance_carrier_plan_grouping_id) REFERENCES insurance_carrier_plan_groupings(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_insurance_carrier_plan_id_fk FOREIGN KEY (insurance_carrier_plan_id) REFERENCES insurance_carrier_plans(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_insurance_policy_id_fk FOREIGN KEY (insurance_policy_id) REFERENCES insurance_policies(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_ordering_employee_id_fk FOREIGN KEY (ordering_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_performing_employee_id_fk FOREIGN KEY (performing_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_posting_employee_id_fk FOREIGN KEY (posting_employee_id) REFERENCES employees(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_site_class_id_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_site_id_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE claim_transaction_facts
	ADD CONSTRAINT claim_transaction_facts_universal_event_type_id_fk FOREIGN KEY (universal_event_type_id) REFERENCES universal_event_types(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_delay_reason_id_fk FOREIGN KEY (delay_reason_id) REFERENCES reasons(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_resident_id_fk FOREIGN KEY (resident_id) REFERENCES employees(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_site_location_id_fk FOREIGN KEY (site_location_id) REFERENCES site_locations(id);

ALTER TABLE rad_exams
	ADD CONSTRAINT rad_exam_first_report_fk FOREIGN KEY (first_report_id) REFERENCES rad_reports(id);

CREATE INDEX claim_transaction_facts_billing_employee_id_idx ON claim_transaction_facts USING btree (billing_employee_id);

CREATE INDEX claim_transaction_facts_claim_denial_reason_id_idx ON claim_transaction_facts USING btree (claim_denial_reason_id);

CREATE INDEX claim_transaction_facts_claim_id_idx ON claim_transaction_facts USING btree (claim_id);

CREATE INDEX claim_transaction_facts_claim_status_id_idx ON claim_transaction_facts USING btree (claim_status_id);

CREATE INDEX claim_transaction_facts_claim_transaction_id_idx ON claim_transaction_facts USING btree (claim_transaction_id);

CREATE INDEX claim_transaction_facts_claim_transaction_type_id_idx ON claim_transaction_facts USING btree (claim_transaction_type_id);

CREATE INDEX claim_transaction_facts_cms_hcpcs_code_id_idx ON claim_transaction_facts USING btree (cms_hcpcs_code_id);

CREATE INDEX claim_transaction_facts_insurance_carrier_id_idx ON claim_transaction_facts USING btree (insurance_carrier_id);

CREATE INDEX claim_transaction_facts_insurance_carrier_plan_grouping_id_idx ON claim_transaction_facts USING btree (insurance_carrier_plan_grouping_id);

CREATE INDEX claim_transaction_facts_insurance_carrier_plan_id_idx ON claim_transaction_facts USING btree (insurance_carrier_plan_id);

CREATE INDEX claim_transaction_facts_insurance_policy_id_idx ON claim_transaction_facts USING btree (insurance_policy_id);

CREATE INDEX claim_transaction_facts_ordering_employee_id_idx ON claim_transaction_facts USING btree (ordering_employee_id);

CREATE INDEX claim_transaction_facts_performing_employee_id_idx ON claim_transaction_facts USING btree (performing_employee_id);

CREATE INDEX claim_transaction_facts_posting_employee_id_idx ON claim_transaction_facts USING btree (posting_employee_id);

CREATE INDEX claim_transaction_facts_service_performed_day_idx ON claim_transaction_facts USING btree (service_performed_day);

CREATE INDEX claim_transaction_facts_service_performed_dow_idx ON claim_transaction_facts USING btree (service_performed_dow);

CREATE INDEX claim_transaction_facts_service_performed_epoch_idx ON claim_transaction_facts USING btree (service_performed_epoch);

CREATE INDEX claim_transaction_facts_service_performed_hour_idx ON claim_transaction_facts USING btree (service_performed_hour);

CREATE INDEX claim_transaction_facts_service_performed_minute_idx ON claim_transaction_facts USING btree (service_performed_minute);

CREATE INDEX claim_transaction_facts_service_performed_month_idx ON claim_transaction_facts USING btree (service_performed_month);

CREATE INDEX claim_transaction_facts_service_performed_woy_idx ON claim_transaction_facts USING btree (service_performed_woy);

CREATE INDEX claim_transaction_facts_service_performed_year_idx ON claim_transaction_facts USING btree (service_performed_year);

CREATE INDEX claim_transaction_facts_site_class_id_idx ON claim_transaction_facts USING btree (site_class_id);

CREATE INDEX claim_transaction_facts_site_id_idx ON claim_transaction_facts USING btree (site_id);

CREATE INDEX claim_transaction_facts_transaction_post_day_idx ON claim_transaction_facts USING btree (transaction_post_day);

CREATE INDEX claim_transaction_facts_transaction_post_dow_idx ON claim_transaction_facts USING btree (transaction_post_dow);

CREATE INDEX claim_transaction_facts_transaction_post_epoch_idx ON claim_transaction_facts USING btree (transaction_post_epoch);

CREATE INDEX claim_transaction_facts_transaction_post_hour_idx ON claim_transaction_facts USING btree (transaction_post_hour);

CREATE INDEX claim_transaction_facts_transaction_post_minute_idx ON claim_transaction_facts USING btree (transaction_post_minute);

CREATE INDEX claim_transaction_facts_transaction_post_month_idx ON claim_transaction_facts USING btree (transaction_post_month);

CREATE INDEX claim_transaction_facts_transaction_post_woy_idx ON claim_transaction_facts USING btree (transaction_post_woy);

CREATE INDEX claim_transaction_facts_transaction_post_year_idx ON claim_transaction_facts USING btree (transaction_post_year);

CREATE INDEX claim_transaction_facts_universal_event_type_id_idx ON claim_transaction_facts USING btree (universal_event_type_id);

CREATE INDEX rad_exam_fact_delay_reason_id_idx ON rad_exam_facts USING btree (delay_reason_id);

CREATE INDEX rad_exam_fact_end_exam_dow_idx ON rad_exam_facts USING btree (end_exam_dow);

CREATE INDEX rad_exam_fact_end_exam_minute_idx ON rad_exam_facts USING btree (end_exam_minute);

CREATE INDEX rad_exam_fact_end_exam_woy_idx ON rad_exam_facts USING btree (end_exam_woy);

CREATE INDEX rad_exam_fact_final_report_day_idx ON rad_exam_facts USING btree (final_report_day);

CREATE INDEX rad_exam_fact_final_report_dow_idx ON rad_exam_facts USING btree (final_report_dow);

CREATE INDEX rad_exam_fact_final_report_epoch_idx ON rad_exam_facts USING btree (final_report_epoch);

CREATE INDEX rad_exam_fact_final_report_hour_idx ON rad_exam_facts USING btree (final_report_hour);

CREATE INDEX rad_exam_fact_final_report_minute_idx ON rad_exam_facts USING btree (final_report_minute);

CREATE INDEX rad_exam_fact_final_report_month_idx ON rad_exam_facts USING btree (final_report_month);

CREATE INDEX rad_exam_fact_final_report_woy_idx ON rad_exam_facts USING btree (final_report_woy);

CREATE INDEX rad_exam_fact_final_report_year_idx ON rad_exam_facts USING btree (final_report_year);

CREATE INDEX rad_exam_fact_first_report_day_idx ON rad_exam_facts USING btree (first_report_day);

CREATE INDEX rad_exam_fact_first_report_dow_idx ON rad_exam_facts USING btree (first_report_dow);

CREATE INDEX rad_exam_fact_first_report_epoch_idx ON rad_exam_facts USING btree (first_report_epoch);

CREATE INDEX rad_exam_fact_first_report_hour_idx ON rad_exam_facts USING btree (first_report_hour);

CREATE INDEX rad_exam_fact_first_report_minute_idx ON rad_exam_facts USING btree (first_report_minute);

CREATE INDEX rad_exam_fact_first_report_month_idx ON rad_exam_facts USING btree (first_report_month);

CREATE INDEX rad_exam_fact_first_report_woy_idx ON rad_exam_facts USING btree (first_report_woy);

CREATE INDEX rad_exam_fact_first_report_year_idx ON rad_exam_facts USING btree (first_report_year);

CREATE INDEX rad_exam_fact_prelim_report_day_idx ON rad_exam_facts USING btree (prelim_report_day);

CREATE INDEX rad_exam_fact_prelim_report_dow_idx ON rad_exam_facts USING btree (prelim_report_dow);

CREATE INDEX rad_exam_fact_prelim_report_epoch_idx ON rad_exam_facts USING btree (prelim_report_epoch);

CREATE INDEX rad_exam_fact_prelim_report_hour_idx ON rad_exam_facts USING btree (prelim_report_hour);

CREATE INDEX rad_exam_fact_prelim_report_minute_idx ON rad_exam_facts USING btree (prelim_report_minute);

CREATE INDEX rad_exam_fact_prelim_report_month_idx ON rad_exam_facts USING btree (prelim_report_month);

CREATE INDEX rad_exam_fact_prelim_report_woy_idx ON rad_exam_facts USING btree (prelim_report_woy);

CREATE INDEX rad_exam_fact_prelim_report_year_idx ON rad_exam_facts USING btree (prelim_report_year);

CREATE INDEX rad_exam_fact_reportable_idx ON rad_exam_facts USING btree (reportable);

CREATE INDEX rad_exam_fact_resident_id_idx ON rad_exam_facts USING btree (resident_id);

CREATE INDEX rad_exam_fact_site_location_id_idx ON rad_exam_facts USING btree (site_location_id);

CREATE INDEX radexam_firstreportid_idx ON rad_exams USING btree (first_report_id);

UPDATE public.configuration_variables SET configuration_value='3.3.0', updated_at=now() WHERE configuration_key='data-model-version';
