-- old: 2.3.27 357ae0b3a3f2c7b5244267f33ad67de4c493a9c4
-- new: 2.4.00 cc6abd2b4056a9c1b0202498caa2a050898a83d8

ALTER TABLE rad_reports
      ADD COLUMN report_impression text;
TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;
\i /servers/harbinger/harbinger/data-model/documentation.sql
UPDATE public.configuration_variables SET configuration_value='cc6abd2b4056a9c1b0202498caa2a050898a83d8', updated_at=now() WHERE configuration_key='data-model-commit-id';
