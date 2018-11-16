-- old: 3.0.02 4d6d806d0790ef85d83502c0fcffc0a883928f6d
-- new: 3.0.03 e33dcb418f77bff02daa87b970412e57e6e58a68

TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;
\i /servers/harbinger/harbinger/data-model/default-data/documentation.sql
UPDATE public.configuration_variables SET configuration_value='e33dcb418f77bff02daa87b970412e57e6e58a68', updated_at=now() WHERE configuration_key='data-model-commit-id';
