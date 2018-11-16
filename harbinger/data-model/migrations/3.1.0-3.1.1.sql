-- old: 3.1.00 e2199a9fb7ad08a73f0ea5dbc474d111604c158b
-- new: 3.1.01 24bfa321db08f567723b7523802c5f13c726c542

DROP INDEX claims_service_performed;

DROP INDEX rad_exam_times_signing_idx;

ALTER TABLE claims
	DROP COLUMN service_performed;

ALTER TABLE rad_exam_facts
	ADD COLUMN order_first_image bigint,
	ADD COLUMN order_last_image bigint,
	ADD COLUMN first_image_prelim bigint,
	ADD COLUMN last_image_prelim bigint,
	ADD COLUMN first_image_final bigint,
	ADD COLUMN last_image_final bigint,
	ADD COLUMN end_exam_first_image bigint,
	ADD COLUMN end_exam_last_image bigint,
	ADD COLUMN send_duration bigint;

ALTER TABLE rad_exam_metrics
	ADD COLUMN order_first_image bigint,
	ADD COLUMN order_last_image bigint,
	ADD COLUMN first_image_prelim bigint,
	ADD COLUMN last_image_prelim bigint,
	ADD COLUMN first_image_final bigint,
	ADD COLUMN last_image_final bigint,
	ADD COLUMN end_exam_first_image bigint,
	ADD COLUMN end_exam_last_image bigint,
	ADD COLUMN send_duration bigint;

ALTER TABLE rad_exam_times
	ADD COLUMN cancelled timestamp with time zone;

ALTER TABLE rad_pacs_metadata
	ADD COLUMN first_image timestamp with time zone,
	ADD COLUMN last_image timestamp with time zone;

CREATE INDEX rad_exam_times_cancelled_idx ON rad_exam_times USING btree (cancelled);

TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;
\i /servers/harbinger/harbinger/data-model/default-data/documentation.sql
UPDATE public.configuration_variables SET configuration_value='24bfa321db08f567723b7523802c5f13c726c542', updated_at=now() WHERE configuration_key='data-model-commit-id';
