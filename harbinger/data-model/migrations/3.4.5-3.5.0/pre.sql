
ALTER TABLE procedures
	DROP CONSTRAINT sites_procedures_fk;

DROP INDEX procedure_dm_idx;

DROP INDEX procedure_site_idx;

DROP INDEX resource_dm_idx;

ALTER TABLE procedures
	DROP COLUMN cms_fee,
	ADD COLUMN external_system_id bigint;

ALTER TABLE resources
	ADD COLUMN external_system_id bigint;

ALTER TABLE procedures
	ADD CONSTRAINT sites_procedures_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

ALTER TABLE resources
	ADD CONSTRAINT resource_extsys_fk FOREIGN KEY (external_system_id) REFERENCES external_systems(id);

CREATE INDEX procedure_dm_idx ON procedures USING btree (code, external_system_id);

CREATE INDEX procedure_extsys_idx ON procedures USING btree (external_system_id);

CREATE INDEX resource_dm_idx ON resources USING btree (resource, external_system_id);

CREATE INDEX resource_extsys_idx ON resources USING btree (external_system_id);
