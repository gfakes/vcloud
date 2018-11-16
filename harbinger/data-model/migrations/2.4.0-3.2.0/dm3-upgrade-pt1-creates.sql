-- drop FK constraints

ALTER TABLE patient_events
	DROP CONSTRAINT patient_events_patient_event_type_fk;

ALTER TABLE patient_events
	DROP CONSTRAINT patient_events_site_location_after_event_fk;

ALTER TABLE patient_events
	DROP CONSTRAINT visit_fk;

ALTER TABLE patient_events_history
	DROP CONSTRAINT patient_events_history_patient_event_type_fk;

ALTER TABLE patient_events_history
	DROP CONSTRAINT patient_events_history_postevent_site_location_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT rad_exams_extsys_id_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT exam_priorities_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT exam_statuses_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT orders_rad_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT patient_mrn_id_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT procedures_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT rad_exam_department_rad_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT reports_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT reports_exams_fk1;

ALTER TABLE rad_exams
	DROP CONSTRAINT reports_exams_fk2;

ALTER TABLE rad_exams
	DROP CONSTRAINT reports_exams_fk3;

ALTER TABLE rad_exams
	DROP CONSTRAINT resources_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT site_classes_exams_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT site_fk;

ALTER TABLE rad_exams
	DROP CONSTRAINT sublocation_fk;

ALTER TABLE rad_reports
	DROP CONSTRAINT report_status_fk;

ALTER TABLE exam_statuses
        DROP CONSTRAINT exam_statuses_external_system_status_fk;

ALTER TABLE exam_statuses
        DROP CONSTRAINT exam_trip_status_fk;

ALTER TABLE rad_external_system_statuses
        DROP CONSTRAINT rad_external_system_statuses_exam_status_fk;

ALTER TABLE rad_external_system_statuses
        DROP CONSTRAINT rad_external_system_statuses_external_system_fk;

ALTER TABLE rad_external_system_statuses
        DROP CONSTRAINT rad_external_system_statuses_rad_exam_fk;

-- create new sequences

CREATE SEQUENCE claim_transaction_cms_modifiers_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MAXVALUE
        NO MINVALUE
        CACHE 1;

CREATE SEQUENCE claim_transaction_diagnoses_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE claim_transactions_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE claim_transaction_types_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE claims_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE cms_facility_types_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE cms_gpci_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE cms_hcpcs_codes_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE cms_hcpcs_code_revisions_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE cms_modifiers_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE external_system_role_mappings_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE external_system_roles_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE icd_code_revisions_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE radonc_case_authorizations_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE rad_exam_authorizations_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE rad_exam_facts_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE icd_codes_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE insurance_carrier_demographics_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE insurance_carrier_plans_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE insurance_carriers_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE insurance_policies_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE relationship_types_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE rad_exam_claims_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE radonc_case_claims_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE procedure_hcpcs_mappings_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE radonc_cases_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE visit_diagnoses_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE visit_insurance_policies_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE insurance_carrier_plan_groupings_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

-- create new tables

CREATE TABLE claim_transaction_cms_modifiers (
        id bigint DEFAULT nextval('claim_transaction_cms_modifiers_id_seq'::regclass) NOT NULL,
        claim_transaction_id bigint NOT NULL,
        cms_modifier_id bigint NOT NULL,
        updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE claim_transaction_diagnoses (
	id bigint DEFAULT nextval('claim_transaction_diagnoses_id_seq'::regclass) NOT NULL,
	claim_transaction_id bigint NOT NULL,
	icd_code_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE claim_transactions (
	id bigint DEFAULT nextval('claim_transactions_id_seq'::regclass) NOT NULL,
	claim_id bigint NOT NULL,
	claim_sequence bigint NOT NULL,
	cms_hcpcs_code_id bigint NOT NULL,
	service_performed timestamp with time zone NOT NULL,
	ordering_employee_id bigint,
	performing_employee_id bigint,
	billing_employee_id bigint NOT NULL,
	posting_employee_id bigint,
	transaction_post timestamp with time zone NOT NULL,
	claim_status_id bigint NOT NULL,
	claim_transaction_type_id bigint NOT NULL,
	transaction_amount bigint NOT NULL,
	unit_count integer,
	balance bigint NOT NULL,
	carrier_id bigint,
	insurance_policy_id bigint,
	self_pay boolean,
	auth_number text,
	comments text,
	claim_denial_reason_id bigint,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE claim_transaction_types (
	id bigint DEFAULT nextval('claim_transaction_types_id_seq'::regclass) NOT NULL,
	transaction_type text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE claims (
	id bigint DEFAULT nextval('claims_id_seq'::regclass) NOT NULL,
	claim_number text NOT NULL,
	external_system_id bigint NOT NULL,
	patient_mrn_id bigint NOT NULL,
	site_id bigint NOT NULL,
	visit_id bigint,
	site_class_id bigint,
        first_claim_transaction_id bigint,
        current_claim_transaction_id bigint,
        original_charge bigint DEFAULT 0 NOT NULL,
	current_balance bigint DEFAULT 0 NOT NULL,
	current_claim_status_id bigint,
        current_carrier_id bigint,
        charge_post timestamp with time zone,
        claim_create timestamp with time zone,
        zero_balance timestamp with time zone,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE cms_facility_types (
	id bigint DEFAULT nextval('cms_facility_types_id_seq'::regclass) NOT NULL,
	pos_code bigint NOT NULL,
	facility_type text NOT NULL,
	cms_facility boolean NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE cms_gpci (
	id bigint DEFAULT nextval('cms_gpci_id_seq'::regclass) NOT NULL,
	carrier text NOT NULL,
	locality text NOT NULL,
	locality_name text NOT NULL,
	work_gpci double precision DEFAULT 0 NOT NULL,
	pe_gpci double precision DEFAULT 0 NOT NULL,
	mp_gpci double precision DEFAULT 0 NOT NULL,
	cms_hcpcs_code_revision_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE cms_hcpcs_codes (
	id bigint DEFAULT nextval('cms_hcpcs_codes_id_seq'::regclass) NOT NULL,
	hcpcs text NOT NULL,
	description text,
	modality_id bigint,
	surgical boolean DEFAULT false NOT NULL,
	supply boolean DEFAULT false NOT NULL,
	work_rvu double precision DEFAULT 0 NOT NULL,
	nonfacility_pe_rvu double precision DEFAULT 0 NOT NULL,
	facility_pe_rvu double precision DEFAULT 0 NOT NULL,
	mp_rvu double precision DEFAULT 0 NOT NULL,
	conversion_factor double precision DEFAULT 0 NOT NULL,
	cms_modifier_id bigint,
	cms_hcpcs_code_revision_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE cms_hcpcs_code_revisions (
	id bigint DEFAULT nextval('cms_hcpcs_code_revisions_id_seq'::regclass) NOT NULL,
	revision text NOT NULL,
	active boolean DEFAULT true NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE cms_modifiers (
	id bigint DEFAULT nextval('cms_modifiers_id_seq'::regclass) NOT NULL,
	modifier text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE external_system_role_mappings (
	id bigint DEFAULT nextval('external_system_role_mappings_id_seq'::regclass) NOT NULL,
	external_system_id bigint NOT NULL,
	external_system_role_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE external_system_roles (
	id bigint DEFAULT nextval('external_system_roles_id_seq'::regclass) NOT NULL,
	system_role text NOT NULL,
	description text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE icd_code_revisions (
	id bigint DEFAULT nextval('icd_code_revisions_id_seq'::regclass) NOT NULL,
	icd_code_version text NOT NULL,
	icd_code_revision text NOT NULL,
	active boolean DEFAULT true NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE icd_codes (
	id bigint DEFAULT nextval('icd_codes_id_seq'::regclass) NOT NULL,
	code text NOT NULL,
	description text,
	icd_code_revision_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE rad_exam_claims (
	id bigint DEFAULT nextval('rad_exam_claims_id_seq'::regclass) NOT NULL,
	claim_id bigint NOT NULL,
	rad_exam_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE radonc_case_authorizations (
	id bigint DEFAULT nextval('radonc_case_authorizations_id_seq'::regclass) NOT NULL,
	radonc_case_id bigint NOT NULL,
	auth_number text NOT NULL,
	insurance_policy_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE rad_exam_authorizations (
	id bigint DEFAULT nextval('rad_exam_authorizations_id_seq'::regclass) NOT NULL,
	rad_exam_id bigint NOT NULL,
	auth_number text NOT NULL,
	insurance_policy_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE rad_exam_facts (
	id bigint DEFAULT nextval('rad_exam_facts_id_seq'::regclass) NOT NULL,
	rad_exam_id bigint,
	end_exam_year smallint NOT NULL,
	end_exam_month smallint NOT NULL,
	end_exam_day smallint NOT NULL,
	end_exam_hour smallint NOT NULL,
	end_exam_epoch bigint NOT NULL,
	modality_id bigint,
	ordering_provider_id bigint,
	patient_type text,
	procedure_id bigint,
	procedure_specialty_id bigint,
	reportable boolean,
	radiologist_id bigint,
	radiologist_specialty_id bigint,
	resource_id bigint,
	site_id bigint,
	rad_exam_department_id bigint,
	site_class_id bigint,
	technologist_id bigint,
	patient_priority text,
	patient_priority_specified_date boolean,
	pro_rvu double precision,
	tech_rvu double precision,
	access_wait bigint,
	reg_wait bigint,
	reg_duration bigint,
	exam_wait bigint,
	exam_duration bigint,
	total_wait bigint,
	order_complete bigint,
	prelim_turn_around bigint,
	turn_around bigint,
	order_first_image bigint,
	order_last_image bigint,
	first_image_prelim bigint,
	last_image_prelim bigint,
	first_image_final bigint,
	last_image_final bigint,
	end_exam_first_image bigint,
	end_exam_last_image bigint,
	send_duration bigint,
	updated_at timestamp with time zone NOT NULL
);

CREATE TABLE radonc_case_claims (
	id bigint DEFAULT nextval('radonc_case_claims_id_seq'::regclass) NOT NULL,
	claim_id bigint NOT NULL,
	radonc_case_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_carrier_demographics (
	id bigint DEFAULT nextval('insurance_carrier_demographics_id_seq'::regclass) NOT NULL,
	insurance_carrier_id bigint NOT NULL,
	demographic_type_id bigint NOT NULL,
	demographic text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_carrier_plans (
	id bigint DEFAULT nextval('insurance_carrier_plans_id_seq'::regclass) NOT NULL,
	insurance_carrier_id bigint NOT NULL,
	plan_name text NOT NULL,
	plan_number text,
	insurance_carrier_plan_grouping_id bigint,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_carriers (
	id bigint DEFAULT nextval('insurance_carriers_id_seq'::regclass) NOT NULL,
	carrier text NOT NULL,
	external_system_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_policies (
	id bigint DEFAULT nextval('insurance_policies_id_seq'::regclass) NOT NULL,
	policy_holder_name text NOT NULL,
	employer_name text,
	insurance_carrier_plan_id bigint,
	group_number text,
	policy_number text,
	relationship_type_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE relationship_types (
	id bigint DEFAULT nextval('relationship_types_id_seq'::regclass) NOT NULL,
	relationship text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE procedure_hcpcs_mappings (
	id bigint DEFAULT nextval('procedure_hcpcs_mappings_id_seq'::regclass) NOT NULL,
	cms_hcpcs_code_id bigint NOT NULL,
	procedure_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE radonc_cases (
	id bigint DEFAULT nextval('radonc_cases_id_seq'::regclass) NOT NULL,
	case_number text NOT NULL,
	external_system_id bigint NOT NULL,
	order_id bigint,
	visit_id bigint,
	patient_mrn_id bigint NOT NULL,
	site_class_id bigint,
	site_sublocation_id bigint,
	procedure_id bigint,
	exam_priority_id bigint,
	current_status_id bigint NOT NULL,
	site_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE visit_diagnoses (
	id bigint DEFAULT nextval('visit_diagnoses_id_seq'::regclass) NOT NULL,
	visit_id bigint NOT NULL,
	icd_code_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE visit_insurance_policies (
	id bigint DEFAULT nextval('visit_insurance_policies_id_seq'::regclass) NOT NULL,
	visit_id bigint NOT NULL,
	insurance_policy_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_carrier_plan_groupings (
	id bigint DEFAULT nextval('insurance_carrier_plan_groupings_id_seq'::regclass) NOT NULL,
	grouping_name text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

-- add columns

ALTER TABLE clinical_roles
	ADD COLUMN description text;

ALTER TABLE external_systems
	ADD COLUMN identifier_padding_rules text;

ALTER TABLE metasites
	ADD COLUMN organizational boolean DEFAULT false NOT NULL;

ALTER TABLE patient_events
	ADD COLUMN external_system_status_id bigint,
	ADD COLUMN site_class_id bigint;

ALTER TABLE patient_events_history
	ADD COLUMN external_system_status_id bigint,
	ADD COLUMN site_class_id bigint;

ALTER TABLE procedures
	ADD COLUMN pro_rvu double precision DEFAULT 0 NOT NULL,
	ADD COLUMN tech_rvu double precision DEFAULT 0 NOT NULL,
	ADD COLUMN cms_fee bigint DEFAULT 0 NOT NULL;

ALTER TABLE rad_exam_metrics
	ADD COLUMN order_first_image bigint,
	ADD COLUMN order_last_image bigint,
	ADD COLUMN first_image_prelim bigint,
	ADD COLUMN last_image_prelim bigint,
	ADD COLUMN first_image_final bigint,
	ADD COLUMN last_image_final bigint,
	ADD COLUMN end_exam_first_image bigint,
	ADD COLUMN end_exam_last_image bigint,
	ADD COLUMN send_duration bigint;

ALTER TABLE rad_exam_times
	ADD COLUMN cancelled timestamp with time zone;

ALTER TABLE rad_exams
        ADD COLUMN last_prelim_report_id bigint;

ALTER TABLE rad_pacs_metadata
	ADD COLUMN first_image timestamp with time zone,
	ADD COLUMN last_image timestamp with time zone;

ALTER TABLE reasons
        ADD COLUMN external_system_id bigint;

ALTER TABLE site_classes
	ADD COLUMN cms_facility_type_id bigint;

ALTER TABLE sites
        ADD COLUMN name text,
	ADD COLUMN cms_gpci_id bigint,
	ADD COLUMN cms_facility boolean,
	ADD COLUMN application_visible boolean DEFAULT true NOT NULL;

-- add primary keys

ALTER TABLE claim_transaction_cms_modifiers
       ADD CONSTRAINT claim_transaction_cms_modifier_id PRIMARY KEY (id);

ALTER TABLE claim_transaction_diagnoses
	ADD CONSTRAINT claim_transaction_diagnoses_id PRIMARY KEY (id);

ALTER TABLE claim_transactions
	ADD CONSTRAINT claim_transaction_id PRIMARY KEY (id);

ALTER TABLE claim_transaction_types
	ADD CONSTRAINT claim_transaction_type_id PRIMARY KEY (id);

ALTER TABLE claims
	ADD CONSTRAINT claim_id PRIMARY KEY (id);

ALTER TABLE cms_facility_types
	ADD CONSTRAINT cms_facility_type_id PRIMARY KEY (id);

ALTER TABLE cms_gpci
	ADD CONSTRAINT cms_gpci_id PRIMARY KEY (id);

ALTER TABLE cms_hcpcs_codes
	ADD CONSTRAINT cms_hcpcs_code_id PRIMARY KEY (id);

ALTER TABLE cms_hcpcs_code_revisions
	ADD CONSTRAINT cms_hcpcs_code_revision_id PRIMARY KEY (id);

ALTER TABLE cms_modifiers
	ADD CONSTRAINT cms_modifier_id PRIMARY KEY (id);

ALTER TABLE external_system_role_mappings
	ADD CONSTRAINT external_system_role_mappings_id PRIMARY KEY (id);

ALTER TABLE external_system_roles
	ADD CONSTRAINT external_system_roles_id PRIMARY KEY (id);

ALTER TABLE icd_code_revisions
	ADD CONSTRAINT icd_code_revision_id PRIMARY KEY (id);

ALTER TABLE icd_codes
	ADD CONSTRAINT icd_code_id PRIMARY KEY (id);

ALTER TABLE insurance_carrier_demographics
	ADD CONSTRAINT insurance_carrier_demographic_id PRIMARY KEY (id);

ALTER TABLE insurance_carrier_plans
	ADD CONSTRAINT insurance_carrier_plan_id PRIMARY KEY (id);

ALTER TABLE insurance_carriers
	ADD CONSTRAINT insurance_carrier_id PRIMARY KEY (id);

ALTER TABLE insurance_policies
	ADD CONSTRAINT insurance_policy_id PRIMARY KEY (id);

ALTER TABLE relationship_types
	ADD CONSTRAINT relationship_type_id PRIMARY KEY (id);

ALTER TABLE procedure_hcpcs_mappings
	ADD CONSTRAINT procedure_hcpcs_mapping_id PRIMARY KEY (id);

ALTER TABLE radonc_cases
	ADD CONSTRAINT radonc_cases_id PRIMARY KEY (id);

ALTER TABLE visit_diagnoses
	ADD CONSTRAINT visit_diagnoses_id PRIMARY KEY (id);

ALTER TABLE rad_exam_claims
	ADD CONSTRAINT rad_exam_claim_id PRIMARY KEY (id);

ALTER TABLE radonc_case_claims
	ADD CONSTRAINT radonc_case_claims_id PRIMARY KEY (id);

ALTER TABLE visit_insurance_policies
	ADD CONSTRAINT visit_insurance_policies_id PRIMARY KEY (id);

ALTER TABLE rad_exam_authorizations
	ADD CONSTRAINT rad_exam_authorization_id PRIMARY KEY (id);

ALTER TABLE radonc_case_authorizations
	ADD CONSTRAINT radonc_case_authorizations_id PRIMARY KEY (id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_id PRIMARY KEY (id);

ALTER TABLE insurance_carrier_plan_groupings
	ADD CONSTRAINT insurance_carrier_plan_grouping_id PRIMARY KEY (id);

-- stored procs for fact table

CREATE OR REPLACE FUNCTION array_sort (ANYARRAY)
RETURNS ANYARRAY LANGUAGE SQL
AS $$
SELECT ARRAY(
    SELECT $1[s.i] AS "foo"
    FROM
        generate_series(array_lower($1,1), array_upper($1,1)) AS s(i)
    ORDER BY foo
);
$$;

CREATE OR REPLACE FUNCTION fn_array_agg_notnull (
    a anyarray
    , b anyelement
) RETURNS ANYARRAY
AS $$
BEGIN

    IF b IS NOT NULL THEN
        a := array_append(a, b);
    END IF;

    RETURN a;

END;
$$ IMMUTABLE LANGUAGE 'plpgsql';

CREATE AGGREGATE array_agg_notnull(ANYELEMENT) (
    SFUNC = fn_array_agg_notnull,
    STYPE = ANYARRAY,
    INITCOND = '{}'
);

CREATE OR REPLACE FUNCTION percentile_cont(myarray real[], percentile real)
RETURNS real AS
$$

DECLARE
  ary_cnt INTEGER;
  row_num real;
  crn real;
  frn real;
  calc_result real;
  new_array real[];
BEGIN
  ary_cnt = array_length(myarray,1);
  row_num = 1 + ( percentile * ( ary_cnt - 1 ));
  new_array = array_sort(myarray);

  crn = ceiling(row_num);
  frn = floor(row_num);

  if crn = frn and frn = row_num then
    calc_result = new_array[row_num];
  else
    calc_result = (crn - row_num) * new_array[frn]
            + (row_num - frn) * new_array[crn];
  end if;

  RETURN calc_result;
END;
$$
  LANGUAGE 'plpgsql' IMMUTABLE;

-- temp grants :/

grant select on rad_exam_facts to productivity;
grant select on rad_exam_facts to quality;
