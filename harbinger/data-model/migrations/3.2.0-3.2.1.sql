-- old: 3.2.0 bcdbcf89c8a6f77904d1017d2eb65c8fe1b47760
-- new: 3.2.1 6dc757128962f04e1a7f49fa58c3cff55cb132c4

UPDATE public.configuration_variables SET configuration_value='6dc757128962f04e1a7f49fa58c3cff55cb132c4', updated_at=now() WHERE configuration_key='data-model-commit-id';
INSERT into configuration_variables (configuration_key,configuration_value,updated_at) values ('data-model-version','3.2.1',now());
