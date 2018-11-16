-- old: 3.2.1 6dc757128962f04e1a7f49fa58c3cff55cb132c4
-- new: 3.2.2 346c245f19c49f4f153709860c1f273ed607fddc

UPDATE public.configuration_variables SET configuration_value='346c245f19c49f4f153709860c1f273ed607fddc', updated_at=now() WHERE configuration_key='data-model-commit-id';
UPDATE public.configuration_variables SET configuration_value='3.2.2', updated_at=now() WHERE configuration_key='data-model-version';
