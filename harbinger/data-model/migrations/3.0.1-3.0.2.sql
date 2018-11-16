-- old: 3.0.01 791c35809c0f3eee5bae46b8b0539d3b1ad51296
-- new: 3.0.02 4d6d806d0790ef85d83502c0fcffc0a883928f6d

INSERT INTO documentation.message_element_mappings (id, message_type_id, data_element_id, mandatory, comments, updated_at) VALUES (4717, 22, 169, false, NULL, now());
UPDATE public.configuration_variables SET configuration_value='4d6d806d0790ef85d83502c0fcffc0a883928f6d', updated_at=now() WHERE configuration_key='data-model-commit-id';
