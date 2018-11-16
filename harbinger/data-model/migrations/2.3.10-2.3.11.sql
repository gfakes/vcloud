-- old: 2.3.10 47d14db61745844c4c4f4b3b47e54cee4e7b71d6
-- new: 2.3.11 55ba27d9cad71afccecca18f6526d8c6e2f501e4

alter table people drop constraint clinicians_people_fk;
update configuration_variables set configuration_value='55ba27d9cad71afccecca18f6526d8c6e2f501e4', updated_at=now() where configuration_key='data-model-commit-id';
