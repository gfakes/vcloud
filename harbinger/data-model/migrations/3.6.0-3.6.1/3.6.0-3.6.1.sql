
ALTER TABLE orders
	ADD COLUMN current_status_id bigint,
	ADD COLUMN site_class_id bigint,
	ADD COLUMN procedure_id bigint,
	ADD COLUMN resource_id bigint,
	ADD COLUMN exam_priority_id bigint,
	ADD COLUMN order_arrival timestamp with time zone,
	ADD COLUMN appointment timestamp with time zone,
	ADD COLUMN appointment_duration bigint,
	ADD COLUMN ordering_provider_id bigint;

ALTER TABLE rad_exam_facts
	ADD COLUMN appointment_duration bigint;

ALTER TABLE rad_exam_times
	ADD COLUMN appointment_duration bigint;

ALTER TABLE orders
	ADD CONSTRAINT orders_current_status_id FOREIGN KEY (current_status_id) REFERENCES external_system_statuses(id);

ALTER TABLE orders
	ADD CONSTRAINT orders_exam_priorities_fk FOREIGN KEY (exam_priority_id) REFERENCES exam_priorities(id);

ALTER TABLE orders
	ADD CONSTRAINT orders_ordering_provider_fk FOREIGN KEY (ordering_provider_id) REFERENCES employees(id);

ALTER TABLE orders
	ADD CONSTRAINT orders_procedures_fk FOREIGN KEY (procedure_id) REFERENCES procedures(id);

ALTER TABLE orders
	ADD CONSTRAINT orders_resources_fk FOREIGN KEY (resource_id) REFERENCES resources(id);

ALTER TABLE orders
	ADD CONSTRAINT orders_site_class_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

CREATE INDEX order_appointment_idx ON orders USING btree (appointment);

CREATE INDEX order_exam_priority_fk_idx ON orders USING btree (exam_priority_id);

CREATE INDEX order_site_class_fk_idx ON orders USING btree (site_class_id);

CREATE INDEX orders_current_status_id_idx ON orders USING btree (current_status_id);

CREATE INDEX orders_order_arrival_idx ON orders USING btree (order_arrival);

CREATE INDEX orders_ordering_provider_id_idx ON orders USING btree (ordering_provider_id);

CREATE INDEX orders_procedure_id_idx ON orders USING btree (procedure_id);

CREATE INDEX orders_resource_id_idx ON orders USING btree (resource_id);

DELETE FROM configuration_variables WHERE configuration_key LIKE '%commit%'; -- cleanup legacy config vars

UPDATE public.configuration_variables SET configuration_value='3.6.1', updated_at=now() WHERE configuration_key='data-model-version';
