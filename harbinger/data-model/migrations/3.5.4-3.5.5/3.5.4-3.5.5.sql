ALTER TABLE rad_exam_facts
	ADD COLUMN exam_priority_id bigint,
	ADD COLUMN transport bigint,
	ADD COLUMN schedule_first_report bigint,
	ADD COLUMN schedule_first_prelim bigint,
	ADD COLUMN schedule_first_final bigint,
	ADD COLUMN order_first_report bigint,
	ADD COLUMN order_first_prelim bigint,
	ADD COLUMN order_first_final bigint;

ALTER TABLE rad_exam_metrics
	ADD COLUMN transport bigint,
	ADD COLUMN schedule_first_report bigint,
	ADD COLUMN schedule_first_prelim bigint,
	ADD COLUMN schedule_first_final bigint,
	ADD COLUMN order_first_report bigint,
	ADD COLUMN order_first_prelim bigint,
	ADD COLUMN order_first_final bigint;

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_delay_exam_priority_id_fk FOREIGN KEY (exam_priority_id) REFERENCES exam_priorities(id);

CREATE INDEX rad_exam_fact_exam_priority_id_idx ON rad_exam_facts USING btree (exam_priority_id);
