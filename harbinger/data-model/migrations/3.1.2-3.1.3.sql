-- old: 3.1.02 5c00d65630671d0ee265ca29e485a196fb407ba1
-- new: 3.1.03 fb4081b6042e445a16a4295ffafd2364b70129c7

alter sequence rad_exam_department_id_seq rename to rad_exam_departments_id_seq;

INSERT INTO external_system_roles (system_role, description, updated_at) VALUES ('Authentication', 'Authentication and/or authorization', now());
INSERT INTO external_system_roles (system_role, description, updated_at) VALUES ('Credentialing', 'Provider identification and credentialing', now());

UPDATE public.configuration_variables SET configuration_value='fb4081b6042e445a16a4295ffafd2364b70129c7', updated_at=now() WHERE configuration_key='data-model-commit-id';
