-- old: 3.1.01 24bfa321db08f567723b7523802c5f13c726c542
-- new: 3.1.02 5c00d65630671d0ee265ca29e485a196fb407ba1

CREATE SEQUENCE insurance_carrier_plan_grouping_associations_id_seq
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

CREATE TABLE insurance_carrier_plan_grouping_associations (
	id bigint DEFAULT nextval('insurance_carrier_plan_grouping_associations_id_seq'::regclass) NOT NULL,
	insurance_carrier_plan_grouping_id bigint NOT NULL,
	insurance_carrier_plan_id bigint NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE insurance_carrier_plan_groupings (
	id bigint DEFAULT nextval('insurance_carrier_plan_groupings_id_seq'::regclass) NOT NULL,
	grouping_name text NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE insurance_carriers
	ADD COLUMN external_system_id bigint;

ALTER TABLE insurance_carrier_plan_grouping_associations
	ADD CONSTRAINT insurance_carrier_plan_grouping_association_id PRIMARY KEY (id);

ALTER TABLE insurance_carrier_plan_groupings
	ADD CONSTRAINT insurance_carrier_plan_grouping_id PRIMARY KEY (id);

ALTER TABLE insurance_carrier_plan_grouping_associations
	ADD CONSTRAINT insurance_carrier_plan_grouping_grouping_fk FOREIGN KEY (insurance_carrier_plan_id) REFERENCES insurance_carrier_plan_groupings(id);

ALTER TABLE insurance_carrier_plan_grouping_associations
	ADD CONSTRAINT insurance_carrier_plan_grouping_plan_fk FOREIGN KEY (insurance_carrier_plan_grouping_id) REFERENCES insurance_carrier_plans(id);

ALTER TABLE insurance_carriers
	ADD CONSTRAINT insurance_carrier_external_system_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

CREATE INDEX insurance_carrier_plan_grouping_associations_grouping_idx ON insurance_carrier_plan_grouping_associations USING btree (insurance_carrier_plan_grouping_id);

CREATE INDEX insurance_carrier_plan_grouping_associations_plan_idx ON insurance_carrier_plan_grouping_associations USING btree (insurance_carrier_plan_id);

CREATE INDEX insurance_carrier_plan_grouping_name_idx ON insurance_carrier_plan_groupings USING btree (grouping_name);

CREATE INDEX insurance_carriers_extsys_idx ON insurance_carriers USING btree (external_system_id);

UPDATE public.configuration_variables SET configuration_value='5c00d65630671d0ee265ca29e485a196fb407ba1', updated_at=now() WHERE configuration_key='data-model-commit-id';
