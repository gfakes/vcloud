alter default privileges in schema public revoke all privileges on sequences from roharbinger;
alter default privileges in schema documentation revoke all privileges on sequences from roharbinger;
alter default privileges in schema servicetools revoke all privileges on sequences from roharbinger;
alter default privileges in schema public revoke all privileges on tables from roharbinger;
alter default privileges in schema documentation revoke all privileges on tables from roharbinger;
alter default privileges in schema servicetools revoke all privileges on tables from roharbinger;
revoke all privileges on all sequences in schema public from roharbinger;
revoke all privileges on all sequences in schema documentation from roharbinger;
revoke all privileges on all sequences in schema servicetools from roharbinger;
revoke all privileges on all tables in schema public from roharbinger;
revoke all privileges on all tables in schema documentation from roharbinger;
revoke all privileges on all tables in schema servicetools from roharbinger;
revoke all privileges on schema public from roharbinger;
revoke all privileges on schema documentation from roharbinger;
revoke all privileges on schema servicetools from roharbinger;
revoke all privileges on database harbinger from roharbinger;
drop user if exists roharbinger;
create user roharbinger password 's4f3forSDKuse.';
grant connect on database harbinger to roharbinger;
grant usage on schema public to roharbinger;
grant usage on schema documentation to roharbinger;
grant usage on schema servicetools to roharbinger;
grant select on all tables in schema public to roharbinger;
grant select on all tables in schema documentation to roharbinger;
grant select on all tables in schema servicetools to roharbinger;
grant select on all sequences in schema public to roharbinger;
grant select on all sequences in schema documentation to roharbinger;
grant select on all sequences in schema servicetools to roharbinger;
alter default privileges in schema public grant select on tables to roharbinger;
alter default privileges in schema documentation grant select on tables to roharbinger;
alter default privileges in schema servicetools grant select on tables to roharbinger;
alter default privileges in schema public grant select on sequences to roharbinger;
alter default privileges in schema documentation grant select on sequences to roharbinger;
alter default privileges in schema servicetools grant select on sequences to roharbinger;
