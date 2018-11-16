-- old: 2.3.13 6f48cfd61e7f261fd32512659d38184716718044
-- new: 2.3.17 a32297c723c2f25bc123b77a8eb8b5d111b6834d

INSERT INTO clinical_roles (clinical_role, department_id, updated_at) VALUES ('ai-staff', 1, now());
INSERT INTO clinical_roles (clinical_role, department_id, updated_at) VALUES ('researcher', 1, now());
UPDATE configuration_variables SET configuration_value='a32297c723c2f25bc123b77a8eb8b5d111b6834d', updated_at=now() WHERE configuration_key='data-model-commit-id';
