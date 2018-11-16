CREATE TABLE app_tracking_00000 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00000 ADD CONSTRAINT at_00000_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00000 ADD CONSTRAINT at_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX at_00000_an_idx ON app_tracking_00000 USING btree (application_name);
CREATE INDEX at_00000_ca_idx ON app_tracking_00000 USING btree (created_at);
CREATE INDEX at_00000_ei_idx ON app_tracking_00000 USING btree (employee_id);
CREATE INDEX at_00000_ru_idx ON app_tracking_00000 USING btree (relative_url);
CREATE INDEX at_00000_u_idx ON app_tracking_00000 USING btree (username);
CREATE RULE  app_tracking_00000 AS ON
INSERT TO app_tracking WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO app_tracking_00000 VALUES (NEW.*);

CREATE TABLE app_tracking_00001 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00001 ADD CONSTRAINT at_00001_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00001 ADD CONSTRAINT at_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX at_00001_an_idx ON app_tracking_00001 USING btree (application_name);
CREATE INDEX at_00001_ca_idx ON app_tracking_00001 USING btree (created_at);
CREATE INDEX at_00001_ei_idx ON app_tracking_00001 USING btree (employee_id);
CREATE INDEX at_00001_ru_idx ON app_tracking_00001 USING btree (relative_url);
CREATE INDEX at_00001_u_idx ON app_tracking_00001 USING btree (username);
CREATE RULE  app_tracking_00001 AS ON
INSERT TO app_tracking WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO app_tracking_00001 VALUES (NEW.*);

CREATE TABLE app_tracking_00002 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00002 ADD CONSTRAINT at_00002_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00002 ADD CONSTRAINT at_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX at_00002_an_idx ON app_tracking_00002 USING btree (application_name);
CREATE INDEX at_00002_ca_idx ON app_tracking_00002 USING btree (created_at);
CREATE INDEX at_00002_ei_idx ON app_tracking_00002 USING btree (employee_id);
CREATE INDEX at_00002_ru_idx ON app_tracking_00002 USING btree (relative_url);
CREATE INDEX at_00002_u_idx ON app_tracking_00002 USING btree (username);
CREATE RULE  app_tracking_00002 AS ON
INSERT TO app_tracking WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO app_tracking_00002 VALUES (NEW.*);

CREATE TABLE app_tracking_00003 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00003 ADD CONSTRAINT at_00003_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00003 ADD CONSTRAINT at_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX at_00003_an_idx ON app_tracking_00003 USING btree (application_name);
CREATE INDEX at_00003_ca_idx ON app_tracking_00003 USING btree (created_at);
CREATE INDEX at_00003_ei_idx ON app_tracking_00003 USING btree (employee_id);
CREATE INDEX at_00003_ru_idx ON app_tracking_00003 USING btree (relative_url);
CREATE INDEX at_00003_u_idx ON app_tracking_00003 USING btree (username);
CREATE RULE  app_tracking_00003 AS ON
INSERT TO app_tracking WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO app_tracking_00003 VALUES (NEW.*);

CREATE TABLE app_tracking_00004 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00004 ADD CONSTRAINT at_00004_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00004 ADD CONSTRAINT at_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX at_00004_an_idx ON app_tracking_00004 USING btree (application_name);
CREATE INDEX at_00004_ca_idx ON app_tracking_00004 USING btree (created_at);
CREATE INDEX at_00004_ei_idx ON app_tracking_00004 USING btree (employee_id);
CREATE INDEX at_00004_ru_idx ON app_tracking_00004 USING btree (relative_url);
CREATE INDEX at_00004_u_idx ON app_tracking_00004 USING btree (username);
CREATE RULE  app_tracking_00004 AS ON
INSERT TO app_tracking WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO app_tracking_00004 VALUES (NEW.*);

CREATE TABLE app_tracking_00005 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00005 ADD CONSTRAINT at_00005_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00005 ADD CONSTRAINT at_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX at_00005_an_idx ON app_tracking_00005 USING btree (application_name);
CREATE INDEX at_00005_ca_idx ON app_tracking_00005 USING btree (created_at);
CREATE INDEX at_00005_ei_idx ON app_tracking_00005 USING btree (employee_id);
CREATE INDEX at_00005_ru_idx ON app_tracking_00005 USING btree (relative_url);
CREATE INDEX at_00005_u_idx ON app_tracking_00005 USING btree (username);
CREATE RULE  app_tracking_00005 AS ON
INSERT TO app_tracking WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO app_tracking_00005 VALUES (NEW.*);

CREATE TABLE app_tracking_00006 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00006 ADD CONSTRAINT at_00006_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00006 ADD CONSTRAINT at_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX at_00006_an_idx ON app_tracking_00006 USING btree (application_name);
CREATE INDEX at_00006_ca_idx ON app_tracking_00006 USING btree (created_at);
CREATE INDEX at_00006_ei_idx ON app_tracking_00006 USING btree (employee_id);
CREATE INDEX at_00006_ru_idx ON app_tracking_00006 USING btree (relative_url);
CREATE INDEX at_00006_u_idx ON app_tracking_00006 USING btree (username);
CREATE RULE  app_tracking_00006 AS ON
INSERT TO app_tracking WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO app_tracking_00006 VALUES (NEW.*);

CREATE TABLE app_tracking_00007 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00007 ADD CONSTRAINT at_00007_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00007 ADD CONSTRAINT at_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX at_00007_an_idx ON app_tracking_00007 USING btree (application_name);
CREATE INDEX at_00007_ca_idx ON app_tracking_00007 USING btree (created_at);
CREATE INDEX at_00007_ei_idx ON app_tracking_00007 USING btree (employee_id);
CREATE INDEX at_00007_ru_idx ON app_tracking_00007 USING btree (relative_url);
CREATE INDEX at_00007_u_idx ON app_tracking_00007 USING btree (username);
CREATE RULE  app_tracking_00007 AS ON
INSERT TO app_tracking WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO app_tracking_00007 VALUES (NEW.*);

CREATE TABLE app_tracking_00008 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00008 ADD CONSTRAINT at_00008_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00008 ADD CONSTRAINT at_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX at_00008_an_idx ON app_tracking_00008 USING btree (application_name);
CREATE INDEX at_00008_ca_idx ON app_tracking_00008 USING btree (created_at);
CREATE INDEX at_00008_ei_idx ON app_tracking_00008 USING btree (employee_id);
CREATE INDEX at_00008_ru_idx ON app_tracking_00008 USING btree (relative_url);
CREATE INDEX at_00008_u_idx ON app_tracking_00008 USING btree (username);
CREATE RULE  app_tracking_00008 AS ON
INSERT TO app_tracking WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO app_tracking_00008 VALUES (NEW.*);

CREATE TABLE app_tracking_00009 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00009 ADD CONSTRAINT at_00009_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00009 ADD CONSTRAINT at_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX at_00009_an_idx ON app_tracking_00009 USING btree (application_name);
CREATE INDEX at_00009_ca_idx ON app_tracking_00009 USING btree (created_at);
CREATE INDEX at_00009_ei_idx ON app_tracking_00009 USING btree (employee_id);
CREATE INDEX at_00009_ru_idx ON app_tracking_00009 USING btree (relative_url);
CREATE INDEX at_00009_u_idx ON app_tracking_00009 USING btree (username);
CREATE RULE  app_tracking_00009 AS ON
INSERT TO app_tracking WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO app_tracking_00009 VALUES (NEW.*);

CREATE TABLE app_tracking_00010 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00010 ADD CONSTRAINT at_00010_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00010 ADD CONSTRAINT at_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX at_00010_an_idx ON app_tracking_00010 USING btree (application_name);
CREATE INDEX at_00010_ca_idx ON app_tracking_00010 USING btree (created_at);
CREATE INDEX at_00010_ei_idx ON app_tracking_00010 USING btree (employee_id);
CREATE INDEX at_00010_ru_idx ON app_tracking_00010 USING btree (relative_url);
CREATE INDEX at_00010_u_idx ON app_tracking_00010 USING btree (username);
CREATE RULE  app_tracking_00010 AS ON
INSERT TO app_tracking WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO app_tracking_00010 VALUES (NEW.*);

CREATE TABLE app_tracking_00011 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00011 ADD CONSTRAINT at_00011_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00011 ADD CONSTRAINT at_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX at_00011_an_idx ON app_tracking_00011 USING btree (application_name);
CREATE INDEX at_00011_ca_idx ON app_tracking_00011 USING btree (created_at);
CREATE INDEX at_00011_ei_idx ON app_tracking_00011 USING btree (employee_id);
CREATE INDEX at_00011_ru_idx ON app_tracking_00011 USING btree (relative_url);
CREATE INDEX at_00011_u_idx ON app_tracking_00011 USING btree (username);
CREATE RULE  app_tracking_00011 AS ON
INSERT TO app_tracking WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO app_tracking_00011 VALUES (NEW.*);

CREATE TABLE app_tracking_00012 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00012 ADD CONSTRAINT at_00012_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00012 ADD CONSTRAINT at_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX at_00012_an_idx ON app_tracking_00012 USING btree (application_name);
CREATE INDEX at_00012_ca_idx ON app_tracking_00012 USING btree (created_at);
CREATE INDEX at_00012_ei_idx ON app_tracking_00012 USING btree (employee_id);
CREATE INDEX at_00012_ru_idx ON app_tracking_00012 USING btree (relative_url);
CREATE INDEX at_00012_u_idx ON app_tracking_00012 USING btree (username);
CREATE RULE  app_tracking_00012 AS ON
INSERT TO app_tracking WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO app_tracking_00012 VALUES (NEW.*);

CREATE TABLE app_tracking_00013 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00013 ADD CONSTRAINT at_00013_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00013 ADD CONSTRAINT at_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX at_00013_an_idx ON app_tracking_00013 USING btree (application_name);
CREATE INDEX at_00013_ca_idx ON app_tracking_00013 USING btree (created_at);
CREATE INDEX at_00013_ei_idx ON app_tracking_00013 USING btree (employee_id);
CREATE INDEX at_00013_ru_idx ON app_tracking_00013 USING btree (relative_url);
CREATE INDEX at_00013_u_idx ON app_tracking_00013 USING btree (username);
CREATE RULE  app_tracking_00013 AS ON
INSERT TO app_tracking WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO app_tracking_00013 VALUES (NEW.*);

CREATE TABLE app_tracking_00014 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00014 ADD CONSTRAINT at_00014_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00014 ADD CONSTRAINT at_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX at_00014_an_idx ON app_tracking_00014 USING btree (application_name);
CREATE INDEX at_00014_ca_idx ON app_tracking_00014 USING btree (created_at);
CREATE INDEX at_00014_ei_idx ON app_tracking_00014 USING btree (employee_id);
CREATE INDEX at_00014_ru_idx ON app_tracking_00014 USING btree (relative_url);
CREATE INDEX at_00014_u_idx ON app_tracking_00014 USING btree (username);
CREATE RULE  app_tracking_00014 AS ON
INSERT TO app_tracking WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO app_tracking_00014 VALUES (NEW.*);

CREATE TABLE app_tracking_00015 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00015 ADD CONSTRAINT at_00015_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00015 ADD CONSTRAINT at_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX at_00015_an_idx ON app_tracking_00015 USING btree (application_name);
CREATE INDEX at_00015_ca_idx ON app_tracking_00015 USING btree (created_at);
CREATE INDEX at_00015_ei_idx ON app_tracking_00015 USING btree (employee_id);
CREATE INDEX at_00015_ru_idx ON app_tracking_00015 USING btree (relative_url);
CREATE INDEX at_00015_u_idx ON app_tracking_00015 USING btree (username);
CREATE RULE  app_tracking_00015 AS ON
INSERT TO app_tracking WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO app_tracking_00015 VALUES (NEW.*);

CREATE TABLE app_tracking_00016 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00016 ADD CONSTRAINT at_00016_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00016 ADD CONSTRAINT at_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX at_00016_an_idx ON app_tracking_00016 USING btree (application_name);
CREATE INDEX at_00016_ca_idx ON app_tracking_00016 USING btree (created_at);
CREATE INDEX at_00016_ei_idx ON app_tracking_00016 USING btree (employee_id);
CREATE INDEX at_00016_ru_idx ON app_tracking_00016 USING btree (relative_url);
CREATE INDEX at_00016_u_idx ON app_tracking_00016 USING btree (username);
CREATE RULE  app_tracking_00016 AS ON
INSERT TO app_tracking WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO app_tracking_00016 VALUES (NEW.*);

CREATE TABLE app_tracking_00017 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00017 ADD CONSTRAINT at_00017_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00017 ADD CONSTRAINT at_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX at_00017_an_idx ON app_tracking_00017 USING btree (application_name);
CREATE INDEX at_00017_ca_idx ON app_tracking_00017 USING btree (created_at);
CREATE INDEX at_00017_ei_idx ON app_tracking_00017 USING btree (employee_id);
CREATE INDEX at_00017_ru_idx ON app_tracking_00017 USING btree (relative_url);
CREATE INDEX at_00017_u_idx ON app_tracking_00017 USING btree (username);
CREATE RULE  app_tracking_00017 AS ON
INSERT TO app_tracking WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO app_tracking_00017 VALUES (NEW.*);

CREATE TABLE app_tracking_00018 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00018 ADD CONSTRAINT at_00018_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00018 ADD CONSTRAINT at_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX at_00018_an_idx ON app_tracking_00018 USING btree (application_name);
CREATE INDEX at_00018_ca_idx ON app_tracking_00018 USING btree (created_at);
CREATE INDEX at_00018_ei_idx ON app_tracking_00018 USING btree (employee_id);
CREATE INDEX at_00018_ru_idx ON app_tracking_00018 USING btree (relative_url);
CREATE INDEX at_00018_u_idx ON app_tracking_00018 USING btree (username);
CREATE RULE  app_tracking_00018 AS ON
INSERT TO app_tracking WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO app_tracking_00018 VALUES (NEW.*);

CREATE TABLE app_tracking_00019 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00019 ADD CONSTRAINT at_00019_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00019 ADD CONSTRAINT at_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX at_00019_an_idx ON app_tracking_00019 USING btree (application_name);
CREATE INDEX at_00019_ca_idx ON app_tracking_00019 USING btree (created_at);
CREATE INDEX at_00019_ei_idx ON app_tracking_00019 USING btree (employee_id);
CREATE INDEX at_00019_ru_idx ON app_tracking_00019 USING btree (relative_url);
CREATE INDEX at_00019_u_idx ON app_tracking_00019 USING btree (username);
CREATE RULE  app_tracking_00019 AS ON
INSERT TO app_tracking WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO app_tracking_00019 VALUES (NEW.*);

CREATE TABLE app_tracking_00020 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00020 ADD CONSTRAINT at_00020_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00020 ADD CONSTRAINT at_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX at_00020_an_idx ON app_tracking_00020 USING btree (application_name);
CREATE INDEX at_00020_ca_idx ON app_tracking_00020 USING btree (created_at);
CREATE INDEX at_00020_ei_idx ON app_tracking_00020 USING btree (employee_id);
CREATE INDEX at_00020_ru_idx ON app_tracking_00020 USING btree (relative_url);
CREATE INDEX at_00020_u_idx ON app_tracking_00020 USING btree (username);
CREATE RULE  app_tracking_00020 AS ON
INSERT TO app_tracking WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO app_tracking_00020 VALUES (NEW.*);

CREATE TABLE app_tracking_00021 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00021 ADD CONSTRAINT at_00021_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00021 ADD CONSTRAINT at_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX at_00021_an_idx ON app_tracking_00021 USING btree (application_name);
CREATE INDEX at_00021_ca_idx ON app_tracking_00021 USING btree (created_at);
CREATE INDEX at_00021_ei_idx ON app_tracking_00021 USING btree (employee_id);
CREATE INDEX at_00021_ru_idx ON app_tracking_00021 USING btree (relative_url);
CREATE INDEX at_00021_u_idx ON app_tracking_00021 USING btree (username);
CREATE RULE  app_tracking_00021 AS ON
INSERT TO app_tracking WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO app_tracking_00021 VALUES (NEW.*);

CREATE TABLE app_tracking_00022 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00022 ADD CONSTRAINT at_00022_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00022 ADD CONSTRAINT at_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX at_00022_an_idx ON app_tracking_00022 USING btree (application_name);
CREATE INDEX at_00022_ca_idx ON app_tracking_00022 USING btree (created_at);
CREATE INDEX at_00022_ei_idx ON app_tracking_00022 USING btree (employee_id);
CREATE INDEX at_00022_ru_idx ON app_tracking_00022 USING btree (relative_url);
CREATE INDEX at_00022_u_idx ON app_tracking_00022 USING btree (username);
CREATE RULE  app_tracking_00022 AS ON
INSERT TO app_tracking WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO app_tracking_00022 VALUES (NEW.*);

CREATE TABLE app_tracking_00023 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00023 ADD CONSTRAINT at_00023_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00023 ADD CONSTRAINT at_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX at_00023_an_idx ON app_tracking_00023 USING btree (application_name);
CREATE INDEX at_00023_ca_idx ON app_tracking_00023 USING btree (created_at);
CREATE INDEX at_00023_ei_idx ON app_tracking_00023 USING btree (employee_id);
CREATE INDEX at_00023_ru_idx ON app_tracking_00023 USING btree (relative_url);
CREATE INDEX at_00023_u_idx ON app_tracking_00023 USING btree (username);
CREATE RULE  app_tracking_00023 AS ON
INSERT TO app_tracking WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO app_tracking_00023 VALUES (NEW.*);

CREATE TABLE app_tracking_00024 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00024 ADD CONSTRAINT at_00024_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00024 ADD CONSTRAINT at_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX at_00024_an_idx ON app_tracking_00024 USING btree (application_name);
CREATE INDEX at_00024_ca_idx ON app_tracking_00024 USING btree (created_at);
CREATE INDEX at_00024_ei_idx ON app_tracking_00024 USING btree (employee_id);
CREATE INDEX at_00024_ru_idx ON app_tracking_00024 USING btree (relative_url);
CREATE INDEX at_00024_u_idx ON app_tracking_00024 USING btree (username);
CREATE RULE  app_tracking_00024 AS ON
INSERT TO app_tracking WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO app_tracking_00024 VALUES (NEW.*);

CREATE TABLE app_tracking_00025 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00025 ADD CONSTRAINT at_00025_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00025 ADD CONSTRAINT at_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX at_00025_an_idx ON app_tracking_00025 USING btree (application_name);
CREATE INDEX at_00025_ca_idx ON app_tracking_00025 USING btree (created_at);
CREATE INDEX at_00025_ei_idx ON app_tracking_00025 USING btree (employee_id);
CREATE INDEX at_00025_ru_idx ON app_tracking_00025 USING btree (relative_url);
CREATE INDEX at_00025_u_idx ON app_tracking_00025 USING btree (username);
CREATE RULE  app_tracking_00025 AS ON
INSERT TO app_tracking WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO app_tracking_00025 VALUES (NEW.*);

CREATE TABLE app_tracking_00026 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00026 ADD CONSTRAINT at_00026_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00026 ADD CONSTRAINT at_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX at_00026_an_idx ON app_tracking_00026 USING btree (application_name);
CREATE INDEX at_00026_ca_idx ON app_tracking_00026 USING btree (created_at);
CREATE INDEX at_00026_ei_idx ON app_tracking_00026 USING btree (employee_id);
CREATE INDEX at_00026_ru_idx ON app_tracking_00026 USING btree (relative_url);
CREATE INDEX at_00026_u_idx ON app_tracking_00026 USING btree (username);
CREATE RULE  app_tracking_00026 AS ON
INSERT TO app_tracking WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO app_tracking_00026 VALUES (NEW.*);

CREATE TABLE app_tracking_00027 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00027 ADD CONSTRAINT at_00027_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00027 ADD CONSTRAINT at_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX at_00027_an_idx ON app_tracking_00027 USING btree (application_name);
CREATE INDEX at_00027_ca_idx ON app_tracking_00027 USING btree (created_at);
CREATE INDEX at_00027_ei_idx ON app_tracking_00027 USING btree (employee_id);
CREATE INDEX at_00027_ru_idx ON app_tracking_00027 USING btree (relative_url);
CREATE INDEX at_00027_u_idx ON app_tracking_00027 USING btree (username);
CREATE RULE  app_tracking_00027 AS ON
INSERT TO app_tracking WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO app_tracking_00027 VALUES (NEW.*);

CREATE TABLE app_tracking_00028 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00028 ADD CONSTRAINT at_00028_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00028 ADD CONSTRAINT at_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX at_00028_an_idx ON app_tracking_00028 USING btree (application_name);
CREATE INDEX at_00028_ca_idx ON app_tracking_00028 USING btree (created_at);
CREATE INDEX at_00028_ei_idx ON app_tracking_00028 USING btree (employee_id);
CREATE INDEX at_00028_ru_idx ON app_tracking_00028 USING btree (relative_url);
CREATE INDEX at_00028_u_idx ON app_tracking_00028 USING btree (username);
CREATE RULE  app_tracking_00028 AS ON
INSERT TO app_tracking WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO app_tracking_00028 VALUES (NEW.*);

CREATE TABLE app_tracking_00029 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00029 ADD CONSTRAINT at_00029_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00029 ADD CONSTRAINT at_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX at_00029_an_idx ON app_tracking_00029 USING btree (application_name);
CREATE INDEX at_00029_ca_idx ON app_tracking_00029 USING btree (created_at);
CREATE INDEX at_00029_ei_idx ON app_tracking_00029 USING btree (employee_id);
CREATE INDEX at_00029_ru_idx ON app_tracking_00029 USING btree (relative_url);
CREATE INDEX at_00029_u_idx ON app_tracking_00029 USING btree (username);
CREATE RULE  app_tracking_00029 AS ON
INSERT TO app_tracking WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO app_tracking_00029 VALUES (NEW.*);

CREATE TABLE app_tracking_00030 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00030 ADD CONSTRAINT at_00030_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00030 ADD CONSTRAINT at_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX at_00030_an_idx ON app_tracking_00030 USING btree (application_name);
CREATE INDEX at_00030_ca_idx ON app_tracking_00030 USING btree (created_at);
CREATE INDEX at_00030_ei_idx ON app_tracking_00030 USING btree (employee_id);
CREATE INDEX at_00030_ru_idx ON app_tracking_00030 USING btree (relative_url);
CREATE INDEX at_00030_u_idx ON app_tracking_00030 USING btree (username);
CREATE RULE  app_tracking_00030 AS ON
INSERT TO app_tracking WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO app_tracking_00030 VALUES (NEW.*);

CREATE TABLE app_tracking_00031 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00031 ADD CONSTRAINT at_00031_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00031 ADD CONSTRAINT at_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX at_00031_an_idx ON app_tracking_00031 USING btree (application_name);
CREATE INDEX at_00031_ca_idx ON app_tracking_00031 USING btree (created_at);
CREATE INDEX at_00031_ei_idx ON app_tracking_00031 USING btree (employee_id);
CREATE INDEX at_00031_ru_idx ON app_tracking_00031 USING btree (relative_url);
CREATE INDEX at_00031_u_idx ON app_tracking_00031 USING btree (username);
CREATE RULE  app_tracking_00031 AS ON
INSERT TO app_tracking WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO app_tracking_00031 VALUES (NEW.*);

CREATE TABLE app_tracking_00032 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00032 ADD CONSTRAINT at_00032_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00032 ADD CONSTRAINT at_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX at_00032_an_idx ON app_tracking_00032 USING btree (application_name);
CREATE INDEX at_00032_ca_idx ON app_tracking_00032 USING btree (created_at);
CREATE INDEX at_00032_ei_idx ON app_tracking_00032 USING btree (employee_id);
CREATE INDEX at_00032_ru_idx ON app_tracking_00032 USING btree (relative_url);
CREATE INDEX at_00032_u_idx ON app_tracking_00032 USING btree (username);
CREATE RULE  app_tracking_00032 AS ON
INSERT TO app_tracking WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO app_tracking_00032 VALUES (NEW.*);

CREATE TABLE app_tracking_00033 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00033 ADD CONSTRAINT at_00033_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00033 ADD CONSTRAINT at_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX at_00033_an_idx ON app_tracking_00033 USING btree (application_name);
CREATE INDEX at_00033_ca_idx ON app_tracking_00033 USING btree (created_at);
CREATE INDEX at_00033_ei_idx ON app_tracking_00033 USING btree (employee_id);
CREATE INDEX at_00033_ru_idx ON app_tracking_00033 USING btree (relative_url);
CREATE INDEX at_00033_u_idx ON app_tracking_00033 USING btree (username);
CREATE RULE  app_tracking_00033 AS ON
INSERT TO app_tracking WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO app_tracking_00033 VALUES (NEW.*);

CREATE TABLE app_tracking_00034 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00034 ADD CONSTRAINT at_00034_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00034 ADD CONSTRAINT at_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX at_00034_an_idx ON app_tracking_00034 USING btree (application_name);
CREATE INDEX at_00034_ca_idx ON app_tracking_00034 USING btree (created_at);
CREATE INDEX at_00034_ei_idx ON app_tracking_00034 USING btree (employee_id);
CREATE INDEX at_00034_ru_idx ON app_tracking_00034 USING btree (relative_url);
CREATE INDEX at_00034_u_idx ON app_tracking_00034 USING btree (username);
CREATE RULE  app_tracking_00034 AS ON
INSERT TO app_tracking WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO app_tracking_00034 VALUES (NEW.*);

CREATE TABLE app_tracking_00035 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00035 ADD CONSTRAINT at_00035_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00035 ADD CONSTRAINT at_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX at_00035_an_idx ON app_tracking_00035 USING btree (application_name);
CREATE INDEX at_00035_ca_idx ON app_tracking_00035 USING btree (created_at);
CREATE INDEX at_00035_ei_idx ON app_tracking_00035 USING btree (employee_id);
CREATE INDEX at_00035_ru_idx ON app_tracking_00035 USING btree (relative_url);
CREATE INDEX at_00035_u_idx ON app_tracking_00035 USING btree (username);
CREATE RULE  app_tracking_00035 AS ON
INSERT TO app_tracking WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO app_tracking_00035 VALUES (NEW.*);

CREATE TABLE app_tracking_00036 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00036 ADD CONSTRAINT at_00036_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00036 ADD CONSTRAINT at_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX at_00036_an_idx ON app_tracking_00036 USING btree (application_name);
CREATE INDEX at_00036_ca_idx ON app_tracking_00036 USING btree (created_at);
CREATE INDEX at_00036_ei_idx ON app_tracking_00036 USING btree (employee_id);
CREATE INDEX at_00036_ru_idx ON app_tracking_00036 USING btree (relative_url);
CREATE INDEX at_00036_u_idx ON app_tracking_00036 USING btree (username);
CREATE RULE  app_tracking_00036 AS ON
INSERT TO app_tracking WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO app_tracking_00036 VALUES (NEW.*);

CREATE TABLE app_tracking_00037 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00037 ADD CONSTRAINT at_00037_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00037 ADD CONSTRAINT at_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX at_00037_an_idx ON app_tracking_00037 USING btree (application_name);
CREATE INDEX at_00037_ca_idx ON app_tracking_00037 USING btree (created_at);
CREATE INDEX at_00037_ei_idx ON app_tracking_00037 USING btree (employee_id);
CREATE INDEX at_00037_ru_idx ON app_tracking_00037 USING btree (relative_url);
CREATE INDEX at_00037_u_idx ON app_tracking_00037 USING btree (username);
CREATE RULE  app_tracking_00037 AS ON
INSERT TO app_tracking WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO app_tracking_00037 VALUES (NEW.*);

CREATE TABLE app_tracking_00038 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00038 ADD CONSTRAINT at_00038_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00038 ADD CONSTRAINT at_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX at_00038_an_idx ON app_tracking_00038 USING btree (application_name);
CREATE INDEX at_00038_ca_idx ON app_tracking_00038 USING btree (created_at);
CREATE INDEX at_00038_ei_idx ON app_tracking_00038 USING btree (employee_id);
CREATE INDEX at_00038_ru_idx ON app_tracking_00038 USING btree (relative_url);
CREATE INDEX at_00038_u_idx ON app_tracking_00038 USING btree (username);
CREATE RULE  app_tracking_00038 AS ON
INSERT TO app_tracking WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO app_tracking_00038 VALUES (NEW.*);

CREATE TABLE app_tracking_00039 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00039 ADD CONSTRAINT at_00039_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00039 ADD CONSTRAINT at_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX at_00039_an_idx ON app_tracking_00039 USING btree (application_name);
CREATE INDEX at_00039_ca_idx ON app_tracking_00039 USING btree (created_at);
CREATE INDEX at_00039_ei_idx ON app_tracking_00039 USING btree (employee_id);
CREATE INDEX at_00039_ru_idx ON app_tracking_00039 USING btree (relative_url);
CREATE INDEX at_00039_u_idx ON app_tracking_00039 USING btree (username);
CREATE RULE  app_tracking_00039 AS ON
INSERT TO app_tracking WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO app_tracking_00039 VALUES (NEW.*);

CREATE TABLE app_tracking_00040 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00040 ADD CONSTRAINT at_00040_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00040 ADD CONSTRAINT at_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX at_00040_an_idx ON app_tracking_00040 USING btree (application_name);
CREATE INDEX at_00040_ca_idx ON app_tracking_00040 USING btree (created_at);
CREATE INDEX at_00040_ei_idx ON app_tracking_00040 USING btree (employee_id);
CREATE INDEX at_00040_ru_idx ON app_tracking_00040 USING btree (relative_url);
CREATE INDEX at_00040_u_idx ON app_tracking_00040 USING btree (username);
CREATE RULE  app_tracking_00040 AS ON
INSERT TO app_tracking WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO app_tracking_00040 VALUES (NEW.*);

CREATE TABLE app_tracking_00041 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00041 ADD CONSTRAINT at_00041_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00041 ADD CONSTRAINT at_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX at_00041_an_idx ON app_tracking_00041 USING btree (application_name);
CREATE INDEX at_00041_ca_idx ON app_tracking_00041 USING btree (created_at);
CREATE INDEX at_00041_ei_idx ON app_tracking_00041 USING btree (employee_id);
CREATE INDEX at_00041_ru_idx ON app_tracking_00041 USING btree (relative_url);
CREATE INDEX at_00041_u_idx ON app_tracking_00041 USING btree (username);
CREATE RULE  app_tracking_00041 AS ON
INSERT TO app_tracking WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO app_tracking_00041 VALUES (NEW.*);

CREATE TABLE app_tracking_00042 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00042 ADD CONSTRAINT at_00042_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00042 ADD CONSTRAINT at_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX at_00042_an_idx ON app_tracking_00042 USING btree (application_name);
CREATE INDEX at_00042_ca_idx ON app_tracking_00042 USING btree (created_at);
CREATE INDEX at_00042_ei_idx ON app_tracking_00042 USING btree (employee_id);
CREATE INDEX at_00042_ru_idx ON app_tracking_00042 USING btree (relative_url);
CREATE INDEX at_00042_u_idx ON app_tracking_00042 USING btree (username);
CREATE RULE  app_tracking_00042 AS ON
INSERT TO app_tracking WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO app_tracking_00042 VALUES (NEW.*);

CREATE TABLE app_tracking_00043 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00043 ADD CONSTRAINT at_00043_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00043 ADD CONSTRAINT at_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX at_00043_an_idx ON app_tracking_00043 USING btree (application_name);
CREATE INDEX at_00043_ca_idx ON app_tracking_00043 USING btree (created_at);
CREATE INDEX at_00043_ei_idx ON app_tracking_00043 USING btree (employee_id);
CREATE INDEX at_00043_ru_idx ON app_tracking_00043 USING btree (relative_url);
CREATE INDEX at_00043_u_idx ON app_tracking_00043 USING btree (username);
CREATE RULE  app_tracking_00043 AS ON
INSERT TO app_tracking WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO app_tracking_00043 VALUES (NEW.*);

CREATE TABLE app_tracking_00044 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00044 ADD CONSTRAINT at_00044_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00044 ADD CONSTRAINT at_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX at_00044_an_idx ON app_tracking_00044 USING btree (application_name);
CREATE INDEX at_00044_ca_idx ON app_tracking_00044 USING btree (created_at);
CREATE INDEX at_00044_ei_idx ON app_tracking_00044 USING btree (employee_id);
CREATE INDEX at_00044_ru_idx ON app_tracking_00044 USING btree (relative_url);
CREATE INDEX at_00044_u_idx ON app_tracking_00044 USING btree (username);
CREATE RULE  app_tracking_00044 AS ON
INSERT TO app_tracking WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO app_tracking_00044 VALUES (NEW.*);

CREATE TABLE app_tracking_00045 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00045 ADD CONSTRAINT at_00045_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00045 ADD CONSTRAINT at_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX at_00045_an_idx ON app_tracking_00045 USING btree (application_name);
CREATE INDEX at_00045_ca_idx ON app_tracking_00045 USING btree (created_at);
CREATE INDEX at_00045_ei_idx ON app_tracking_00045 USING btree (employee_id);
CREATE INDEX at_00045_ru_idx ON app_tracking_00045 USING btree (relative_url);
CREATE INDEX at_00045_u_idx ON app_tracking_00045 USING btree (username);
CREATE RULE  app_tracking_00045 AS ON
INSERT TO app_tracking WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO app_tracking_00045 VALUES (NEW.*);

CREATE TABLE app_tracking_00046 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00046 ADD CONSTRAINT at_00046_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00046 ADD CONSTRAINT at_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX at_00046_an_idx ON app_tracking_00046 USING btree (application_name);
CREATE INDEX at_00046_ca_idx ON app_tracking_00046 USING btree (created_at);
CREATE INDEX at_00046_ei_idx ON app_tracking_00046 USING btree (employee_id);
CREATE INDEX at_00046_ru_idx ON app_tracking_00046 USING btree (relative_url);
CREATE INDEX at_00046_u_idx ON app_tracking_00046 USING btree (username);
CREATE RULE  app_tracking_00046 AS ON
INSERT TO app_tracking WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO app_tracking_00046 VALUES (NEW.*);

CREATE TABLE app_tracking_00047 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00047 ADD CONSTRAINT at_00047_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00047 ADD CONSTRAINT at_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX at_00047_an_idx ON app_tracking_00047 USING btree (application_name);
CREATE INDEX at_00047_ca_idx ON app_tracking_00047 USING btree (created_at);
CREATE INDEX at_00047_ei_idx ON app_tracking_00047 USING btree (employee_id);
CREATE INDEX at_00047_ru_idx ON app_tracking_00047 USING btree (relative_url);
CREATE INDEX at_00047_u_idx ON app_tracking_00047 USING btree (username);
CREATE RULE  app_tracking_00047 AS ON
INSERT TO app_tracking WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO app_tracking_00047 VALUES (NEW.*);

CREATE TABLE app_tracking_00048 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00048 ADD CONSTRAINT at_00048_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00048 ADD CONSTRAINT at_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX at_00048_an_idx ON app_tracking_00048 USING btree (application_name);
CREATE INDEX at_00048_ca_idx ON app_tracking_00048 USING btree (created_at);
CREATE INDEX at_00048_ei_idx ON app_tracking_00048 USING btree (employee_id);
CREATE INDEX at_00048_ru_idx ON app_tracking_00048 USING btree (relative_url);
CREATE INDEX at_00048_u_idx ON app_tracking_00048 USING btree (username);
CREATE RULE  app_tracking_00048 AS ON
INSERT TO app_tracking WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO app_tracking_00048 VALUES (NEW.*);

CREATE TABLE app_tracking_00049 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00049 ADD CONSTRAINT at_00049_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00049 ADD CONSTRAINT at_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX at_00049_an_idx ON app_tracking_00049 USING btree (application_name);
CREATE INDEX at_00049_ca_idx ON app_tracking_00049 USING btree (created_at);
CREATE INDEX at_00049_ei_idx ON app_tracking_00049 USING btree (employee_id);
CREATE INDEX at_00049_ru_idx ON app_tracking_00049 USING btree (relative_url);
CREATE INDEX at_00049_u_idx ON app_tracking_00049 USING btree (username);
CREATE RULE  app_tracking_00049 AS ON
INSERT TO app_tracking WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO app_tracking_00049 VALUES (NEW.*);

CREATE TABLE app_tracking_00050 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00050 ADD CONSTRAINT at_00050_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00050 ADD CONSTRAINT at_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX at_00050_an_idx ON app_tracking_00050 USING btree (application_name);
CREATE INDEX at_00050_ca_idx ON app_tracking_00050 USING btree (created_at);
CREATE INDEX at_00050_ei_idx ON app_tracking_00050 USING btree (employee_id);
CREATE INDEX at_00050_ru_idx ON app_tracking_00050 USING btree (relative_url);
CREATE INDEX at_00050_u_idx ON app_tracking_00050 USING btree (username);
CREATE RULE  app_tracking_00050 AS ON
INSERT TO app_tracking WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO app_tracking_00050 VALUES (NEW.*);

CREATE TABLE app_tracking_00051 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00051 ADD CONSTRAINT at_00051_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00051 ADD CONSTRAINT at_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX at_00051_an_idx ON app_tracking_00051 USING btree (application_name);
CREATE INDEX at_00051_ca_idx ON app_tracking_00051 USING btree (created_at);
CREATE INDEX at_00051_ei_idx ON app_tracking_00051 USING btree (employee_id);
CREATE INDEX at_00051_ru_idx ON app_tracking_00051 USING btree (relative_url);
CREATE INDEX at_00051_u_idx ON app_tracking_00051 USING btree (username);
CREATE RULE  app_tracking_00051 AS ON
INSERT TO app_tracking WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO app_tracking_00051 VALUES (NEW.*);

CREATE TABLE app_tracking_00052 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00052 ADD CONSTRAINT at_00052_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00052 ADD CONSTRAINT at_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX at_00052_an_idx ON app_tracking_00052 USING btree (application_name);
CREATE INDEX at_00052_ca_idx ON app_tracking_00052 USING btree (created_at);
CREATE INDEX at_00052_ei_idx ON app_tracking_00052 USING btree (employee_id);
CREATE INDEX at_00052_ru_idx ON app_tracking_00052 USING btree (relative_url);
CREATE INDEX at_00052_u_idx ON app_tracking_00052 USING btree (username);
CREATE RULE  app_tracking_00052 AS ON
INSERT TO app_tracking WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO app_tracking_00052 VALUES (NEW.*);

CREATE TABLE app_tracking_00053 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00053 ADD CONSTRAINT at_00053_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00053 ADD CONSTRAINT at_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX at_00053_an_idx ON app_tracking_00053 USING btree (application_name);
CREATE INDEX at_00053_ca_idx ON app_tracking_00053 USING btree (created_at);
CREATE INDEX at_00053_ei_idx ON app_tracking_00053 USING btree (employee_id);
CREATE INDEX at_00053_ru_idx ON app_tracking_00053 USING btree (relative_url);
CREATE INDEX at_00053_u_idx ON app_tracking_00053 USING btree (username);
CREATE RULE  app_tracking_00053 AS ON
INSERT TO app_tracking WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO app_tracking_00053 VALUES (NEW.*);

CREATE TABLE app_tracking_00054 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00054 ADD CONSTRAINT at_00054_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00054 ADD CONSTRAINT at_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX at_00054_an_idx ON app_tracking_00054 USING btree (application_name);
CREATE INDEX at_00054_ca_idx ON app_tracking_00054 USING btree (created_at);
CREATE INDEX at_00054_ei_idx ON app_tracking_00054 USING btree (employee_id);
CREATE INDEX at_00054_ru_idx ON app_tracking_00054 USING btree (relative_url);
CREATE INDEX at_00054_u_idx ON app_tracking_00054 USING btree (username);
CREATE RULE  app_tracking_00054 AS ON
INSERT TO app_tracking WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO app_tracking_00054 VALUES (NEW.*);

CREATE TABLE app_tracking_00055 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00055 ADD CONSTRAINT at_00055_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00055 ADD CONSTRAINT at_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX at_00055_an_idx ON app_tracking_00055 USING btree (application_name);
CREATE INDEX at_00055_ca_idx ON app_tracking_00055 USING btree (created_at);
CREATE INDEX at_00055_ei_idx ON app_tracking_00055 USING btree (employee_id);
CREATE INDEX at_00055_ru_idx ON app_tracking_00055 USING btree (relative_url);
CREATE INDEX at_00055_u_idx ON app_tracking_00055 USING btree (username);
CREATE RULE  app_tracking_00055 AS ON
INSERT TO app_tracking WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO app_tracking_00055 VALUES (NEW.*);

CREATE TABLE app_tracking_00056 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00056 ADD CONSTRAINT at_00056_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00056 ADD CONSTRAINT at_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX at_00056_an_idx ON app_tracking_00056 USING btree (application_name);
CREATE INDEX at_00056_ca_idx ON app_tracking_00056 USING btree (created_at);
CREATE INDEX at_00056_ei_idx ON app_tracking_00056 USING btree (employee_id);
CREATE INDEX at_00056_ru_idx ON app_tracking_00056 USING btree (relative_url);
CREATE INDEX at_00056_u_idx ON app_tracking_00056 USING btree (username);
CREATE RULE  app_tracking_00056 AS ON
INSERT TO app_tracking WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO app_tracking_00056 VALUES (NEW.*);

CREATE TABLE app_tracking_00057 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00057 ADD CONSTRAINT at_00057_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00057 ADD CONSTRAINT at_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX at_00057_an_idx ON app_tracking_00057 USING btree (application_name);
CREATE INDEX at_00057_ca_idx ON app_tracking_00057 USING btree (created_at);
CREATE INDEX at_00057_ei_idx ON app_tracking_00057 USING btree (employee_id);
CREATE INDEX at_00057_ru_idx ON app_tracking_00057 USING btree (relative_url);
CREATE INDEX at_00057_u_idx ON app_tracking_00057 USING btree (username);
CREATE RULE  app_tracking_00057 AS ON
INSERT TO app_tracking WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO app_tracking_00057 VALUES (NEW.*);

CREATE TABLE app_tracking_00058 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00058 ADD CONSTRAINT at_00058_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00058 ADD CONSTRAINT at_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX at_00058_an_idx ON app_tracking_00058 USING btree (application_name);
CREATE INDEX at_00058_ca_idx ON app_tracking_00058 USING btree (created_at);
CREATE INDEX at_00058_ei_idx ON app_tracking_00058 USING btree (employee_id);
CREATE INDEX at_00058_ru_idx ON app_tracking_00058 USING btree (relative_url);
CREATE INDEX at_00058_u_idx ON app_tracking_00058 USING btree (username);
CREATE RULE  app_tracking_00058 AS ON
INSERT TO app_tracking WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO app_tracking_00058 VALUES (NEW.*);

CREATE TABLE app_tracking_00059 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00059 ADD CONSTRAINT at_00059_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00059 ADD CONSTRAINT at_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX at_00059_an_idx ON app_tracking_00059 USING btree (application_name);
CREATE INDEX at_00059_ca_idx ON app_tracking_00059 USING btree (created_at);
CREATE INDEX at_00059_ei_idx ON app_tracking_00059 USING btree (employee_id);
CREATE INDEX at_00059_ru_idx ON app_tracking_00059 USING btree (relative_url);
CREATE INDEX at_00059_u_idx ON app_tracking_00059 USING btree (username);
CREATE RULE  app_tracking_00059 AS ON
INSERT TO app_tracking WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO app_tracking_00059 VALUES (NEW.*);

CREATE TABLE app_tracking_00060 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00060 ADD CONSTRAINT at_00060_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00060 ADD CONSTRAINT at_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX at_00060_an_idx ON app_tracking_00060 USING btree (application_name);
CREATE INDEX at_00060_ca_idx ON app_tracking_00060 USING btree (created_at);
CREATE INDEX at_00060_ei_idx ON app_tracking_00060 USING btree (employee_id);
CREATE INDEX at_00060_ru_idx ON app_tracking_00060 USING btree (relative_url);
CREATE INDEX at_00060_u_idx ON app_tracking_00060 USING btree (username);
CREATE RULE  app_tracking_00060 AS ON
INSERT TO app_tracking WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO app_tracking_00060 VALUES (NEW.*);

CREATE TABLE app_tracking_00061 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00061 ADD CONSTRAINT at_00061_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00061 ADD CONSTRAINT at_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX at_00061_an_idx ON app_tracking_00061 USING btree (application_name);
CREATE INDEX at_00061_ca_idx ON app_tracking_00061 USING btree (created_at);
CREATE INDEX at_00061_ei_idx ON app_tracking_00061 USING btree (employee_id);
CREATE INDEX at_00061_ru_idx ON app_tracking_00061 USING btree (relative_url);
CREATE INDEX at_00061_u_idx ON app_tracking_00061 USING btree (username);
CREATE RULE  app_tracking_00061 AS ON
INSERT TO app_tracking WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO app_tracking_00061 VALUES (NEW.*);

CREATE TABLE app_tracking_00062 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00062 ADD CONSTRAINT at_00062_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00062 ADD CONSTRAINT at_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX at_00062_an_idx ON app_tracking_00062 USING btree (application_name);
CREATE INDEX at_00062_ca_idx ON app_tracking_00062 USING btree (created_at);
CREATE INDEX at_00062_ei_idx ON app_tracking_00062 USING btree (employee_id);
CREATE INDEX at_00062_ru_idx ON app_tracking_00062 USING btree (relative_url);
CREATE INDEX at_00062_u_idx ON app_tracking_00062 USING btree (username);
CREATE RULE  app_tracking_00062 AS ON
INSERT TO app_tracking WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO app_tracking_00062 VALUES (NEW.*);

CREATE TABLE app_tracking_00063 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00063 ADD CONSTRAINT at_00063_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00063 ADD CONSTRAINT at_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX at_00063_an_idx ON app_tracking_00063 USING btree (application_name);
CREATE INDEX at_00063_ca_idx ON app_tracking_00063 USING btree (created_at);
CREATE INDEX at_00063_ei_idx ON app_tracking_00063 USING btree (employee_id);
CREATE INDEX at_00063_ru_idx ON app_tracking_00063 USING btree (relative_url);
CREATE INDEX at_00063_u_idx ON app_tracking_00063 USING btree (username);
CREATE RULE  app_tracking_00063 AS ON
INSERT TO app_tracking WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO app_tracking_00063 VALUES (NEW.*);

CREATE TABLE app_tracking_00064 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00064 ADD CONSTRAINT at_00064_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00064 ADD CONSTRAINT at_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX at_00064_an_idx ON app_tracking_00064 USING btree (application_name);
CREATE INDEX at_00064_ca_idx ON app_tracking_00064 USING btree (created_at);
CREATE INDEX at_00064_ei_idx ON app_tracking_00064 USING btree (employee_id);
CREATE INDEX at_00064_ru_idx ON app_tracking_00064 USING btree (relative_url);
CREATE INDEX at_00064_u_idx ON app_tracking_00064 USING btree (username);
CREATE RULE  app_tracking_00064 AS ON
INSERT TO app_tracking WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO app_tracking_00064 VALUES (NEW.*);

CREATE TABLE app_tracking_00065 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00065 ADD CONSTRAINT at_00065_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00065 ADD CONSTRAINT at_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX at_00065_an_idx ON app_tracking_00065 USING btree (application_name);
CREATE INDEX at_00065_ca_idx ON app_tracking_00065 USING btree (created_at);
CREATE INDEX at_00065_ei_idx ON app_tracking_00065 USING btree (employee_id);
CREATE INDEX at_00065_ru_idx ON app_tracking_00065 USING btree (relative_url);
CREATE INDEX at_00065_u_idx ON app_tracking_00065 USING btree (username);
CREATE RULE  app_tracking_00065 AS ON
INSERT TO app_tracking WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO app_tracking_00065 VALUES (NEW.*);

CREATE TABLE app_tracking_00066 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00066 ADD CONSTRAINT at_00066_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00066 ADD CONSTRAINT at_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX at_00066_an_idx ON app_tracking_00066 USING btree (application_name);
CREATE INDEX at_00066_ca_idx ON app_tracking_00066 USING btree (created_at);
CREATE INDEX at_00066_ei_idx ON app_tracking_00066 USING btree (employee_id);
CREATE INDEX at_00066_ru_idx ON app_tracking_00066 USING btree (relative_url);
CREATE INDEX at_00066_u_idx ON app_tracking_00066 USING btree (username);
CREATE RULE  app_tracking_00066 AS ON
INSERT TO app_tracking WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO app_tracking_00066 VALUES (NEW.*);

CREATE TABLE app_tracking_00067 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00067 ADD CONSTRAINT at_00067_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00067 ADD CONSTRAINT at_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX at_00067_an_idx ON app_tracking_00067 USING btree (application_name);
CREATE INDEX at_00067_ca_idx ON app_tracking_00067 USING btree (created_at);
CREATE INDEX at_00067_ei_idx ON app_tracking_00067 USING btree (employee_id);
CREATE INDEX at_00067_ru_idx ON app_tracking_00067 USING btree (relative_url);
CREATE INDEX at_00067_u_idx ON app_tracking_00067 USING btree (username);
CREATE RULE  app_tracking_00067 AS ON
INSERT TO app_tracking WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO app_tracking_00067 VALUES (NEW.*);

CREATE TABLE app_tracking_00068 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00068 ADD CONSTRAINT at_00068_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00068 ADD CONSTRAINT at_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX at_00068_an_idx ON app_tracking_00068 USING btree (application_name);
CREATE INDEX at_00068_ca_idx ON app_tracking_00068 USING btree (created_at);
CREATE INDEX at_00068_ei_idx ON app_tracking_00068 USING btree (employee_id);
CREATE INDEX at_00068_ru_idx ON app_tracking_00068 USING btree (relative_url);
CREATE INDEX at_00068_u_idx ON app_tracking_00068 USING btree (username);
CREATE RULE  app_tracking_00068 AS ON
INSERT TO app_tracking WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO app_tracking_00068 VALUES (NEW.*);

CREATE TABLE app_tracking_00069 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00069 ADD CONSTRAINT at_00069_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00069 ADD CONSTRAINT at_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX at_00069_an_idx ON app_tracking_00069 USING btree (application_name);
CREATE INDEX at_00069_ca_idx ON app_tracking_00069 USING btree (created_at);
CREATE INDEX at_00069_ei_idx ON app_tracking_00069 USING btree (employee_id);
CREATE INDEX at_00069_ru_idx ON app_tracking_00069 USING btree (relative_url);
CREATE INDEX at_00069_u_idx ON app_tracking_00069 USING btree (username);
CREATE RULE  app_tracking_00069 AS ON
INSERT TO app_tracking WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO app_tracking_00069 VALUES (NEW.*);

CREATE TABLE app_tracking_00070 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00070 ADD CONSTRAINT at_00070_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00070 ADD CONSTRAINT at_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX at_00070_an_idx ON app_tracking_00070 USING btree (application_name);
CREATE INDEX at_00070_ca_idx ON app_tracking_00070 USING btree (created_at);
CREATE INDEX at_00070_ei_idx ON app_tracking_00070 USING btree (employee_id);
CREATE INDEX at_00070_ru_idx ON app_tracking_00070 USING btree (relative_url);
CREATE INDEX at_00070_u_idx ON app_tracking_00070 USING btree (username);
CREATE RULE  app_tracking_00070 AS ON
INSERT TO app_tracking WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO app_tracking_00070 VALUES (NEW.*);

CREATE TABLE app_tracking_00071 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00071 ADD CONSTRAINT at_00071_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00071 ADD CONSTRAINT at_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX at_00071_an_idx ON app_tracking_00071 USING btree (application_name);
CREATE INDEX at_00071_ca_idx ON app_tracking_00071 USING btree (created_at);
CREATE INDEX at_00071_ei_idx ON app_tracking_00071 USING btree (employee_id);
CREATE INDEX at_00071_ru_idx ON app_tracking_00071 USING btree (relative_url);
CREATE INDEX at_00071_u_idx ON app_tracking_00071 USING btree (username);
CREATE RULE  app_tracking_00071 AS ON
INSERT TO app_tracking WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO app_tracking_00071 VALUES (NEW.*);

CREATE TABLE app_tracking_00072 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00072 ADD CONSTRAINT at_00072_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00072 ADD CONSTRAINT at_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX at_00072_an_idx ON app_tracking_00072 USING btree (application_name);
CREATE INDEX at_00072_ca_idx ON app_tracking_00072 USING btree (created_at);
CREATE INDEX at_00072_ei_idx ON app_tracking_00072 USING btree (employee_id);
CREATE INDEX at_00072_ru_idx ON app_tracking_00072 USING btree (relative_url);
CREATE INDEX at_00072_u_idx ON app_tracking_00072 USING btree (username);
CREATE RULE  app_tracking_00072 AS ON
INSERT TO app_tracking WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO app_tracking_00072 VALUES (NEW.*);

CREATE TABLE app_tracking_00073 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00073 ADD CONSTRAINT at_00073_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00073 ADD CONSTRAINT at_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX at_00073_an_idx ON app_tracking_00073 USING btree (application_name);
CREATE INDEX at_00073_ca_idx ON app_tracking_00073 USING btree (created_at);
CREATE INDEX at_00073_ei_idx ON app_tracking_00073 USING btree (employee_id);
CREATE INDEX at_00073_ru_idx ON app_tracking_00073 USING btree (relative_url);
CREATE INDEX at_00073_u_idx ON app_tracking_00073 USING btree (username);
CREATE RULE  app_tracking_00073 AS ON
INSERT TO app_tracking WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO app_tracking_00073 VALUES (NEW.*);

CREATE TABLE app_tracking_00074 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00074 ADD CONSTRAINT at_00074_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00074 ADD CONSTRAINT at_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX at_00074_an_idx ON app_tracking_00074 USING btree (application_name);
CREATE INDEX at_00074_ca_idx ON app_tracking_00074 USING btree (created_at);
CREATE INDEX at_00074_ei_idx ON app_tracking_00074 USING btree (employee_id);
CREATE INDEX at_00074_ru_idx ON app_tracking_00074 USING btree (relative_url);
CREATE INDEX at_00074_u_idx ON app_tracking_00074 USING btree (username);
CREATE RULE  app_tracking_00074 AS ON
INSERT TO app_tracking WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO app_tracking_00074 VALUES (NEW.*);

CREATE TABLE app_tracking_00075 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00075 ADD CONSTRAINT at_00075_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00075 ADD CONSTRAINT at_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX at_00075_an_idx ON app_tracking_00075 USING btree (application_name);
CREATE INDEX at_00075_ca_idx ON app_tracking_00075 USING btree (created_at);
CREATE INDEX at_00075_ei_idx ON app_tracking_00075 USING btree (employee_id);
CREATE INDEX at_00075_ru_idx ON app_tracking_00075 USING btree (relative_url);
CREATE INDEX at_00075_u_idx ON app_tracking_00075 USING btree (username);
CREATE RULE  app_tracking_00075 AS ON
INSERT TO app_tracking WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO app_tracking_00075 VALUES (NEW.*);

CREATE TABLE app_tracking_00076 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00076 ADD CONSTRAINT at_00076_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00076 ADD CONSTRAINT at_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX at_00076_an_idx ON app_tracking_00076 USING btree (application_name);
CREATE INDEX at_00076_ca_idx ON app_tracking_00076 USING btree (created_at);
CREATE INDEX at_00076_ei_idx ON app_tracking_00076 USING btree (employee_id);
CREATE INDEX at_00076_ru_idx ON app_tracking_00076 USING btree (relative_url);
CREATE INDEX at_00076_u_idx ON app_tracking_00076 USING btree (username);
CREATE RULE  app_tracking_00076 AS ON
INSERT TO app_tracking WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO app_tracking_00076 VALUES (NEW.*);

CREATE TABLE app_tracking_00077 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00077 ADD CONSTRAINT at_00077_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00077 ADD CONSTRAINT at_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX at_00077_an_idx ON app_tracking_00077 USING btree (application_name);
CREATE INDEX at_00077_ca_idx ON app_tracking_00077 USING btree (created_at);
CREATE INDEX at_00077_ei_idx ON app_tracking_00077 USING btree (employee_id);
CREATE INDEX at_00077_ru_idx ON app_tracking_00077 USING btree (relative_url);
CREATE INDEX at_00077_u_idx ON app_tracking_00077 USING btree (username);
CREATE RULE  app_tracking_00077 AS ON
INSERT TO app_tracking WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO app_tracking_00077 VALUES (NEW.*);

CREATE TABLE app_tracking_00078 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00078 ADD CONSTRAINT at_00078_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00078 ADD CONSTRAINT at_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX at_00078_an_idx ON app_tracking_00078 USING btree (application_name);
CREATE INDEX at_00078_ca_idx ON app_tracking_00078 USING btree (created_at);
CREATE INDEX at_00078_ei_idx ON app_tracking_00078 USING btree (employee_id);
CREATE INDEX at_00078_ru_idx ON app_tracking_00078 USING btree (relative_url);
CREATE INDEX at_00078_u_idx ON app_tracking_00078 USING btree (username);
CREATE RULE  app_tracking_00078 AS ON
INSERT TO app_tracking WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO app_tracking_00078 VALUES (NEW.*);

CREATE TABLE app_tracking_00079 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00079 ADD CONSTRAINT at_00079_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00079 ADD CONSTRAINT at_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX at_00079_an_idx ON app_tracking_00079 USING btree (application_name);
CREATE INDEX at_00079_ca_idx ON app_tracking_00079 USING btree (created_at);
CREATE INDEX at_00079_ei_idx ON app_tracking_00079 USING btree (employee_id);
CREATE INDEX at_00079_ru_idx ON app_tracking_00079 USING btree (relative_url);
CREATE INDEX at_00079_u_idx ON app_tracking_00079 USING btree (username);
CREATE RULE  app_tracking_00079 AS ON
INSERT TO app_tracking WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO app_tracking_00079 VALUES (NEW.*);

CREATE TABLE app_tracking_00080 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00080 ADD CONSTRAINT at_00080_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00080 ADD CONSTRAINT at_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX at_00080_an_idx ON app_tracking_00080 USING btree (application_name);
CREATE INDEX at_00080_ca_idx ON app_tracking_00080 USING btree (created_at);
CREATE INDEX at_00080_ei_idx ON app_tracking_00080 USING btree (employee_id);
CREATE INDEX at_00080_ru_idx ON app_tracking_00080 USING btree (relative_url);
CREATE INDEX at_00080_u_idx ON app_tracking_00080 USING btree (username);
CREATE RULE  app_tracking_00080 AS ON
INSERT TO app_tracking WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO app_tracking_00080 VALUES (NEW.*);

CREATE TABLE app_tracking_00081 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00081 ADD CONSTRAINT at_00081_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00081 ADD CONSTRAINT at_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX at_00081_an_idx ON app_tracking_00081 USING btree (application_name);
CREATE INDEX at_00081_ca_idx ON app_tracking_00081 USING btree (created_at);
CREATE INDEX at_00081_ei_idx ON app_tracking_00081 USING btree (employee_id);
CREATE INDEX at_00081_ru_idx ON app_tracking_00081 USING btree (relative_url);
CREATE INDEX at_00081_u_idx ON app_tracking_00081 USING btree (username);
CREATE RULE  app_tracking_00081 AS ON
INSERT TO app_tracking WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO app_tracking_00081 VALUES (NEW.*);

CREATE TABLE app_tracking_00082 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00082 ADD CONSTRAINT at_00082_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00082 ADD CONSTRAINT at_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX at_00082_an_idx ON app_tracking_00082 USING btree (application_name);
CREATE INDEX at_00082_ca_idx ON app_tracking_00082 USING btree (created_at);
CREATE INDEX at_00082_ei_idx ON app_tracking_00082 USING btree (employee_id);
CREATE INDEX at_00082_ru_idx ON app_tracking_00082 USING btree (relative_url);
CREATE INDEX at_00082_u_idx ON app_tracking_00082 USING btree (username);
CREATE RULE  app_tracking_00082 AS ON
INSERT TO app_tracking WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO app_tracking_00082 VALUES (NEW.*);

CREATE TABLE app_tracking_00083 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00083 ADD CONSTRAINT at_00083_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00083 ADD CONSTRAINT at_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX at_00083_an_idx ON app_tracking_00083 USING btree (application_name);
CREATE INDEX at_00083_ca_idx ON app_tracking_00083 USING btree (created_at);
CREATE INDEX at_00083_ei_idx ON app_tracking_00083 USING btree (employee_id);
CREATE INDEX at_00083_ru_idx ON app_tracking_00083 USING btree (relative_url);
CREATE INDEX at_00083_u_idx ON app_tracking_00083 USING btree (username);
CREATE RULE  app_tracking_00083 AS ON
INSERT TO app_tracking WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO app_tracking_00083 VALUES (NEW.*);

CREATE TABLE app_tracking_00084 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00084 ADD CONSTRAINT at_00084_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00084 ADD CONSTRAINT at_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX at_00084_an_idx ON app_tracking_00084 USING btree (application_name);
CREATE INDEX at_00084_ca_idx ON app_tracking_00084 USING btree (created_at);
CREATE INDEX at_00084_ei_idx ON app_tracking_00084 USING btree (employee_id);
CREATE INDEX at_00084_ru_idx ON app_tracking_00084 USING btree (relative_url);
CREATE INDEX at_00084_u_idx ON app_tracking_00084 USING btree (username);
CREATE RULE  app_tracking_00084 AS ON
INSERT TO app_tracking WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO app_tracking_00084 VALUES (NEW.*);

CREATE TABLE app_tracking_00085 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00085 ADD CONSTRAINT at_00085_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00085 ADD CONSTRAINT at_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX at_00085_an_idx ON app_tracking_00085 USING btree (application_name);
CREATE INDEX at_00085_ca_idx ON app_tracking_00085 USING btree (created_at);
CREATE INDEX at_00085_ei_idx ON app_tracking_00085 USING btree (employee_id);
CREATE INDEX at_00085_ru_idx ON app_tracking_00085 USING btree (relative_url);
CREATE INDEX at_00085_u_idx ON app_tracking_00085 USING btree (username);
CREATE RULE  app_tracking_00085 AS ON
INSERT TO app_tracking WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO app_tracking_00085 VALUES (NEW.*);

CREATE TABLE app_tracking_00086 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00086 ADD CONSTRAINT at_00086_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00086 ADD CONSTRAINT at_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX at_00086_an_idx ON app_tracking_00086 USING btree (application_name);
CREATE INDEX at_00086_ca_idx ON app_tracking_00086 USING btree (created_at);
CREATE INDEX at_00086_ei_idx ON app_tracking_00086 USING btree (employee_id);
CREATE INDEX at_00086_ru_idx ON app_tracking_00086 USING btree (relative_url);
CREATE INDEX at_00086_u_idx ON app_tracking_00086 USING btree (username);
CREATE RULE  app_tracking_00086 AS ON
INSERT TO app_tracking WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO app_tracking_00086 VALUES (NEW.*);

CREATE TABLE app_tracking_00087 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00087 ADD CONSTRAINT at_00087_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00087 ADD CONSTRAINT at_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX at_00087_an_idx ON app_tracking_00087 USING btree (application_name);
CREATE INDEX at_00087_ca_idx ON app_tracking_00087 USING btree (created_at);
CREATE INDEX at_00087_ei_idx ON app_tracking_00087 USING btree (employee_id);
CREATE INDEX at_00087_ru_idx ON app_tracking_00087 USING btree (relative_url);
CREATE INDEX at_00087_u_idx ON app_tracking_00087 USING btree (username);
CREATE RULE  app_tracking_00087 AS ON
INSERT TO app_tracking WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO app_tracking_00087 VALUES (NEW.*);

CREATE TABLE app_tracking_00088 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00088 ADD CONSTRAINT at_00088_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00088 ADD CONSTRAINT at_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX at_00088_an_idx ON app_tracking_00088 USING btree (application_name);
CREATE INDEX at_00088_ca_idx ON app_tracking_00088 USING btree (created_at);
CREATE INDEX at_00088_ei_idx ON app_tracking_00088 USING btree (employee_id);
CREATE INDEX at_00088_ru_idx ON app_tracking_00088 USING btree (relative_url);
CREATE INDEX at_00088_u_idx ON app_tracking_00088 USING btree (username);
CREATE RULE  app_tracking_00088 AS ON
INSERT TO app_tracking WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO app_tracking_00088 VALUES (NEW.*);

CREATE TABLE app_tracking_00089 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00089 ADD CONSTRAINT at_00089_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00089 ADD CONSTRAINT at_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX at_00089_an_idx ON app_tracking_00089 USING btree (application_name);
CREATE INDEX at_00089_ca_idx ON app_tracking_00089 USING btree (created_at);
CREATE INDEX at_00089_ei_idx ON app_tracking_00089 USING btree (employee_id);
CREATE INDEX at_00089_ru_idx ON app_tracking_00089 USING btree (relative_url);
CREATE INDEX at_00089_u_idx ON app_tracking_00089 USING btree (username);
CREATE RULE  app_tracking_00089 AS ON
INSERT TO app_tracking WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO app_tracking_00089 VALUES (NEW.*);

CREATE TABLE app_tracking_00090 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00090 ADD CONSTRAINT at_00090_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00090 ADD CONSTRAINT at_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX at_00090_an_idx ON app_tracking_00090 USING btree (application_name);
CREATE INDEX at_00090_ca_idx ON app_tracking_00090 USING btree (created_at);
CREATE INDEX at_00090_ei_idx ON app_tracking_00090 USING btree (employee_id);
CREATE INDEX at_00090_ru_idx ON app_tracking_00090 USING btree (relative_url);
CREATE INDEX at_00090_u_idx ON app_tracking_00090 USING btree (username);
CREATE RULE  app_tracking_00090 AS ON
INSERT TO app_tracking WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO app_tracking_00090 VALUES (NEW.*);

CREATE TABLE app_tracking_00091 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00091 ADD CONSTRAINT at_00091_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00091 ADD CONSTRAINT at_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX at_00091_an_idx ON app_tracking_00091 USING btree (application_name);
CREATE INDEX at_00091_ca_idx ON app_tracking_00091 USING btree (created_at);
CREATE INDEX at_00091_ei_idx ON app_tracking_00091 USING btree (employee_id);
CREATE INDEX at_00091_ru_idx ON app_tracking_00091 USING btree (relative_url);
CREATE INDEX at_00091_u_idx ON app_tracking_00091 USING btree (username);
CREATE RULE  app_tracking_00091 AS ON
INSERT TO app_tracking WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO app_tracking_00091 VALUES (NEW.*);

CREATE TABLE app_tracking_00092 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00092 ADD CONSTRAINT at_00092_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00092 ADD CONSTRAINT at_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX at_00092_an_idx ON app_tracking_00092 USING btree (application_name);
CREATE INDEX at_00092_ca_idx ON app_tracking_00092 USING btree (created_at);
CREATE INDEX at_00092_ei_idx ON app_tracking_00092 USING btree (employee_id);
CREATE INDEX at_00092_ru_idx ON app_tracking_00092 USING btree (relative_url);
CREATE INDEX at_00092_u_idx ON app_tracking_00092 USING btree (username);
CREATE RULE  app_tracking_00092 AS ON
INSERT TO app_tracking WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO app_tracking_00092 VALUES (NEW.*);

CREATE TABLE app_tracking_00093 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00093 ADD CONSTRAINT at_00093_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00093 ADD CONSTRAINT at_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX at_00093_an_idx ON app_tracking_00093 USING btree (application_name);
CREATE INDEX at_00093_ca_idx ON app_tracking_00093 USING btree (created_at);
CREATE INDEX at_00093_ei_idx ON app_tracking_00093 USING btree (employee_id);
CREATE INDEX at_00093_ru_idx ON app_tracking_00093 USING btree (relative_url);
CREATE INDEX at_00093_u_idx ON app_tracking_00093 USING btree (username);
CREATE RULE  app_tracking_00093 AS ON
INSERT TO app_tracking WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO app_tracking_00093 VALUES (NEW.*);

CREATE TABLE app_tracking_00094 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00094 ADD CONSTRAINT at_00094_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00094 ADD CONSTRAINT at_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX at_00094_an_idx ON app_tracking_00094 USING btree (application_name);
CREATE INDEX at_00094_ca_idx ON app_tracking_00094 USING btree (created_at);
CREATE INDEX at_00094_ei_idx ON app_tracking_00094 USING btree (employee_id);
CREATE INDEX at_00094_ru_idx ON app_tracking_00094 USING btree (relative_url);
CREATE INDEX at_00094_u_idx ON app_tracking_00094 USING btree (username);
CREATE RULE  app_tracking_00094 AS ON
INSERT TO app_tracking WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO app_tracking_00094 VALUES (NEW.*);

CREATE TABLE app_tracking_00095 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00095 ADD CONSTRAINT at_00095_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00095 ADD CONSTRAINT at_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX at_00095_an_idx ON app_tracking_00095 USING btree (application_name);
CREATE INDEX at_00095_ca_idx ON app_tracking_00095 USING btree (created_at);
CREATE INDEX at_00095_ei_idx ON app_tracking_00095 USING btree (employee_id);
CREATE INDEX at_00095_ru_idx ON app_tracking_00095 USING btree (relative_url);
CREATE INDEX at_00095_u_idx ON app_tracking_00095 USING btree (username);
CREATE RULE  app_tracking_00095 AS ON
INSERT TO app_tracking WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO app_tracking_00095 VALUES (NEW.*);

CREATE TABLE app_tracking_00096 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00096 ADD CONSTRAINT at_00096_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00096 ADD CONSTRAINT at_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX at_00096_an_idx ON app_tracking_00096 USING btree (application_name);
CREATE INDEX at_00096_ca_idx ON app_tracking_00096 USING btree (created_at);
CREATE INDEX at_00096_ei_idx ON app_tracking_00096 USING btree (employee_id);
CREATE INDEX at_00096_ru_idx ON app_tracking_00096 USING btree (relative_url);
CREATE INDEX at_00096_u_idx ON app_tracking_00096 USING btree (username);
CREATE RULE  app_tracking_00096 AS ON
INSERT TO app_tracking WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO app_tracking_00096 VALUES (NEW.*);

CREATE TABLE app_tracking_00097 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00097 ADD CONSTRAINT at_00097_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00097 ADD CONSTRAINT at_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX at_00097_an_idx ON app_tracking_00097 USING btree (application_name);
CREATE INDEX at_00097_ca_idx ON app_tracking_00097 USING btree (created_at);
CREATE INDEX at_00097_ei_idx ON app_tracking_00097 USING btree (employee_id);
CREATE INDEX at_00097_ru_idx ON app_tracking_00097 USING btree (relative_url);
CREATE INDEX at_00097_u_idx ON app_tracking_00097 USING btree (username);
CREATE RULE  app_tracking_00097 AS ON
INSERT TO app_tracking WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO app_tracking_00097 VALUES (NEW.*);

CREATE TABLE app_tracking_00098 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00098 ADD CONSTRAINT at_00098_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00098 ADD CONSTRAINT at_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX at_00098_an_idx ON app_tracking_00098 USING btree (application_name);
CREATE INDEX at_00098_ca_idx ON app_tracking_00098 USING btree (created_at);
CREATE INDEX at_00098_ei_idx ON app_tracking_00098 USING btree (employee_id);
CREATE INDEX at_00098_ru_idx ON app_tracking_00098 USING btree (relative_url);
CREATE INDEX at_00098_u_idx ON app_tracking_00098 USING btree (username);
CREATE RULE  app_tracking_00098 AS ON
INSERT TO app_tracking WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO app_tracking_00098 VALUES (NEW.*);

CREATE TABLE app_tracking_00099 ( ) INHERITS (app_tracking);
ALTER TABLE app_tracking_00099 ADD CONSTRAINT at_00099_pk PRIMARY KEY (id);
ALTER TABLE app_tracking_00099 ADD CONSTRAINT at_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX at_00099_an_idx ON app_tracking_00099 USING btree (application_name);
CREATE INDEX at_00099_ca_idx ON app_tracking_00099 USING btree (created_at);
CREATE INDEX at_00099_ei_idx ON app_tracking_00099 USING btree (employee_id);
CREATE INDEX at_00099_ru_idx ON app_tracking_00099 USING btree (relative_url);
CREATE INDEX at_00099_u_idx ON app_tracking_00099 USING btree (username);
CREATE RULE  app_tracking_00099 AS ON
INSERT TO app_tracking WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO app_tracking_00099 VALUES (NEW.*);
