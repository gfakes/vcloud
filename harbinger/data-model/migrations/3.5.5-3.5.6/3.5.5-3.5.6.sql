
ALTER TABLE rad_exam_facts
	ADD COLUMN scheduler_id bigint,
	ADD COLUMN send_delay bigint,
	ADD COLUMN acquisition_duration bigint,
	ADD COLUMN order_begin_acquisition bigint,
	ADD COLUMN order_end_acquisition bigint,
	ADD COLUMN acquisition_wait bigint,
	ADD COLUMN acquisition_delay bigint,
	ADD COLUMN acquisition_ready bigint,
	ADD COLUMN acquisition_first_report bigint,
	ADD COLUMN acquisition_first_prelim bigint,
	ADD COLUMN acquisition_first_final bigint;

ALTER TABLE rad_exam_metrics
	ADD COLUMN send_delay bigint,
	ADD COLUMN acquisition_duration bigint,
	ADD COLUMN order_begin_acquisition bigint,
	ADD COLUMN order_end_acquisition bigint,
	ADD COLUMN acquisition_wait bigint,
	ADD COLUMN acquisition_delay bigint,
	ADD COLUMN acquisition_ready bigint,
	ADD COLUMN acquisition_first_report bigint,
	ADD COLUMN acquisition_first_prelim bigint,
	ADD COLUMN acquisition_first_final bigint;

ALTER TABLE rad_pacs_metadata
	ADD COLUMN dicom_begin timestamp with time zone,
	ADD COLUMN dicom_end timestamp with time zone;

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_scheduler_id_fk FOREIGN KEY (scheduler_id) REFERENCES employees(id);

CREATE INDEX rad_exam_fact_scheduler_id_idx ON rad_exam_facts USING btree (scheduler_id);
