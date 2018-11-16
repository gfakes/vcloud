ALTER TABLE procedures
        ADD COLUMN pro_fee bigint DEFAULT 0 NOT NULL,
        ADD COLUMN tech_fee bigint DEFAULT 0 NOT NULL;

UPDATE public.configuration_variables SET configuration_value='3.3.1', updated_at=now() WHERE configuration_key='data-model-version';
