-- old: 3.1.03 fb4081b6042e445a16a4295ffafd2364b70129c7
-- new: 3.2.00 bcdbcf89c8a6f77904d1017d2eb65c8fe1b47760

DROP TABLE insurance_carrier_plan_grouping_associations;

DROP SEQUENCE insurance_carrier_plan_grouping_associations_id_seq;

ALTER TABLE insurance_carrier_plans
	ADD COLUMN insurance_carrier_plan_grouping_id bigint;

ALTER TABLE insurance_carriers
	ALTER COLUMN external_system_id SET NOT NULL;

ALTER TABLE insurance_carrier_plans
	ADD CONSTRAINT insurance_carrier_plan_grouping_fk FOREIGN KEY (insurance_carrier_plan_grouping_id) REFERENCES insurance_carrier_plan_groupings(id);

CREATE INDEX insurance_carrier_plan_grouping_idx ON insurance_carrier_plans USING btree (insurance_carrier_plan_grouping_id);

UPDATE public.configuration_variables SET configuration_value='bcdbcf89c8a6f77904d1017d2eb65c8fe1b47760', updated_at=now() WHERE configuration_key='data-model-commit-id';
