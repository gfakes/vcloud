
ALTER TABLE procedures
	DROP COLUMN site_id,
	ALTER COLUMN external_system_id SET NOT NULL;

ALTER TABLE resources
	ALTER COLUMN external_system_id SET NOT NULL;

UPDATE public.configuration_variables SET configuration_value='3.5.0', updated_at=now() WHERE configuration_key='data-model-version';
