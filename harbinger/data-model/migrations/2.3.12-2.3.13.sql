-- old: 2.3.12 77ad9b5b90907d959299cfa7de447eca66765467
-- new: 2.3.13 6f48cfd61e7f261fd32512659d38184716718044

CREATE SEQUENCE data_manager_static_routes_id_seq
  START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE data_manager_static_routes (
	id bigint DEFAULT nextval('data_manager_static_routes_id_seq'::regclass) NOT NULL,
	incoming_host text NOT NULL,
	incoming_exchange text NOT NULL,
	incoming_routing_key_matcher text NOT NULL,
	outgoing_host text NOT NULL,
	outgoing_exchange text NOT NULL,
	outgoing_routing_key text NOT NULL,
	documentation text,
	updated_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE employee_specialty_mappings
	ADD COLUMN primary_specialty boolean DEFAULT false;

update configuration_variables set configuration_value='6f48cfd61e7f261fd32512659d38184716718044', updated_at=now() where configuration_key='data-model-commit-id';
