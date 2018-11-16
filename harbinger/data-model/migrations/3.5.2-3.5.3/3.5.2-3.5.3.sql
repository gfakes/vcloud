
ALTER TABLE rad_exam_facts
	ADD COLUMN begin_exam_epoch bigint;

CREATE INDEX rad_exam_fact_begin_exam_epoch_idx ON rad_exam_facts using btree (begin_exam_epoch);
