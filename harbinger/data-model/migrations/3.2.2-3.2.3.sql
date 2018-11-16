-- old: 3.2.2 346c245f19c49f4f153709860c1f273ed607fddc
-- new: 3.2.3 a2116cb83a7bd57778d9ec606cfcb8fd368cf134

UPDATE public.configuration_variables SET configuration_value='a2116cb83a7bd57778d9ec606cfcb8fd368cf134', updated_at=now() WHERE configuration_key='data-model-commit-id';
UPDATE public.configuration_variables SET configuration_value='3.2.3', updated_at=now() WHERE configuration_key='data-model-version';
