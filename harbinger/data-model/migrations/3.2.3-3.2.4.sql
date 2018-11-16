-- old: 3.2.3 a2116cb83a7bd57778d9ec606cfcb8fd368cf134
-- new: 3.2.4 bd588cb8272a3404d73648edac2462861d7f6126

UPDATE public.configuration_variables SET configuration_value='bd588cb8272a3404d73648edac2462861d7f6126', updated_at=now() WHERE configuration_key='data-model-commit-id';
UPDATE public.configuration_variables SET configuration_value='3.2.4', updated_at=now() WHERE configuration_key='data-model-version';
