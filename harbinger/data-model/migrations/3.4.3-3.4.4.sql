ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_procedure_id_fk FOREIGN KEY (procedure_id) REFERENCES procedures(id);

UPDATE public.configuration_variables SET configuration_value='3.4.4', updated_at=now() WHERE configuration_key='data-model-version';
