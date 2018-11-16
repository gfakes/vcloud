
CREATE SCHEMA documentation;

SET search_path = documentation, pg_catalog;

CREATE SEQUENCE data_elements_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE data_types_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE department_models_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE element_groupings_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE message_element_mappings_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE message_types_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE data_elements (
	id bigint DEFAULT nextval('data_elements_id_seq'::regclass) NOT NULL,
	json_key text NOT NULL,
	description text NOT NULL,
	industry_aliases text,
	core_table text NOT NULL,
	core_column text NOT NULL,
	data_type_id bigint NOT NULL,
	element_grouping_id bigint,
	grouping_mandatory boolean,
	grouping_inheritence boolean,
	wildcard boolean DEFAULT false NOT NULL,
	hl7_default_location text,
	hl7_repeating boolean DEFAULT false NOT NULL,
	hl7_mandatory boolean DEFAULT false NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE data_types (
	id bigint DEFAULT nextval('data_types_id_seq'::regclass) NOT NULL,
	data_type text NOT NULL,
	json_type text NOT NULL,
	sql_type text NOT NULL,
	comments text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE department_models (
	id bigint DEFAULT nextval('department_models_id_seq'::regclass) NOT NULL,
	department text NOT NULL,
	comments text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE element_groupings (
	id bigint DEFAULT nextval('element_groupings_id_seq'::regclass) NOT NULL,
	"grouping" text NOT NULL,
	comments text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE message_element_mappings (
	id bigint DEFAULT nextval('message_element_mappings_id_seq'::regclass) NOT NULL,
	message_type_id bigint NOT NULL,
	data_element_id bigint NOT NULL,
	mandatory boolean DEFAULT false NOT NULL,
	comments text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE message_types (
	id bigint DEFAULT nextval('message_types_id_seq'::regclass) NOT NULL,
	message_type text NOT NULL,
	department_model_id bigint NOT NULL,
	comments text,
	hl7_type text,
	hl7_trigger_events text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE data_elements
	ADD CONSTRAINT data_elements_id PRIMARY KEY (id);

ALTER TABLE data_types
	ADD CONSTRAINT data_types_id PRIMARY KEY (id);

ALTER TABLE department_models
	ADD CONSTRAINT department_models_id PRIMARY KEY (id);

ALTER TABLE element_groupings
	ADD CONSTRAINT element_groupings_id PRIMARY KEY (id);

ALTER TABLE message_element_mappings
	ADD CONSTRAINT message_element_mappings_id PRIMARY KEY (id);

ALTER TABLE message_types
	ADD CONSTRAINT message_types_id PRIMARY KEY (id);

ALTER TABLE data_elements
	ADD CONSTRAINT data_elements_data_type_id_fk FOREIGN KEY (data_type_id) REFERENCES data_types(id);

ALTER TABLE data_elements
	ADD CONSTRAINT data_elements_element_grouping_id_fk FOREIGN KEY (element_grouping_id) REFERENCES element_groupings(id);

ALTER TABLE message_element_mappings
	ADD CONSTRAINT message_element_mappings_data_element_id_fk FOREIGN KEY (data_element_id) REFERENCES data_elements(id);

ALTER TABLE message_element_mappings
	ADD CONSTRAINT message_element_mappings_message_type_id_fk FOREIGN KEY (message_type_id) REFERENCES message_types(id);

ALTER TABLE message_types
	ADD CONSTRAINT message_types_department_model_id_fk FOREIGN KEY (department_model_id) REFERENCES department_models(id);

CREATE INDEX doc_de_dt_id ON data_elements USING btree (data_type_id);

CREATE INDEX doc_de_eg_id ON data_elements USING btree (element_grouping_id);

CREATE INDEX doc_de_jk ON data_elements USING btree (json_key);

CREATE INDEX doc_mem_de_id ON message_element_mappings USING btree (data_element_id);

CREATE INDEX doc_mem_mandatory ON message_element_mappings USING btree (mandatory);

CREATE INDEX doc_mem_mt_id ON message_element_mappings USING btree (message_type_id);

CREATE INDEX doc_mt_dept_mod_id ON message_types USING btree (department_model_id);
