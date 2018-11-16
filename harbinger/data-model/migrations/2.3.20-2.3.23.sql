-- old: 2.3.20 9ced04914b20df287444c1be82727ba3d7fc5ac3
-- new: 2.3.23 542ccdad95d27ce75b128bcb68deba36e7fdd2b0

update site_classes set patient_type_id=(select id from patient_types where patient_type='O') where patient_type_id is null;
ALTER TABLE site_classes ALTER COLUMN patient_type_id SET NOT NULL;
TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;
\i /servers/harbinger/harbinger/data-model/documentation.sql
UPDATE public.configuration_variables SET configuration_value='542ccdad95d27ce75b128bcb68deba36e7fdd2b0', updated_at=now() WHERE configuration_key='data-model-commit-id';
