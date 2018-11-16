-- old: 2.3.11 55ba27d9cad71afccecca18f6526d8c6e2f501e4
-- new: 2.3.12 77ad9b5b90907d959299cfa7de447eca66765467

CREATE INDEX patients_name ON patients USING btree (name);

CREATE INDEX patients_lowered_name ON patients USING btree (lower(name));

CREATE INDEX patients_birthday ON patients USING btree (birthdate);

CREATE INDEX patients_gender ON patients USING btree (gender);

update configuration_variables set configuration_value='77ad9b5b90907d959299cfa7de447eca66765467', updated_at=now() where configuration_key='data-model-commit-id';
