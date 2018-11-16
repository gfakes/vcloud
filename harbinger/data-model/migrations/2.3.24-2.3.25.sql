-- old: 2.3.24 19a1a0c81ab4adea7e8bc3981e23f28872776358
-- new: 2.3.25 b326983d4d647ba3599d17369df881c89b1540f2

delete from trip_statuses where status='cancel';
TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;
\i /servers/harbinger/harbinger/data-model/documentation.sql
UPDATE public.configuration_variables SET configuration_value='b326983d4d647ba3599d17369df881c89b1540f2', updated_at=now() WHERE configuration_key='data-model-commit-id';
