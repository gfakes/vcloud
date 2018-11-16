-- old: 2.3.26 a4e6ce0964557df9224a311d2d007083e704983c
-- new: 2.3.27 357ae0b3a3f2c7b5244267f33ad67de4c493a9c4

ALTER TABLE residents
	ALTER COLUMN pgy2 SET NOT NULL,
	ALTER COLUMN pgy3 SET NOT NULL,
	ALTER COLUMN pgy4 SET NOT NULL,
	ALTER COLUMN pgy5 SET NOT NULL;
UPDATE public.configuration_variables SET configuration_value='357ae0b3a3f2c7b5244267f33ad67de4c493a9c4', updated_at=now() WHERE configuration_key='data-model-commit-id';
