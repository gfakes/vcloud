-- old: 2.3.5  57d52b67dc71a500300a93ea3f9748fbaa1f5e0f
-- new: 2.3.11 55ba27d9cad71afccecca18f6526d8c6e2f501e4

SET search_path = public, pg_catalog;

ALTER TABLE people
  DROP CONSTRAINT clinicians_people_fk;

DROP INDEX data_manager_error_logs_data_manager_message_log_id_idx;

DROP INDEX dmml_prev_ml_id;

DROP INDEX fki_data_manager_routing_key_domain_id_fk;

DROP INDEX data_manager_warehouse_logs_affected_table_idx;

DROP INDEX data_manager_warehouse_logs_affected_table_row_id_idx;

DROP INDEX data_manager_warehouse_logs_data_manager_message_log_idx;

DROP INDEX status_idx;

alter sequence cpt_code_id_seq rename to cpt_codes_id_seq;

ALTER TABLE visits
	ALTER COLUMN site_id DROP NOT NULL;

CREATE INDEX dmel_dmml_idx ON data_manager_error_logs USING btree (data_manager_message_log_id);

CREATE INDEX dmml_pmi_id ON data_manager_message_logs USING btree (previous_message_id);

CREATE INDEX dmml_rkdi_fk ON data_manager_message_logs USING btree (data_manager_routing_key_domain_id);

CREATE INDEX dmml_hmb_fk ON data_manager_message_logs USING btree (handle_message_begin);

CREATE INDEX dmml_eli_fk ON data_manager_message_logs USING btree (data_manager_error_log_id);

CREATE INDEX dmwl_affected_table_idx ON data_manager_warehouse_logs USING btree (affected_table);

CREATE INDEX dmwl_affected_table_row_id_idx ON data_manager_warehouse_logs USING btree (affected_table_row_id);

CREATE INDEX dmwl_dmml_idx ON data_manager_warehouse_logs USING btree (data_manager_message_log_id);

CREATE INDEX exam_statuses_status_idx ON exam_statuses USING btree (status);

CREATE INDEX identifier_lowered_ident_idx ON identifiers USING btree (lower(identifier));

update configuration_variables set configuration_value='55ba27d9cad71afccecca18f6526d8c6e2f501e4', updated_at=now() where configuration_key='data-model-commit-id';
