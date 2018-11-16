-- old: 3.0.03 e33dcb418f77bff02daa87b970412e57e6e58a68
-- new: 3.0.04 065a1c8879e5635149456771710c7c6ced3376e3

INSERT INTO universal_event_types (event_type, description, updated_at) VALUES ('transfer in', 'money being transferred in', now());
INSERT INTO universal_event_types (event_type, description, updated_at) VALUES ('transfer out', 'money being transferred out', now());
UPDATE public.configuration_variables SET configuration_value='065a1c8879e5635149456771710c7c6ced3376e3', updated_at=now() WHERE configuration_key='data-model-commit-id';
