CREATE SEQUENCE data_quality_stats_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE app_tracking_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE app_tracking (
	id bigint DEFAULT nextval('claim_transaction_cms_modifiers_id_seq'::regclass) NOT NULL,
	application_name text,
	browser_name text,
	browser_version text,
	platform text,
	query_parameters text,
	relative_url text,
	url text,
	username text,
	employee_id bigint,
	created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE data_quality_stats (
	id bigint DEFAULT nextval('data_quality_stats_id_seq'::regclass) NOT NULL,
	sample_date date DEFAULT (('now'::text)::date - 1) NOT NULL,
	fact_density text NOT NULL,
	data_manager text NOT NULL,
	app_traffic text NOT NULL,
	deployment text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE procedures
	ADD COLUMN volume integer DEFAULT 1 NOT NULL;

ALTER TABLE rad_exam_details
	ADD COLUMN patient_age integer;

ALTER TABLE rad_exam_facts
	ADD COLUMN volume integer,
	ADD COLUMN patient_age integer;

ALTER TABLE app_tracking
	ADD CONSTRAINT app_tracking_id PRIMARY KEY (id);

ALTER TABLE app_tracking
	ADD CONSTRAINT app_tracking_employees_fk FOREIGN KEY (employee_id) REFERENCES employees(id);

ALTER TABLE data_quality_stats
	ADD CONSTRAINT data_quality_stats_pk PRIMARY KEY (id);

CREATE INDEX app_tracking_appname_idx ON app_tracking USING btree (application_name);

CREATE INDEX app_tracking_createdat_idx ON app_tracking USING btree (created_at);

CREATE INDEX app_tracking_employee_fk_idx ON app_tracking USING btree (employee_id);

CREATE INDEX app_tracking_relurl_idx ON app_tracking USING btree (relative_url);

CREATE INDEX app_tracking_username_idx ON app_tracking USING btree (username);

CREATE INDEX data_quality_stats_sample_idx ON data_quality_stats USING btree (sample_date);

CREATE INDEX procedure_volume_idx ON procedures USING btree (volume);

CREATE INDEX rad_exam_fact_patient_age_idx ON rad_exam_facts USING btree (patient_age);

SET search_path = documentation, pg_catalog;

TRUNCATE TABLE documentation.message_types, documentation.message_element_mappings, documentation.element_groupings, documentation.department_models, documentation.data_types, documentation.data_elements;

ALTER TABLE data_elements
      ADD COLUMN hl7_default_location text,
      ADD COLUMN hl7_repeating boolean DEFAULT false NOT NULL,
      ADD COLUMN hl7_mandatory boolean DEFAULT false NOT NULL;

ALTER TABLE message_types
      ADD COLUMN hl7_type text,
      ADD COLUMN hl7_trigger_events text;

CREATE INDEX doc_de_dt_id ON data_elements USING btree (data_type_id);

CREATE INDEX doc_de_eg_id ON data_elements USING btree (element_grouping_id);

CREATE INDEX doc_de_jk ON data_elements USING btree (json_key);

CREATE INDEX doc_mem_de_id ON message_element_mappings USING btree (data_element_id);

CREATE INDEX doc_mem_mandatory ON message_element_mappings USING btree (mandatory);

CREATE INDEX doc_mem_mt_id ON message_element_mappings USING btree (message_type_id);

CREATE INDEX doc_mt_dept_mod_id ON message_types USING btree (department_model_id);
