drop database if exists harbinger;
drop user if exists harbinger;
create database harbinger;
create user harbinger password 'hcR3volution!';
grant all privileges on database harbinger to harbinger;
\c harbinger
grant all on all tables in schema public to harbinger;
