
CREATE SCHEMA servicetools;

SET search_path = servicetools, pg_catalog;

CREATE SEQUENCE servicetools_bulk_imports_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE servicetools_worklist_whitelist_item_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE servicetools_bulk_imports (
	id bigint DEFAULT nextval('servicetools_bulk_imports_id_seq'::regclass) NOT NULL,
	employee_id bigint NOT NULL,
	file_info text,
	meta_info text,
	created_at timestamp with time zone DEFAULT now() NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE servicetools_worklist_whitelist_items (
	id bigint DEFAULT nextval('servicetools_worklist_whitelist_item_id_seq'::regclass) NOT NULL,
	worklist_title text NOT NULL,
	table_id bigint NOT NULL,
	created_at timestamp with time zone DEFAULT now() NOT NULL,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE servicetools_bulk_imports
	ADD CONSTRAINT servicetools_bulk_import_id PRIMARY KEY (id);

ALTER TABLE servicetools_worklist_whitelist_items
	ADD CONSTRAINT servicetools_worklist_whitelist_item_id PRIMARY KEY (id);

CREATE INDEX servicetools_worklist_whitelist_items_table_idx ON servicetools_worklist_whitelist_items USING btree (table_id);

CREATE INDEX servicetools_worklist_whitelist_items_worklist_title_idx ON servicetools_worklist_whitelist_items USING btree (worklist_title);
