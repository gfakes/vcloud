ALTER TABLE procedures
	DROP COLUMN volume_countable;

UPDATE public.configuration_variables SET configuration_value='3.4.0', updated_at=now() WHERE configuration_key='data-model-version';
