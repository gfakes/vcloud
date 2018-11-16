SELECT SETVAL('app_tracking_id_seq', (SELECT NEXTVAL('claim_transaction_cms_modifiers_id_seq')));

ALTER TABLE app_tracking
      ALTER COLUMN id SET DEFAULT nextval('app_tracking_id_seq'::regclass);

SELECT SETVAL('claim_transaction_cms_modifiers_id_seq', COALESCE((SELECT MAX(id)+1 FROM claim_transaction_cms_modifiers), 1));

ALTER TABLE app_tracking
	ADD COLUMN browser_ip text;

ALTER TABLE site_classes
	ALTER COLUMN site_id SET NOT NULL;

UPDATE public.configuration_variables SET configuration_value='3.4.2', updated_at=now() WHERE configuration_key='data-model-version';
