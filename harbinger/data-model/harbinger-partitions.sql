/* app_tracking_00000 */
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

/* app_tracking_00001 */
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

/* app_tracking_00002 */
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

/* app_tracking_00003 */
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

/* app_tracking_00004 */
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

/* app_tracking_00005 */
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

/* app_tracking_00006 */
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

/* app_tracking_00007 */
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

/* app_tracking_00008 */
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

/* app_tracking_00009 */
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

/* app_tracking_00010 */
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

/* app_tracking_00011 */
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

/* app_tracking_00012 */
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

/* app_tracking_00013 */
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

/* app_tracking_00014 */
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

/* app_tracking_00015 */
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

/* app_tracking_00016 */
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

/* app_tracking_00017 */
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

/* app_tracking_00018 */
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

/* app_tracking_00019 */
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

/* app_tracking_00020 */
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

/* app_tracking_00021 */
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

/* app_tracking_00022 */
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

/* app_tracking_00023 */
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

/* app_tracking_00024 */
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

/* app_tracking_00025 */
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

/* app_tracking_00026 */
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

/* app_tracking_00027 */
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

/* app_tracking_00028 */
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

/* app_tracking_00029 */
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

/* app_tracking_00030 */
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

/* app_tracking_00031 */
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

/* app_tracking_00032 */
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

/* app_tracking_00033 */
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

/* app_tracking_00034 */
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

/* app_tracking_00035 */
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

/* app_tracking_00036 */
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

/* app_tracking_00037 */
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

/* app_tracking_00038 */
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

/* app_tracking_00039 */
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

/* app_tracking_00040 */
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

/* app_tracking_00041 */
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

/* app_tracking_00042 */
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

/* app_tracking_00043 */
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

/* app_tracking_00044 */
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

/* app_tracking_00045 */
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

/* app_tracking_00046 */
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

/* app_tracking_00047 */
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

/* app_tracking_00048 */
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

/* app_tracking_00049 */
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

/* app_tracking_00050 */
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

/* app_tracking_00051 */
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

/* app_tracking_00052 */
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

/* app_tracking_00053 */
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

/* app_tracking_00054 */
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

/* app_tracking_00055 */
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

/* app_tracking_00056 */
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

/* app_tracking_00057 */
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

/* app_tracking_00058 */
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

/* app_tracking_00059 */
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

/* app_tracking_00060 */
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

/* app_tracking_00061 */
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

/* app_tracking_00062 */
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

/* app_tracking_00063 */
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

/* app_tracking_00064 */
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

/* app_tracking_00065 */
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

/* app_tracking_00066 */
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

/* app_tracking_00067 */
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

/* app_tracking_00068 */
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

/* app_tracking_00069 */
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

/* app_tracking_00070 */
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

/* app_tracking_00071 */
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

/* app_tracking_00072 */
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

/* app_tracking_00073 */
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

/* app_tracking_00074 */
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

/* app_tracking_00075 */
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

/* app_tracking_00076 */
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

/* app_tracking_00077 */
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

/* app_tracking_00078 */
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

/* app_tracking_00079 */
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

/* app_tracking_00080 */
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

/* app_tracking_00081 */
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

/* app_tracking_00082 */
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

/* app_tracking_00083 */
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

/* app_tracking_00084 */
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

/* app_tracking_00085 */
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

/* app_tracking_00086 */
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

/* app_tracking_00087 */
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

/* app_tracking_00088 */
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

/* app_tracking_00089 */
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

/* app_tracking_00090 */
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

/* app_tracking_00091 */
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

/* app_tracking_00092 */
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

/* app_tracking_00093 */
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

/* app_tracking_00094 */
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

/* app_tracking_00095 */
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

/* app_tracking_00096 */
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

/* app_tracking_00097 */
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

/* app_tracking_00098 */
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

/* app_tracking_00099 */
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

/* data_manager_error_logs_00000 */
CREATE TABLE data_manager_error_logs_00000 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00000 ADD CONSTRAINT dmel_00000_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00000 ADD CONSTRAINT dmel_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX dmel_00000_dmml_id_idx ON data_manager_error_logs_00000 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00000 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00000 VALUES (NEW.*);

/* data_manager_error_logs_00001 */
CREATE TABLE data_manager_error_logs_00001 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00001 ADD CONSTRAINT dmel_00001_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00001 ADD CONSTRAINT dmel_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX dmel_00001_dmml_id_idx ON data_manager_error_logs_00001 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00001 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00001 VALUES (NEW.*);

/* data_manager_error_logs_00002 */
CREATE TABLE data_manager_error_logs_00002 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00002 ADD CONSTRAINT dmel_00002_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00002 ADD CONSTRAINT dmel_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX dmel_00002_dmml_id_idx ON data_manager_error_logs_00002 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00002 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00002 VALUES (NEW.*);

/* data_manager_error_logs_00003 */
CREATE TABLE data_manager_error_logs_00003 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00003 ADD CONSTRAINT dmel_00003_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00003 ADD CONSTRAINT dmel_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX dmel_00003_dmml_id_idx ON data_manager_error_logs_00003 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00003 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00003 VALUES (NEW.*);

/* data_manager_error_logs_00004 */
CREATE TABLE data_manager_error_logs_00004 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00004 ADD CONSTRAINT dmel_00004_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00004 ADD CONSTRAINT dmel_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX dmel_00004_dmml_id_idx ON data_manager_error_logs_00004 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00004 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00004 VALUES (NEW.*);

/* data_manager_error_logs_00005 */
CREATE TABLE data_manager_error_logs_00005 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00005 ADD CONSTRAINT dmel_00005_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00005 ADD CONSTRAINT dmel_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX dmel_00005_dmml_id_idx ON data_manager_error_logs_00005 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00005 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00005 VALUES (NEW.*);

/* data_manager_error_logs_00006 */
CREATE TABLE data_manager_error_logs_00006 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00006 ADD CONSTRAINT dmel_00006_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00006 ADD CONSTRAINT dmel_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX dmel_00006_dmml_id_idx ON data_manager_error_logs_00006 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00006 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00006 VALUES (NEW.*);

/* data_manager_error_logs_00007 */
CREATE TABLE data_manager_error_logs_00007 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00007 ADD CONSTRAINT dmel_00007_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00007 ADD CONSTRAINT dmel_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX dmel_00007_dmml_id_idx ON data_manager_error_logs_00007 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00007 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00007 VALUES (NEW.*);

/* data_manager_error_logs_00008 */
CREATE TABLE data_manager_error_logs_00008 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00008 ADD CONSTRAINT dmel_00008_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00008 ADD CONSTRAINT dmel_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX dmel_00008_dmml_id_idx ON data_manager_error_logs_00008 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00008 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00008 VALUES (NEW.*);

/* data_manager_error_logs_00009 */
CREATE TABLE data_manager_error_logs_00009 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00009 ADD CONSTRAINT dmel_00009_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00009 ADD CONSTRAINT dmel_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX dmel_00009_dmml_id_idx ON data_manager_error_logs_00009 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00009 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00009 VALUES (NEW.*);

/* data_manager_error_logs_00010 */
CREATE TABLE data_manager_error_logs_00010 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00010 ADD CONSTRAINT dmel_00010_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00010 ADD CONSTRAINT dmel_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX dmel_00010_dmml_id_idx ON data_manager_error_logs_00010 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00010 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00010 VALUES (NEW.*);

/* data_manager_error_logs_00011 */
CREATE TABLE data_manager_error_logs_00011 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00011 ADD CONSTRAINT dmel_00011_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00011 ADD CONSTRAINT dmel_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX dmel_00011_dmml_id_idx ON data_manager_error_logs_00011 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00011 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00011 VALUES (NEW.*);

/* data_manager_error_logs_00012 */
CREATE TABLE data_manager_error_logs_00012 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00012 ADD CONSTRAINT dmel_00012_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00012 ADD CONSTRAINT dmel_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX dmel_00012_dmml_id_idx ON data_manager_error_logs_00012 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00012 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00012 VALUES (NEW.*);

/* data_manager_error_logs_00013 */
CREATE TABLE data_manager_error_logs_00013 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00013 ADD CONSTRAINT dmel_00013_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00013 ADD CONSTRAINT dmel_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX dmel_00013_dmml_id_idx ON data_manager_error_logs_00013 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00013 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00013 VALUES (NEW.*);

/* data_manager_error_logs_00014 */
CREATE TABLE data_manager_error_logs_00014 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00014 ADD CONSTRAINT dmel_00014_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00014 ADD CONSTRAINT dmel_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX dmel_00014_dmml_id_idx ON data_manager_error_logs_00014 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00014 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00014 VALUES (NEW.*);

/* data_manager_error_logs_00015 */
CREATE TABLE data_manager_error_logs_00015 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00015 ADD CONSTRAINT dmel_00015_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00015 ADD CONSTRAINT dmel_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX dmel_00015_dmml_id_idx ON data_manager_error_logs_00015 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00015 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00015 VALUES (NEW.*);

/* data_manager_error_logs_00016 */
CREATE TABLE data_manager_error_logs_00016 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00016 ADD CONSTRAINT dmel_00016_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00016 ADD CONSTRAINT dmel_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX dmel_00016_dmml_id_idx ON data_manager_error_logs_00016 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00016 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00016 VALUES (NEW.*);

/* data_manager_error_logs_00017 */
CREATE TABLE data_manager_error_logs_00017 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00017 ADD CONSTRAINT dmel_00017_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00017 ADD CONSTRAINT dmel_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX dmel_00017_dmml_id_idx ON data_manager_error_logs_00017 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00017 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00017 VALUES (NEW.*);

/* data_manager_error_logs_00018 */
CREATE TABLE data_manager_error_logs_00018 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00018 ADD CONSTRAINT dmel_00018_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00018 ADD CONSTRAINT dmel_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX dmel_00018_dmml_id_idx ON data_manager_error_logs_00018 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00018 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00018 VALUES (NEW.*);

/* data_manager_error_logs_00019 */
CREATE TABLE data_manager_error_logs_00019 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00019 ADD CONSTRAINT dmel_00019_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00019 ADD CONSTRAINT dmel_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX dmel_00019_dmml_id_idx ON data_manager_error_logs_00019 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00019 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00019 VALUES (NEW.*);

/* data_manager_error_logs_00020 */
CREATE TABLE data_manager_error_logs_00020 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00020 ADD CONSTRAINT dmel_00020_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00020 ADD CONSTRAINT dmel_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX dmel_00020_dmml_id_idx ON data_manager_error_logs_00020 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00020 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00020 VALUES (NEW.*);

/* data_manager_error_logs_00021 */
CREATE TABLE data_manager_error_logs_00021 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00021 ADD CONSTRAINT dmel_00021_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00021 ADD CONSTRAINT dmel_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX dmel_00021_dmml_id_idx ON data_manager_error_logs_00021 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00021 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00021 VALUES (NEW.*);

/* data_manager_error_logs_00022 */
CREATE TABLE data_manager_error_logs_00022 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00022 ADD CONSTRAINT dmel_00022_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00022 ADD CONSTRAINT dmel_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX dmel_00022_dmml_id_idx ON data_manager_error_logs_00022 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00022 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00022 VALUES (NEW.*);

/* data_manager_error_logs_00023 */
CREATE TABLE data_manager_error_logs_00023 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00023 ADD CONSTRAINT dmel_00023_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00023 ADD CONSTRAINT dmel_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX dmel_00023_dmml_id_idx ON data_manager_error_logs_00023 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00023 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00023 VALUES (NEW.*);

/* data_manager_error_logs_00024 */
CREATE TABLE data_manager_error_logs_00024 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00024 ADD CONSTRAINT dmel_00024_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00024 ADD CONSTRAINT dmel_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX dmel_00024_dmml_id_idx ON data_manager_error_logs_00024 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00024 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00024 VALUES (NEW.*);

/* data_manager_error_logs_00025 */
CREATE TABLE data_manager_error_logs_00025 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00025 ADD CONSTRAINT dmel_00025_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00025 ADD CONSTRAINT dmel_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX dmel_00025_dmml_id_idx ON data_manager_error_logs_00025 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00025 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00025 VALUES (NEW.*);

/* data_manager_error_logs_00026 */
CREATE TABLE data_manager_error_logs_00026 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00026 ADD CONSTRAINT dmel_00026_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00026 ADD CONSTRAINT dmel_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX dmel_00026_dmml_id_idx ON data_manager_error_logs_00026 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00026 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00026 VALUES (NEW.*);

/* data_manager_error_logs_00027 */
CREATE TABLE data_manager_error_logs_00027 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00027 ADD CONSTRAINT dmel_00027_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00027 ADD CONSTRAINT dmel_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX dmel_00027_dmml_id_idx ON data_manager_error_logs_00027 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00027 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00027 VALUES (NEW.*);

/* data_manager_error_logs_00028 */
CREATE TABLE data_manager_error_logs_00028 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00028 ADD CONSTRAINT dmel_00028_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00028 ADD CONSTRAINT dmel_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX dmel_00028_dmml_id_idx ON data_manager_error_logs_00028 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00028 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00028 VALUES (NEW.*);

/* data_manager_error_logs_00029 */
CREATE TABLE data_manager_error_logs_00029 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00029 ADD CONSTRAINT dmel_00029_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00029 ADD CONSTRAINT dmel_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX dmel_00029_dmml_id_idx ON data_manager_error_logs_00029 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00029 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00029 VALUES (NEW.*);

/* data_manager_error_logs_00030 */
CREATE TABLE data_manager_error_logs_00030 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00030 ADD CONSTRAINT dmel_00030_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00030 ADD CONSTRAINT dmel_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX dmel_00030_dmml_id_idx ON data_manager_error_logs_00030 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00030 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00030 VALUES (NEW.*);

/* data_manager_error_logs_00031 */
CREATE TABLE data_manager_error_logs_00031 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00031 ADD CONSTRAINT dmel_00031_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00031 ADD CONSTRAINT dmel_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX dmel_00031_dmml_id_idx ON data_manager_error_logs_00031 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00031 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00031 VALUES (NEW.*);

/* data_manager_error_logs_00032 */
CREATE TABLE data_manager_error_logs_00032 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00032 ADD CONSTRAINT dmel_00032_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00032 ADD CONSTRAINT dmel_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX dmel_00032_dmml_id_idx ON data_manager_error_logs_00032 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00032 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00032 VALUES (NEW.*);

/* data_manager_error_logs_00033 */
CREATE TABLE data_manager_error_logs_00033 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00033 ADD CONSTRAINT dmel_00033_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00033 ADD CONSTRAINT dmel_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX dmel_00033_dmml_id_idx ON data_manager_error_logs_00033 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00033 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00033 VALUES (NEW.*);

/* data_manager_error_logs_00034 */
CREATE TABLE data_manager_error_logs_00034 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00034 ADD CONSTRAINT dmel_00034_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00034 ADD CONSTRAINT dmel_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX dmel_00034_dmml_id_idx ON data_manager_error_logs_00034 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00034 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00034 VALUES (NEW.*);

/* data_manager_error_logs_00035 */
CREATE TABLE data_manager_error_logs_00035 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00035 ADD CONSTRAINT dmel_00035_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00035 ADD CONSTRAINT dmel_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX dmel_00035_dmml_id_idx ON data_manager_error_logs_00035 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00035 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00035 VALUES (NEW.*);

/* data_manager_error_logs_00036 */
CREATE TABLE data_manager_error_logs_00036 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00036 ADD CONSTRAINT dmel_00036_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00036 ADD CONSTRAINT dmel_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX dmel_00036_dmml_id_idx ON data_manager_error_logs_00036 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00036 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00036 VALUES (NEW.*);

/* data_manager_error_logs_00037 */
CREATE TABLE data_manager_error_logs_00037 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00037 ADD CONSTRAINT dmel_00037_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00037 ADD CONSTRAINT dmel_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX dmel_00037_dmml_id_idx ON data_manager_error_logs_00037 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00037 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00037 VALUES (NEW.*);

/* data_manager_error_logs_00038 */
CREATE TABLE data_manager_error_logs_00038 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00038 ADD CONSTRAINT dmel_00038_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00038 ADD CONSTRAINT dmel_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX dmel_00038_dmml_id_idx ON data_manager_error_logs_00038 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00038 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00038 VALUES (NEW.*);

/* data_manager_error_logs_00039 */
CREATE TABLE data_manager_error_logs_00039 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00039 ADD CONSTRAINT dmel_00039_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00039 ADD CONSTRAINT dmel_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX dmel_00039_dmml_id_idx ON data_manager_error_logs_00039 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00039 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00039 VALUES (NEW.*);

/* data_manager_error_logs_00040 */
CREATE TABLE data_manager_error_logs_00040 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00040 ADD CONSTRAINT dmel_00040_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00040 ADD CONSTRAINT dmel_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX dmel_00040_dmml_id_idx ON data_manager_error_logs_00040 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00040 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00040 VALUES (NEW.*);

/* data_manager_error_logs_00041 */
CREATE TABLE data_manager_error_logs_00041 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00041 ADD CONSTRAINT dmel_00041_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00041 ADD CONSTRAINT dmel_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX dmel_00041_dmml_id_idx ON data_manager_error_logs_00041 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00041 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00041 VALUES (NEW.*);

/* data_manager_error_logs_00042 */
CREATE TABLE data_manager_error_logs_00042 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00042 ADD CONSTRAINT dmel_00042_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00042 ADD CONSTRAINT dmel_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX dmel_00042_dmml_id_idx ON data_manager_error_logs_00042 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00042 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00042 VALUES (NEW.*);

/* data_manager_error_logs_00043 */
CREATE TABLE data_manager_error_logs_00043 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00043 ADD CONSTRAINT dmel_00043_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00043 ADD CONSTRAINT dmel_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX dmel_00043_dmml_id_idx ON data_manager_error_logs_00043 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00043 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00043 VALUES (NEW.*);

/* data_manager_error_logs_00044 */
CREATE TABLE data_manager_error_logs_00044 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00044 ADD CONSTRAINT dmel_00044_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00044 ADD CONSTRAINT dmel_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX dmel_00044_dmml_id_idx ON data_manager_error_logs_00044 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00044 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00044 VALUES (NEW.*);

/* data_manager_error_logs_00045 */
CREATE TABLE data_manager_error_logs_00045 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00045 ADD CONSTRAINT dmel_00045_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00045 ADD CONSTRAINT dmel_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX dmel_00045_dmml_id_idx ON data_manager_error_logs_00045 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00045 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00045 VALUES (NEW.*);

/* data_manager_error_logs_00046 */
CREATE TABLE data_manager_error_logs_00046 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00046 ADD CONSTRAINT dmel_00046_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00046 ADD CONSTRAINT dmel_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX dmel_00046_dmml_id_idx ON data_manager_error_logs_00046 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00046 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00046 VALUES (NEW.*);

/* data_manager_error_logs_00047 */
CREATE TABLE data_manager_error_logs_00047 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00047 ADD CONSTRAINT dmel_00047_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00047 ADD CONSTRAINT dmel_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX dmel_00047_dmml_id_idx ON data_manager_error_logs_00047 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00047 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00047 VALUES (NEW.*);

/* data_manager_error_logs_00048 */
CREATE TABLE data_manager_error_logs_00048 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00048 ADD CONSTRAINT dmel_00048_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00048 ADD CONSTRAINT dmel_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX dmel_00048_dmml_id_idx ON data_manager_error_logs_00048 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00048 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00048 VALUES (NEW.*);

/* data_manager_error_logs_00049 */
CREATE TABLE data_manager_error_logs_00049 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00049 ADD CONSTRAINT dmel_00049_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00049 ADD CONSTRAINT dmel_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX dmel_00049_dmml_id_idx ON data_manager_error_logs_00049 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00049 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00049 VALUES (NEW.*);

/* data_manager_error_logs_00050 */
CREATE TABLE data_manager_error_logs_00050 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00050 ADD CONSTRAINT dmel_00050_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00050 ADD CONSTRAINT dmel_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX dmel_00050_dmml_id_idx ON data_manager_error_logs_00050 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00050 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00050 VALUES (NEW.*);

/* data_manager_error_logs_00051 */
CREATE TABLE data_manager_error_logs_00051 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00051 ADD CONSTRAINT dmel_00051_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00051 ADD CONSTRAINT dmel_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX dmel_00051_dmml_id_idx ON data_manager_error_logs_00051 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00051 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00051 VALUES (NEW.*);

/* data_manager_error_logs_00052 */
CREATE TABLE data_manager_error_logs_00052 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00052 ADD CONSTRAINT dmel_00052_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00052 ADD CONSTRAINT dmel_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX dmel_00052_dmml_id_idx ON data_manager_error_logs_00052 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00052 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00052 VALUES (NEW.*);

/* data_manager_error_logs_00053 */
CREATE TABLE data_manager_error_logs_00053 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00053 ADD CONSTRAINT dmel_00053_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00053 ADD CONSTRAINT dmel_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX dmel_00053_dmml_id_idx ON data_manager_error_logs_00053 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00053 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00053 VALUES (NEW.*);

/* data_manager_error_logs_00054 */
CREATE TABLE data_manager_error_logs_00054 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00054 ADD CONSTRAINT dmel_00054_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00054 ADD CONSTRAINT dmel_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX dmel_00054_dmml_id_idx ON data_manager_error_logs_00054 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00054 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00054 VALUES (NEW.*);

/* data_manager_error_logs_00055 */
CREATE TABLE data_manager_error_logs_00055 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00055 ADD CONSTRAINT dmel_00055_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00055 ADD CONSTRAINT dmel_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX dmel_00055_dmml_id_idx ON data_manager_error_logs_00055 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00055 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00055 VALUES (NEW.*);

/* data_manager_error_logs_00056 */
CREATE TABLE data_manager_error_logs_00056 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00056 ADD CONSTRAINT dmel_00056_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00056 ADD CONSTRAINT dmel_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX dmel_00056_dmml_id_idx ON data_manager_error_logs_00056 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00056 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00056 VALUES (NEW.*);

/* data_manager_error_logs_00057 */
CREATE TABLE data_manager_error_logs_00057 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00057 ADD CONSTRAINT dmel_00057_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00057 ADD CONSTRAINT dmel_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX dmel_00057_dmml_id_idx ON data_manager_error_logs_00057 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00057 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00057 VALUES (NEW.*);

/* data_manager_error_logs_00058 */
CREATE TABLE data_manager_error_logs_00058 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00058 ADD CONSTRAINT dmel_00058_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00058 ADD CONSTRAINT dmel_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX dmel_00058_dmml_id_idx ON data_manager_error_logs_00058 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00058 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00058 VALUES (NEW.*);

/* data_manager_error_logs_00059 */
CREATE TABLE data_manager_error_logs_00059 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00059 ADD CONSTRAINT dmel_00059_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00059 ADD CONSTRAINT dmel_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX dmel_00059_dmml_id_idx ON data_manager_error_logs_00059 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00059 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00059 VALUES (NEW.*);

/* data_manager_error_logs_00060 */
CREATE TABLE data_manager_error_logs_00060 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00060 ADD CONSTRAINT dmel_00060_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00060 ADD CONSTRAINT dmel_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX dmel_00060_dmml_id_idx ON data_manager_error_logs_00060 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00060 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00060 VALUES (NEW.*);

/* data_manager_error_logs_00061 */
CREATE TABLE data_manager_error_logs_00061 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00061 ADD CONSTRAINT dmel_00061_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00061 ADD CONSTRAINT dmel_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX dmel_00061_dmml_id_idx ON data_manager_error_logs_00061 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00061 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00061 VALUES (NEW.*);

/* data_manager_error_logs_00062 */
CREATE TABLE data_manager_error_logs_00062 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00062 ADD CONSTRAINT dmel_00062_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00062 ADD CONSTRAINT dmel_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX dmel_00062_dmml_id_idx ON data_manager_error_logs_00062 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00062 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00062 VALUES (NEW.*);

/* data_manager_error_logs_00063 */
CREATE TABLE data_manager_error_logs_00063 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00063 ADD CONSTRAINT dmel_00063_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00063 ADD CONSTRAINT dmel_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX dmel_00063_dmml_id_idx ON data_manager_error_logs_00063 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00063 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00063 VALUES (NEW.*);

/* data_manager_error_logs_00064 */
CREATE TABLE data_manager_error_logs_00064 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00064 ADD CONSTRAINT dmel_00064_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00064 ADD CONSTRAINT dmel_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX dmel_00064_dmml_id_idx ON data_manager_error_logs_00064 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00064 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00064 VALUES (NEW.*);

/* data_manager_error_logs_00065 */
CREATE TABLE data_manager_error_logs_00065 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00065 ADD CONSTRAINT dmel_00065_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00065 ADD CONSTRAINT dmel_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX dmel_00065_dmml_id_idx ON data_manager_error_logs_00065 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00065 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00065 VALUES (NEW.*);

/* data_manager_error_logs_00066 */
CREATE TABLE data_manager_error_logs_00066 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00066 ADD CONSTRAINT dmel_00066_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00066 ADD CONSTRAINT dmel_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX dmel_00066_dmml_id_idx ON data_manager_error_logs_00066 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00066 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00066 VALUES (NEW.*);

/* data_manager_error_logs_00067 */
CREATE TABLE data_manager_error_logs_00067 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00067 ADD CONSTRAINT dmel_00067_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00067 ADD CONSTRAINT dmel_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX dmel_00067_dmml_id_idx ON data_manager_error_logs_00067 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00067 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00067 VALUES (NEW.*);

/* data_manager_error_logs_00068 */
CREATE TABLE data_manager_error_logs_00068 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00068 ADD CONSTRAINT dmel_00068_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00068 ADD CONSTRAINT dmel_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX dmel_00068_dmml_id_idx ON data_manager_error_logs_00068 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00068 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00068 VALUES (NEW.*);

/* data_manager_error_logs_00069 */
CREATE TABLE data_manager_error_logs_00069 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00069 ADD CONSTRAINT dmel_00069_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00069 ADD CONSTRAINT dmel_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX dmel_00069_dmml_id_idx ON data_manager_error_logs_00069 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00069 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00069 VALUES (NEW.*);

/* data_manager_error_logs_00070 */
CREATE TABLE data_manager_error_logs_00070 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00070 ADD CONSTRAINT dmel_00070_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00070 ADD CONSTRAINT dmel_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX dmel_00070_dmml_id_idx ON data_manager_error_logs_00070 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00070 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00070 VALUES (NEW.*);

/* data_manager_error_logs_00071 */
CREATE TABLE data_manager_error_logs_00071 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00071 ADD CONSTRAINT dmel_00071_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00071 ADD CONSTRAINT dmel_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX dmel_00071_dmml_id_idx ON data_manager_error_logs_00071 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00071 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00071 VALUES (NEW.*);

/* data_manager_error_logs_00072 */
CREATE TABLE data_manager_error_logs_00072 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00072 ADD CONSTRAINT dmel_00072_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00072 ADD CONSTRAINT dmel_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX dmel_00072_dmml_id_idx ON data_manager_error_logs_00072 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00072 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00072 VALUES (NEW.*);

/* data_manager_error_logs_00073 */
CREATE TABLE data_manager_error_logs_00073 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00073 ADD CONSTRAINT dmel_00073_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00073 ADD CONSTRAINT dmel_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX dmel_00073_dmml_id_idx ON data_manager_error_logs_00073 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00073 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00073 VALUES (NEW.*);

/* data_manager_error_logs_00074 */
CREATE TABLE data_manager_error_logs_00074 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00074 ADD CONSTRAINT dmel_00074_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00074 ADD CONSTRAINT dmel_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX dmel_00074_dmml_id_idx ON data_manager_error_logs_00074 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00074 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00074 VALUES (NEW.*);

/* data_manager_error_logs_00075 */
CREATE TABLE data_manager_error_logs_00075 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00075 ADD CONSTRAINT dmel_00075_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00075 ADD CONSTRAINT dmel_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX dmel_00075_dmml_id_idx ON data_manager_error_logs_00075 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00075 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00075 VALUES (NEW.*);

/* data_manager_error_logs_00076 */
CREATE TABLE data_manager_error_logs_00076 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00076 ADD CONSTRAINT dmel_00076_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00076 ADD CONSTRAINT dmel_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX dmel_00076_dmml_id_idx ON data_manager_error_logs_00076 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00076 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00076 VALUES (NEW.*);

/* data_manager_error_logs_00077 */
CREATE TABLE data_manager_error_logs_00077 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00077 ADD CONSTRAINT dmel_00077_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00077 ADD CONSTRAINT dmel_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX dmel_00077_dmml_id_idx ON data_manager_error_logs_00077 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00077 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00077 VALUES (NEW.*);

/* data_manager_error_logs_00078 */
CREATE TABLE data_manager_error_logs_00078 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00078 ADD CONSTRAINT dmel_00078_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00078 ADD CONSTRAINT dmel_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX dmel_00078_dmml_id_idx ON data_manager_error_logs_00078 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00078 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00078 VALUES (NEW.*);

/* data_manager_error_logs_00079 */
CREATE TABLE data_manager_error_logs_00079 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00079 ADD CONSTRAINT dmel_00079_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00079 ADD CONSTRAINT dmel_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX dmel_00079_dmml_id_idx ON data_manager_error_logs_00079 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00079 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00079 VALUES (NEW.*);

/* data_manager_error_logs_00080 */
CREATE TABLE data_manager_error_logs_00080 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00080 ADD CONSTRAINT dmel_00080_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00080 ADD CONSTRAINT dmel_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX dmel_00080_dmml_id_idx ON data_manager_error_logs_00080 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00080 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00080 VALUES (NEW.*);

/* data_manager_error_logs_00081 */
CREATE TABLE data_manager_error_logs_00081 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00081 ADD CONSTRAINT dmel_00081_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00081 ADD CONSTRAINT dmel_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX dmel_00081_dmml_id_idx ON data_manager_error_logs_00081 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00081 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00081 VALUES (NEW.*);

/* data_manager_error_logs_00082 */
CREATE TABLE data_manager_error_logs_00082 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00082 ADD CONSTRAINT dmel_00082_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00082 ADD CONSTRAINT dmel_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX dmel_00082_dmml_id_idx ON data_manager_error_logs_00082 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00082 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00082 VALUES (NEW.*);

/* data_manager_error_logs_00083 */
CREATE TABLE data_manager_error_logs_00083 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00083 ADD CONSTRAINT dmel_00083_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00083 ADD CONSTRAINT dmel_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX dmel_00083_dmml_id_idx ON data_manager_error_logs_00083 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00083 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00083 VALUES (NEW.*);

/* data_manager_error_logs_00084 */
CREATE TABLE data_manager_error_logs_00084 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00084 ADD CONSTRAINT dmel_00084_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00084 ADD CONSTRAINT dmel_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX dmel_00084_dmml_id_idx ON data_manager_error_logs_00084 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00084 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00084 VALUES (NEW.*);

/* data_manager_error_logs_00085 */
CREATE TABLE data_manager_error_logs_00085 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00085 ADD CONSTRAINT dmel_00085_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00085 ADD CONSTRAINT dmel_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX dmel_00085_dmml_id_idx ON data_manager_error_logs_00085 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00085 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00085 VALUES (NEW.*);

/* data_manager_error_logs_00086 */
CREATE TABLE data_manager_error_logs_00086 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00086 ADD CONSTRAINT dmel_00086_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00086 ADD CONSTRAINT dmel_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX dmel_00086_dmml_id_idx ON data_manager_error_logs_00086 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00086 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00086 VALUES (NEW.*);

/* data_manager_error_logs_00087 */
CREATE TABLE data_manager_error_logs_00087 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00087 ADD CONSTRAINT dmel_00087_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00087 ADD CONSTRAINT dmel_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX dmel_00087_dmml_id_idx ON data_manager_error_logs_00087 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00087 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00087 VALUES (NEW.*);

/* data_manager_error_logs_00088 */
CREATE TABLE data_manager_error_logs_00088 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00088 ADD CONSTRAINT dmel_00088_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00088 ADD CONSTRAINT dmel_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX dmel_00088_dmml_id_idx ON data_manager_error_logs_00088 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00088 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00088 VALUES (NEW.*);

/* data_manager_error_logs_00089 */
CREATE TABLE data_manager_error_logs_00089 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00089 ADD CONSTRAINT dmel_00089_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00089 ADD CONSTRAINT dmel_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX dmel_00089_dmml_id_idx ON data_manager_error_logs_00089 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00089 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00089 VALUES (NEW.*);

/* data_manager_error_logs_00090 */
CREATE TABLE data_manager_error_logs_00090 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00090 ADD CONSTRAINT dmel_00090_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00090 ADD CONSTRAINT dmel_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX dmel_00090_dmml_id_idx ON data_manager_error_logs_00090 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00090 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00090 VALUES (NEW.*);

/* data_manager_error_logs_00091 */
CREATE TABLE data_manager_error_logs_00091 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00091 ADD CONSTRAINT dmel_00091_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00091 ADD CONSTRAINT dmel_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX dmel_00091_dmml_id_idx ON data_manager_error_logs_00091 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00091 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00091 VALUES (NEW.*);

/* data_manager_error_logs_00092 */
CREATE TABLE data_manager_error_logs_00092 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00092 ADD CONSTRAINT dmel_00092_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00092 ADD CONSTRAINT dmel_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX dmel_00092_dmml_id_idx ON data_manager_error_logs_00092 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00092 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00092 VALUES (NEW.*);

/* data_manager_error_logs_00093 */
CREATE TABLE data_manager_error_logs_00093 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00093 ADD CONSTRAINT dmel_00093_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00093 ADD CONSTRAINT dmel_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX dmel_00093_dmml_id_idx ON data_manager_error_logs_00093 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00093 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00093 VALUES (NEW.*);

/* data_manager_error_logs_00094 */
CREATE TABLE data_manager_error_logs_00094 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00094 ADD CONSTRAINT dmel_00094_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00094 ADD CONSTRAINT dmel_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX dmel_00094_dmml_id_idx ON data_manager_error_logs_00094 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00094 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00094 VALUES (NEW.*);

/* data_manager_error_logs_00095 */
CREATE TABLE data_manager_error_logs_00095 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00095 ADD CONSTRAINT dmel_00095_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00095 ADD CONSTRAINT dmel_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX dmel_00095_dmml_id_idx ON data_manager_error_logs_00095 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00095 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00095 VALUES (NEW.*);

/* data_manager_error_logs_00096 */
CREATE TABLE data_manager_error_logs_00096 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00096 ADD CONSTRAINT dmel_00096_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00096 ADD CONSTRAINT dmel_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX dmel_00096_dmml_id_idx ON data_manager_error_logs_00096 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00096 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00096 VALUES (NEW.*);

/* data_manager_error_logs_00097 */
CREATE TABLE data_manager_error_logs_00097 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00097 ADD CONSTRAINT dmel_00097_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00097 ADD CONSTRAINT dmel_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX dmel_00097_dmml_id_idx ON data_manager_error_logs_00097 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00097 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00097 VALUES (NEW.*);

/* data_manager_error_logs_00098 */
CREATE TABLE data_manager_error_logs_00098 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00098 ADD CONSTRAINT dmel_00098_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00098 ADD CONSTRAINT dmel_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX dmel_00098_dmml_id_idx ON data_manager_error_logs_00098 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00098 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00098 VALUES (NEW.*);

/* data_manager_error_logs_00099 */
CREATE TABLE data_manager_error_logs_00099 ( ) INHERITS (data_manager_error_logs);
ALTER TABLE data_manager_error_logs_00099 ADD CONSTRAINT dmel_00099_pk PRIMARY KEY (id);
ALTER TABLE data_manager_error_logs_00099 ADD CONSTRAINT dmel_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX dmel_00099_dmml_id_idx ON data_manager_error_logs_00099 USING btree (data_manager_message_log_id);
CREATE RULE  data_manager_error_logs_00099 AS ON
INSERT TO data_manager_error_logs WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO data_manager_error_logs_00099 VALUES (NEW.*);

/* data_manager_message_logs_00000 */
CREATE TABLE data_manager_message_logs_00000 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00000 ADD CONSTRAINT dmml_00000_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00000 ADD CONSTRAINT dmml_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX dmml_00000_pmi_idx ON data_manager_message_logs_00000 USING btree (previous_message_id);
CREATE INDEX dmml_00000_rkdi_idx ON data_manager_message_logs_00000 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00000_hmb_idx ON data_manager_message_logs_00000 USING btree (handle_message_begin);
CREATE INDEX dmml_00000_eli_idx ON data_manager_message_logs_00000 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00000 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00000 VALUES (NEW.*);

/* data_manager_message_logs_00001 */
CREATE TABLE data_manager_message_logs_00001 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00001 ADD CONSTRAINT dmml_00001_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00001 ADD CONSTRAINT dmml_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX dmml_00001_pmi_idx ON data_manager_message_logs_00001 USING btree (previous_message_id);
CREATE INDEX dmml_00001_rkdi_idx ON data_manager_message_logs_00001 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00001_hmb_idx ON data_manager_message_logs_00001 USING btree (handle_message_begin);
CREATE INDEX dmml_00001_eli_idx ON data_manager_message_logs_00001 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00001 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00001 VALUES (NEW.*);

/* data_manager_message_logs_00002 */
CREATE TABLE data_manager_message_logs_00002 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00002 ADD CONSTRAINT dmml_00002_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00002 ADD CONSTRAINT dmml_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX dmml_00002_pmi_idx ON data_manager_message_logs_00002 USING btree (previous_message_id);
CREATE INDEX dmml_00002_rkdi_idx ON data_manager_message_logs_00002 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00002_hmb_idx ON data_manager_message_logs_00002 USING btree (handle_message_begin);
CREATE INDEX dmml_00002_eli_idx ON data_manager_message_logs_00002 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00002 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00002 VALUES (NEW.*);

/* data_manager_message_logs_00003 */
CREATE TABLE data_manager_message_logs_00003 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00003 ADD CONSTRAINT dmml_00003_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00003 ADD CONSTRAINT dmml_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX dmml_00003_pmi_idx ON data_manager_message_logs_00003 USING btree (previous_message_id);
CREATE INDEX dmml_00003_rkdi_idx ON data_manager_message_logs_00003 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00003_hmb_idx ON data_manager_message_logs_00003 USING btree (handle_message_begin);
CREATE INDEX dmml_00003_eli_idx ON data_manager_message_logs_00003 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00003 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00003 VALUES (NEW.*);

/* data_manager_message_logs_00004 */
CREATE TABLE data_manager_message_logs_00004 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00004 ADD CONSTRAINT dmml_00004_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00004 ADD CONSTRAINT dmml_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX dmml_00004_pmi_idx ON data_manager_message_logs_00004 USING btree (previous_message_id);
CREATE INDEX dmml_00004_rkdi_idx ON data_manager_message_logs_00004 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00004_hmb_idx ON data_manager_message_logs_00004 USING btree (handle_message_begin);
CREATE INDEX dmml_00004_eli_idx ON data_manager_message_logs_00004 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00004 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00004 VALUES (NEW.*);

/* data_manager_message_logs_00005 */
CREATE TABLE data_manager_message_logs_00005 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00005 ADD CONSTRAINT dmml_00005_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00005 ADD CONSTRAINT dmml_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX dmml_00005_pmi_idx ON data_manager_message_logs_00005 USING btree (previous_message_id);
CREATE INDEX dmml_00005_rkdi_idx ON data_manager_message_logs_00005 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00005_hmb_idx ON data_manager_message_logs_00005 USING btree (handle_message_begin);
CREATE INDEX dmml_00005_eli_idx ON data_manager_message_logs_00005 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00005 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00005 VALUES (NEW.*);

/* data_manager_message_logs_00006 */
CREATE TABLE data_manager_message_logs_00006 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00006 ADD CONSTRAINT dmml_00006_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00006 ADD CONSTRAINT dmml_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX dmml_00006_pmi_idx ON data_manager_message_logs_00006 USING btree (previous_message_id);
CREATE INDEX dmml_00006_rkdi_idx ON data_manager_message_logs_00006 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00006_hmb_idx ON data_manager_message_logs_00006 USING btree (handle_message_begin);
CREATE INDEX dmml_00006_eli_idx ON data_manager_message_logs_00006 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00006 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00006 VALUES (NEW.*);

/* data_manager_message_logs_00007 */
CREATE TABLE data_manager_message_logs_00007 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00007 ADD CONSTRAINT dmml_00007_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00007 ADD CONSTRAINT dmml_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX dmml_00007_pmi_idx ON data_manager_message_logs_00007 USING btree (previous_message_id);
CREATE INDEX dmml_00007_rkdi_idx ON data_manager_message_logs_00007 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00007_hmb_idx ON data_manager_message_logs_00007 USING btree (handle_message_begin);
CREATE INDEX dmml_00007_eli_idx ON data_manager_message_logs_00007 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00007 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00007 VALUES (NEW.*);

/* data_manager_message_logs_00008 */
CREATE TABLE data_manager_message_logs_00008 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00008 ADD CONSTRAINT dmml_00008_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00008 ADD CONSTRAINT dmml_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX dmml_00008_pmi_idx ON data_manager_message_logs_00008 USING btree (previous_message_id);
CREATE INDEX dmml_00008_rkdi_idx ON data_manager_message_logs_00008 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00008_hmb_idx ON data_manager_message_logs_00008 USING btree (handle_message_begin);
CREATE INDEX dmml_00008_eli_idx ON data_manager_message_logs_00008 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00008 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00008 VALUES (NEW.*);

/* data_manager_message_logs_00009 */
CREATE TABLE data_manager_message_logs_00009 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00009 ADD CONSTRAINT dmml_00009_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00009 ADD CONSTRAINT dmml_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX dmml_00009_pmi_idx ON data_manager_message_logs_00009 USING btree (previous_message_id);
CREATE INDEX dmml_00009_rkdi_idx ON data_manager_message_logs_00009 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00009_hmb_idx ON data_manager_message_logs_00009 USING btree (handle_message_begin);
CREATE INDEX dmml_00009_eli_idx ON data_manager_message_logs_00009 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00009 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00009 VALUES (NEW.*);

/* data_manager_message_logs_00010 */
CREATE TABLE data_manager_message_logs_00010 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00010 ADD CONSTRAINT dmml_00010_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00010 ADD CONSTRAINT dmml_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX dmml_00010_pmi_idx ON data_manager_message_logs_00010 USING btree (previous_message_id);
CREATE INDEX dmml_00010_rkdi_idx ON data_manager_message_logs_00010 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00010_hmb_idx ON data_manager_message_logs_00010 USING btree (handle_message_begin);
CREATE INDEX dmml_00010_eli_idx ON data_manager_message_logs_00010 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00010 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00010 VALUES (NEW.*);

/* data_manager_message_logs_00011 */
CREATE TABLE data_manager_message_logs_00011 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00011 ADD CONSTRAINT dmml_00011_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00011 ADD CONSTRAINT dmml_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX dmml_00011_pmi_idx ON data_manager_message_logs_00011 USING btree (previous_message_id);
CREATE INDEX dmml_00011_rkdi_idx ON data_manager_message_logs_00011 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00011_hmb_idx ON data_manager_message_logs_00011 USING btree (handle_message_begin);
CREATE INDEX dmml_00011_eli_idx ON data_manager_message_logs_00011 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00011 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00011 VALUES (NEW.*);

/* data_manager_message_logs_00012 */
CREATE TABLE data_manager_message_logs_00012 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00012 ADD CONSTRAINT dmml_00012_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00012 ADD CONSTRAINT dmml_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX dmml_00012_pmi_idx ON data_manager_message_logs_00012 USING btree (previous_message_id);
CREATE INDEX dmml_00012_rkdi_idx ON data_manager_message_logs_00012 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00012_hmb_idx ON data_manager_message_logs_00012 USING btree (handle_message_begin);
CREATE INDEX dmml_00012_eli_idx ON data_manager_message_logs_00012 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00012 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00012 VALUES (NEW.*);

/* data_manager_message_logs_00013 */
CREATE TABLE data_manager_message_logs_00013 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00013 ADD CONSTRAINT dmml_00013_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00013 ADD CONSTRAINT dmml_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX dmml_00013_pmi_idx ON data_manager_message_logs_00013 USING btree (previous_message_id);
CREATE INDEX dmml_00013_rkdi_idx ON data_manager_message_logs_00013 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00013_hmb_idx ON data_manager_message_logs_00013 USING btree (handle_message_begin);
CREATE INDEX dmml_00013_eli_idx ON data_manager_message_logs_00013 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00013 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00013 VALUES (NEW.*);

/* data_manager_message_logs_00014 */
CREATE TABLE data_manager_message_logs_00014 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00014 ADD CONSTRAINT dmml_00014_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00014 ADD CONSTRAINT dmml_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX dmml_00014_pmi_idx ON data_manager_message_logs_00014 USING btree (previous_message_id);
CREATE INDEX dmml_00014_rkdi_idx ON data_manager_message_logs_00014 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00014_hmb_idx ON data_manager_message_logs_00014 USING btree (handle_message_begin);
CREATE INDEX dmml_00014_eli_idx ON data_manager_message_logs_00014 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00014 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00014 VALUES (NEW.*);

/* data_manager_message_logs_00015 */
CREATE TABLE data_manager_message_logs_00015 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00015 ADD CONSTRAINT dmml_00015_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00015 ADD CONSTRAINT dmml_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX dmml_00015_pmi_idx ON data_manager_message_logs_00015 USING btree (previous_message_id);
CREATE INDEX dmml_00015_rkdi_idx ON data_manager_message_logs_00015 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00015_hmb_idx ON data_manager_message_logs_00015 USING btree (handle_message_begin);
CREATE INDEX dmml_00015_eli_idx ON data_manager_message_logs_00015 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00015 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00015 VALUES (NEW.*);

/* data_manager_message_logs_00016 */
CREATE TABLE data_manager_message_logs_00016 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00016 ADD CONSTRAINT dmml_00016_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00016 ADD CONSTRAINT dmml_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX dmml_00016_pmi_idx ON data_manager_message_logs_00016 USING btree (previous_message_id);
CREATE INDEX dmml_00016_rkdi_idx ON data_manager_message_logs_00016 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00016_hmb_idx ON data_manager_message_logs_00016 USING btree (handle_message_begin);
CREATE INDEX dmml_00016_eli_idx ON data_manager_message_logs_00016 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00016 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00016 VALUES (NEW.*);

/* data_manager_message_logs_00017 */
CREATE TABLE data_manager_message_logs_00017 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00017 ADD CONSTRAINT dmml_00017_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00017 ADD CONSTRAINT dmml_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX dmml_00017_pmi_idx ON data_manager_message_logs_00017 USING btree (previous_message_id);
CREATE INDEX dmml_00017_rkdi_idx ON data_manager_message_logs_00017 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00017_hmb_idx ON data_manager_message_logs_00017 USING btree (handle_message_begin);
CREATE INDEX dmml_00017_eli_idx ON data_manager_message_logs_00017 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00017 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00017 VALUES (NEW.*);

/* data_manager_message_logs_00018 */
CREATE TABLE data_manager_message_logs_00018 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00018 ADD CONSTRAINT dmml_00018_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00018 ADD CONSTRAINT dmml_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX dmml_00018_pmi_idx ON data_manager_message_logs_00018 USING btree (previous_message_id);
CREATE INDEX dmml_00018_rkdi_idx ON data_manager_message_logs_00018 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00018_hmb_idx ON data_manager_message_logs_00018 USING btree (handle_message_begin);
CREATE INDEX dmml_00018_eli_idx ON data_manager_message_logs_00018 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00018 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00018 VALUES (NEW.*);

/* data_manager_message_logs_00019 */
CREATE TABLE data_manager_message_logs_00019 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00019 ADD CONSTRAINT dmml_00019_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00019 ADD CONSTRAINT dmml_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX dmml_00019_pmi_idx ON data_manager_message_logs_00019 USING btree (previous_message_id);
CREATE INDEX dmml_00019_rkdi_idx ON data_manager_message_logs_00019 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00019_hmb_idx ON data_manager_message_logs_00019 USING btree (handle_message_begin);
CREATE INDEX dmml_00019_eli_idx ON data_manager_message_logs_00019 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00019 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00019 VALUES (NEW.*);

/* data_manager_message_logs_00020 */
CREATE TABLE data_manager_message_logs_00020 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00020 ADD CONSTRAINT dmml_00020_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00020 ADD CONSTRAINT dmml_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX dmml_00020_pmi_idx ON data_manager_message_logs_00020 USING btree (previous_message_id);
CREATE INDEX dmml_00020_rkdi_idx ON data_manager_message_logs_00020 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00020_hmb_idx ON data_manager_message_logs_00020 USING btree (handle_message_begin);
CREATE INDEX dmml_00020_eli_idx ON data_manager_message_logs_00020 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00020 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00020 VALUES (NEW.*);

/* data_manager_message_logs_00021 */
CREATE TABLE data_manager_message_logs_00021 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00021 ADD CONSTRAINT dmml_00021_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00021 ADD CONSTRAINT dmml_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX dmml_00021_pmi_idx ON data_manager_message_logs_00021 USING btree (previous_message_id);
CREATE INDEX dmml_00021_rkdi_idx ON data_manager_message_logs_00021 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00021_hmb_idx ON data_manager_message_logs_00021 USING btree (handle_message_begin);
CREATE INDEX dmml_00021_eli_idx ON data_manager_message_logs_00021 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00021 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00021 VALUES (NEW.*);

/* data_manager_message_logs_00022 */
CREATE TABLE data_manager_message_logs_00022 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00022 ADD CONSTRAINT dmml_00022_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00022 ADD CONSTRAINT dmml_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX dmml_00022_pmi_idx ON data_manager_message_logs_00022 USING btree (previous_message_id);
CREATE INDEX dmml_00022_rkdi_idx ON data_manager_message_logs_00022 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00022_hmb_idx ON data_manager_message_logs_00022 USING btree (handle_message_begin);
CREATE INDEX dmml_00022_eli_idx ON data_manager_message_logs_00022 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00022 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00022 VALUES (NEW.*);

/* data_manager_message_logs_00023 */
CREATE TABLE data_manager_message_logs_00023 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00023 ADD CONSTRAINT dmml_00023_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00023 ADD CONSTRAINT dmml_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX dmml_00023_pmi_idx ON data_manager_message_logs_00023 USING btree (previous_message_id);
CREATE INDEX dmml_00023_rkdi_idx ON data_manager_message_logs_00023 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00023_hmb_idx ON data_manager_message_logs_00023 USING btree (handle_message_begin);
CREATE INDEX dmml_00023_eli_idx ON data_manager_message_logs_00023 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00023 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00023 VALUES (NEW.*);

/* data_manager_message_logs_00024 */
CREATE TABLE data_manager_message_logs_00024 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00024 ADD CONSTRAINT dmml_00024_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00024 ADD CONSTRAINT dmml_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX dmml_00024_pmi_idx ON data_manager_message_logs_00024 USING btree (previous_message_id);
CREATE INDEX dmml_00024_rkdi_idx ON data_manager_message_logs_00024 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00024_hmb_idx ON data_manager_message_logs_00024 USING btree (handle_message_begin);
CREATE INDEX dmml_00024_eli_idx ON data_manager_message_logs_00024 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00024 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00024 VALUES (NEW.*);

/* data_manager_message_logs_00025 */
CREATE TABLE data_manager_message_logs_00025 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00025 ADD CONSTRAINT dmml_00025_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00025 ADD CONSTRAINT dmml_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX dmml_00025_pmi_idx ON data_manager_message_logs_00025 USING btree (previous_message_id);
CREATE INDEX dmml_00025_rkdi_idx ON data_manager_message_logs_00025 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00025_hmb_idx ON data_manager_message_logs_00025 USING btree (handle_message_begin);
CREATE INDEX dmml_00025_eli_idx ON data_manager_message_logs_00025 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00025 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00025 VALUES (NEW.*);

/* data_manager_message_logs_00026 */
CREATE TABLE data_manager_message_logs_00026 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00026 ADD CONSTRAINT dmml_00026_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00026 ADD CONSTRAINT dmml_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX dmml_00026_pmi_idx ON data_manager_message_logs_00026 USING btree (previous_message_id);
CREATE INDEX dmml_00026_rkdi_idx ON data_manager_message_logs_00026 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00026_hmb_idx ON data_manager_message_logs_00026 USING btree (handle_message_begin);
CREATE INDEX dmml_00026_eli_idx ON data_manager_message_logs_00026 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00026 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00026 VALUES (NEW.*);

/* data_manager_message_logs_00027 */
CREATE TABLE data_manager_message_logs_00027 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00027 ADD CONSTRAINT dmml_00027_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00027 ADD CONSTRAINT dmml_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX dmml_00027_pmi_idx ON data_manager_message_logs_00027 USING btree (previous_message_id);
CREATE INDEX dmml_00027_rkdi_idx ON data_manager_message_logs_00027 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00027_hmb_idx ON data_manager_message_logs_00027 USING btree (handle_message_begin);
CREATE INDEX dmml_00027_eli_idx ON data_manager_message_logs_00027 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00027 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00027 VALUES (NEW.*);

/* data_manager_message_logs_00028 */
CREATE TABLE data_manager_message_logs_00028 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00028 ADD CONSTRAINT dmml_00028_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00028 ADD CONSTRAINT dmml_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX dmml_00028_pmi_idx ON data_manager_message_logs_00028 USING btree (previous_message_id);
CREATE INDEX dmml_00028_rkdi_idx ON data_manager_message_logs_00028 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00028_hmb_idx ON data_manager_message_logs_00028 USING btree (handle_message_begin);
CREATE INDEX dmml_00028_eli_idx ON data_manager_message_logs_00028 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00028 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00028 VALUES (NEW.*);

/* data_manager_message_logs_00029 */
CREATE TABLE data_manager_message_logs_00029 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00029 ADD CONSTRAINT dmml_00029_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00029 ADD CONSTRAINT dmml_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX dmml_00029_pmi_idx ON data_manager_message_logs_00029 USING btree (previous_message_id);
CREATE INDEX dmml_00029_rkdi_idx ON data_manager_message_logs_00029 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00029_hmb_idx ON data_manager_message_logs_00029 USING btree (handle_message_begin);
CREATE INDEX dmml_00029_eli_idx ON data_manager_message_logs_00029 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00029 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00029 VALUES (NEW.*);

/* data_manager_message_logs_00030 */
CREATE TABLE data_manager_message_logs_00030 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00030 ADD CONSTRAINT dmml_00030_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00030 ADD CONSTRAINT dmml_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX dmml_00030_pmi_idx ON data_manager_message_logs_00030 USING btree (previous_message_id);
CREATE INDEX dmml_00030_rkdi_idx ON data_manager_message_logs_00030 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00030_hmb_idx ON data_manager_message_logs_00030 USING btree (handle_message_begin);
CREATE INDEX dmml_00030_eli_idx ON data_manager_message_logs_00030 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00030 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00030 VALUES (NEW.*);

/* data_manager_message_logs_00031 */
CREATE TABLE data_manager_message_logs_00031 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00031 ADD CONSTRAINT dmml_00031_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00031 ADD CONSTRAINT dmml_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX dmml_00031_pmi_idx ON data_manager_message_logs_00031 USING btree (previous_message_id);
CREATE INDEX dmml_00031_rkdi_idx ON data_manager_message_logs_00031 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00031_hmb_idx ON data_manager_message_logs_00031 USING btree (handle_message_begin);
CREATE INDEX dmml_00031_eli_idx ON data_manager_message_logs_00031 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00031 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00031 VALUES (NEW.*);

/* data_manager_message_logs_00032 */
CREATE TABLE data_manager_message_logs_00032 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00032 ADD CONSTRAINT dmml_00032_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00032 ADD CONSTRAINT dmml_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX dmml_00032_pmi_idx ON data_manager_message_logs_00032 USING btree (previous_message_id);
CREATE INDEX dmml_00032_rkdi_idx ON data_manager_message_logs_00032 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00032_hmb_idx ON data_manager_message_logs_00032 USING btree (handle_message_begin);
CREATE INDEX dmml_00032_eli_idx ON data_manager_message_logs_00032 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00032 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00032 VALUES (NEW.*);

/* data_manager_message_logs_00033 */
CREATE TABLE data_manager_message_logs_00033 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00033 ADD CONSTRAINT dmml_00033_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00033 ADD CONSTRAINT dmml_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX dmml_00033_pmi_idx ON data_manager_message_logs_00033 USING btree (previous_message_id);
CREATE INDEX dmml_00033_rkdi_idx ON data_manager_message_logs_00033 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00033_hmb_idx ON data_manager_message_logs_00033 USING btree (handle_message_begin);
CREATE INDEX dmml_00033_eli_idx ON data_manager_message_logs_00033 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00033 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00033 VALUES (NEW.*);

/* data_manager_message_logs_00034 */
CREATE TABLE data_manager_message_logs_00034 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00034 ADD CONSTRAINT dmml_00034_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00034 ADD CONSTRAINT dmml_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX dmml_00034_pmi_idx ON data_manager_message_logs_00034 USING btree (previous_message_id);
CREATE INDEX dmml_00034_rkdi_idx ON data_manager_message_logs_00034 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00034_hmb_idx ON data_manager_message_logs_00034 USING btree (handle_message_begin);
CREATE INDEX dmml_00034_eli_idx ON data_manager_message_logs_00034 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00034 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00034 VALUES (NEW.*);

/* data_manager_message_logs_00035 */
CREATE TABLE data_manager_message_logs_00035 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00035 ADD CONSTRAINT dmml_00035_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00035 ADD CONSTRAINT dmml_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX dmml_00035_pmi_idx ON data_manager_message_logs_00035 USING btree (previous_message_id);
CREATE INDEX dmml_00035_rkdi_idx ON data_manager_message_logs_00035 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00035_hmb_idx ON data_manager_message_logs_00035 USING btree (handle_message_begin);
CREATE INDEX dmml_00035_eli_idx ON data_manager_message_logs_00035 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00035 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00035 VALUES (NEW.*);

/* data_manager_message_logs_00036 */
CREATE TABLE data_manager_message_logs_00036 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00036 ADD CONSTRAINT dmml_00036_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00036 ADD CONSTRAINT dmml_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX dmml_00036_pmi_idx ON data_manager_message_logs_00036 USING btree (previous_message_id);
CREATE INDEX dmml_00036_rkdi_idx ON data_manager_message_logs_00036 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00036_hmb_idx ON data_manager_message_logs_00036 USING btree (handle_message_begin);
CREATE INDEX dmml_00036_eli_idx ON data_manager_message_logs_00036 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00036 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00036 VALUES (NEW.*);

/* data_manager_message_logs_00037 */
CREATE TABLE data_manager_message_logs_00037 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00037 ADD CONSTRAINT dmml_00037_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00037 ADD CONSTRAINT dmml_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX dmml_00037_pmi_idx ON data_manager_message_logs_00037 USING btree (previous_message_id);
CREATE INDEX dmml_00037_rkdi_idx ON data_manager_message_logs_00037 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00037_hmb_idx ON data_manager_message_logs_00037 USING btree (handle_message_begin);
CREATE INDEX dmml_00037_eli_idx ON data_manager_message_logs_00037 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00037 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00037 VALUES (NEW.*);

/* data_manager_message_logs_00038 */
CREATE TABLE data_manager_message_logs_00038 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00038 ADD CONSTRAINT dmml_00038_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00038 ADD CONSTRAINT dmml_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX dmml_00038_pmi_idx ON data_manager_message_logs_00038 USING btree (previous_message_id);
CREATE INDEX dmml_00038_rkdi_idx ON data_manager_message_logs_00038 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00038_hmb_idx ON data_manager_message_logs_00038 USING btree (handle_message_begin);
CREATE INDEX dmml_00038_eli_idx ON data_manager_message_logs_00038 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00038 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00038 VALUES (NEW.*);

/* data_manager_message_logs_00039 */
CREATE TABLE data_manager_message_logs_00039 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00039 ADD CONSTRAINT dmml_00039_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00039 ADD CONSTRAINT dmml_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX dmml_00039_pmi_idx ON data_manager_message_logs_00039 USING btree (previous_message_id);
CREATE INDEX dmml_00039_rkdi_idx ON data_manager_message_logs_00039 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00039_hmb_idx ON data_manager_message_logs_00039 USING btree (handle_message_begin);
CREATE INDEX dmml_00039_eli_idx ON data_manager_message_logs_00039 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00039 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00039 VALUES (NEW.*);

/* data_manager_message_logs_00040 */
CREATE TABLE data_manager_message_logs_00040 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00040 ADD CONSTRAINT dmml_00040_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00040 ADD CONSTRAINT dmml_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX dmml_00040_pmi_idx ON data_manager_message_logs_00040 USING btree (previous_message_id);
CREATE INDEX dmml_00040_rkdi_idx ON data_manager_message_logs_00040 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00040_hmb_idx ON data_manager_message_logs_00040 USING btree (handle_message_begin);
CREATE INDEX dmml_00040_eli_idx ON data_manager_message_logs_00040 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00040 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00040 VALUES (NEW.*);

/* data_manager_message_logs_00041 */
CREATE TABLE data_manager_message_logs_00041 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00041 ADD CONSTRAINT dmml_00041_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00041 ADD CONSTRAINT dmml_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX dmml_00041_pmi_idx ON data_manager_message_logs_00041 USING btree (previous_message_id);
CREATE INDEX dmml_00041_rkdi_idx ON data_manager_message_logs_00041 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00041_hmb_idx ON data_manager_message_logs_00041 USING btree (handle_message_begin);
CREATE INDEX dmml_00041_eli_idx ON data_manager_message_logs_00041 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00041 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00041 VALUES (NEW.*);

/* data_manager_message_logs_00042 */
CREATE TABLE data_manager_message_logs_00042 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00042 ADD CONSTRAINT dmml_00042_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00042 ADD CONSTRAINT dmml_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX dmml_00042_pmi_idx ON data_manager_message_logs_00042 USING btree (previous_message_id);
CREATE INDEX dmml_00042_rkdi_idx ON data_manager_message_logs_00042 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00042_hmb_idx ON data_manager_message_logs_00042 USING btree (handle_message_begin);
CREATE INDEX dmml_00042_eli_idx ON data_manager_message_logs_00042 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00042 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00042 VALUES (NEW.*);

/* data_manager_message_logs_00043 */
CREATE TABLE data_manager_message_logs_00043 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00043 ADD CONSTRAINT dmml_00043_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00043 ADD CONSTRAINT dmml_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX dmml_00043_pmi_idx ON data_manager_message_logs_00043 USING btree (previous_message_id);
CREATE INDEX dmml_00043_rkdi_idx ON data_manager_message_logs_00043 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00043_hmb_idx ON data_manager_message_logs_00043 USING btree (handle_message_begin);
CREATE INDEX dmml_00043_eli_idx ON data_manager_message_logs_00043 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00043 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00043 VALUES (NEW.*);

/* data_manager_message_logs_00044 */
CREATE TABLE data_manager_message_logs_00044 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00044 ADD CONSTRAINT dmml_00044_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00044 ADD CONSTRAINT dmml_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX dmml_00044_pmi_idx ON data_manager_message_logs_00044 USING btree (previous_message_id);
CREATE INDEX dmml_00044_rkdi_idx ON data_manager_message_logs_00044 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00044_hmb_idx ON data_manager_message_logs_00044 USING btree (handle_message_begin);
CREATE INDEX dmml_00044_eli_idx ON data_manager_message_logs_00044 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00044 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00044 VALUES (NEW.*);

/* data_manager_message_logs_00045 */
CREATE TABLE data_manager_message_logs_00045 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00045 ADD CONSTRAINT dmml_00045_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00045 ADD CONSTRAINT dmml_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX dmml_00045_pmi_idx ON data_manager_message_logs_00045 USING btree (previous_message_id);
CREATE INDEX dmml_00045_rkdi_idx ON data_manager_message_logs_00045 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00045_hmb_idx ON data_manager_message_logs_00045 USING btree (handle_message_begin);
CREATE INDEX dmml_00045_eli_idx ON data_manager_message_logs_00045 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00045 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00045 VALUES (NEW.*);

/* data_manager_message_logs_00046 */
CREATE TABLE data_manager_message_logs_00046 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00046 ADD CONSTRAINT dmml_00046_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00046 ADD CONSTRAINT dmml_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX dmml_00046_pmi_idx ON data_manager_message_logs_00046 USING btree (previous_message_id);
CREATE INDEX dmml_00046_rkdi_idx ON data_manager_message_logs_00046 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00046_hmb_idx ON data_manager_message_logs_00046 USING btree (handle_message_begin);
CREATE INDEX dmml_00046_eli_idx ON data_manager_message_logs_00046 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00046 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00046 VALUES (NEW.*);

/* data_manager_message_logs_00047 */
CREATE TABLE data_manager_message_logs_00047 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00047 ADD CONSTRAINT dmml_00047_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00047 ADD CONSTRAINT dmml_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX dmml_00047_pmi_idx ON data_manager_message_logs_00047 USING btree (previous_message_id);
CREATE INDEX dmml_00047_rkdi_idx ON data_manager_message_logs_00047 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00047_hmb_idx ON data_manager_message_logs_00047 USING btree (handle_message_begin);
CREATE INDEX dmml_00047_eli_idx ON data_manager_message_logs_00047 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00047 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00047 VALUES (NEW.*);

/* data_manager_message_logs_00048 */
CREATE TABLE data_manager_message_logs_00048 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00048 ADD CONSTRAINT dmml_00048_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00048 ADD CONSTRAINT dmml_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX dmml_00048_pmi_idx ON data_manager_message_logs_00048 USING btree (previous_message_id);
CREATE INDEX dmml_00048_rkdi_idx ON data_manager_message_logs_00048 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00048_hmb_idx ON data_manager_message_logs_00048 USING btree (handle_message_begin);
CREATE INDEX dmml_00048_eli_idx ON data_manager_message_logs_00048 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00048 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00048 VALUES (NEW.*);

/* data_manager_message_logs_00049 */
CREATE TABLE data_manager_message_logs_00049 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00049 ADD CONSTRAINT dmml_00049_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00049 ADD CONSTRAINT dmml_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX dmml_00049_pmi_idx ON data_manager_message_logs_00049 USING btree (previous_message_id);
CREATE INDEX dmml_00049_rkdi_idx ON data_manager_message_logs_00049 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00049_hmb_idx ON data_manager_message_logs_00049 USING btree (handle_message_begin);
CREATE INDEX dmml_00049_eli_idx ON data_manager_message_logs_00049 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00049 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00049 VALUES (NEW.*);

/* data_manager_message_logs_00050 */
CREATE TABLE data_manager_message_logs_00050 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00050 ADD CONSTRAINT dmml_00050_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00050 ADD CONSTRAINT dmml_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX dmml_00050_pmi_idx ON data_manager_message_logs_00050 USING btree (previous_message_id);
CREATE INDEX dmml_00050_rkdi_idx ON data_manager_message_logs_00050 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00050_hmb_idx ON data_manager_message_logs_00050 USING btree (handle_message_begin);
CREATE INDEX dmml_00050_eli_idx ON data_manager_message_logs_00050 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00050 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00050 VALUES (NEW.*);

/* data_manager_message_logs_00051 */
CREATE TABLE data_manager_message_logs_00051 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00051 ADD CONSTRAINT dmml_00051_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00051 ADD CONSTRAINT dmml_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX dmml_00051_pmi_idx ON data_manager_message_logs_00051 USING btree (previous_message_id);
CREATE INDEX dmml_00051_rkdi_idx ON data_manager_message_logs_00051 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00051_hmb_idx ON data_manager_message_logs_00051 USING btree (handle_message_begin);
CREATE INDEX dmml_00051_eli_idx ON data_manager_message_logs_00051 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00051 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00051 VALUES (NEW.*);

/* data_manager_message_logs_00052 */
CREATE TABLE data_manager_message_logs_00052 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00052 ADD CONSTRAINT dmml_00052_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00052 ADD CONSTRAINT dmml_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX dmml_00052_pmi_idx ON data_manager_message_logs_00052 USING btree (previous_message_id);
CREATE INDEX dmml_00052_rkdi_idx ON data_manager_message_logs_00052 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00052_hmb_idx ON data_manager_message_logs_00052 USING btree (handle_message_begin);
CREATE INDEX dmml_00052_eli_idx ON data_manager_message_logs_00052 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00052 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00052 VALUES (NEW.*);

/* data_manager_message_logs_00053 */
CREATE TABLE data_manager_message_logs_00053 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00053 ADD CONSTRAINT dmml_00053_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00053 ADD CONSTRAINT dmml_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX dmml_00053_pmi_idx ON data_manager_message_logs_00053 USING btree (previous_message_id);
CREATE INDEX dmml_00053_rkdi_idx ON data_manager_message_logs_00053 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00053_hmb_idx ON data_manager_message_logs_00053 USING btree (handle_message_begin);
CREATE INDEX dmml_00053_eli_idx ON data_manager_message_logs_00053 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00053 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00053 VALUES (NEW.*);

/* data_manager_message_logs_00054 */
CREATE TABLE data_manager_message_logs_00054 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00054 ADD CONSTRAINT dmml_00054_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00054 ADD CONSTRAINT dmml_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX dmml_00054_pmi_idx ON data_manager_message_logs_00054 USING btree (previous_message_id);
CREATE INDEX dmml_00054_rkdi_idx ON data_manager_message_logs_00054 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00054_hmb_idx ON data_manager_message_logs_00054 USING btree (handle_message_begin);
CREATE INDEX dmml_00054_eli_idx ON data_manager_message_logs_00054 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00054 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00054 VALUES (NEW.*);

/* data_manager_message_logs_00055 */
CREATE TABLE data_manager_message_logs_00055 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00055 ADD CONSTRAINT dmml_00055_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00055 ADD CONSTRAINT dmml_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX dmml_00055_pmi_idx ON data_manager_message_logs_00055 USING btree (previous_message_id);
CREATE INDEX dmml_00055_rkdi_idx ON data_manager_message_logs_00055 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00055_hmb_idx ON data_manager_message_logs_00055 USING btree (handle_message_begin);
CREATE INDEX dmml_00055_eli_idx ON data_manager_message_logs_00055 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00055 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00055 VALUES (NEW.*);

/* data_manager_message_logs_00056 */
CREATE TABLE data_manager_message_logs_00056 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00056 ADD CONSTRAINT dmml_00056_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00056 ADD CONSTRAINT dmml_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX dmml_00056_pmi_idx ON data_manager_message_logs_00056 USING btree (previous_message_id);
CREATE INDEX dmml_00056_rkdi_idx ON data_manager_message_logs_00056 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00056_hmb_idx ON data_manager_message_logs_00056 USING btree (handle_message_begin);
CREATE INDEX dmml_00056_eli_idx ON data_manager_message_logs_00056 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00056 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00056 VALUES (NEW.*);

/* data_manager_message_logs_00057 */
CREATE TABLE data_manager_message_logs_00057 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00057 ADD CONSTRAINT dmml_00057_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00057 ADD CONSTRAINT dmml_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX dmml_00057_pmi_idx ON data_manager_message_logs_00057 USING btree (previous_message_id);
CREATE INDEX dmml_00057_rkdi_idx ON data_manager_message_logs_00057 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00057_hmb_idx ON data_manager_message_logs_00057 USING btree (handle_message_begin);
CREATE INDEX dmml_00057_eli_idx ON data_manager_message_logs_00057 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00057 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00057 VALUES (NEW.*);

/* data_manager_message_logs_00058 */
CREATE TABLE data_manager_message_logs_00058 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00058 ADD CONSTRAINT dmml_00058_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00058 ADD CONSTRAINT dmml_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX dmml_00058_pmi_idx ON data_manager_message_logs_00058 USING btree (previous_message_id);
CREATE INDEX dmml_00058_rkdi_idx ON data_manager_message_logs_00058 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00058_hmb_idx ON data_manager_message_logs_00058 USING btree (handle_message_begin);
CREATE INDEX dmml_00058_eli_idx ON data_manager_message_logs_00058 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00058 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00058 VALUES (NEW.*);

/* data_manager_message_logs_00059 */
CREATE TABLE data_manager_message_logs_00059 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00059 ADD CONSTRAINT dmml_00059_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00059 ADD CONSTRAINT dmml_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX dmml_00059_pmi_idx ON data_manager_message_logs_00059 USING btree (previous_message_id);
CREATE INDEX dmml_00059_rkdi_idx ON data_manager_message_logs_00059 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00059_hmb_idx ON data_manager_message_logs_00059 USING btree (handle_message_begin);
CREATE INDEX dmml_00059_eli_idx ON data_manager_message_logs_00059 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00059 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00059 VALUES (NEW.*);

/* data_manager_message_logs_00060 */
CREATE TABLE data_manager_message_logs_00060 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00060 ADD CONSTRAINT dmml_00060_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00060 ADD CONSTRAINT dmml_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX dmml_00060_pmi_idx ON data_manager_message_logs_00060 USING btree (previous_message_id);
CREATE INDEX dmml_00060_rkdi_idx ON data_manager_message_logs_00060 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00060_hmb_idx ON data_manager_message_logs_00060 USING btree (handle_message_begin);
CREATE INDEX dmml_00060_eli_idx ON data_manager_message_logs_00060 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00060 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00060 VALUES (NEW.*);

/* data_manager_message_logs_00061 */
CREATE TABLE data_manager_message_logs_00061 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00061 ADD CONSTRAINT dmml_00061_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00061 ADD CONSTRAINT dmml_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX dmml_00061_pmi_idx ON data_manager_message_logs_00061 USING btree (previous_message_id);
CREATE INDEX dmml_00061_rkdi_idx ON data_manager_message_logs_00061 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00061_hmb_idx ON data_manager_message_logs_00061 USING btree (handle_message_begin);
CREATE INDEX dmml_00061_eli_idx ON data_manager_message_logs_00061 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00061 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00061 VALUES (NEW.*);

/* data_manager_message_logs_00062 */
CREATE TABLE data_manager_message_logs_00062 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00062 ADD CONSTRAINT dmml_00062_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00062 ADD CONSTRAINT dmml_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX dmml_00062_pmi_idx ON data_manager_message_logs_00062 USING btree (previous_message_id);
CREATE INDEX dmml_00062_rkdi_idx ON data_manager_message_logs_00062 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00062_hmb_idx ON data_manager_message_logs_00062 USING btree (handle_message_begin);
CREATE INDEX dmml_00062_eli_idx ON data_manager_message_logs_00062 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00062 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00062 VALUES (NEW.*);

/* data_manager_message_logs_00063 */
CREATE TABLE data_manager_message_logs_00063 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00063 ADD CONSTRAINT dmml_00063_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00063 ADD CONSTRAINT dmml_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX dmml_00063_pmi_idx ON data_manager_message_logs_00063 USING btree (previous_message_id);
CREATE INDEX dmml_00063_rkdi_idx ON data_manager_message_logs_00063 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00063_hmb_idx ON data_manager_message_logs_00063 USING btree (handle_message_begin);
CREATE INDEX dmml_00063_eli_idx ON data_manager_message_logs_00063 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00063 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00063 VALUES (NEW.*);

/* data_manager_message_logs_00064 */
CREATE TABLE data_manager_message_logs_00064 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00064 ADD CONSTRAINT dmml_00064_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00064 ADD CONSTRAINT dmml_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX dmml_00064_pmi_idx ON data_manager_message_logs_00064 USING btree (previous_message_id);
CREATE INDEX dmml_00064_rkdi_idx ON data_manager_message_logs_00064 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00064_hmb_idx ON data_manager_message_logs_00064 USING btree (handle_message_begin);
CREATE INDEX dmml_00064_eli_idx ON data_manager_message_logs_00064 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00064 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00064 VALUES (NEW.*);

/* data_manager_message_logs_00065 */
CREATE TABLE data_manager_message_logs_00065 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00065 ADD CONSTRAINT dmml_00065_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00065 ADD CONSTRAINT dmml_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX dmml_00065_pmi_idx ON data_manager_message_logs_00065 USING btree (previous_message_id);
CREATE INDEX dmml_00065_rkdi_idx ON data_manager_message_logs_00065 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00065_hmb_idx ON data_manager_message_logs_00065 USING btree (handle_message_begin);
CREATE INDEX dmml_00065_eli_idx ON data_manager_message_logs_00065 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00065 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00065 VALUES (NEW.*);

/* data_manager_message_logs_00066 */
CREATE TABLE data_manager_message_logs_00066 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00066 ADD CONSTRAINT dmml_00066_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00066 ADD CONSTRAINT dmml_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX dmml_00066_pmi_idx ON data_manager_message_logs_00066 USING btree (previous_message_id);
CREATE INDEX dmml_00066_rkdi_idx ON data_manager_message_logs_00066 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00066_hmb_idx ON data_manager_message_logs_00066 USING btree (handle_message_begin);
CREATE INDEX dmml_00066_eli_idx ON data_manager_message_logs_00066 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00066 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00066 VALUES (NEW.*);

/* data_manager_message_logs_00067 */
CREATE TABLE data_manager_message_logs_00067 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00067 ADD CONSTRAINT dmml_00067_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00067 ADD CONSTRAINT dmml_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX dmml_00067_pmi_idx ON data_manager_message_logs_00067 USING btree (previous_message_id);
CREATE INDEX dmml_00067_rkdi_idx ON data_manager_message_logs_00067 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00067_hmb_idx ON data_manager_message_logs_00067 USING btree (handle_message_begin);
CREATE INDEX dmml_00067_eli_idx ON data_manager_message_logs_00067 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00067 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00067 VALUES (NEW.*);

/* data_manager_message_logs_00068 */
CREATE TABLE data_manager_message_logs_00068 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00068 ADD CONSTRAINT dmml_00068_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00068 ADD CONSTRAINT dmml_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX dmml_00068_pmi_idx ON data_manager_message_logs_00068 USING btree (previous_message_id);
CREATE INDEX dmml_00068_rkdi_idx ON data_manager_message_logs_00068 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00068_hmb_idx ON data_manager_message_logs_00068 USING btree (handle_message_begin);
CREATE INDEX dmml_00068_eli_idx ON data_manager_message_logs_00068 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00068 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00068 VALUES (NEW.*);

/* data_manager_message_logs_00069 */
CREATE TABLE data_manager_message_logs_00069 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00069 ADD CONSTRAINT dmml_00069_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00069 ADD CONSTRAINT dmml_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX dmml_00069_pmi_idx ON data_manager_message_logs_00069 USING btree (previous_message_id);
CREATE INDEX dmml_00069_rkdi_idx ON data_manager_message_logs_00069 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00069_hmb_idx ON data_manager_message_logs_00069 USING btree (handle_message_begin);
CREATE INDEX dmml_00069_eli_idx ON data_manager_message_logs_00069 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00069 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00069 VALUES (NEW.*);

/* data_manager_message_logs_00070 */
CREATE TABLE data_manager_message_logs_00070 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00070 ADD CONSTRAINT dmml_00070_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00070 ADD CONSTRAINT dmml_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX dmml_00070_pmi_idx ON data_manager_message_logs_00070 USING btree (previous_message_id);
CREATE INDEX dmml_00070_rkdi_idx ON data_manager_message_logs_00070 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00070_hmb_idx ON data_manager_message_logs_00070 USING btree (handle_message_begin);
CREATE INDEX dmml_00070_eli_idx ON data_manager_message_logs_00070 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00070 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00070 VALUES (NEW.*);

/* data_manager_message_logs_00071 */
CREATE TABLE data_manager_message_logs_00071 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00071 ADD CONSTRAINT dmml_00071_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00071 ADD CONSTRAINT dmml_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX dmml_00071_pmi_idx ON data_manager_message_logs_00071 USING btree (previous_message_id);
CREATE INDEX dmml_00071_rkdi_idx ON data_manager_message_logs_00071 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00071_hmb_idx ON data_manager_message_logs_00071 USING btree (handle_message_begin);
CREATE INDEX dmml_00071_eli_idx ON data_manager_message_logs_00071 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00071 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00071 VALUES (NEW.*);

/* data_manager_message_logs_00072 */
CREATE TABLE data_manager_message_logs_00072 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00072 ADD CONSTRAINT dmml_00072_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00072 ADD CONSTRAINT dmml_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX dmml_00072_pmi_idx ON data_manager_message_logs_00072 USING btree (previous_message_id);
CREATE INDEX dmml_00072_rkdi_idx ON data_manager_message_logs_00072 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00072_hmb_idx ON data_manager_message_logs_00072 USING btree (handle_message_begin);
CREATE INDEX dmml_00072_eli_idx ON data_manager_message_logs_00072 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00072 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00072 VALUES (NEW.*);

/* data_manager_message_logs_00073 */
CREATE TABLE data_manager_message_logs_00073 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00073 ADD CONSTRAINT dmml_00073_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00073 ADD CONSTRAINT dmml_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX dmml_00073_pmi_idx ON data_manager_message_logs_00073 USING btree (previous_message_id);
CREATE INDEX dmml_00073_rkdi_idx ON data_manager_message_logs_00073 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00073_hmb_idx ON data_manager_message_logs_00073 USING btree (handle_message_begin);
CREATE INDEX dmml_00073_eli_idx ON data_manager_message_logs_00073 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00073 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00073 VALUES (NEW.*);

/* data_manager_message_logs_00074 */
CREATE TABLE data_manager_message_logs_00074 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00074 ADD CONSTRAINT dmml_00074_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00074 ADD CONSTRAINT dmml_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX dmml_00074_pmi_idx ON data_manager_message_logs_00074 USING btree (previous_message_id);
CREATE INDEX dmml_00074_rkdi_idx ON data_manager_message_logs_00074 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00074_hmb_idx ON data_manager_message_logs_00074 USING btree (handle_message_begin);
CREATE INDEX dmml_00074_eli_idx ON data_manager_message_logs_00074 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00074 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00074 VALUES (NEW.*);

/* data_manager_message_logs_00075 */
CREATE TABLE data_manager_message_logs_00075 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00075 ADD CONSTRAINT dmml_00075_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00075 ADD CONSTRAINT dmml_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX dmml_00075_pmi_idx ON data_manager_message_logs_00075 USING btree (previous_message_id);
CREATE INDEX dmml_00075_rkdi_idx ON data_manager_message_logs_00075 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00075_hmb_idx ON data_manager_message_logs_00075 USING btree (handle_message_begin);
CREATE INDEX dmml_00075_eli_idx ON data_manager_message_logs_00075 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00075 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00075 VALUES (NEW.*);

/* data_manager_message_logs_00076 */
CREATE TABLE data_manager_message_logs_00076 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00076 ADD CONSTRAINT dmml_00076_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00076 ADD CONSTRAINT dmml_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX dmml_00076_pmi_idx ON data_manager_message_logs_00076 USING btree (previous_message_id);
CREATE INDEX dmml_00076_rkdi_idx ON data_manager_message_logs_00076 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00076_hmb_idx ON data_manager_message_logs_00076 USING btree (handle_message_begin);
CREATE INDEX dmml_00076_eli_idx ON data_manager_message_logs_00076 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00076 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00076 VALUES (NEW.*);

/* data_manager_message_logs_00077 */
CREATE TABLE data_manager_message_logs_00077 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00077 ADD CONSTRAINT dmml_00077_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00077 ADD CONSTRAINT dmml_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX dmml_00077_pmi_idx ON data_manager_message_logs_00077 USING btree (previous_message_id);
CREATE INDEX dmml_00077_rkdi_idx ON data_manager_message_logs_00077 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00077_hmb_idx ON data_manager_message_logs_00077 USING btree (handle_message_begin);
CREATE INDEX dmml_00077_eli_idx ON data_manager_message_logs_00077 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00077 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00077 VALUES (NEW.*);

/* data_manager_message_logs_00078 */
CREATE TABLE data_manager_message_logs_00078 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00078 ADD CONSTRAINT dmml_00078_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00078 ADD CONSTRAINT dmml_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX dmml_00078_pmi_idx ON data_manager_message_logs_00078 USING btree (previous_message_id);
CREATE INDEX dmml_00078_rkdi_idx ON data_manager_message_logs_00078 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00078_hmb_idx ON data_manager_message_logs_00078 USING btree (handle_message_begin);
CREATE INDEX dmml_00078_eli_idx ON data_manager_message_logs_00078 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00078 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00078 VALUES (NEW.*);

/* data_manager_message_logs_00079 */
CREATE TABLE data_manager_message_logs_00079 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00079 ADD CONSTRAINT dmml_00079_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00079 ADD CONSTRAINT dmml_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX dmml_00079_pmi_idx ON data_manager_message_logs_00079 USING btree (previous_message_id);
CREATE INDEX dmml_00079_rkdi_idx ON data_manager_message_logs_00079 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00079_hmb_idx ON data_manager_message_logs_00079 USING btree (handle_message_begin);
CREATE INDEX dmml_00079_eli_idx ON data_manager_message_logs_00079 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00079 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00079 VALUES (NEW.*);

/* data_manager_message_logs_00080 */
CREATE TABLE data_manager_message_logs_00080 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00080 ADD CONSTRAINT dmml_00080_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00080 ADD CONSTRAINT dmml_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX dmml_00080_pmi_idx ON data_manager_message_logs_00080 USING btree (previous_message_id);
CREATE INDEX dmml_00080_rkdi_idx ON data_manager_message_logs_00080 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00080_hmb_idx ON data_manager_message_logs_00080 USING btree (handle_message_begin);
CREATE INDEX dmml_00080_eli_idx ON data_manager_message_logs_00080 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00080 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00080 VALUES (NEW.*);

/* data_manager_message_logs_00081 */
CREATE TABLE data_manager_message_logs_00081 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00081 ADD CONSTRAINT dmml_00081_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00081 ADD CONSTRAINT dmml_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX dmml_00081_pmi_idx ON data_manager_message_logs_00081 USING btree (previous_message_id);
CREATE INDEX dmml_00081_rkdi_idx ON data_manager_message_logs_00081 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00081_hmb_idx ON data_manager_message_logs_00081 USING btree (handle_message_begin);
CREATE INDEX dmml_00081_eli_idx ON data_manager_message_logs_00081 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00081 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00081 VALUES (NEW.*);

/* data_manager_message_logs_00082 */
CREATE TABLE data_manager_message_logs_00082 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00082 ADD CONSTRAINT dmml_00082_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00082 ADD CONSTRAINT dmml_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX dmml_00082_pmi_idx ON data_manager_message_logs_00082 USING btree (previous_message_id);
CREATE INDEX dmml_00082_rkdi_idx ON data_manager_message_logs_00082 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00082_hmb_idx ON data_manager_message_logs_00082 USING btree (handle_message_begin);
CREATE INDEX dmml_00082_eli_idx ON data_manager_message_logs_00082 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00082 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00082 VALUES (NEW.*);

/* data_manager_message_logs_00083 */
CREATE TABLE data_manager_message_logs_00083 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00083 ADD CONSTRAINT dmml_00083_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00083 ADD CONSTRAINT dmml_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX dmml_00083_pmi_idx ON data_manager_message_logs_00083 USING btree (previous_message_id);
CREATE INDEX dmml_00083_rkdi_idx ON data_manager_message_logs_00083 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00083_hmb_idx ON data_manager_message_logs_00083 USING btree (handle_message_begin);
CREATE INDEX dmml_00083_eli_idx ON data_manager_message_logs_00083 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00083 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00083 VALUES (NEW.*);

/* data_manager_message_logs_00084 */
CREATE TABLE data_manager_message_logs_00084 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00084 ADD CONSTRAINT dmml_00084_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00084 ADD CONSTRAINT dmml_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX dmml_00084_pmi_idx ON data_manager_message_logs_00084 USING btree (previous_message_id);
CREATE INDEX dmml_00084_rkdi_idx ON data_manager_message_logs_00084 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00084_hmb_idx ON data_manager_message_logs_00084 USING btree (handle_message_begin);
CREATE INDEX dmml_00084_eli_idx ON data_manager_message_logs_00084 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00084 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00084 VALUES (NEW.*);

/* data_manager_message_logs_00085 */
CREATE TABLE data_manager_message_logs_00085 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00085 ADD CONSTRAINT dmml_00085_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00085 ADD CONSTRAINT dmml_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX dmml_00085_pmi_idx ON data_manager_message_logs_00085 USING btree (previous_message_id);
CREATE INDEX dmml_00085_rkdi_idx ON data_manager_message_logs_00085 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00085_hmb_idx ON data_manager_message_logs_00085 USING btree (handle_message_begin);
CREATE INDEX dmml_00085_eli_idx ON data_manager_message_logs_00085 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00085 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00085 VALUES (NEW.*);

/* data_manager_message_logs_00086 */
CREATE TABLE data_manager_message_logs_00086 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00086 ADD CONSTRAINT dmml_00086_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00086 ADD CONSTRAINT dmml_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX dmml_00086_pmi_idx ON data_manager_message_logs_00086 USING btree (previous_message_id);
CREATE INDEX dmml_00086_rkdi_idx ON data_manager_message_logs_00086 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00086_hmb_idx ON data_manager_message_logs_00086 USING btree (handle_message_begin);
CREATE INDEX dmml_00086_eli_idx ON data_manager_message_logs_00086 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00086 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00086 VALUES (NEW.*);

/* data_manager_message_logs_00087 */
CREATE TABLE data_manager_message_logs_00087 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00087 ADD CONSTRAINT dmml_00087_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00087 ADD CONSTRAINT dmml_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX dmml_00087_pmi_idx ON data_manager_message_logs_00087 USING btree (previous_message_id);
CREATE INDEX dmml_00087_rkdi_idx ON data_manager_message_logs_00087 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00087_hmb_idx ON data_manager_message_logs_00087 USING btree (handle_message_begin);
CREATE INDEX dmml_00087_eli_idx ON data_manager_message_logs_00087 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00087 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00087 VALUES (NEW.*);

/* data_manager_message_logs_00088 */
CREATE TABLE data_manager_message_logs_00088 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00088 ADD CONSTRAINT dmml_00088_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00088 ADD CONSTRAINT dmml_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX dmml_00088_pmi_idx ON data_manager_message_logs_00088 USING btree (previous_message_id);
CREATE INDEX dmml_00088_rkdi_idx ON data_manager_message_logs_00088 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00088_hmb_idx ON data_manager_message_logs_00088 USING btree (handle_message_begin);
CREATE INDEX dmml_00088_eli_idx ON data_manager_message_logs_00088 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00088 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00088 VALUES (NEW.*);

/* data_manager_message_logs_00089 */
CREATE TABLE data_manager_message_logs_00089 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00089 ADD CONSTRAINT dmml_00089_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00089 ADD CONSTRAINT dmml_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX dmml_00089_pmi_idx ON data_manager_message_logs_00089 USING btree (previous_message_id);
CREATE INDEX dmml_00089_rkdi_idx ON data_manager_message_logs_00089 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00089_hmb_idx ON data_manager_message_logs_00089 USING btree (handle_message_begin);
CREATE INDEX dmml_00089_eli_idx ON data_manager_message_logs_00089 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00089 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00089 VALUES (NEW.*);

/* data_manager_message_logs_00090 */
CREATE TABLE data_manager_message_logs_00090 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00090 ADD CONSTRAINT dmml_00090_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00090 ADD CONSTRAINT dmml_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX dmml_00090_pmi_idx ON data_manager_message_logs_00090 USING btree (previous_message_id);
CREATE INDEX dmml_00090_rkdi_idx ON data_manager_message_logs_00090 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00090_hmb_idx ON data_manager_message_logs_00090 USING btree (handle_message_begin);
CREATE INDEX dmml_00090_eli_idx ON data_manager_message_logs_00090 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00090 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00090 VALUES (NEW.*);

/* data_manager_message_logs_00091 */
CREATE TABLE data_manager_message_logs_00091 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00091 ADD CONSTRAINT dmml_00091_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00091 ADD CONSTRAINT dmml_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX dmml_00091_pmi_idx ON data_manager_message_logs_00091 USING btree (previous_message_id);
CREATE INDEX dmml_00091_rkdi_idx ON data_manager_message_logs_00091 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00091_hmb_idx ON data_manager_message_logs_00091 USING btree (handle_message_begin);
CREATE INDEX dmml_00091_eli_idx ON data_manager_message_logs_00091 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00091 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00091 VALUES (NEW.*);

/* data_manager_message_logs_00092 */
CREATE TABLE data_manager_message_logs_00092 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00092 ADD CONSTRAINT dmml_00092_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00092 ADD CONSTRAINT dmml_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX dmml_00092_pmi_idx ON data_manager_message_logs_00092 USING btree (previous_message_id);
CREATE INDEX dmml_00092_rkdi_idx ON data_manager_message_logs_00092 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00092_hmb_idx ON data_manager_message_logs_00092 USING btree (handle_message_begin);
CREATE INDEX dmml_00092_eli_idx ON data_manager_message_logs_00092 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00092 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00092 VALUES (NEW.*);

/* data_manager_message_logs_00093 */
CREATE TABLE data_manager_message_logs_00093 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00093 ADD CONSTRAINT dmml_00093_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00093 ADD CONSTRAINT dmml_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX dmml_00093_pmi_idx ON data_manager_message_logs_00093 USING btree (previous_message_id);
CREATE INDEX dmml_00093_rkdi_idx ON data_manager_message_logs_00093 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00093_hmb_idx ON data_manager_message_logs_00093 USING btree (handle_message_begin);
CREATE INDEX dmml_00093_eli_idx ON data_manager_message_logs_00093 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00093 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00093 VALUES (NEW.*);

/* data_manager_message_logs_00094 */
CREATE TABLE data_manager_message_logs_00094 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00094 ADD CONSTRAINT dmml_00094_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00094 ADD CONSTRAINT dmml_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX dmml_00094_pmi_idx ON data_manager_message_logs_00094 USING btree (previous_message_id);
CREATE INDEX dmml_00094_rkdi_idx ON data_manager_message_logs_00094 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00094_hmb_idx ON data_manager_message_logs_00094 USING btree (handle_message_begin);
CREATE INDEX dmml_00094_eli_idx ON data_manager_message_logs_00094 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00094 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00094 VALUES (NEW.*);

/* data_manager_message_logs_00095 */
CREATE TABLE data_manager_message_logs_00095 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00095 ADD CONSTRAINT dmml_00095_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00095 ADD CONSTRAINT dmml_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX dmml_00095_pmi_idx ON data_manager_message_logs_00095 USING btree (previous_message_id);
CREATE INDEX dmml_00095_rkdi_idx ON data_manager_message_logs_00095 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00095_hmb_idx ON data_manager_message_logs_00095 USING btree (handle_message_begin);
CREATE INDEX dmml_00095_eli_idx ON data_manager_message_logs_00095 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00095 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00095 VALUES (NEW.*);

/* data_manager_message_logs_00096 */
CREATE TABLE data_manager_message_logs_00096 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00096 ADD CONSTRAINT dmml_00096_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00096 ADD CONSTRAINT dmml_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX dmml_00096_pmi_idx ON data_manager_message_logs_00096 USING btree (previous_message_id);
CREATE INDEX dmml_00096_rkdi_idx ON data_manager_message_logs_00096 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00096_hmb_idx ON data_manager_message_logs_00096 USING btree (handle_message_begin);
CREATE INDEX dmml_00096_eli_idx ON data_manager_message_logs_00096 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00096 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00096 VALUES (NEW.*);

/* data_manager_message_logs_00097 */
CREATE TABLE data_manager_message_logs_00097 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00097 ADD CONSTRAINT dmml_00097_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00097 ADD CONSTRAINT dmml_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX dmml_00097_pmi_idx ON data_manager_message_logs_00097 USING btree (previous_message_id);
CREATE INDEX dmml_00097_rkdi_idx ON data_manager_message_logs_00097 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00097_hmb_idx ON data_manager_message_logs_00097 USING btree (handle_message_begin);
CREATE INDEX dmml_00097_eli_idx ON data_manager_message_logs_00097 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00097 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00097 VALUES (NEW.*);

/* data_manager_message_logs_00098 */
CREATE TABLE data_manager_message_logs_00098 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00098 ADD CONSTRAINT dmml_00098_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00098 ADD CONSTRAINT dmml_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX dmml_00098_pmi_idx ON data_manager_message_logs_00098 USING btree (previous_message_id);
CREATE INDEX dmml_00098_rkdi_idx ON data_manager_message_logs_00098 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00098_hmb_idx ON data_manager_message_logs_00098 USING btree (handle_message_begin);
CREATE INDEX dmml_00098_eli_idx ON data_manager_message_logs_00098 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00098 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00098 VALUES (NEW.*);

/* data_manager_message_logs_00099 */
CREATE TABLE data_manager_message_logs_00099 ( ) INHERITS (data_manager_message_logs);
ALTER TABLE data_manager_message_logs_00099 ADD CONSTRAINT dmml_00099_pk PRIMARY KEY (id);
ALTER TABLE data_manager_message_logs_00099 ADD CONSTRAINT dmml_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX dmml_00099_pmi_idx ON data_manager_message_logs_00099 USING btree (previous_message_id);
CREATE INDEX dmml_00099_rkdi_idx ON data_manager_message_logs_00099 USING btree (data_manager_routing_key_domain_id);
CREATE INDEX dmml_00099_hmb_idx ON data_manager_message_logs_00099 USING btree (handle_message_begin);
CREATE INDEX dmml_00099_eli_idx ON data_manager_message_logs_00099 USING btree (data_manager_error_log_id);
CREATE RULE  data_manager_message_logs_00099 AS ON
INSERT TO data_manager_message_logs WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO data_manager_message_logs_00099 VALUES (NEW.*);

/* data_manager_warehouse_logs_00000 */
CREATE TABLE data_manager_warehouse_logs_00000 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00000 ADD CONSTRAINT dmwl_00000_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00000 ADD CONSTRAINT dmwl_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX dmwl_00000_dmml_id_idx ON data_manager_warehouse_logs_00000 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00000_at_idx ON data_manager_warehouse_logs_00000 USING btree (affected_table);
CREATE INDEX dmwl_00000_atri_idx ON data_manager_warehouse_logs_00000 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00000 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00000 VALUES (NEW.*);

/* data_manager_warehouse_logs_00001 */
CREATE TABLE data_manager_warehouse_logs_00001 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00001 ADD CONSTRAINT dmwl_00001_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00001 ADD CONSTRAINT dmwl_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX dmwl_00001_dmml_id_idx ON data_manager_warehouse_logs_00001 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00001_at_idx ON data_manager_warehouse_logs_00001 USING btree (affected_table);
CREATE INDEX dmwl_00001_atri_idx ON data_manager_warehouse_logs_00001 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00001 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00001 VALUES (NEW.*);

/* data_manager_warehouse_logs_00002 */
CREATE TABLE data_manager_warehouse_logs_00002 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00002 ADD CONSTRAINT dmwl_00002_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00002 ADD CONSTRAINT dmwl_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX dmwl_00002_dmml_id_idx ON data_manager_warehouse_logs_00002 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00002_at_idx ON data_manager_warehouse_logs_00002 USING btree (affected_table);
CREATE INDEX dmwl_00002_atri_idx ON data_manager_warehouse_logs_00002 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00002 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00002 VALUES (NEW.*);

/* data_manager_warehouse_logs_00003 */
CREATE TABLE data_manager_warehouse_logs_00003 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00003 ADD CONSTRAINT dmwl_00003_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00003 ADD CONSTRAINT dmwl_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX dmwl_00003_dmml_id_idx ON data_manager_warehouse_logs_00003 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00003_at_idx ON data_manager_warehouse_logs_00003 USING btree (affected_table);
CREATE INDEX dmwl_00003_atri_idx ON data_manager_warehouse_logs_00003 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00003 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00003 VALUES (NEW.*);

/* data_manager_warehouse_logs_00004 */
CREATE TABLE data_manager_warehouse_logs_00004 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00004 ADD CONSTRAINT dmwl_00004_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00004 ADD CONSTRAINT dmwl_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX dmwl_00004_dmml_id_idx ON data_manager_warehouse_logs_00004 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00004_at_idx ON data_manager_warehouse_logs_00004 USING btree (affected_table);
CREATE INDEX dmwl_00004_atri_idx ON data_manager_warehouse_logs_00004 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00004 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00004 VALUES (NEW.*);

/* data_manager_warehouse_logs_00005 */
CREATE TABLE data_manager_warehouse_logs_00005 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00005 ADD CONSTRAINT dmwl_00005_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00005 ADD CONSTRAINT dmwl_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX dmwl_00005_dmml_id_idx ON data_manager_warehouse_logs_00005 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00005_at_idx ON data_manager_warehouse_logs_00005 USING btree (affected_table);
CREATE INDEX dmwl_00005_atri_idx ON data_manager_warehouse_logs_00005 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00005 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00005 VALUES (NEW.*);

/* data_manager_warehouse_logs_00006 */
CREATE TABLE data_manager_warehouse_logs_00006 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00006 ADD CONSTRAINT dmwl_00006_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00006 ADD CONSTRAINT dmwl_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX dmwl_00006_dmml_id_idx ON data_manager_warehouse_logs_00006 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00006_at_idx ON data_manager_warehouse_logs_00006 USING btree (affected_table);
CREATE INDEX dmwl_00006_atri_idx ON data_manager_warehouse_logs_00006 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00006 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00006 VALUES (NEW.*);

/* data_manager_warehouse_logs_00007 */
CREATE TABLE data_manager_warehouse_logs_00007 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00007 ADD CONSTRAINT dmwl_00007_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00007 ADD CONSTRAINT dmwl_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX dmwl_00007_dmml_id_idx ON data_manager_warehouse_logs_00007 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00007_at_idx ON data_manager_warehouse_logs_00007 USING btree (affected_table);
CREATE INDEX dmwl_00007_atri_idx ON data_manager_warehouse_logs_00007 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00007 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00007 VALUES (NEW.*);

/* data_manager_warehouse_logs_00008 */
CREATE TABLE data_manager_warehouse_logs_00008 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00008 ADD CONSTRAINT dmwl_00008_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00008 ADD CONSTRAINT dmwl_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX dmwl_00008_dmml_id_idx ON data_manager_warehouse_logs_00008 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00008_at_idx ON data_manager_warehouse_logs_00008 USING btree (affected_table);
CREATE INDEX dmwl_00008_atri_idx ON data_manager_warehouse_logs_00008 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00008 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00008 VALUES (NEW.*);

/* data_manager_warehouse_logs_00009 */
CREATE TABLE data_manager_warehouse_logs_00009 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00009 ADD CONSTRAINT dmwl_00009_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00009 ADD CONSTRAINT dmwl_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX dmwl_00009_dmml_id_idx ON data_manager_warehouse_logs_00009 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00009_at_idx ON data_manager_warehouse_logs_00009 USING btree (affected_table);
CREATE INDEX dmwl_00009_atri_idx ON data_manager_warehouse_logs_00009 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00009 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00009 VALUES (NEW.*);

/* data_manager_warehouse_logs_00010 */
CREATE TABLE data_manager_warehouse_logs_00010 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00010 ADD CONSTRAINT dmwl_00010_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00010 ADD CONSTRAINT dmwl_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX dmwl_00010_dmml_id_idx ON data_manager_warehouse_logs_00010 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00010_at_idx ON data_manager_warehouse_logs_00010 USING btree (affected_table);
CREATE INDEX dmwl_00010_atri_idx ON data_manager_warehouse_logs_00010 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00010 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00010 VALUES (NEW.*);

/* data_manager_warehouse_logs_00011 */
CREATE TABLE data_manager_warehouse_logs_00011 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00011 ADD CONSTRAINT dmwl_00011_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00011 ADD CONSTRAINT dmwl_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX dmwl_00011_dmml_id_idx ON data_manager_warehouse_logs_00011 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00011_at_idx ON data_manager_warehouse_logs_00011 USING btree (affected_table);
CREATE INDEX dmwl_00011_atri_idx ON data_manager_warehouse_logs_00011 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00011 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00011 VALUES (NEW.*);

/* data_manager_warehouse_logs_00012 */
CREATE TABLE data_manager_warehouse_logs_00012 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00012 ADD CONSTRAINT dmwl_00012_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00012 ADD CONSTRAINT dmwl_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX dmwl_00012_dmml_id_idx ON data_manager_warehouse_logs_00012 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00012_at_idx ON data_manager_warehouse_logs_00012 USING btree (affected_table);
CREATE INDEX dmwl_00012_atri_idx ON data_manager_warehouse_logs_00012 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00012 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00012 VALUES (NEW.*);

/* data_manager_warehouse_logs_00013 */
CREATE TABLE data_manager_warehouse_logs_00013 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00013 ADD CONSTRAINT dmwl_00013_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00013 ADD CONSTRAINT dmwl_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX dmwl_00013_dmml_id_idx ON data_manager_warehouse_logs_00013 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00013_at_idx ON data_manager_warehouse_logs_00013 USING btree (affected_table);
CREATE INDEX dmwl_00013_atri_idx ON data_manager_warehouse_logs_00013 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00013 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00013 VALUES (NEW.*);

/* data_manager_warehouse_logs_00014 */
CREATE TABLE data_manager_warehouse_logs_00014 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00014 ADD CONSTRAINT dmwl_00014_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00014 ADD CONSTRAINT dmwl_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX dmwl_00014_dmml_id_idx ON data_manager_warehouse_logs_00014 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00014_at_idx ON data_manager_warehouse_logs_00014 USING btree (affected_table);
CREATE INDEX dmwl_00014_atri_idx ON data_manager_warehouse_logs_00014 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00014 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00014 VALUES (NEW.*);

/* data_manager_warehouse_logs_00015 */
CREATE TABLE data_manager_warehouse_logs_00015 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00015 ADD CONSTRAINT dmwl_00015_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00015 ADD CONSTRAINT dmwl_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX dmwl_00015_dmml_id_idx ON data_manager_warehouse_logs_00015 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00015_at_idx ON data_manager_warehouse_logs_00015 USING btree (affected_table);
CREATE INDEX dmwl_00015_atri_idx ON data_manager_warehouse_logs_00015 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00015 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00015 VALUES (NEW.*);

/* data_manager_warehouse_logs_00016 */
CREATE TABLE data_manager_warehouse_logs_00016 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00016 ADD CONSTRAINT dmwl_00016_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00016 ADD CONSTRAINT dmwl_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX dmwl_00016_dmml_id_idx ON data_manager_warehouse_logs_00016 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00016_at_idx ON data_manager_warehouse_logs_00016 USING btree (affected_table);
CREATE INDEX dmwl_00016_atri_idx ON data_manager_warehouse_logs_00016 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00016 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00016 VALUES (NEW.*);

/* data_manager_warehouse_logs_00017 */
CREATE TABLE data_manager_warehouse_logs_00017 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00017 ADD CONSTRAINT dmwl_00017_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00017 ADD CONSTRAINT dmwl_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX dmwl_00017_dmml_id_idx ON data_manager_warehouse_logs_00017 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00017_at_idx ON data_manager_warehouse_logs_00017 USING btree (affected_table);
CREATE INDEX dmwl_00017_atri_idx ON data_manager_warehouse_logs_00017 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00017 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00017 VALUES (NEW.*);

/* data_manager_warehouse_logs_00018 */
CREATE TABLE data_manager_warehouse_logs_00018 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00018 ADD CONSTRAINT dmwl_00018_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00018 ADD CONSTRAINT dmwl_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX dmwl_00018_dmml_id_idx ON data_manager_warehouse_logs_00018 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00018_at_idx ON data_manager_warehouse_logs_00018 USING btree (affected_table);
CREATE INDEX dmwl_00018_atri_idx ON data_manager_warehouse_logs_00018 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00018 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00018 VALUES (NEW.*);

/* data_manager_warehouse_logs_00019 */
CREATE TABLE data_manager_warehouse_logs_00019 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00019 ADD CONSTRAINT dmwl_00019_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00019 ADD CONSTRAINT dmwl_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX dmwl_00019_dmml_id_idx ON data_manager_warehouse_logs_00019 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00019_at_idx ON data_manager_warehouse_logs_00019 USING btree (affected_table);
CREATE INDEX dmwl_00019_atri_idx ON data_manager_warehouse_logs_00019 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00019 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00019 VALUES (NEW.*);

/* data_manager_warehouse_logs_00020 */
CREATE TABLE data_manager_warehouse_logs_00020 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00020 ADD CONSTRAINT dmwl_00020_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00020 ADD CONSTRAINT dmwl_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX dmwl_00020_dmml_id_idx ON data_manager_warehouse_logs_00020 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00020_at_idx ON data_manager_warehouse_logs_00020 USING btree (affected_table);
CREATE INDEX dmwl_00020_atri_idx ON data_manager_warehouse_logs_00020 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00020 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00020 VALUES (NEW.*);

/* data_manager_warehouse_logs_00021 */
CREATE TABLE data_manager_warehouse_logs_00021 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00021 ADD CONSTRAINT dmwl_00021_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00021 ADD CONSTRAINT dmwl_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX dmwl_00021_dmml_id_idx ON data_manager_warehouse_logs_00021 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00021_at_idx ON data_manager_warehouse_logs_00021 USING btree (affected_table);
CREATE INDEX dmwl_00021_atri_idx ON data_manager_warehouse_logs_00021 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00021 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00021 VALUES (NEW.*);

/* data_manager_warehouse_logs_00022 */
CREATE TABLE data_manager_warehouse_logs_00022 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00022 ADD CONSTRAINT dmwl_00022_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00022 ADD CONSTRAINT dmwl_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX dmwl_00022_dmml_id_idx ON data_manager_warehouse_logs_00022 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00022_at_idx ON data_manager_warehouse_logs_00022 USING btree (affected_table);
CREATE INDEX dmwl_00022_atri_idx ON data_manager_warehouse_logs_00022 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00022 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00022 VALUES (NEW.*);

/* data_manager_warehouse_logs_00023 */
CREATE TABLE data_manager_warehouse_logs_00023 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00023 ADD CONSTRAINT dmwl_00023_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00023 ADD CONSTRAINT dmwl_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX dmwl_00023_dmml_id_idx ON data_manager_warehouse_logs_00023 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00023_at_idx ON data_manager_warehouse_logs_00023 USING btree (affected_table);
CREATE INDEX dmwl_00023_atri_idx ON data_manager_warehouse_logs_00023 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00023 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00023 VALUES (NEW.*);

/* data_manager_warehouse_logs_00024 */
CREATE TABLE data_manager_warehouse_logs_00024 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00024 ADD CONSTRAINT dmwl_00024_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00024 ADD CONSTRAINT dmwl_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX dmwl_00024_dmml_id_idx ON data_manager_warehouse_logs_00024 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00024_at_idx ON data_manager_warehouse_logs_00024 USING btree (affected_table);
CREATE INDEX dmwl_00024_atri_idx ON data_manager_warehouse_logs_00024 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00024 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00024 VALUES (NEW.*);

/* data_manager_warehouse_logs_00025 */
CREATE TABLE data_manager_warehouse_logs_00025 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00025 ADD CONSTRAINT dmwl_00025_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00025 ADD CONSTRAINT dmwl_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX dmwl_00025_dmml_id_idx ON data_manager_warehouse_logs_00025 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00025_at_idx ON data_manager_warehouse_logs_00025 USING btree (affected_table);
CREATE INDEX dmwl_00025_atri_idx ON data_manager_warehouse_logs_00025 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00025 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00025 VALUES (NEW.*);

/* data_manager_warehouse_logs_00026 */
CREATE TABLE data_manager_warehouse_logs_00026 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00026 ADD CONSTRAINT dmwl_00026_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00026 ADD CONSTRAINT dmwl_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX dmwl_00026_dmml_id_idx ON data_manager_warehouse_logs_00026 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00026_at_idx ON data_manager_warehouse_logs_00026 USING btree (affected_table);
CREATE INDEX dmwl_00026_atri_idx ON data_manager_warehouse_logs_00026 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00026 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00026 VALUES (NEW.*);

/* data_manager_warehouse_logs_00027 */
CREATE TABLE data_manager_warehouse_logs_00027 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00027 ADD CONSTRAINT dmwl_00027_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00027 ADD CONSTRAINT dmwl_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX dmwl_00027_dmml_id_idx ON data_manager_warehouse_logs_00027 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00027_at_idx ON data_manager_warehouse_logs_00027 USING btree (affected_table);
CREATE INDEX dmwl_00027_atri_idx ON data_manager_warehouse_logs_00027 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00027 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00027 VALUES (NEW.*);

/* data_manager_warehouse_logs_00028 */
CREATE TABLE data_manager_warehouse_logs_00028 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00028 ADD CONSTRAINT dmwl_00028_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00028 ADD CONSTRAINT dmwl_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX dmwl_00028_dmml_id_idx ON data_manager_warehouse_logs_00028 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00028_at_idx ON data_manager_warehouse_logs_00028 USING btree (affected_table);
CREATE INDEX dmwl_00028_atri_idx ON data_manager_warehouse_logs_00028 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00028 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00028 VALUES (NEW.*);

/* data_manager_warehouse_logs_00029 */
CREATE TABLE data_manager_warehouse_logs_00029 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00029 ADD CONSTRAINT dmwl_00029_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00029 ADD CONSTRAINT dmwl_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX dmwl_00029_dmml_id_idx ON data_manager_warehouse_logs_00029 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00029_at_idx ON data_manager_warehouse_logs_00029 USING btree (affected_table);
CREATE INDEX dmwl_00029_atri_idx ON data_manager_warehouse_logs_00029 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00029 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00029 VALUES (NEW.*);

/* data_manager_warehouse_logs_00030 */
CREATE TABLE data_manager_warehouse_logs_00030 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00030 ADD CONSTRAINT dmwl_00030_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00030 ADD CONSTRAINT dmwl_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX dmwl_00030_dmml_id_idx ON data_manager_warehouse_logs_00030 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00030_at_idx ON data_manager_warehouse_logs_00030 USING btree (affected_table);
CREATE INDEX dmwl_00030_atri_idx ON data_manager_warehouse_logs_00030 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00030 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00030 VALUES (NEW.*);

/* data_manager_warehouse_logs_00031 */
CREATE TABLE data_manager_warehouse_logs_00031 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00031 ADD CONSTRAINT dmwl_00031_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00031 ADD CONSTRAINT dmwl_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX dmwl_00031_dmml_id_idx ON data_manager_warehouse_logs_00031 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00031_at_idx ON data_manager_warehouse_logs_00031 USING btree (affected_table);
CREATE INDEX dmwl_00031_atri_idx ON data_manager_warehouse_logs_00031 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00031 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00031 VALUES (NEW.*);

/* data_manager_warehouse_logs_00032 */
CREATE TABLE data_manager_warehouse_logs_00032 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00032 ADD CONSTRAINT dmwl_00032_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00032 ADD CONSTRAINT dmwl_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX dmwl_00032_dmml_id_idx ON data_manager_warehouse_logs_00032 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00032_at_idx ON data_manager_warehouse_logs_00032 USING btree (affected_table);
CREATE INDEX dmwl_00032_atri_idx ON data_manager_warehouse_logs_00032 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00032 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00032 VALUES (NEW.*);

/* data_manager_warehouse_logs_00033 */
CREATE TABLE data_manager_warehouse_logs_00033 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00033 ADD CONSTRAINT dmwl_00033_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00033 ADD CONSTRAINT dmwl_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX dmwl_00033_dmml_id_idx ON data_manager_warehouse_logs_00033 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00033_at_idx ON data_manager_warehouse_logs_00033 USING btree (affected_table);
CREATE INDEX dmwl_00033_atri_idx ON data_manager_warehouse_logs_00033 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00033 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00033 VALUES (NEW.*);

/* data_manager_warehouse_logs_00034 */
CREATE TABLE data_manager_warehouse_logs_00034 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00034 ADD CONSTRAINT dmwl_00034_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00034 ADD CONSTRAINT dmwl_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX dmwl_00034_dmml_id_idx ON data_manager_warehouse_logs_00034 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00034_at_idx ON data_manager_warehouse_logs_00034 USING btree (affected_table);
CREATE INDEX dmwl_00034_atri_idx ON data_manager_warehouse_logs_00034 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00034 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00034 VALUES (NEW.*);

/* data_manager_warehouse_logs_00035 */
CREATE TABLE data_manager_warehouse_logs_00035 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00035 ADD CONSTRAINT dmwl_00035_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00035 ADD CONSTRAINT dmwl_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX dmwl_00035_dmml_id_idx ON data_manager_warehouse_logs_00035 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00035_at_idx ON data_manager_warehouse_logs_00035 USING btree (affected_table);
CREATE INDEX dmwl_00035_atri_idx ON data_manager_warehouse_logs_00035 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00035 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00035 VALUES (NEW.*);

/* data_manager_warehouse_logs_00036 */
CREATE TABLE data_manager_warehouse_logs_00036 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00036 ADD CONSTRAINT dmwl_00036_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00036 ADD CONSTRAINT dmwl_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX dmwl_00036_dmml_id_idx ON data_manager_warehouse_logs_00036 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00036_at_idx ON data_manager_warehouse_logs_00036 USING btree (affected_table);
CREATE INDEX dmwl_00036_atri_idx ON data_manager_warehouse_logs_00036 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00036 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00036 VALUES (NEW.*);

/* data_manager_warehouse_logs_00037 */
CREATE TABLE data_manager_warehouse_logs_00037 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00037 ADD CONSTRAINT dmwl_00037_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00037 ADD CONSTRAINT dmwl_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX dmwl_00037_dmml_id_idx ON data_manager_warehouse_logs_00037 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00037_at_idx ON data_manager_warehouse_logs_00037 USING btree (affected_table);
CREATE INDEX dmwl_00037_atri_idx ON data_manager_warehouse_logs_00037 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00037 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00037 VALUES (NEW.*);

/* data_manager_warehouse_logs_00038 */
CREATE TABLE data_manager_warehouse_logs_00038 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00038 ADD CONSTRAINT dmwl_00038_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00038 ADD CONSTRAINT dmwl_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX dmwl_00038_dmml_id_idx ON data_manager_warehouse_logs_00038 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00038_at_idx ON data_manager_warehouse_logs_00038 USING btree (affected_table);
CREATE INDEX dmwl_00038_atri_idx ON data_manager_warehouse_logs_00038 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00038 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00038 VALUES (NEW.*);

/* data_manager_warehouse_logs_00039 */
CREATE TABLE data_manager_warehouse_logs_00039 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00039 ADD CONSTRAINT dmwl_00039_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00039 ADD CONSTRAINT dmwl_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX dmwl_00039_dmml_id_idx ON data_manager_warehouse_logs_00039 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00039_at_idx ON data_manager_warehouse_logs_00039 USING btree (affected_table);
CREATE INDEX dmwl_00039_atri_idx ON data_manager_warehouse_logs_00039 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00039 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00039 VALUES (NEW.*);

/* data_manager_warehouse_logs_00040 */
CREATE TABLE data_manager_warehouse_logs_00040 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00040 ADD CONSTRAINT dmwl_00040_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00040 ADD CONSTRAINT dmwl_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX dmwl_00040_dmml_id_idx ON data_manager_warehouse_logs_00040 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00040_at_idx ON data_manager_warehouse_logs_00040 USING btree (affected_table);
CREATE INDEX dmwl_00040_atri_idx ON data_manager_warehouse_logs_00040 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00040 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00040 VALUES (NEW.*);

/* data_manager_warehouse_logs_00041 */
CREATE TABLE data_manager_warehouse_logs_00041 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00041 ADD CONSTRAINT dmwl_00041_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00041 ADD CONSTRAINT dmwl_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX dmwl_00041_dmml_id_idx ON data_manager_warehouse_logs_00041 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00041_at_idx ON data_manager_warehouse_logs_00041 USING btree (affected_table);
CREATE INDEX dmwl_00041_atri_idx ON data_manager_warehouse_logs_00041 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00041 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00041 VALUES (NEW.*);

/* data_manager_warehouse_logs_00042 */
CREATE TABLE data_manager_warehouse_logs_00042 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00042 ADD CONSTRAINT dmwl_00042_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00042 ADD CONSTRAINT dmwl_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX dmwl_00042_dmml_id_idx ON data_manager_warehouse_logs_00042 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00042_at_idx ON data_manager_warehouse_logs_00042 USING btree (affected_table);
CREATE INDEX dmwl_00042_atri_idx ON data_manager_warehouse_logs_00042 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00042 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00042 VALUES (NEW.*);

/* data_manager_warehouse_logs_00043 */
CREATE TABLE data_manager_warehouse_logs_00043 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00043 ADD CONSTRAINT dmwl_00043_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00043 ADD CONSTRAINT dmwl_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX dmwl_00043_dmml_id_idx ON data_manager_warehouse_logs_00043 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00043_at_idx ON data_manager_warehouse_logs_00043 USING btree (affected_table);
CREATE INDEX dmwl_00043_atri_idx ON data_manager_warehouse_logs_00043 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00043 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00043 VALUES (NEW.*);

/* data_manager_warehouse_logs_00044 */
CREATE TABLE data_manager_warehouse_logs_00044 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00044 ADD CONSTRAINT dmwl_00044_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00044 ADD CONSTRAINT dmwl_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX dmwl_00044_dmml_id_idx ON data_manager_warehouse_logs_00044 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00044_at_idx ON data_manager_warehouse_logs_00044 USING btree (affected_table);
CREATE INDEX dmwl_00044_atri_idx ON data_manager_warehouse_logs_00044 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00044 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00044 VALUES (NEW.*);

/* data_manager_warehouse_logs_00045 */
CREATE TABLE data_manager_warehouse_logs_00045 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00045 ADD CONSTRAINT dmwl_00045_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00045 ADD CONSTRAINT dmwl_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX dmwl_00045_dmml_id_idx ON data_manager_warehouse_logs_00045 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00045_at_idx ON data_manager_warehouse_logs_00045 USING btree (affected_table);
CREATE INDEX dmwl_00045_atri_idx ON data_manager_warehouse_logs_00045 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00045 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00045 VALUES (NEW.*);

/* data_manager_warehouse_logs_00046 */
CREATE TABLE data_manager_warehouse_logs_00046 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00046 ADD CONSTRAINT dmwl_00046_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00046 ADD CONSTRAINT dmwl_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX dmwl_00046_dmml_id_idx ON data_manager_warehouse_logs_00046 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00046_at_idx ON data_manager_warehouse_logs_00046 USING btree (affected_table);
CREATE INDEX dmwl_00046_atri_idx ON data_manager_warehouse_logs_00046 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00046 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00046 VALUES (NEW.*);

/* data_manager_warehouse_logs_00047 */
CREATE TABLE data_manager_warehouse_logs_00047 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00047 ADD CONSTRAINT dmwl_00047_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00047 ADD CONSTRAINT dmwl_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX dmwl_00047_dmml_id_idx ON data_manager_warehouse_logs_00047 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00047_at_idx ON data_manager_warehouse_logs_00047 USING btree (affected_table);
CREATE INDEX dmwl_00047_atri_idx ON data_manager_warehouse_logs_00047 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00047 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00047 VALUES (NEW.*);

/* data_manager_warehouse_logs_00048 */
CREATE TABLE data_manager_warehouse_logs_00048 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00048 ADD CONSTRAINT dmwl_00048_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00048 ADD CONSTRAINT dmwl_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX dmwl_00048_dmml_id_idx ON data_manager_warehouse_logs_00048 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00048_at_idx ON data_manager_warehouse_logs_00048 USING btree (affected_table);
CREATE INDEX dmwl_00048_atri_idx ON data_manager_warehouse_logs_00048 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00048 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00048 VALUES (NEW.*);

/* data_manager_warehouse_logs_00049 */
CREATE TABLE data_manager_warehouse_logs_00049 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00049 ADD CONSTRAINT dmwl_00049_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00049 ADD CONSTRAINT dmwl_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX dmwl_00049_dmml_id_idx ON data_manager_warehouse_logs_00049 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00049_at_idx ON data_manager_warehouse_logs_00049 USING btree (affected_table);
CREATE INDEX dmwl_00049_atri_idx ON data_manager_warehouse_logs_00049 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00049 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00049 VALUES (NEW.*);

/* data_manager_warehouse_logs_00050 */
CREATE TABLE data_manager_warehouse_logs_00050 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00050 ADD CONSTRAINT dmwl_00050_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00050 ADD CONSTRAINT dmwl_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX dmwl_00050_dmml_id_idx ON data_manager_warehouse_logs_00050 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00050_at_idx ON data_manager_warehouse_logs_00050 USING btree (affected_table);
CREATE INDEX dmwl_00050_atri_idx ON data_manager_warehouse_logs_00050 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00050 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00050 VALUES (NEW.*);

/* data_manager_warehouse_logs_00051 */
CREATE TABLE data_manager_warehouse_logs_00051 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00051 ADD CONSTRAINT dmwl_00051_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00051 ADD CONSTRAINT dmwl_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX dmwl_00051_dmml_id_idx ON data_manager_warehouse_logs_00051 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00051_at_idx ON data_manager_warehouse_logs_00051 USING btree (affected_table);
CREATE INDEX dmwl_00051_atri_idx ON data_manager_warehouse_logs_00051 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00051 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00051 VALUES (NEW.*);

/* data_manager_warehouse_logs_00052 */
CREATE TABLE data_manager_warehouse_logs_00052 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00052 ADD CONSTRAINT dmwl_00052_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00052 ADD CONSTRAINT dmwl_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX dmwl_00052_dmml_id_idx ON data_manager_warehouse_logs_00052 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00052_at_idx ON data_manager_warehouse_logs_00052 USING btree (affected_table);
CREATE INDEX dmwl_00052_atri_idx ON data_manager_warehouse_logs_00052 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00052 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00052 VALUES (NEW.*);

/* data_manager_warehouse_logs_00053 */
CREATE TABLE data_manager_warehouse_logs_00053 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00053 ADD CONSTRAINT dmwl_00053_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00053 ADD CONSTRAINT dmwl_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX dmwl_00053_dmml_id_idx ON data_manager_warehouse_logs_00053 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00053_at_idx ON data_manager_warehouse_logs_00053 USING btree (affected_table);
CREATE INDEX dmwl_00053_atri_idx ON data_manager_warehouse_logs_00053 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00053 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00053 VALUES (NEW.*);

/* data_manager_warehouse_logs_00054 */
CREATE TABLE data_manager_warehouse_logs_00054 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00054 ADD CONSTRAINT dmwl_00054_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00054 ADD CONSTRAINT dmwl_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX dmwl_00054_dmml_id_idx ON data_manager_warehouse_logs_00054 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00054_at_idx ON data_manager_warehouse_logs_00054 USING btree (affected_table);
CREATE INDEX dmwl_00054_atri_idx ON data_manager_warehouse_logs_00054 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00054 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00054 VALUES (NEW.*);

/* data_manager_warehouse_logs_00055 */
CREATE TABLE data_manager_warehouse_logs_00055 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00055 ADD CONSTRAINT dmwl_00055_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00055 ADD CONSTRAINT dmwl_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX dmwl_00055_dmml_id_idx ON data_manager_warehouse_logs_00055 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00055_at_idx ON data_manager_warehouse_logs_00055 USING btree (affected_table);
CREATE INDEX dmwl_00055_atri_idx ON data_manager_warehouse_logs_00055 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00055 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00055 VALUES (NEW.*);

/* data_manager_warehouse_logs_00056 */
CREATE TABLE data_manager_warehouse_logs_00056 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00056 ADD CONSTRAINT dmwl_00056_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00056 ADD CONSTRAINT dmwl_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX dmwl_00056_dmml_id_idx ON data_manager_warehouse_logs_00056 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00056_at_idx ON data_manager_warehouse_logs_00056 USING btree (affected_table);
CREATE INDEX dmwl_00056_atri_idx ON data_manager_warehouse_logs_00056 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00056 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00056 VALUES (NEW.*);

/* data_manager_warehouse_logs_00057 */
CREATE TABLE data_manager_warehouse_logs_00057 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00057 ADD CONSTRAINT dmwl_00057_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00057 ADD CONSTRAINT dmwl_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX dmwl_00057_dmml_id_idx ON data_manager_warehouse_logs_00057 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00057_at_idx ON data_manager_warehouse_logs_00057 USING btree (affected_table);
CREATE INDEX dmwl_00057_atri_idx ON data_manager_warehouse_logs_00057 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00057 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00057 VALUES (NEW.*);

/* data_manager_warehouse_logs_00058 */
CREATE TABLE data_manager_warehouse_logs_00058 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00058 ADD CONSTRAINT dmwl_00058_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00058 ADD CONSTRAINT dmwl_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX dmwl_00058_dmml_id_idx ON data_manager_warehouse_logs_00058 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00058_at_idx ON data_manager_warehouse_logs_00058 USING btree (affected_table);
CREATE INDEX dmwl_00058_atri_idx ON data_manager_warehouse_logs_00058 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00058 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00058 VALUES (NEW.*);

/* data_manager_warehouse_logs_00059 */
CREATE TABLE data_manager_warehouse_logs_00059 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00059 ADD CONSTRAINT dmwl_00059_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00059 ADD CONSTRAINT dmwl_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX dmwl_00059_dmml_id_idx ON data_manager_warehouse_logs_00059 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00059_at_idx ON data_manager_warehouse_logs_00059 USING btree (affected_table);
CREATE INDEX dmwl_00059_atri_idx ON data_manager_warehouse_logs_00059 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00059 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00059 VALUES (NEW.*);

/* data_manager_warehouse_logs_00060 */
CREATE TABLE data_manager_warehouse_logs_00060 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00060 ADD CONSTRAINT dmwl_00060_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00060 ADD CONSTRAINT dmwl_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX dmwl_00060_dmml_id_idx ON data_manager_warehouse_logs_00060 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00060_at_idx ON data_manager_warehouse_logs_00060 USING btree (affected_table);
CREATE INDEX dmwl_00060_atri_idx ON data_manager_warehouse_logs_00060 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00060 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00060 VALUES (NEW.*);

/* data_manager_warehouse_logs_00061 */
CREATE TABLE data_manager_warehouse_logs_00061 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00061 ADD CONSTRAINT dmwl_00061_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00061 ADD CONSTRAINT dmwl_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX dmwl_00061_dmml_id_idx ON data_manager_warehouse_logs_00061 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00061_at_idx ON data_manager_warehouse_logs_00061 USING btree (affected_table);
CREATE INDEX dmwl_00061_atri_idx ON data_manager_warehouse_logs_00061 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00061 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00061 VALUES (NEW.*);

/* data_manager_warehouse_logs_00062 */
CREATE TABLE data_manager_warehouse_logs_00062 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00062 ADD CONSTRAINT dmwl_00062_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00062 ADD CONSTRAINT dmwl_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX dmwl_00062_dmml_id_idx ON data_manager_warehouse_logs_00062 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00062_at_idx ON data_manager_warehouse_logs_00062 USING btree (affected_table);
CREATE INDEX dmwl_00062_atri_idx ON data_manager_warehouse_logs_00062 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00062 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00062 VALUES (NEW.*);

/* data_manager_warehouse_logs_00063 */
CREATE TABLE data_manager_warehouse_logs_00063 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00063 ADD CONSTRAINT dmwl_00063_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00063 ADD CONSTRAINT dmwl_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX dmwl_00063_dmml_id_idx ON data_manager_warehouse_logs_00063 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00063_at_idx ON data_manager_warehouse_logs_00063 USING btree (affected_table);
CREATE INDEX dmwl_00063_atri_idx ON data_manager_warehouse_logs_00063 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00063 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00063 VALUES (NEW.*);

/* data_manager_warehouse_logs_00064 */
CREATE TABLE data_manager_warehouse_logs_00064 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00064 ADD CONSTRAINT dmwl_00064_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00064 ADD CONSTRAINT dmwl_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX dmwl_00064_dmml_id_idx ON data_manager_warehouse_logs_00064 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00064_at_idx ON data_manager_warehouse_logs_00064 USING btree (affected_table);
CREATE INDEX dmwl_00064_atri_idx ON data_manager_warehouse_logs_00064 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00064 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00064 VALUES (NEW.*);

/* data_manager_warehouse_logs_00065 */
CREATE TABLE data_manager_warehouse_logs_00065 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00065 ADD CONSTRAINT dmwl_00065_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00065 ADD CONSTRAINT dmwl_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX dmwl_00065_dmml_id_idx ON data_manager_warehouse_logs_00065 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00065_at_idx ON data_manager_warehouse_logs_00065 USING btree (affected_table);
CREATE INDEX dmwl_00065_atri_idx ON data_manager_warehouse_logs_00065 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00065 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00065 VALUES (NEW.*);

/* data_manager_warehouse_logs_00066 */
CREATE TABLE data_manager_warehouse_logs_00066 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00066 ADD CONSTRAINT dmwl_00066_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00066 ADD CONSTRAINT dmwl_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX dmwl_00066_dmml_id_idx ON data_manager_warehouse_logs_00066 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00066_at_idx ON data_manager_warehouse_logs_00066 USING btree (affected_table);
CREATE INDEX dmwl_00066_atri_idx ON data_manager_warehouse_logs_00066 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00066 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00066 VALUES (NEW.*);

/* data_manager_warehouse_logs_00067 */
CREATE TABLE data_manager_warehouse_logs_00067 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00067 ADD CONSTRAINT dmwl_00067_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00067 ADD CONSTRAINT dmwl_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX dmwl_00067_dmml_id_idx ON data_manager_warehouse_logs_00067 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00067_at_idx ON data_manager_warehouse_logs_00067 USING btree (affected_table);
CREATE INDEX dmwl_00067_atri_idx ON data_manager_warehouse_logs_00067 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00067 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00067 VALUES (NEW.*);

/* data_manager_warehouse_logs_00068 */
CREATE TABLE data_manager_warehouse_logs_00068 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00068 ADD CONSTRAINT dmwl_00068_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00068 ADD CONSTRAINT dmwl_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX dmwl_00068_dmml_id_idx ON data_manager_warehouse_logs_00068 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00068_at_idx ON data_manager_warehouse_logs_00068 USING btree (affected_table);
CREATE INDEX dmwl_00068_atri_idx ON data_manager_warehouse_logs_00068 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00068 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00068 VALUES (NEW.*);

/* data_manager_warehouse_logs_00069 */
CREATE TABLE data_manager_warehouse_logs_00069 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00069 ADD CONSTRAINT dmwl_00069_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00069 ADD CONSTRAINT dmwl_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX dmwl_00069_dmml_id_idx ON data_manager_warehouse_logs_00069 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00069_at_idx ON data_manager_warehouse_logs_00069 USING btree (affected_table);
CREATE INDEX dmwl_00069_atri_idx ON data_manager_warehouse_logs_00069 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00069 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00069 VALUES (NEW.*);

/* data_manager_warehouse_logs_00070 */
CREATE TABLE data_manager_warehouse_logs_00070 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00070 ADD CONSTRAINT dmwl_00070_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00070 ADD CONSTRAINT dmwl_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX dmwl_00070_dmml_id_idx ON data_manager_warehouse_logs_00070 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00070_at_idx ON data_manager_warehouse_logs_00070 USING btree (affected_table);
CREATE INDEX dmwl_00070_atri_idx ON data_manager_warehouse_logs_00070 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00070 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00070 VALUES (NEW.*);

/* data_manager_warehouse_logs_00071 */
CREATE TABLE data_manager_warehouse_logs_00071 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00071 ADD CONSTRAINT dmwl_00071_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00071 ADD CONSTRAINT dmwl_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX dmwl_00071_dmml_id_idx ON data_manager_warehouse_logs_00071 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00071_at_idx ON data_manager_warehouse_logs_00071 USING btree (affected_table);
CREATE INDEX dmwl_00071_atri_idx ON data_manager_warehouse_logs_00071 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00071 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00071 VALUES (NEW.*);

/* data_manager_warehouse_logs_00072 */
CREATE TABLE data_manager_warehouse_logs_00072 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00072 ADD CONSTRAINT dmwl_00072_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00072 ADD CONSTRAINT dmwl_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX dmwl_00072_dmml_id_idx ON data_manager_warehouse_logs_00072 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00072_at_idx ON data_manager_warehouse_logs_00072 USING btree (affected_table);
CREATE INDEX dmwl_00072_atri_idx ON data_manager_warehouse_logs_00072 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00072 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00072 VALUES (NEW.*);

/* data_manager_warehouse_logs_00073 */
CREATE TABLE data_manager_warehouse_logs_00073 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00073 ADD CONSTRAINT dmwl_00073_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00073 ADD CONSTRAINT dmwl_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX dmwl_00073_dmml_id_idx ON data_manager_warehouse_logs_00073 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00073_at_idx ON data_manager_warehouse_logs_00073 USING btree (affected_table);
CREATE INDEX dmwl_00073_atri_idx ON data_manager_warehouse_logs_00073 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00073 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00073 VALUES (NEW.*);

/* data_manager_warehouse_logs_00074 */
CREATE TABLE data_manager_warehouse_logs_00074 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00074 ADD CONSTRAINT dmwl_00074_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00074 ADD CONSTRAINT dmwl_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX dmwl_00074_dmml_id_idx ON data_manager_warehouse_logs_00074 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00074_at_idx ON data_manager_warehouse_logs_00074 USING btree (affected_table);
CREATE INDEX dmwl_00074_atri_idx ON data_manager_warehouse_logs_00074 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00074 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00074 VALUES (NEW.*);

/* data_manager_warehouse_logs_00075 */
CREATE TABLE data_manager_warehouse_logs_00075 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00075 ADD CONSTRAINT dmwl_00075_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00075 ADD CONSTRAINT dmwl_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX dmwl_00075_dmml_id_idx ON data_manager_warehouse_logs_00075 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00075_at_idx ON data_manager_warehouse_logs_00075 USING btree (affected_table);
CREATE INDEX dmwl_00075_atri_idx ON data_manager_warehouse_logs_00075 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00075 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00075 VALUES (NEW.*);

/* data_manager_warehouse_logs_00076 */
CREATE TABLE data_manager_warehouse_logs_00076 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00076 ADD CONSTRAINT dmwl_00076_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00076 ADD CONSTRAINT dmwl_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX dmwl_00076_dmml_id_idx ON data_manager_warehouse_logs_00076 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00076_at_idx ON data_manager_warehouse_logs_00076 USING btree (affected_table);
CREATE INDEX dmwl_00076_atri_idx ON data_manager_warehouse_logs_00076 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00076 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00076 VALUES (NEW.*);

/* data_manager_warehouse_logs_00077 */
CREATE TABLE data_manager_warehouse_logs_00077 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00077 ADD CONSTRAINT dmwl_00077_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00077 ADD CONSTRAINT dmwl_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX dmwl_00077_dmml_id_idx ON data_manager_warehouse_logs_00077 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00077_at_idx ON data_manager_warehouse_logs_00077 USING btree (affected_table);
CREATE INDEX dmwl_00077_atri_idx ON data_manager_warehouse_logs_00077 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00077 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00077 VALUES (NEW.*);

/* data_manager_warehouse_logs_00078 */
CREATE TABLE data_manager_warehouse_logs_00078 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00078 ADD CONSTRAINT dmwl_00078_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00078 ADD CONSTRAINT dmwl_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX dmwl_00078_dmml_id_idx ON data_manager_warehouse_logs_00078 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00078_at_idx ON data_manager_warehouse_logs_00078 USING btree (affected_table);
CREATE INDEX dmwl_00078_atri_idx ON data_manager_warehouse_logs_00078 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00078 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00078 VALUES (NEW.*);

/* data_manager_warehouse_logs_00079 */
CREATE TABLE data_manager_warehouse_logs_00079 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00079 ADD CONSTRAINT dmwl_00079_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00079 ADD CONSTRAINT dmwl_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX dmwl_00079_dmml_id_idx ON data_manager_warehouse_logs_00079 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00079_at_idx ON data_manager_warehouse_logs_00079 USING btree (affected_table);
CREATE INDEX dmwl_00079_atri_idx ON data_manager_warehouse_logs_00079 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00079 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00079 VALUES (NEW.*);

/* data_manager_warehouse_logs_00080 */
CREATE TABLE data_manager_warehouse_logs_00080 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00080 ADD CONSTRAINT dmwl_00080_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00080 ADD CONSTRAINT dmwl_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX dmwl_00080_dmml_id_idx ON data_manager_warehouse_logs_00080 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00080_at_idx ON data_manager_warehouse_logs_00080 USING btree (affected_table);
CREATE INDEX dmwl_00080_atri_idx ON data_manager_warehouse_logs_00080 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00080 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00080 VALUES (NEW.*);

/* data_manager_warehouse_logs_00081 */
CREATE TABLE data_manager_warehouse_logs_00081 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00081 ADD CONSTRAINT dmwl_00081_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00081 ADD CONSTRAINT dmwl_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX dmwl_00081_dmml_id_idx ON data_manager_warehouse_logs_00081 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00081_at_idx ON data_manager_warehouse_logs_00081 USING btree (affected_table);
CREATE INDEX dmwl_00081_atri_idx ON data_manager_warehouse_logs_00081 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00081 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00081 VALUES (NEW.*);

/* data_manager_warehouse_logs_00082 */
CREATE TABLE data_manager_warehouse_logs_00082 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00082 ADD CONSTRAINT dmwl_00082_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00082 ADD CONSTRAINT dmwl_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX dmwl_00082_dmml_id_idx ON data_manager_warehouse_logs_00082 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00082_at_idx ON data_manager_warehouse_logs_00082 USING btree (affected_table);
CREATE INDEX dmwl_00082_atri_idx ON data_manager_warehouse_logs_00082 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00082 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00082 VALUES (NEW.*);

/* data_manager_warehouse_logs_00083 */
CREATE TABLE data_manager_warehouse_logs_00083 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00083 ADD CONSTRAINT dmwl_00083_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00083 ADD CONSTRAINT dmwl_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX dmwl_00083_dmml_id_idx ON data_manager_warehouse_logs_00083 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00083_at_idx ON data_manager_warehouse_logs_00083 USING btree (affected_table);
CREATE INDEX dmwl_00083_atri_idx ON data_manager_warehouse_logs_00083 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00083 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00083 VALUES (NEW.*);

/* data_manager_warehouse_logs_00084 */
CREATE TABLE data_manager_warehouse_logs_00084 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00084 ADD CONSTRAINT dmwl_00084_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00084 ADD CONSTRAINT dmwl_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX dmwl_00084_dmml_id_idx ON data_manager_warehouse_logs_00084 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00084_at_idx ON data_manager_warehouse_logs_00084 USING btree (affected_table);
CREATE INDEX dmwl_00084_atri_idx ON data_manager_warehouse_logs_00084 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00084 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00084 VALUES (NEW.*);

/* data_manager_warehouse_logs_00085 */
CREATE TABLE data_manager_warehouse_logs_00085 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00085 ADD CONSTRAINT dmwl_00085_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00085 ADD CONSTRAINT dmwl_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX dmwl_00085_dmml_id_idx ON data_manager_warehouse_logs_00085 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00085_at_idx ON data_manager_warehouse_logs_00085 USING btree (affected_table);
CREATE INDEX dmwl_00085_atri_idx ON data_manager_warehouse_logs_00085 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00085 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00085 VALUES (NEW.*);

/* data_manager_warehouse_logs_00086 */
CREATE TABLE data_manager_warehouse_logs_00086 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00086 ADD CONSTRAINT dmwl_00086_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00086 ADD CONSTRAINT dmwl_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX dmwl_00086_dmml_id_idx ON data_manager_warehouse_logs_00086 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00086_at_idx ON data_manager_warehouse_logs_00086 USING btree (affected_table);
CREATE INDEX dmwl_00086_atri_idx ON data_manager_warehouse_logs_00086 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00086 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00086 VALUES (NEW.*);

/* data_manager_warehouse_logs_00087 */
CREATE TABLE data_manager_warehouse_logs_00087 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00087 ADD CONSTRAINT dmwl_00087_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00087 ADD CONSTRAINT dmwl_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX dmwl_00087_dmml_id_idx ON data_manager_warehouse_logs_00087 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00087_at_idx ON data_manager_warehouse_logs_00087 USING btree (affected_table);
CREATE INDEX dmwl_00087_atri_idx ON data_manager_warehouse_logs_00087 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00087 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00087 VALUES (NEW.*);

/* data_manager_warehouse_logs_00088 */
CREATE TABLE data_manager_warehouse_logs_00088 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00088 ADD CONSTRAINT dmwl_00088_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00088 ADD CONSTRAINT dmwl_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX dmwl_00088_dmml_id_idx ON data_manager_warehouse_logs_00088 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00088_at_idx ON data_manager_warehouse_logs_00088 USING btree (affected_table);
CREATE INDEX dmwl_00088_atri_idx ON data_manager_warehouse_logs_00088 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00088 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00088 VALUES (NEW.*);

/* data_manager_warehouse_logs_00089 */
CREATE TABLE data_manager_warehouse_logs_00089 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00089 ADD CONSTRAINT dmwl_00089_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00089 ADD CONSTRAINT dmwl_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX dmwl_00089_dmml_id_idx ON data_manager_warehouse_logs_00089 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00089_at_idx ON data_manager_warehouse_logs_00089 USING btree (affected_table);
CREATE INDEX dmwl_00089_atri_idx ON data_manager_warehouse_logs_00089 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00089 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00089 VALUES (NEW.*);

/* data_manager_warehouse_logs_00090 */
CREATE TABLE data_manager_warehouse_logs_00090 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00090 ADD CONSTRAINT dmwl_00090_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00090 ADD CONSTRAINT dmwl_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX dmwl_00090_dmml_id_idx ON data_manager_warehouse_logs_00090 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00090_at_idx ON data_manager_warehouse_logs_00090 USING btree (affected_table);
CREATE INDEX dmwl_00090_atri_idx ON data_manager_warehouse_logs_00090 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00090 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00090 VALUES (NEW.*);

/* data_manager_warehouse_logs_00091 */
CREATE TABLE data_manager_warehouse_logs_00091 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00091 ADD CONSTRAINT dmwl_00091_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00091 ADD CONSTRAINT dmwl_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX dmwl_00091_dmml_id_idx ON data_manager_warehouse_logs_00091 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00091_at_idx ON data_manager_warehouse_logs_00091 USING btree (affected_table);
CREATE INDEX dmwl_00091_atri_idx ON data_manager_warehouse_logs_00091 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00091 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00091 VALUES (NEW.*);

/* data_manager_warehouse_logs_00092 */
CREATE TABLE data_manager_warehouse_logs_00092 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00092 ADD CONSTRAINT dmwl_00092_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00092 ADD CONSTRAINT dmwl_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX dmwl_00092_dmml_id_idx ON data_manager_warehouse_logs_00092 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00092_at_idx ON data_manager_warehouse_logs_00092 USING btree (affected_table);
CREATE INDEX dmwl_00092_atri_idx ON data_manager_warehouse_logs_00092 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00092 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00092 VALUES (NEW.*);

/* data_manager_warehouse_logs_00093 */
CREATE TABLE data_manager_warehouse_logs_00093 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00093 ADD CONSTRAINT dmwl_00093_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00093 ADD CONSTRAINT dmwl_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX dmwl_00093_dmml_id_idx ON data_manager_warehouse_logs_00093 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00093_at_idx ON data_manager_warehouse_logs_00093 USING btree (affected_table);
CREATE INDEX dmwl_00093_atri_idx ON data_manager_warehouse_logs_00093 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00093 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00093 VALUES (NEW.*);

/* data_manager_warehouse_logs_00094 */
CREATE TABLE data_manager_warehouse_logs_00094 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00094 ADD CONSTRAINT dmwl_00094_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00094 ADD CONSTRAINT dmwl_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX dmwl_00094_dmml_id_idx ON data_manager_warehouse_logs_00094 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00094_at_idx ON data_manager_warehouse_logs_00094 USING btree (affected_table);
CREATE INDEX dmwl_00094_atri_idx ON data_manager_warehouse_logs_00094 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00094 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00094 VALUES (NEW.*);

/* data_manager_warehouse_logs_00095 */
CREATE TABLE data_manager_warehouse_logs_00095 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00095 ADD CONSTRAINT dmwl_00095_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00095 ADD CONSTRAINT dmwl_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX dmwl_00095_dmml_id_idx ON data_manager_warehouse_logs_00095 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00095_at_idx ON data_manager_warehouse_logs_00095 USING btree (affected_table);
CREATE INDEX dmwl_00095_atri_idx ON data_manager_warehouse_logs_00095 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00095 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00095 VALUES (NEW.*);

/* data_manager_warehouse_logs_00096 */
CREATE TABLE data_manager_warehouse_logs_00096 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00096 ADD CONSTRAINT dmwl_00096_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00096 ADD CONSTRAINT dmwl_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX dmwl_00096_dmml_id_idx ON data_manager_warehouse_logs_00096 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00096_at_idx ON data_manager_warehouse_logs_00096 USING btree (affected_table);
CREATE INDEX dmwl_00096_atri_idx ON data_manager_warehouse_logs_00096 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00096 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00096 VALUES (NEW.*);

/* data_manager_warehouse_logs_00097 */
CREATE TABLE data_manager_warehouse_logs_00097 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00097 ADD CONSTRAINT dmwl_00097_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00097 ADD CONSTRAINT dmwl_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX dmwl_00097_dmml_id_idx ON data_manager_warehouse_logs_00097 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00097_at_idx ON data_manager_warehouse_logs_00097 USING btree (affected_table);
CREATE INDEX dmwl_00097_atri_idx ON data_manager_warehouse_logs_00097 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00097 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00097 VALUES (NEW.*);

/* data_manager_warehouse_logs_00098 */
CREATE TABLE data_manager_warehouse_logs_00098 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00098 ADD CONSTRAINT dmwl_00098_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00098 ADD CONSTRAINT dmwl_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX dmwl_00098_dmml_id_idx ON data_manager_warehouse_logs_00098 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00098_at_idx ON data_manager_warehouse_logs_00098 USING btree (affected_table);
CREATE INDEX dmwl_00098_atri_idx ON data_manager_warehouse_logs_00098 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00098 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00098 VALUES (NEW.*);

/* data_manager_warehouse_logs_00099 */
CREATE TABLE data_manager_warehouse_logs_00099 ( ) INHERITS (data_manager_warehouse_logs);
ALTER TABLE data_manager_warehouse_logs_00099 ADD CONSTRAINT dmwl_00099_pk PRIMARY KEY (id);
ALTER TABLE data_manager_warehouse_logs_00099 ADD CONSTRAINT dmwl_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX dmwl_00099_dmml_id_idx ON data_manager_warehouse_logs_00099 USING btree (data_manager_message_log_id);
CREATE INDEX dmwl_00099_at_idx ON data_manager_warehouse_logs_00099 USING btree (affected_table);
CREATE INDEX dmwl_00099_atri_idx ON data_manager_warehouse_logs_00099 USING btree (affected_table_row_id);
CREATE RULE  data_manager_warehouse_logs_00099 AS ON
INSERT TO data_manager_warehouse_logs WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO data_manager_warehouse_logs_00099 VALUES (NEW.*);

/* hipaa_request_items_00000 */
CREATE TABLE hipaa_request_items_00000 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00000 ADD CONSTRAINT hri_00000_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00000 ADD CONSTRAINT hri_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX hri_00000_hri_idx ON hipaa_request_items_00000 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00000 AS ON
INSERT TO hipaa_request_items WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00000 VALUES (NEW.*);

/* hipaa_request_items_00001 */
CREATE TABLE hipaa_request_items_00001 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00001 ADD CONSTRAINT hri_00001_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00001 ADD CONSTRAINT hri_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX hri_00001_hri_idx ON hipaa_request_items_00001 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00001 AS ON
INSERT TO hipaa_request_items WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00001 VALUES (NEW.*);

/* hipaa_request_items_00002 */
CREATE TABLE hipaa_request_items_00002 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00002 ADD CONSTRAINT hri_00002_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00002 ADD CONSTRAINT hri_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX hri_00002_hri_idx ON hipaa_request_items_00002 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00002 AS ON
INSERT TO hipaa_request_items WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00002 VALUES (NEW.*);

/* hipaa_request_items_00003 */
CREATE TABLE hipaa_request_items_00003 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00003 ADD CONSTRAINT hri_00003_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00003 ADD CONSTRAINT hri_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX hri_00003_hri_idx ON hipaa_request_items_00003 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00003 AS ON
INSERT TO hipaa_request_items WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00003 VALUES (NEW.*);

/* hipaa_request_items_00004 */
CREATE TABLE hipaa_request_items_00004 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00004 ADD CONSTRAINT hri_00004_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00004 ADD CONSTRAINT hri_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX hri_00004_hri_idx ON hipaa_request_items_00004 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00004 AS ON
INSERT TO hipaa_request_items WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00004 VALUES (NEW.*);

/* hipaa_request_items_00005 */
CREATE TABLE hipaa_request_items_00005 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00005 ADD CONSTRAINT hri_00005_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00005 ADD CONSTRAINT hri_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX hri_00005_hri_idx ON hipaa_request_items_00005 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00005 AS ON
INSERT TO hipaa_request_items WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00005 VALUES (NEW.*);

/* hipaa_request_items_00006 */
CREATE TABLE hipaa_request_items_00006 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00006 ADD CONSTRAINT hri_00006_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00006 ADD CONSTRAINT hri_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX hri_00006_hri_idx ON hipaa_request_items_00006 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00006 AS ON
INSERT TO hipaa_request_items WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00006 VALUES (NEW.*);

/* hipaa_request_items_00007 */
CREATE TABLE hipaa_request_items_00007 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00007 ADD CONSTRAINT hri_00007_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00007 ADD CONSTRAINT hri_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX hri_00007_hri_idx ON hipaa_request_items_00007 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00007 AS ON
INSERT TO hipaa_request_items WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00007 VALUES (NEW.*);

/* hipaa_request_items_00008 */
CREATE TABLE hipaa_request_items_00008 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00008 ADD CONSTRAINT hri_00008_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00008 ADD CONSTRAINT hri_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX hri_00008_hri_idx ON hipaa_request_items_00008 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00008 AS ON
INSERT TO hipaa_request_items WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00008 VALUES (NEW.*);

/* hipaa_request_items_00009 */
CREATE TABLE hipaa_request_items_00009 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00009 ADD CONSTRAINT hri_00009_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00009 ADD CONSTRAINT hri_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX hri_00009_hri_idx ON hipaa_request_items_00009 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00009 AS ON
INSERT TO hipaa_request_items WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00009 VALUES (NEW.*);

/* hipaa_request_items_00010 */
CREATE TABLE hipaa_request_items_00010 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00010 ADD CONSTRAINT hri_00010_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00010 ADD CONSTRAINT hri_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX hri_00010_hri_idx ON hipaa_request_items_00010 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00010 AS ON
INSERT TO hipaa_request_items WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00010 VALUES (NEW.*);

/* hipaa_request_items_00011 */
CREATE TABLE hipaa_request_items_00011 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00011 ADD CONSTRAINT hri_00011_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00011 ADD CONSTRAINT hri_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX hri_00011_hri_idx ON hipaa_request_items_00011 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00011 AS ON
INSERT TO hipaa_request_items WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00011 VALUES (NEW.*);

/* hipaa_request_items_00012 */
CREATE TABLE hipaa_request_items_00012 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00012 ADD CONSTRAINT hri_00012_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00012 ADD CONSTRAINT hri_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX hri_00012_hri_idx ON hipaa_request_items_00012 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00012 AS ON
INSERT TO hipaa_request_items WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00012 VALUES (NEW.*);

/* hipaa_request_items_00013 */
CREATE TABLE hipaa_request_items_00013 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00013 ADD CONSTRAINT hri_00013_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00013 ADD CONSTRAINT hri_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX hri_00013_hri_idx ON hipaa_request_items_00013 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00013 AS ON
INSERT TO hipaa_request_items WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00013 VALUES (NEW.*);

/* hipaa_request_items_00014 */
CREATE TABLE hipaa_request_items_00014 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00014 ADD CONSTRAINT hri_00014_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00014 ADD CONSTRAINT hri_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX hri_00014_hri_idx ON hipaa_request_items_00014 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00014 AS ON
INSERT TO hipaa_request_items WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00014 VALUES (NEW.*);

/* hipaa_request_items_00015 */
CREATE TABLE hipaa_request_items_00015 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00015 ADD CONSTRAINT hri_00015_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00015 ADD CONSTRAINT hri_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX hri_00015_hri_idx ON hipaa_request_items_00015 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00015 AS ON
INSERT TO hipaa_request_items WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00015 VALUES (NEW.*);

/* hipaa_request_items_00016 */
CREATE TABLE hipaa_request_items_00016 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00016 ADD CONSTRAINT hri_00016_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00016 ADD CONSTRAINT hri_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX hri_00016_hri_idx ON hipaa_request_items_00016 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00016 AS ON
INSERT TO hipaa_request_items WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00016 VALUES (NEW.*);

/* hipaa_request_items_00017 */
CREATE TABLE hipaa_request_items_00017 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00017 ADD CONSTRAINT hri_00017_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00017 ADD CONSTRAINT hri_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX hri_00017_hri_idx ON hipaa_request_items_00017 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00017 AS ON
INSERT TO hipaa_request_items WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00017 VALUES (NEW.*);

/* hipaa_request_items_00018 */
CREATE TABLE hipaa_request_items_00018 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00018 ADD CONSTRAINT hri_00018_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00018 ADD CONSTRAINT hri_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX hri_00018_hri_idx ON hipaa_request_items_00018 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00018 AS ON
INSERT TO hipaa_request_items WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00018 VALUES (NEW.*);

/* hipaa_request_items_00019 */
CREATE TABLE hipaa_request_items_00019 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00019 ADD CONSTRAINT hri_00019_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00019 ADD CONSTRAINT hri_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX hri_00019_hri_idx ON hipaa_request_items_00019 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00019 AS ON
INSERT TO hipaa_request_items WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00019 VALUES (NEW.*);

/* hipaa_request_items_00020 */
CREATE TABLE hipaa_request_items_00020 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00020 ADD CONSTRAINT hri_00020_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00020 ADD CONSTRAINT hri_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX hri_00020_hri_idx ON hipaa_request_items_00020 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00020 AS ON
INSERT TO hipaa_request_items WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00020 VALUES (NEW.*);

/* hipaa_request_items_00021 */
CREATE TABLE hipaa_request_items_00021 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00021 ADD CONSTRAINT hri_00021_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00021 ADD CONSTRAINT hri_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX hri_00021_hri_idx ON hipaa_request_items_00021 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00021 AS ON
INSERT TO hipaa_request_items WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00021 VALUES (NEW.*);

/* hipaa_request_items_00022 */
CREATE TABLE hipaa_request_items_00022 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00022 ADD CONSTRAINT hri_00022_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00022 ADD CONSTRAINT hri_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX hri_00022_hri_idx ON hipaa_request_items_00022 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00022 AS ON
INSERT TO hipaa_request_items WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00022 VALUES (NEW.*);

/* hipaa_request_items_00023 */
CREATE TABLE hipaa_request_items_00023 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00023 ADD CONSTRAINT hri_00023_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00023 ADD CONSTRAINT hri_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX hri_00023_hri_idx ON hipaa_request_items_00023 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00023 AS ON
INSERT TO hipaa_request_items WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00023 VALUES (NEW.*);

/* hipaa_request_items_00024 */
CREATE TABLE hipaa_request_items_00024 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00024 ADD CONSTRAINT hri_00024_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00024 ADD CONSTRAINT hri_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX hri_00024_hri_idx ON hipaa_request_items_00024 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00024 AS ON
INSERT TO hipaa_request_items WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00024 VALUES (NEW.*);

/* hipaa_request_items_00025 */
CREATE TABLE hipaa_request_items_00025 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00025 ADD CONSTRAINT hri_00025_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00025 ADD CONSTRAINT hri_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX hri_00025_hri_idx ON hipaa_request_items_00025 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00025 AS ON
INSERT TO hipaa_request_items WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00025 VALUES (NEW.*);

/* hipaa_request_items_00026 */
CREATE TABLE hipaa_request_items_00026 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00026 ADD CONSTRAINT hri_00026_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00026 ADD CONSTRAINT hri_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX hri_00026_hri_idx ON hipaa_request_items_00026 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00026 AS ON
INSERT TO hipaa_request_items WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00026 VALUES (NEW.*);

/* hipaa_request_items_00027 */
CREATE TABLE hipaa_request_items_00027 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00027 ADD CONSTRAINT hri_00027_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00027 ADD CONSTRAINT hri_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX hri_00027_hri_idx ON hipaa_request_items_00027 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00027 AS ON
INSERT TO hipaa_request_items WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00027 VALUES (NEW.*);

/* hipaa_request_items_00028 */
CREATE TABLE hipaa_request_items_00028 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00028 ADD CONSTRAINT hri_00028_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00028 ADD CONSTRAINT hri_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX hri_00028_hri_idx ON hipaa_request_items_00028 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00028 AS ON
INSERT TO hipaa_request_items WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00028 VALUES (NEW.*);

/* hipaa_request_items_00029 */
CREATE TABLE hipaa_request_items_00029 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00029 ADD CONSTRAINT hri_00029_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00029 ADD CONSTRAINT hri_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX hri_00029_hri_idx ON hipaa_request_items_00029 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00029 AS ON
INSERT TO hipaa_request_items WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00029 VALUES (NEW.*);

/* hipaa_request_items_00030 */
CREATE TABLE hipaa_request_items_00030 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00030 ADD CONSTRAINT hri_00030_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00030 ADD CONSTRAINT hri_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX hri_00030_hri_idx ON hipaa_request_items_00030 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00030 AS ON
INSERT TO hipaa_request_items WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00030 VALUES (NEW.*);

/* hipaa_request_items_00031 */
CREATE TABLE hipaa_request_items_00031 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00031 ADD CONSTRAINT hri_00031_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00031 ADD CONSTRAINT hri_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX hri_00031_hri_idx ON hipaa_request_items_00031 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00031 AS ON
INSERT TO hipaa_request_items WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00031 VALUES (NEW.*);

/* hipaa_request_items_00032 */
CREATE TABLE hipaa_request_items_00032 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00032 ADD CONSTRAINT hri_00032_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00032 ADD CONSTRAINT hri_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX hri_00032_hri_idx ON hipaa_request_items_00032 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00032 AS ON
INSERT TO hipaa_request_items WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00032 VALUES (NEW.*);

/* hipaa_request_items_00033 */
CREATE TABLE hipaa_request_items_00033 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00033 ADD CONSTRAINT hri_00033_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00033 ADD CONSTRAINT hri_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX hri_00033_hri_idx ON hipaa_request_items_00033 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00033 AS ON
INSERT TO hipaa_request_items WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00033 VALUES (NEW.*);

/* hipaa_request_items_00034 */
CREATE TABLE hipaa_request_items_00034 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00034 ADD CONSTRAINT hri_00034_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00034 ADD CONSTRAINT hri_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX hri_00034_hri_idx ON hipaa_request_items_00034 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00034 AS ON
INSERT TO hipaa_request_items WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00034 VALUES (NEW.*);

/* hipaa_request_items_00035 */
CREATE TABLE hipaa_request_items_00035 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00035 ADD CONSTRAINT hri_00035_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00035 ADD CONSTRAINT hri_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX hri_00035_hri_idx ON hipaa_request_items_00035 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00035 AS ON
INSERT TO hipaa_request_items WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00035 VALUES (NEW.*);

/* hipaa_request_items_00036 */
CREATE TABLE hipaa_request_items_00036 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00036 ADD CONSTRAINT hri_00036_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00036 ADD CONSTRAINT hri_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX hri_00036_hri_idx ON hipaa_request_items_00036 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00036 AS ON
INSERT TO hipaa_request_items WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00036 VALUES (NEW.*);

/* hipaa_request_items_00037 */
CREATE TABLE hipaa_request_items_00037 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00037 ADD CONSTRAINT hri_00037_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00037 ADD CONSTRAINT hri_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX hri_00037_hri_idx ON hipaa_request_items_00037 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00037 AS ON
INSERT TO hipaa_request_items WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00037 VALUES (NEW.*);

/* hipaa_request_items_00038 */
CREATE TABLE hipaa_request_items_00038 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00038 ADD CONSTRAINT hri_00038_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00038 ADD CONSTRAINT hri_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX hri_00038_hri_idx ON hipaa_request_items_00038 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00038 AS ON
INSERT TO hipaa_request_items WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00038 VALUES (NEW.*);

/* hipaa_request_items_00039 */
CREATE TABLE hipaa_request_items_00039 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00039 ADD CONSTRAINT hri_00039_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00039 ADD CONSTRAINT hri_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX hri_00039_hri_idx ON hipaa_request_items_00039 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00039 AS ON
INSERT TO hipaa_request_items WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00039 VALUES (NEW.*);

/* hipaa_request_items_00040 */
CREATE TABLE hipaa_request_items_00040 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00040 ADD CONSTRAINT hri_00040_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00040 ADD CONSTRAINT hri_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX hri_00040_hri_idx ON hipaa_request_items_00040 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00040 AS ON
INSERT TO hipaa_request_items WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00040 VALUES (NEW.*);

/* hipaa_request_items_00041 */
CREATE TABLE hipaa_request_items_00041 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00041 ADD CONSTRAINT hri_00041_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00041 ADD CONSTRAINT hri_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX hri_00041_hri_idx ON hipaa_request_items_00041 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00041 AS ON
INSERT TO hipaa_request_items WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00041 VALUES (NEW.*);

/* hipaa_request_items_00042 */
CREATE TABLE hipaa_request_items_00042 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00042 ADD CONSTRAINT hri_00042_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00042 ADD CONSTRAINT hri_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX hri_00042_hri_idx ON hipaa_request_items_00042 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00042 AS ON
INSERT TO hipaa_request_items WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00042 VALUES (NEW.*);

/* hipaa_request_items_00043 */
CREATE TABLE hipaa_request_items_00043 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00043 ADD CONSTRAINT hri_00043_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00043 ADD CONSTRAINT hri_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX hri_00043_hri_idx ON hipaa_request_items_00043 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00043 AS ON
INSERT TO hipaa_request_items WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00043 VALUES (NEW.*);

/* hipaa_request_items_00044 */
CREATE TABLE hipaa_request_items_00044 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00044 ADD CONSTRAINT hri_00044_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00044 ADD CONSTRAINT hri_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX hri_00044_hri_idx ON hipaa_request_items_00044 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00044 AS ON
INSERT TO hipaa_request_items WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00044 VALUES (NEW.*);

/* hipaa_request_items_00045 */
CREATE TABLE hipaa_request_items_00045 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00045 ADD CONSTRAINT hri_00045_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00045 ADD CONSTRAINT hri_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX hri_00045_hri_idx ON hipaa_request_items_00045 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00045 AS ON
INSERT TO hipaa_request_items WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00045 VALUES (NEW.*);

/* hipaa_request_items_00046 */
CREATE TABLE hipaa_request_items_00046 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00046 ADD CONSTRAINT hri_00046_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00046 ADD CONSTRAINT hri_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX hri_00046_hri_idx ON hipaa_request_items_00046 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00046 AS ON
INSERT TO hipaa_request_items WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00046 VALUES (NEW.*);

/* hipaa_request_items_00047 */
CREATE TABLE hipaa_request_items_00047 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00047 ADD CONSTRAINT hri_00047_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00047 ADD CONSTRAINT hri_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX hri_00047_hri_idx ON hipaa_request_items_00047 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00047 AS ON
INSERT TO hipaa_request_items WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00047 VALUES (NEW.*);

/* hipaa_request_items_00048 */
CREATE TABLE hipaa_request_items_00048 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00048 ADD CONSTRAINT hri_00048_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00048 ADD CONSTRAINT hri_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX hri_00048_hri_idx ON hipaa_request_items_00048 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00048 AS ON
INSERT TO hipaa_request_items WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00048 VALUES (NEW.*);

/* hipaa_request_items_00049 */
CREATE TABLE hipaa_request_items_00049 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00049 ADD CONSTRAINT hri_00049_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00049 ADD CONSTRAINT hri_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX hri_00049_hri_idx ON hipaa_request_items_00049 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00049 AS ON
INSERT TO hipaa_request_items WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00049 VALUES (NEW.*);

/* hipaa_request_items_00050 */
CREATE TABLE hipaa_request_items_00050 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00050 ADD CONSTRAINT hri_00050_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00050 ADD CONSTRAINT hri_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX hri_00050_hri_idx ON hipaa_request_items_00050 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00050 AS ON
INSERT TO hipaa_request_items WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00050 VALUES (NEW.*);

/* hipaa_request_items_00051 */
CREATE TABLE hipaa_request_items_00051 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00051 ADD CONSTRAINT hri_00051_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00051 ADD CONSTRAINT hri_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX hri_00051_hri_idx ON hipaa_request_items_00051 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00051 AS ON
INSERT TO hipaa_request_items WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00051 VALUES (NEW.*);

/* hipaa_request_items_00052 */
CREATE TABLE hipaa_request_items_00052 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00052 ADD CONSTRAINT hri_00052_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00052 ADD CONSTRAINT hri_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX hri_00052_hri_idx ON hipaa_request_items_00052 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00052 AS ON
INSERT TO hipaa_request_items WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00052 VALUES (NEW.*);

/* hipaa_request_items_00053 */
CREATE TABLE hipaa_request_items_00053 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00053 ADD CONSTRAINT hri_00053_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00053 ADD CONSTRAINT hri_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX hri_00053_hri_idx ON hipaa_request_items_00053 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00053 AS ON
INSERT TO hipaa_request_items WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00053 VALUES (NEW.*);

/* hipaa_request_items_00054 */
CREATE TABLE hipaa_request_items_00054 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00054 ADD CONSTRAINT hri_00054_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00054 ADD CONSTRAINT hri_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX hri_00054_hri_idx ON hipaa_request_items_00054 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00054 AS ON
INSERT TO hipaa_request_items WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00054 VALUES (NEW.*);

/* hipaa_request_items_00055 */
CREATE TABLE hipaa_request_items_00055 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00055 ADD CONSTRAINT hri_00055_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00055 ADD CONSTRAINT hri_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX hri_00055_hri_idx ON hipaa_request_items_00055 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00055 AS ON
INSERT TO hipaa_request_items WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00055 VALUES (NEW.*);

/* hipaa_request_items_00056 */
CREATE TABLE hipaa_request_items_00056 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00056 ADD CONSTRAINT hri_00056_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00056 ADD CONSTRAINT hri_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX hri_00056_hri_idx ON hipaa_request_items_00056 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00056 AS ON
INSERT TO hipaa_request_items WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00056 VALUES (NEW.*);

/* hipaa_request_items_00057 */
CREATE TABLE hipaa_request_items_00057 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00057 ADD CONSTRAINT hri_00057_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00057 ADD CONSTRAINT hri_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX hri_00057_hri_idx ON hipaa_request_items_00057 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00057 AS ON
INSERT TO hipaa_request_items WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00057 VALUES (NEW.*);

/* hipaa_request_items_00058 */
CREATE TABLE hipaa_request_items_00058 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00058 ADD CONSTRAINT hri_00058_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00058 ADD CONSTRAINT hri_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX hri_00058_hri_idx ON hipaa_request_items_00058 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00058 AS ON
INSERT TO hipaa_request_items WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00058 VALUES (NEW.*);

/* hipaa_request_items_00059 */
CREATE TABLE hipaa_request_items_00059 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00059 ADD CONSTRAINT hri_00059_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00059 ADD CONSTRAINT hri_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX hri_00059_hri_idx ON hipaa_request_items_00059 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00059 AS ON
INSERT TO hipaa_request_items WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00059 VALUES (NEW.*);

/* hipaa_request_items_00060 */
CREATE TABLE hipaa_request_items_00060 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00060 ADD CONSTRAINT hri_00060_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00060 ADD CONSTRAINT hri_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX hri_00060_hri_idx ON hipaa_request_items_00060 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00060 AS ON
INSERT TO hipaa_request_items WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00060 VALUES (NEW.*);

/* hipaa_request_items_00061 */
CREATE TABLE hipaa_request_items_00061 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00061 ADD CONSTRAINT hri_00061_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00061 ADD CONSTRAINT hri_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX hri_00061_hri_idx ON hipaa_request_items_00061 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00061 AS ON
INSERT TO hipaa_request_items WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00061 VALUES (NEW.*);

/* hipaa_request_items_00062 */
CREATE TABLE hipaa_request_items_00062 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00062 ADD CONSTRAINT hri_00062_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00062 ADD CONSTRAINT hri_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX hri_00062_hri_idx ON hipaa_request_items_00062 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00062 AS ON
INSERT TO hipaa_request_items WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00062 VALUES (NEW.*);

/* hipaa_request_items_00063 */
CREATE TABLE hipaa_request_items_00063 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00063 ADD CONSTRAINT hri_00063_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00063 ADD CONSTRAINT hri_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX hri_00063_hri_idx ON hipaa_request_items_00063 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00063 AS ON
INSERT TO hipaa_request_items WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00063 VALUES (NEW.*);

/* hipaa_request_items_00064 */
CREATE TABLE hipaa_request_items_00064 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00064 ADD CONSTRAINT hri_00064_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00064 ADD CONSTRAINT hri_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX hri_00064_hri_idx ON hipaa_request_items_00064 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00064 AS ON
INSERT TO hipaa_request_items WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00064 VALUES (NEW.*);

/* hipaa_request_items_00065 */
CREATE TABLE hipaa_request_items_00065 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00065 ADD CONSTRAINT hri_00065_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00065 ADD CONSTRAINT hri_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX hri_00065_hri_idx ON hipaa_request_items_00065 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00065 AS ON
INSERT TO hipaa_request_items WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00065 VALUES (NEW.*);

/* hipaa_request_items_00066 */
CREATE TABLE hipaa_request_items_00066 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00066 ADD CONSTRAINT hri_00066_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00066 ADD CONSTRAINT hri_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX hri_00066_hri_idx ON hipaa_request_items_00066 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00066 AS ON
INSERT TO hipaa_request_items WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00066 VALUES (NEW.*);

/* hipaa_request_items_00067 */
CREATE TABLE hipaa_request_items_00067 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00067 ADD CONSTRAINT hri_00067_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00067 ADD CONSTRAINT hri_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX hri_00067_hri_idx ON hipaa_request_items_00067 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00067 AS ON
INSERT TO hipaa_request_items WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00067 VALUES (NEW.*);

/* hipaa_request_items_00068 */
CREATE TABLE hipaa_request_items_00068 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00068 ADD CONSTRAINT hri_00068_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00068 ADD CONSTRAINT hri_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX hri_00068_hri_idx ON hipaa_request_items_00068 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00068 AS ON
INSERT TO hipaa_request_items WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00068 VALUES (NEW.*);

/* hipaa_request_items_00069 */
CREATE TABLE hipaa_request_items_00069 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00069 ADD CONSTRAINT hri_00069_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00069 ADD CONSTRAINT hri_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX hri_00069_hri_idx ON hipaa_request_items_00069 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00069 AS ON
INSERT TO hipaa_request_items WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00069 VALUES (NEW.*);

/* hipaa_request_items_00070 */
CREATE TABLE hipaa_request_items_00070 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00070 ADD CONSTRAINT hri_00070_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00070 ADD CONSTRAINT hri_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX hri_00070_hri_idx ON hipaa_request_items_00070 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00070 AS ON
INSERT TO hipaa_request_items WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00070 VALUES (NEW.*);

/* hipaa_request_items_00071 */
CREATE TABLE hipaa_request_items_00071 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00071 ADD CONSTRAINT hri_00071_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00071 ADD CONSTRAINT hri_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX hri_00071_hri_idx ON hipaa_request_items_00071 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00071 AS ON
INSERT TO hipaa_request_items WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00071 VALUES (NEW.*);

/* hipaa_request_items_00072 */
CREATE TABLE hipaa_request_items_00072 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00072 ADD CONSTRAINT hri_00072_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00072 ADD CONSTRAINT hri_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX hri_00072_hri_idx ON hipaa_request_items_00072 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00072 AS ON
INSERT TO hipaa_request_items WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00072 VALUES (NEW.*);

/* hipaa_request_items_00073 */
CREATE TABLE hipaa_request_items_00073 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00073 ADD CONSTRAINT hri_00073_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00073 ADD CONSTRAINT hri_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX hri_00073_hri_idx ON hipaa_request_items_00073 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00073 AS ON
INSERT TO hipaa_request_items WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00073 VALUES (NEW.*);

/* hipaa_request_items_00074 */
CREATE TABLE hipaa_request_items_00074 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00074 ADD CONSTRAINT hri_00074_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00074 ADD CONSTRAINT hri_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX hri_00074_hri_idx ON hipaa_request_items_00074 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00074 AS ON
INSERT TO hipaa_request_items WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00074 VALUES (NEW.*);

/* hipaa_request_items_00075 */
CREATE TABLE hipaa_request_items_00075 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00075 ADD CONSTRAINT hri_00075_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00075 ADD CONSTRAINT hri_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX hri_00075_hri_idx ON hipaa_request_items_00075 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00075 AS ON
INSERT TO hipaa_request_items WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00075 VALUES (NEW.*);

/* hipaa_request_items_00076 */
CREATE TABLE hipaa_request_items_00076 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00076 ADD CONSTRAINT hri_00076_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00076 ADD CONSTRAINT hri_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX hri_00076_hri_idx ON hipaa_request_items_00076 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00076 AS ON
INSERT TO hipaa_request_items WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00076 VALUES (NEW.*);

/* hipaa_request_items_00077 */
CREATE TABLE hipaa_request_items_00077 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00077 ADD CONSTRAINT hri_00077_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00077 ADD CONSTRAINT hri_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX hri_00077_hri_idx ON hipaa_request_items_00077 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00077 AS ON
INSERT TO hipaa_request_items WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00077 VALUES (NEW.*);

/* hipaa_request_items_00078 */
CREATE TABLE hipaa_request_items_00078 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00078 ADD CONSTRAINT hri_00078_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00078 ADD CONSTRAINT hri_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX hri_00078_hri_idx ON hipaa_request_items_00078 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00078 AS ON
INSERT TO hipaa_request_items WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00078 VALUES (NEW.*);

/* hipaa_request_items_00079 */
CREATE TABLE hipaa_request_items_00079 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00079 ADD CONSTRAINT hri_00079_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00079 ADD CONSTRAINT hri_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX hri_00079_hri_idx ON hipaa_request_items_00079 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00079 AS ON
INSERT TO hipaa_request_items WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00079 VALUES (NEW.*);

/* hipaa_request_items_00080 */
CREATE TABLE hipaa_request_items_00080 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00080 ADD CONSTRAINT hri_00080_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00080 ADD CONSTRAINT hri_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX hri_00080_hri_idx ON hipaa_request_items_00080 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00080 AS ON
INSERT TO hipaa_request_items WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00080 VALUES (NEW.*);

/* hipaa_request_items_00081 */
CREATE TABLE hipaa_request_items_00081 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00081 ADD CONSTRAINT hri_00081_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00081 ADD CONSTRAINT hri_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX hri_00081_hri_idx ON hipaa_request_items_00081 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00081 AS ON
INSERT TO hipaa_request_items WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00081 VALUES (NEW.*);

/* hipaa_request_items_00082 */
CREATE TABLE hipaa_request_items_00082 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00082 ADD CONSTRAINT hri_00082_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00082 ADD CONSTRAINT hri_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX hri_00082_hri_idx ON hipaa_request_items_00082 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00082 AS ON
INSERT TO hipaa_request_items WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00082 VALUES (NEW.*);

/* hipaa_request_items_00083 */
CREATE TABLE hipaa_request_items_00083 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00083 ADD CONSTRAINT hri_00083_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00083 ADD CONSTRAINT hri_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX hri_00083_hri_idx ON hipaa_request_items_00083 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00083 AS ON
INSERT TO hipaa_request_items WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00083 VALUES (NEW.*);

/* hipaa_request_items_00084 */
CREATE TABLE hipaa_request_items_00084 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00084 ADD CONSTRAINT hri_00084_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00084 ADD CONSTRAINT hri_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX hri_00084_hri_idx ON hipaa_request_items_00084 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00084 AS ON
INSERT TO hipaa_request_items WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00084 VALUES (NEW.*);

/* hipaa_request_items_00085 */
CREATE TABLE hipaa_request_items_00085 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00085 ADD CONSTRAINT hri_00085_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00085 ADD CONSTRAINT hri_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX hri_00085_hri_idx ON hipaa_request_items_00085 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00085 AS ON
INSERT TO hipaa_request_items WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00085 VALUES (NEW.*);

/* hipaa_request_items_00086 */
CREATE TABLE hipaa_request_items_00086 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00086 ADD CONSTRAINT hri_00086_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00086 ADD CONSTRAINT hri_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX hri_00086_hri_idx ON hipaa_request_items_00086 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00086 AS ON
INSERT TO hipaa_request_items WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00086 VALUES (NEW.*);

/* hipaa_request_items_00087 */
CREATE TABLE hipaa_request_items_00087 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00087 ADD CONSTRAINT hri_00087_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00087 ADD CONSTRAINT hri_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX hri_00087_hri_idx ON hipaa_request_items_00087 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00087 AS ON
INSERT TO hipaa_request_items WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00087 VALUES (NEW.*);

/* hipaa_request_items_00088 */
CREATE TABLE hipaa_request_items_00088 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00088 ADD CONSTRAINT hri_00088_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00088 ADD CONSTRAINT hri_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX hri_00088_hri_idx ON hipaa_request_items_00088 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00088 AS ON
INSERT TO hipaa_request_items WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00088 VALUES (NEW.*);

/* hipaa_request_items_00089 */
CREATE TABLE hipaa_request_items_00089 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00089 ADD CONSTRAINT hri_00089_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00089 ADD CONSTRAINT hri_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX hri_00089_hri_idx ON hipaa_request_items_00089 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00089 AS ON
INSERT TO hipaa_request_items WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00089 VALUES (NEW.*);

/* hipaa_request_items_00090 */
CREATE TABLE hipaa_request_items_00090 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00090 ADD CONSTRAINT hri_00090_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00090 ADD CONSTRAINT hri_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX hri_00090_hri_idx ON hipaa_request_items_00090 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00090 AS ON
INSERT TO hipaa_request_items WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00090 VALUES (NEW.*);

/* hipaa_request_items_00091 */
CREATE TABLE hipaa_request_items_00091 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00091 ADD CONSTRAINT hri_00091_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00091 ADD CONSTRAINT hri_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX hri_00091_hri_idx ON hipaa_request_items_00091 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00091 AS ON
INSERT TO hipaa_request_items WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00091 VALUES (NEW.*);

/* hipaa_request_items_00092 */
CREATE TABLE hipaa_request_items_00092 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00092 ADD CONSTRAINT hri_00092_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00092 ADD CONSTRAINT hri_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX hri_00092_hri_idx ON hipaa_request_items_00092 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00092 AS ON
INSERT TO hipaa_request_items WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00092 VALUES (NEW.*);

/* hipaa_request_items_00093 */
CREATE TABLE hipaa_request_items_00093 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00093 ADD CONSTRAINT hri_00093_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00093 ADD CONSTRAINT hri_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX hri_00093_hri_idx ON hipaa_request_items_00093 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00093 AS ON
INSERT TO hipaa_request_items WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00093 VALUES (NEW.*);

/* hipaa_request_items_00094 */
CREATE TABLE hipaa_request_items_00094 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00094 ADD CONSTRAINT hri_00094_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00094 ADD CONSTRAINT hri_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX hri_00094_hri_idx ON hipaa_request_items_00094 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00094 AS ON
INSERT TO hipaa_request_items WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00094 VALUES (NEW.*);

/* hipaa_request_items_00095 */
CREATE TABLE hipaa_request_items_00095 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00095 ADD CONSTRAINT hri_00095_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00095 ADD CONSTRAINT hri_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX hri_00095_hri_idx ON hipaa_request_items_00095 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00095 AS ON
INSERT TO hipaa_request_items WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00095 VALUES (NEW.*);

/* hipaa_request_items_00096 */
CREATE TABLE hipaa_request_items_00096 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00096 ADD CONSTRAINT hri_00096_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00096 ADD CONSTRAINT hri_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX hri_00096_hri_idx ON hipaa_request_items_00096 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00096 AS ON
INSERT TO hipaa_request_items WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00096 VALUES (NEW.*);

/* hipaa_request_items_00097 */
CREATE TABLE hipaa_request_items_00097 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00097 ADD CONSTRAINT hri_00097_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00097 ADD CONSTRAINT hri_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX hri_00097_hri_idx ON hipaa_request_items_00097 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00097 AS ON
INSERT TO hipaa_request_items WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00097 VALUES (NEW.*);

/* hipaa_request_items_00098 */
CREATE TABLE hipaa_request_items_00098 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00098 ADD CONSTRAINT hri_00098_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00098 ADD CONSTRAINT hri_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX hri_00098_hri_idx ON hipaa_request_items_00098 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00098 AS ON
INSERT TO hipaa_request_items WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00098 VALUES (NEW.*);

/* hipaa_request_items_00099 */
CREATE TABLE hipaa_request_items_00099 ( ) INHERITS (hipaa_request_items);
ALTER TABLE hipaa_request_items_00099 ADD CONSTRAINT hri_00099_pk PRIMARY KEY (id);
ALTER TABLE hipaa_request_items_00099 ADD CONSTRAINT hri_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX hri_00099_hri_idx ON hipaa_request_items_00099 USING btree (hipaa_request_id);
CREATE RULE  hipaa_request_items_00099 AS ON
INSERT TO hipaa_request_items WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO hipaa_request_items_00099 VALUES (NEW.*);

/* hipaa_requests_00000 */
CREATE TABLE hipaa_requests_00000 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00000 ADD CONSTRAINT hr_00000_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00000 ADD CONSTRAINT hr_00000_id_check CHECK (((id >= 0) AND (id <= 1000000)));
CREATE INDEX hr_00000_user_id_idx ON hipaa_requests_00000 USING btree (user_id);
CREATE RULE  hipaa_requests_00000 AS ON
INSERT TO hipaa_requests WHERE ( id between 0 AND 1000000 )
DO INSTEAD INSERT INTO hipaa_requests_00000 VALUES (NEW.*);

/* hipaa_requests_00001 */
CREATE TABLE hipaa_requests_00001 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00001 ADD CONSTRAINT hr_00001_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00001 ADD CONSTRAINT hr_00001_id_check CHECK (((id >= 1000001) AND (id <= 2000000)));
CREATE INDEX hr_00001_user_id_idx ON hipaa_requests_00001 USING btree (user_id);
CREATE RULE  hipaa_requests_00001 AS ON
INSERT TO hipaa_requests WHERE ( id between 1000001 AND 2000000 )
DO INSTEAD INSERT INTO hipaa_requests_00001 VALUES (NEW.*);

/* hipaa_requests_00002 */
CREATE TABLE hipaa_requests_00002 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00002 ADD CONSTRAINT hr_00002_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00002 ADD CONSTRAINT hr_00002_id_check CHECK (((id >= 2000001) AND (id <= 3000000)));
CREATE INDEX hr_00002_user_id_idx ON hipaa_requests_00002 USING btree (user_id);
CREATE RULE  hipaa_requests_00002 AS ON
INSERT TO hipaa_requests WHERE ( id between 2000001 AND 3000000 )
DO INSTEAD INSERT INTO hipaa_requests_00002 VALUES (NEW.*);

/* hipaa_requests_00003 */
CREATE TABLE hipaa_requests_00003 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00003 ADD CONSTRAINT hr_00003_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00003 ADD CONSTRAINT hr_00003_id_check CHECK (((id >= 3000001) AND (id <= 4000000)));
CREATE INDEX hr_00003_user_id_idx ON hipaa_requests_00003 USING btree (user_id);
CREATE RULE  hipaa_requests_00003 AS ON
INSERT TO hipaa_requests WHERE ( id between 3000001 AND 4000000 )
DO INSTEAD INSERT INTO hipaa_requests_00003 VALUES (NEW.*);

/* hipaa_requests_00004 */
CREATE TABLE hipaa_requests_00004 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00004 ADD CONSTRAINT hr_00004_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00004 ADD CONSTRAINT hr_00004_id_check CHECK (((id >= 4000001) AND (id <= 5000000)));
CREATE INDEX hr_00004_user_id_idx ON hipaa_requests_00004 USING btree (user_id);
CREATE RULE  hipaa_requests_00004 AS ON
INSERT TO hipaa_requests WHERE ( id between 4000001 AND 5000000 )
DO INSTEAD INSERT INTO hipaa_requests_00004 VALUES (NEW.*);

/* hipaa_requests_00005 */
CREATE TABLE hipaa_requests_00005 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00005 ADD CONSTRAINT hr_00005_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00005 ADD CONSTRAINT hr_00005_id_check CHECK (((id >= 5000001) AND (id <= 6000000)));
CREATE INDEX hr_00005_user_id_idx ON hipaa_requests_00005 USING btree (user_id);
CREATE RULE  hipaa_requests_00005 AS ON
INSERT TO hipaa_requests WHERE ( id between 5000001 AND 6000000 )
DO INSTEAD INSERT INTO hipaa_requests_00005 VALUES (NEW.*);

/* hipaa_requests_00006 */
CREATE TABLE hipaa_requests_00006 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00006 ADD CONSTRAINT hr_00006_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00006 ADD CONSTRAINT hr_00006_id_check CHECK (((id >= 6000001) AND (id <= 7000000)));
CREATE INDEX hr_00006_user_id_idx ON hipaa_requests_00006 USING btree (user_id);
CREATE RULE  hipaa_requests_00006 AS ON
INSERT TO hipaa_requests WHERE ( id between 6000001 AND 7000000 )
DO INSTEAD INSERT INTO hipaa_requests_00006 VALUES (NEW.*);

/* hipaa_requests_00007 */
CREATE TABLE hipaa_requests_00007 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00007 ADD CONSTRAINT hr_00007_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00007 ADD CONSTRAINT hr_00007_id_check CHECK (((id >= 7000001) AND (id <= 8000000)));
CREATE INDEX hr_00007_user_id_idx ON hipaa_requests_00007 USING btree (user_id);
CREATE RULE  hipaa_requests_00007 AS ON
INSERT TO hipaa_requests WHERE ( id between 7000001 AND 8000000 )
DO INSTEAD INSERT INTO hipaa_requests_00007 VALUES (NEW.*);

/* hipaa_requests_00008 */
CREATE TABLE hipaa_requests_00008 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00008 ADD CONSTRAINT hr_00008_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00008 ADD CONSTRAINT hr_00008_id_check CHECK (((id >= 8000001) AND (id <= 9000000)));
CREATE INDEX hr_00008_user_id_idx ON hipaa_requests_00008 USING btree (user_id);
CREATE RULE  hipaa_requests_00008 AS ON
INSERT TO hipaa_requests WHERE ( id between 8000001 AND 9000000 )
DO INSTEAD INSERT INTO hipaa_requests_00008 VALUES (NEW.*);

/* hipaa_requests_00009 */
CREATE TABLE hipaa_requests_00009 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00009 ADD CONSTRAINT hr_00009_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00009 ADD CONSTRAINT hr_00009_id_check CHECK (((id >= 9000001) AND (id <= 10000000)));
CREATE INDEX hr_00009_user_id_idx ON hipaa_requests_00009 USING btree (user_id);
CREATE RULE  hipaa_requests_00009 AS ON
INSERT TO hipaa_requests WHERE ( id between 9000001 AND 10000000 )
DO INSTEAD INSERT INTO hipaa_requests_00009 VALUES (NEW.*);

/* hipaa_requests_00010 */
CREATE TABLE hipaa_requests_00010 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00010 ADD CONSTRAINT hr_00010_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00010 ADD CONSTRAINT hr_00010_id_check CHECK (((id >= 10000001) AND (id <= 11000000)));
CREATE INDEX hr_00010_user_id_idx ON hipaa_requests_00010 USING btree (user_id);
CREATE RULE  hipaa_requests_00010 AS ON
INSERT TO hipaa_requests WHERE ( id between 10000001 AND 11000000 )
DO INSTEAD INSERT INTO hipaa_requests_00010 VALUES (NEW.*);

/* hipaa_requests_00011 */
CREATE TABLE hipaa_requests_00011 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00011 ADD CONSTRAINT hr_00011_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00011 ADD CONSTRAINT hr_00011_id_check CHECK (((id >= 11000001) AND (id <= 12000000)));
CREATE INDEX hr_00011_user_id_idx ON hipaa_requests_00011 USING btree (user_id);
CREATE RULE  hipaa_requests_00011 AS ON
INSERT TO hipaa_requests WHERE ( id between 11000001 AND 12000000 )
DO INSTEAD INSERT INTO hipaa_requests_00011 VALUES (NEW.*);

/* hipaa_requests_00012 */
CREATE TABLE hipaa_requests_00012 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00012 ADD CONSTRAINT hr_00012_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00012 ADD CONSTRAINT hr_00012_id_check CHECK (((id >= 12000001) AND (id <= 13000000)));
CREATE INDEX hr_00012_user_id_idx ON hipaa_requests_00012 USING btree (user_id);
CREATE RULE  hipaa_requests_00012 AS ON
INSERT TO hipaa_requests WHERE ( id between 12000001 AND 13000000 )
DO INSTEAD INSERT INTO hipaa_requests_00012 VALUES (NEW.*);

/* hipaa_requests_00013 */
CREATE TABLE hipaa_requests_00013 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00013 ADD CONSTRAINT hr_00013_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00013 ADD CONSTRAINT hr_00013_id_check CHECK (((id >= 13000001) AND (id <= 14000000)));
CREATE INDEX hr_00013_user_id_idx ON hipaa_requests_00013 USING btree (user_id);
CREATE RULE  hipaa_requests_00013 AS ON
INSERT TO hipaa_requests WHERE ( id between 13000001 AND 14000000 )
DO INSTEAD INSERT INTO hipaa_requests_00013 VALUES (NEW.*);

/* hipaa_requests_00014 */
CREATE TABLE hipaa_requests_00014 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00014 ADD CONSTRAINT hr_00014_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00014 ADD CONSTRAINT hr_00014_id_check CHECK (((id >= 14000001) AND (id <= 15000000)));
CREATE INDEX hr_00014_user_id_idx ON hipaa_requests_00014 USING btree (user_id);
CREATE RULE  hipaa_requests_00014 AS ON
INSERT TO hipaa_requests WHERE ( id between 14000001 AND 15000000 )
DO INSTEAD INSERT INTO hipaa_requests_00014 VALUES (NEW.*);

/* hipaa_requests_00015 */
CREATE TABLE hipaa_requests_00015 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00015 ADD CONSTRAINT hr_00015_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00015 ADD CONSTRAINT hr_00015_id_check CHECK (((id >= 15000001) AND (id <= 16000000)));
CREATE INDEX hr_00015_user_id_idx ON hipaa_requests_00015 USING btree (user_id);
CREATE RULE  hipaa_requests_00015 AS ON
INSERT TO hipaa_requests WHERE ( id between 15000001 AND 16000000 )
DO INSTEAD INSERT INTO hipaa_requests_00015 VALUES (NEW.*);

/* hipaa_requests_00016 */
CREATE TABLE hipaa_requests_00016 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00016 ADD CONSTRAINT hr_00016_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00016 ADD CONSTRAINT hr_00016_id_check CHECK (((id >= 16000001) AND (id <= 17000000)));
CREATE INDEX hr_00016_user_id_idx ON hipaa_requests_00016 USING btree (user_id);
CREATE RULE  hipaa_requests_00016 AS ON
INSERT TO hipaa_requests WHERE ( id between 16000001 AND 17000000 )
DO INSTEAD INSERT INTO hipaa_requests_00016 VALUES (NEW.*);

/* hipaa_requests_00017 */
CREATE TABLE hipaa_requests_00017 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00017 ADD CONSTRAINT hr_00017_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00017 ADD CONSTRAINT hr_00017_id_check CHECK (((id >= 17000001) AND (id <= 18000000)));
CREATE INDEX hr_00017_user_id_idx ON hipaa_requests_00017 USING btree (user_id);
CREATE RULE  hipaa_requests_00017 AS ON
INSERT TO hipaa_requests WHERE ( id between 17000001 AND 18000000 )
DO INSTEAD INSERT INTO hipaa_requests_00017 VALUES (NEW.*);

/* hipaa_requests_00018 */
CREATE TABLE hipaa_requests_00018 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00018 ADD CONSTRAINT hr_00018_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00018 ADD CONSTRAINT hr_00018_id_check CHECK (((id >= 18000001) AND (id <= 19000000)));
CREATE INDEX hr_00018_user_id_idx ON hipaa_requests_00018 USING btree (user_id);
CREATE RULE  hipaa_requests_00018 AS ON
INSERT TO hipaa_requests WHERE ( id between 18000001 AND 19000000 )
DO INSTEAD INSERT INTO hipaa_requests_00018 VALUES (NEW.*);

/* hipaa_requests_00019 */
CREATE TABLE hipaa_requests_00019 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00019 ADD CONSTRAINT hr_00019_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00019 ADD CONSTRAINT hr_00019_id_check CHECK (((id >= 19000001) AND (id <= 20000000)));
CREATE INDEX hr_00019_user_id_idx ON hipaa_requests_00019 USING btree (user_id);
CREATE RULE  hipaa_requests_00019 AS ON
INSERT TO hipaa_requests WHERE ( id between 19000001 AND 20000000 )
DO INSTEAD INSERT INTO hipaa_requests_00019 VALUES (NEW.*);

/* hipaa_requests_00020 */
CREATE TABLE hipaa_requests_00020 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00020 ADD CONSTRAINT hr_00020_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00020 ADD CONSTRAINT hr_00020_id_check CHECK (((id >= 20000001) AND (id <= 21000000)));
CREATE INDEX hr_00020_user_id_idx ON hipaa_requests_00020 USING btree (user_id);
CREATE RULE  hipaa_requests_00020 AS ON
INSERT TO hipaa_requests WHERE ( id between 20000001 AND 21000000 )
DO INSTEAD INSERT INTO hipaa_requests_00020 VALUES (NEW.*);

/* hipaa_requests_00021 */
CREATE TABLE hipaa_requests_00021 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00021 ADD CONSTRAINT hr_00021_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00021 ADD CONSTRAINT hr_00021_id_check CHECK (((id >= 21000001) AND (id <= 22000000)));
CREATE INDEX hr_00021_user_id_idx ON hipaa_requests_00021 USING btree (user_id);
CREATE RULE  hipaa_requests_00021 AS ON
INSERT TO hipaa_requests WHERE ( id between 21000001 AND 22000000 )
DO INSTEAD INSERT INTO hipaa_requests_00021 VALUES (NEW.*);

/* hipaa_requests_00022 */
CREATE TABLE hipaa_requests_00022 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00022 ADD CONSTRAINT hr_00022_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00022 ADD CONSTRAINT hr_00022_id_check CHECK (((id >= 22000001) AND (id <= 23000000)));
CREATE INDEX hr_00022_user_id_idx ON hipaa_requests_00022 USING btree (user_id);
CREATE RULE  hipaa_requests_00022 AS ON
INSERT TO hipaa_requests WHERE ( id between 22000001 AND 23000000 )
DO INSTEAD INSERT INTO hipaa_requests_00022 VALUES (NEW.*);

/* hipaa_requests_00023 */
CREATE TABLE hipaa_requests_00023 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00023 ADD CONSTRAINT hr_00023_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00023 ADD CONSTRAINT hr_00023_id_check CHECK (((id >= 23000001) AND (id <= 24000000)));
CREATE INDEX hr_00023_user_id_idx ON hipaa_requests_00023 USING btree (user_id);
CREATE RULE  hipaa_requests_00023 AS ON
INSERT TO hipaa_requests WHERE ( id between 23000001 AND 24000000 )
DO INSTEAD INSERT INTO hipaa_requests_00023 VALUES (NEW.*);

/* hipaa_requests_00024 */
CREATE TABLE hipaa_requests_00024 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00024 ADD CONSTRAINT hr_00024_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00024 ADD CONSTRAINT hr_00024_id_check CHECK (((id >= 24000001) AND (id <= 25000000)));
CREATE INDEX hr_00024_user_id_idx ON hipaa_requests_00024 USING btree (user_id);
CREATE RULE  hipaa_requests_00024 AS ON
INSERT TO hipaa_requests WHERE ( id between 24000001 AND 25000000 )
DO INSTEAD INSERT INTO hipaa_requests_00024 VALUES (NEW.*);

/* hipaa_requests_00025 */
CREATE TABLE hipaa_requests_00025 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00025 ADD CONSTRAINT hr_00025_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00025 ADD CONSTRAINT hr_00025_id_check CHECK (((id >= 25000001) AND (id <= 26000000)));
CREATE INDEX hr_00025_user_id_idx ON hipaa_requests_00025 USING btree (user_id);
CREATE RULE  hipaa_requests_00025 AS ON
INSERT TO hipaa_requests WHERE ( id between 25000001 AND 26000000 )
DO INSTEAD INSERT INTO hipaa_requests_00025 VALUES (NEW.*);

/* hipaa_requests_00026 */
CREATE TABLE hipaa_requests_00026 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00026 ADD CONSTRAINT hr_00026_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00026 ADD CONSTRAINT hr_00026_id_check CHECK (((id >= 26000001) AND (id <= 27000000)));
CREATE INDEX hr_00026_user_id_idx ON hipaa_requests_00026 USING btree (user_id);
CREATE RULE  hipaa_requests_00026 AS ON
INSERT TO hipaa_requests WHERE ( id between 26000001 AND 27000000 )
DO INSTEAD INSERT INTO hipaa_requests_00026 VALUES (NEW.*);

/* hipaa_requests_00027 */
CREATE TABLE hipaa_requests_00027 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00027 ADD CONSTRAINT hr_00027_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00027 ADD CONSTRAINT hr_00027_id_check CHECK (((id >= 27000001) AND (id <= 28000000)));
CREATE INDEX hr_00027_user_id_idx ON hipaa_requests_00027 USING btree (user_id);
CREATE RULE  hipaa_requests_00027 AS ON
INSERT TO hipaa_requests WHERE ( id between 27000001 AND 28000000 )
DO INSTEAD INSERT INTO hipaa_requests_00027 VALUES (NEW.*);

/* hipaa_requests_00028 */
CREATE TABLE hipaa_requests_00028 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00028 ADD CONSTRAINT hr_00028_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00028 ADD CONSTRAINT hr_00028_id_check CHECK (((id >= 28000001) AND (id <= 29000000)));
CREATE INDEX hr_00028_user_id_idx ON hipaa_requests_00028 USING btree (user_id);
CREATE RULE  hipaa_requests_00028 AS ON
INSERT TO hipaa_requests WHERE ( id between 28000001 AND 29000000 )
DO INSTEAD INSERT INTO hipaa_requests_00028 VALUES (NEW.*);

/* hipaa_requests_00029 */
CREATE TABLE hipaa_requests_00029 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00029 ADD CONSTRAINT hr_00029_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00029 ADD CONSTRAINT hr_00029_id_check CHECK (((id >= 29000001) AND (id <= 30000000)));
CREATE INDEX hr_00029_user_id_idx ON hipaa_requests_00029 USING btree (user_id);
CREATE RULE  hipaa_requests_00029 AS ON
INSERT TO hipaa_requests WHERE ( id between 29000001 AND 30000000 )
DO INSTEAD INSERT INTO hipaa_requests_00029 VALUES (NEW.*);

/* hipaa_requests_00030 */
CREATE TABLE hipaa_requests_00030 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00030 ADD CONSTRAINT hr_00030_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00030 ADD CONSTRAINT hr_00030_id_check CHECK (((id >= 30000001) AND (id <= 31000000)));
CREATE INDEX hr_00030_user_id_idx ON hipaa_requests_00030 USING btree (user_id);
CREATE RULE  hipaa_requests_00030 AS ON
INSERT TO hipaa_requests WHERE ( id between 30000001 AND 31000000 )
DO INSTEAD INSERT INTO hipaa_requests_00030 VALUES (NEW.*);

/* hipaa_requests_00031 */
CREATE TABLE hipaa_requests_00031 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00031 ADD CONSTRAINT hr_00031_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00031 ADD CONSTRAINT hr_00031_id_check CHECK (((id >= 31000001) AND (id <= 32000000)));
CREATE INDEX hr_00031_user_id_idx ON hipaa_requests_00031 USING btree (user_id);
CREATE RULE  hipaa_requests_00031 AS ON
INSERT TO hipaa_requests WHERE ( id between 31000001 AND 32000000 )
DO INSTEAD INSERT INTO hipaa_requests_00031 VALUES (NEW.*);

/* hipaa_requests_00032 */
CREATE TABLE hipaa_requests_00032 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00032 ADD CONSTRAINT hr_00032_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00032 ADD CONSTRAINT hr_00032_id_check CHECK (((id >= 32000001) AND (id <= 33000000)));
CREATE INDEX hr_00032_user_id_idx ON hipaa_requests_00032 USING btree (user_id);
CREATE RULE  hipaa_requests_00032 AS ON
INSERT TO hipaa_requests WHERE ( id between 32000001 AND 33000000 )
DO INSTEAD INSERT INTO hipaa_requests_00032 VALUES (NEW.*);

/* hipaa_requests_00033 */
CREATE TABLE hipaa_requests_00033 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00033 ADD CONSTRAINT hr_00033_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00033 ADD CONSTRAINT hr_00033_id_check CHECK (((id >= 33000001) AND (id <= 34000000)));
CREATE INDEX hr_00033_user_id_idx ON hipaa_requests_00033 USING btree (user_id);
CREATE RULE  hipaa_requests_00033 AS ON
INSERT TO hipaa_requests WHERE ( id between 33000001 AND 34000000 )
DO INSTEAD INSERT INTO hipaa_requests_00033 VALUES (NEW.*);

/* hipaa_requests_00034 */
CREATE TABLE hipaa_requests_00034 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00034 ADD CONSTRAINT hr_00034_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00034 ADD CONSTRAINT hr_00034_id_check CHECK (((id >= 34000001) AND (id <= 35000000)));
CREATE INDEX hr_00034_user_id_idx ON hipaa_requests_00034 USING btree (user_id);
CREATE RULE  hipaa_requests_00034 AS ON
INSERT TO hipaa_requests WHERE ( id between 34000001 AND 35000000 )
DO INSTEAD INSERT INTO hipaa_requests_00034 VALUES (NEW.*);

/* hipaa_requests_00035 */
CREATE TABLE hipaa_requests_00035 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00035 ADD CONSTRAINT hr_00035_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00035 ADD CONSTRAINT hr_00035_id_check CHECK (((id >= 35000001) AND (id <= 36000000)));
CREATE INDEX hr_00035_user_id_idx ON hipaa_requests_00035 USING btree (user_id);
CREATE RULE  hipaa_requests_00035 AS ON
INSERT TO hipaa_requests WHERE ( id between 35000001 AND 36000000 )
DO INSTEAD INSERT INTO hipaa_requests_00035 VALUES (NEW.*);

/* hipaa_requests_00036 */
CREATE TABLE hipaa_requests_00036 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00036 ADD CONSTRAINT hr_00036_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00036 ADD CONSTRAINT hr_00036_id_check CHECK (((id >= 36000001) AND (id <= 37000000)));
CREATE INDEX hr_00036_user_id_idx ON hipaa_requests_00036 USING btree (user_id);
CREATE RULE  hipaa_requests_00036 AS ON
INSERT TO hipaa_requests WHERE ( id between 36000001 AND 37000000 )
DO INSTEAD INSERT INTO hipaa_requests_00036 VALUES (NEW.*);

/* hipaa_requests_00037 */
CREATE TABLE hipaa_requests_00037 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00037 ADD CONSTRAINT hr_00037_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00037 ADD CONSTRAINT hr_00037_id_check CHECK (((id >= 37000001) AND (id <= 38000000)));
CREATE INDEX hr_00037_user_id_idx ON hipaa_requests_00037 USING btree (user_id);
CREATE RULE  hipaa_requests_00037 AS ON
INSERT TO hipaa_requests WHERE ( id between 37000001 AND 38000000 )
DO INSTEAD INSERT INTO hipaa_requests_00037 VALUES (NEW.*);

/* hipaa_requests_00038 */
CREATE TABLE hipaa_requests_00038 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00038 ADD CONSTRAINT hr_00038_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00038 ADD CONSTRAINT hr_00038_id_check CHECK (((id >= 38000001) AND (id <= 39000000)));
CREATE INDEX hr_00038_user_id_idx ON hipaa_requests_00038 USING btree (user_id);
CREATE RULE  hipaa_requests_00038 AS ON
INSERT TO hipaa_requests WHERE ( id between 38000001 AND 39000000 )
DO INSTEAD INSERT INTO hipaa_requests_00038 VALUES (NEW.*);

/* hipaa_requests_00039 */
CREATE TABLE hipaa_requests_00039 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00039 ADD CONSTRAINT hr_00039_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00039 ADD CONSTRAINT hr_00039_id_check CHECK (((id >= 39000001) AND (id <= 40000000)));
CREATE INDEX hr_00039_user_id_idx ON hipaa_requests_00039 USING btree (user_id);
CREATE RULE  hipaa_requests_00039 AS ON
INSERT TO hipaa_requests WHERE ( id between 39000001 AND 40000000 )
DO INSTEAD INSERT INTO hipaa_requests_00039 VALUES (NEW.*);

/* hipaa_requests_00040 */
CREATE TABLE hipaa_requests_00040 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00040 ADD CONSTRAINT hr_00040_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00040 ADD CONSTRAINT hr_00040_id_check CHECK (((id >= 40000001) AND (id <= 41000000)));
CREATE INDEX hr_00040_user_id_idx ON hipaa_requests_00040 USING btree (user_id);
CREATE RULE  hipaa_requests_00040 AS ON
INSERT TO hipaa_requests WHERE ( id between 40000001 AND 41000000 )
DO INSTEAD INSERT INTO hipaa_requests_00040 VALUES (NEW.*);

/* hipaa_requests_00041 */
CREATE TABLE hipaa_requests_00041 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00041 ADD CONSTRAINT hr_00041_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00041 ADD CONSTRAINT hr_00041_id_check CHECK (((id >= 41000001) AND (id <= 42000000)));
CREATE INDEX hr_00041_user_id_idx ON hipaa_requests_00041 USING btree (user_id);
CREATE RULE  hipaa_requests_00041 AS ON
INSERT TO hipaa_requests WHERE ( id between 41000001 AND 42000000 )
DO INSTEAD INSERT INTO hipaa_requests_00041 VALUES (NEW.*);

/* hipaa_requests_00042 */
CREATE TABLE hipaa_requests_00042 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00042 ADD CONSTRAINT hr_00042_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00042 ADD CONSTRAINT hr_00042_id_check CHECK (((id >= 42000001) AND (id <= 43000000)));
CREATE INDEX hr_00042_user_id_idx ON hipaa_requests_00042 USING btree (user_id);
CREATE RULE  hipaa_requests_00042 AS ON
INSERT TO hipaa_requests WHERE ( id between 42000001 AND 43000000 )
DO INSTEAD INSERT INTO hipaa_requests_00042 VALUES (NEW.*);

/* hipaa_requests_00043 */
CREATE TABLE hipaa_requests_00043 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00043 ADD CONSTRAINT hr_00043_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00043 ADD CONSTRAINT hr_00043_id_check CHECK (((id >= 43000001) AND (id <= 44000000)));
CREATE INDEX hr_00043_user_id_idx ON hipaa_requests_00043 USING btree (user_id);
CREATE RULE  hipaa_requests_00043 AS ON
INSERT TO hipaa_requests WHERE ( id between 43000001 AND 44000000 )
DO INSTEAD INSERT INTO hipaa_requests_00043 VALUES (NEW.*);

/* hipaa_requests_00044 */
CREATE TABLE hipaa_requests_00044 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00044 ADD CONSTRAINT hr_00044_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00044 ADD CONSTRAINT hr_00044_id_check CHECK (((id >= 44000001) AND (id <= 45000000)));
CREATE INDEX hr_00044_user_id_idx ON hipaa_requests_00044 USING btree (user_id);
CREATE RULE  hipaa_requests_00044 AS ON
INSERT TO hipaa_requests WHERE ( id between 44000001 AND 45000000 )
DO INSTEAD INSERT INTO hipaa_requests_00044 VALUES (NEW.*);

/* hipaa_requests_00045 */
CREATE TABLE hipaa_requests_00045 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00045 ADD CONSTRAINT hr_00045_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00045 ADD CONSTRAINT hr_00045_id_check CHECK (((id >= 45000001) AND (id <= 46000000)));
CREATE INDEX hr_00045_user_id_idx ON hipaa_requests_00045 USING btree (user_id);
CREATE RULE  hipaa_requests_00045 AS ON
INSERT TO hipaa_requests WHERE ( id between 45000001 AND 46000000 )
DO INSTEAD INSERT INTO hipaa_requests_00045 VALUES (NEW.*);

/* hipaa_requests_00046 */
CREATE TABLE hipaa_requests_00046 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00046 ADD CONSTRAINT hr_00046_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00046 ADD CONSTRAINT hr_00046_id_check CHECK (((id >= 46000001) AND (id <= 47000000)));
CREATE INDEX hr_00046_user_id_idx ON hipaa_requests_00046 USING btree (user_id);
CREATE RULE  hipaa_requests_00046 AS ON
INSERT TO hipaa_requests WHERE ( id between 46000001 AND 47000000 )
DO INSTEAD INSERT INTO hipaa_requests_00046 VALUES (NEW.*);

/* hipaa_requests_00047 */
CREATE TABLE hipaa_requests_00047 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00047 ADD CONSTRAINT hr_00047_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00047 ADD CONSTRAINT hr_00047_id_check CHECK (((id >= 47000001) AND (id <= 48000000)));
CREATE INDEX hr_00047_user_id_idx ON hipaa_requests_00047 USING btree (user_id);
CREATE RULE  hipaa_requests_00047 AS ON
INSERT TO hipaa_requests WHERE ( id between 47000001 AND 48000000 )
DO INSTEAD INSERT INTO hipaa_requests_00047 VALUES (NEW.*);

/* hipaa_requests_00048 */
CREATE TABLE hipaa_requests_00048 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00048 ADD CONSTRAINT hr_00048_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00048 ADD CONSTRAINT hr_00048_id_check CHECK (((id >= 48000001) AND (id <= 49000000)));
CREATE INDEX hr_00048_user_id_idx ON hipaa_requests_00048 USING btree (user_id);
CREATE RULE  hipaa_requests_00048 AS ON
INSERT TO hipaa_requests WHERE ( id between 48000001 AND 49000000 )
DO INSTEAD INSERT INTO hipaa_requests_00048 VALUES (NEW.*);

/* hipaa_requests_00049 */
CREATE TABLE hipaa_requests_00049 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00049 ADD CONSTRAINT hr_00049_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00049 ADD CONSTRAINT hr_00049_id_check CHECK (((id >= 49000001) AND (id <= 50000000)));
CREATE INDEX hr_00049_user_id_idx ON hipaa_requests_00049 USING btree (user_id);
CREATE RULE  hipaa_requests_00049 AS ON
INSERT TO hipaa_requests WHERE ( id between 49000001 AND 50000000 )
DO INSTEAD INSERT INTO hipaa_requests_00049 VALUES (NEW.*);

/* hipaa_requests_00050 */
CREATE TABLE hipaa_requests_00050 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00050 ADD CONSTRAINT hr_00050_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00050 ADD CONSTRAINT hr_00050_id_check CHECK (((id >= 50000001) AND (id <= 51000000)));
CREATE INDEX hr_00050_user_id_idx ON hipaa_requests_00050 USING btree (user_id);
CREATE RULE  hipaa_requests_00050 AS ON
INSERT TO hipaa_requests WHERE ( id between 50000001 AND 51000000 )
DO INSTEAD INSERT INTO hipaa_requests_00050 VALUES (NEW.*);

/* hipaa_requests_00051 */
CREATE TABLE hipaa_requests_00051 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00051 ADD CONSTRAINT hr_00051_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00051 ADD CONSTRAINT hr_00051_id_check CHECK (((id >= 51000001) AND (id <= 52000000)));
CREATE INDEX hr_00051_user_id_idx ON hipaa_requests_00051 USING btree (user_id);
CREATE RULE  hipaa_requests_00051 AS ON
INSERT TO hipaa_requests WHERE ( id between 51000001 AND 52000000 )
DO INSTEAD INSERT INTO hipaa_requests_00051 VALUES (NEW.*);

/* hipaa_requests_00052 */
CREATE TABLE hipaa_requests_00052 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00052 ADD CONSTRAINT hr_00052_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00052 ADD CONSTRAINT hr_00052_id_check CHECK (((id >= 52000001) AND (id <= 53000000)));
CREATE INDEX hr_00052_user_id_idx ON hipaa_requests_00052 USING btree (user_id);
CREATE RULE  hipaa_requests_00052 AS ON
INSERT TO hipaa_requests WHERE ( id between 52000001 AND 53000000 )
DO INSTEAD INSERT INTO hipaa_requests_00052 VALUES (NEW.*);

/* hipaa_requests_00053 */
CREATE TABLE hipaa_requests_00053 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00053 ADD CONSTRAINT hr_00053_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00053 ADD CONSTRAINT hr_00053_id_check CHECK (((id >= 53000001) AND (id <= 54000000)));
CREATE INDEX hr_00053_user_id_idx ON hipaa_requests_00053 USING btree (user_id);
CREATE RULE  hipaa_requests_00053 AS ON
INSERT TO hipaa_requests WHERE ( id between 53000001 AND 54000000 )
DO INSTEAD INSERT INTO hipaa_requests_00053 VALUES (NEW.*);

/* hipaa_requests_00054 */
CREATE TABLE hipaa_requests_00054 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00054 ADD CONSTRAINT hr_00054_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00054 ADD CONSTRAINT hr_00054_id_check CHECK (((id >= 54000001) AND (id <= 55000000)));
CREATE INDEX hr_00054_user_id_idx ON hipaa_requests_00054 USING btree (user_id);
CREATE RULE  hipaa_requests_00054 AS ON
INSERT TO hipaa_requests WHERE ( id between 54000001 AND 55000000 )
DO INSTEAD INSERT INTO hipaa_requests_00054 VALUES (NEW.*);

/* hipaa_requests_00055 */
CREATE TABLE hipaa_requests_00055 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00055 ADD CONSTRAINT hr_00055_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00055 ADD CONSTRAINT hr_00055_id_check CHECK (((id >= 55000001) AND (id <= 56000000)));
CREATE INDEX hr_00055_user_id_idx ON hipaa_requests_00055 USING btree (user_id);
CREATE RULE  hipaa_requests_00055 AS ON
INSERT TO hipaa_requests WHERE ( id between 55000001 AND 56000000 )
DO INSTEAD INSERT INTO hipaa_requests_00055 VALUES (NEW.*);

/* hipaa_requests_00056 */
CREATE TABLE hipaa_requests_00056 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00056 ADD CONSTRAINT hr_00056_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00056 ADD CONSTRAINT hr_00056_id_check CHECK (((id >= 56000001) AND (id <= 57000000)));
CREATE INDEX hr_00056_user_id_idx ON hipaa_requests_00056 USING btree (user_id);
CREATE RULE  hipaa_requests_00056 AS ON
INSERT TO hipaa_requests WHERE ( id between 56000001 AND 57000000 )
DO INSTEAD INSERT INTO hipaa_requests_00056 VALUES (NEW.*);

/* hipaa_requests_00057 */
CREATE TABLE hipaa_requests_00057 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00057 ADD CONSTRAINT hr_00057_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00057 ADD CONSTRAINT hr_00057_id_check CHECK (((id >= 57000001) AND (id <= 58000000)));
CREATE INDEX hr_00057_user_id_idx ON hipaa_requests_00057 USING btree (user_id);
CREATE RULE  hipaa_requests_00057 AS ON
INSERT TO hipaa_requests WHERE ( id between 57000001 AND 58000000 )
DO INSTEAD INSERT INTO hipaa_requests_00057 VALUES (NEW.*);

/* hipaa_requests_00058 */
CREATE TABLE hipaa_requests_00058 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00058 ADD CONSTRAINT hr_00058_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00058 ADD CONSTRAINT hr_00058_id_check CHECK (((id >= 58000001) AND (id <= 59000000)));
CREATE INDEX hr_00058_user_id_idx ON hipaa_requests_00058 USING btree (user_id);
CREATE RULE  hipaa_requests_00058 AS ON
INSERT TO hipaa_requests WHERE ( id between 58000001 AND 59000000 )
DO INSTEAD INSERT INTO hipaa_requests_00058 VALUES (NEW.*);

/* hipaa_requests_00059 */
CREATE TABLE hipaa_requests_00059 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00059 ADD CONSTRAINT hr_00059_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00059 ADD CONSTRAINT hr_00059_id_check CHECK (((id >= 59000001) AND (id <= 60000000)));
CREATE INDEX hr_00059_user_id_idx ON hipaa_requests_00059 USING btree (user_id);
CREATE RULE  hipaa_requests_00059 AS ON
INSERT TO hipaa_requests WHERE ( id between 59000001 AND 60000000 )
DO INSTEAD INSERT INTO hipaa_requests_00059 VALUES (NEW.*);

/* hipaa_requests_00060 */
CREATE TABLE hipaa_requests_00060 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00060 ADD CONSTRAINT hr_00060_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00060 ADD CONSTRAINT hr_00060_id_check CHECK (((id >= 60000001) AND (id <= 61000000)));
CREATE INDEX hr_00060_user_id_idx ON hipaa_requests_00060 USING btree (user_id);
CREATE RULE  hipaa_requests_00060 AS ON
INSERT TO hipaa_requests WHERE ( id between 60000001 AND 61000000 )
DO INSTEAD INSERT INTO hipaa_requests_00060 VALUES (NEW.*);

/* hipaa_requests_00061 */
CREATE TABLE hipaa_requests_00061 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00061 ADD CONSTRAINT hr_00061_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00061 ADD CONSTRAINT hr_00061_id_check CHECK (((id >= 61000001) AND (id <= 62000000)));
CREATE INDEX hr_00061_user_id_idx ON hipaa_requests_00061 USING btree (user_id);
CREATE RULE  hipaa_requests_00061 AS ON
INSERT TO hipaa_requests WHERE ( id between 61000001 AND 62000000 )
DO INSTEAD INSERT INTO hipaa_requests_00061 VALUES (NEW.*);

/* hipaa_requests_00062 */
CREATE TABLE hipaa_requests_00062 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00062 ADD CONSTRAINT hr_00062_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00062 ADD CONSTRAINT hr_00062_id_check CHECK (((id >= 62000001) AND (id <= 63000000)));
CREATE INDEX hr_00062_user_id_idx ON hipaa_requests_00062 USING btree (user_id);
CREATE RULE  hipaa_requests_00062 AS ON
INSERT TO hipaa_requests WHERE ( id between 62000001 AND 63000000 )
DO INSTEAD INSERT INTO hipaa_requests_00062 VALUES (NEW.*);

/* hipaa_requests_00063 */
CREATE TABLE hipaa_requests_00063 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00063 ADD CONSTRAINT hr_00063_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00063 ADD CONSTRAINT hr_00063_id_check CHECK (((id >= 63000001) AND (id <= 64000000)));
CREATE INDEX hr_00063_user_id_idx ON hipaa_requests_00063 USING btree (user_id);
CREATE RULE  hipaa_requests_00063 AS ON
INSERT TO hipaa_requests WHERE ( id between 63000001 AND 64000000 )
DO INSTEAD INSERT INTO hipaa_requests_00063 VALUES (NEW.*);

/* hipaa_requests_00064 */
CREATE TABLE hipaa_requests_00064 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00064 ADD CONSTRAINT hr_00064_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00064 ADD CONSTRAINT hr_00064_id_check CHECK (((id >= 64000001) AND (id <= 65000000)));
CREATE INDEX hr_00064_user_id_idx ON hipaa_requests_00064 USING btree (user_id);
CREATE RULE  hipaa_requests_00064 AS ON
INSERT TO hipaa_requests WHERE ( id between 64000001 AND 65000000 )
DO INSTEAD INSERT INTO hipaa_requests_00064 VALUES (NEW.*);

/* hipaa_requests_00065 */
CREATE TABLE hipaa_requests_00065 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00065 ADD CONSTRAINT hr_00065_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00065 ADD CONSTRAINT hr_00065_id_check CHECK (((id >= 65000001) AND (id <= 66000000)));
CREATE INDEX hr_00065_user_id_idx ON hipaa_requests_00065 USING btree (user_id);
CREATE RULE  hipaa_requests_00065 AS ON
INSERT TO hipaa_requests WHERE ( id between 65000001 AND 66000000 )
DO INSTEAD INSERT INTO hipaa_requests_00065 VALUES (NEW.*);

/* hipaa_requests_00066 */
CREATE TABLE hipaa_requests_00066 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00066 ADD CONSTRAINT hr_00066_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00066 ADD CONSTRAINT hr_00066_id_check CHECK (((id >= 66000001) AND (id <= 67000000)));
CREATE INDEX hr_00066_user_id_idx ON hipaa_requests_00066 USING btree (user_id);
CREATE RULE  hipaa_requests_00066 AS ON
INSERT TO hipaa_requests WHERE ( id between 66000001 AND 67000000 )
DO INSTEAD INSERT INTO hipaa_requests_00066 VALUES (NEW.*);

/* hipaa_requests_00067 */
CREATE TABLE hipaa_requests_00067 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00067 ADD CONSTRAINT hr_00067_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00067 ADD CONSTRAINT hr_00067_id_check CHECK (((id >= 67000001) AND (id <= 68000000)));
CREATE INDEX hr_00067_user_id_idx ON hipaa_requests_00067 USING btree (user_id);
CREATE RULE  hipaa_requests_00067 AS ON
INSERT TO hipaa_requests WHERE ( id between 67000001 AND 68000000 )
DO INSTEAD INSERT INTO hipaa_requests_00067 VALUES (NEW.*);

/* hipaa_requests_00068 */
CREATE TABLE hipaa_requests_00068 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00068 ADD CONSTRAINT hr_00068_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00068 ADD CONSTRAINT hr_00068_id_check CHECK (((id >= 68000001) AND (id <= 69000000)));
CREATE INDEX hr_00068_user_id_idx ON hipaa_requests_00068 USING btree (user_id);
CREATE RULE  hipaa_requests_00068 AS ON
INSERT TO hipaa_requests WHERE ( id between 68000001 AND 69000000 )
DO INSTEAD INSERT INTO hipaa_requests_00068 VALUES (NEW.*);

/* hipaa_requests_00069 */
CREATE TABLE hipaa_requests_00069 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00069 ADD CONSTRAINT hr_00069_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00069 ADD CONSTRAINT hr_00069_id_check CHECK (((id >= 69000001) AND (id <= 70000000)));
CREATE INDEX hr_00069_user_id_idx ON hipaa_requests_00069 USING btree (user_id);
CREATE RULE  hipaa_requests_00069 AS ON
INSERT TO hipaa_requests WHERE ( id between 69000001 AND 70000000 )
DO INSTEAD INSERT INTO hipaa_requests_00069 VALUES (NEW.*);

/* hipaa_requests_00070 */
CREATE TABLE hipaa_requests_00070 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00070 ADD CONSTRAINT hr_00070_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00070 ADD CONSTRAINT hr_00070_id_check CHECK (((id >= 70000001) AND (id <= 71000000)));
CREATE INDEX hr_00070_user_id_idx ON hipaa_requests_00070 USING btree (user_id);
CREATE RULE  hipaa_requests_00070 AS ON
INSERT TO hipaa_requests WHERE ( id between 70000001 AND 71000000 )
DO INSTEAD INSERT INTO hipaa_requests_00070 VALUES (NEW.*);

/* hipaa_requests_00071 */
CREATE TABLE hipaa_requests_00071 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00071 ADD CONSTRAINT hr_00071_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00071 ADD CONSTRAINT hr_00071_id_check CHECK (((id >= 71000001) AND (id <= 72000000)));
CREATE INDEX hr_00071_user_id_idx ON hipaa_requests_00071 USING btree (user_id);
CREATE RULE  hipaa_requests_00071 AS ON
INSERT TO hipaa_requests WHERE ( id between 71000001 AND 72000000 )
DO INSTEAD INSERT INTO hipaa_requests_00071 VALUES (NEW.*);

/* hipaa_requests_00072 */
CREATE TABLE hipaa_requests_00072 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00072 ADD CONSTRAINT hr_00072_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00072 ADD CONSTRAINT hr_00072_id_check CHECK (((id >= 72000001) AND (id <= 73000000)));
CREATE INDEX hr_00072_user_id_idx ON hipaa_requests_00072 USING btree (user_id);
CREATE RULE  hipaa_requests_00072 AS ON
INSERT TO hipaa_requests WHERE ( id between 72000001 AND 73000000 )
DO INSTEAD INSERT INTO hipaa_requests_00072 VALUES (NEW.*);

/* hipaa_requests_00073 */
CREATE TABLE hipaa_requests_00073 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00073 ADD CONSTRAINT hr_00073_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00073 ADD CONSTRAINT hr_00073_id_check CHECK (((id >= 73000001) AND (id <= 74000000)));
CREATE INDEX hr_00073_user_id_idx ON hipaa_requests_00073 USING btree (user_id);
CREATE RULE  hipaa_requests_00073 AS ON
INSERT TO hipaa_requests WHERE ( id between 73000001 AND 74000000 )
DO INSTEAD INSERT INTO hipaa_requests_00073 VALUES (NEW.*);

/* hipaa_requests_00074 */
CREATE TABLE hipaa_requests_00074 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00074 ADD CONSTRAINT hr_00074_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00074 ADD CONSTRAINT hr_00074_id_check CHECK (((id >= 74000001) AND (id <= 75000000)));
CREATE INDEX hr_00074_user_id_idx ON hipaa_requests_00074 USING btree (user_id);
CREATE RULE  hipaa_requests_00074 AS ON
INSERT TO hipaa_requests WHERE ( id between 74000001 AND 75000000 )
DO INSTEAD INSERT INTO hipaa_requests_00074 VALUES (NEW.*);

/* hipaa_requests_00075 */
CREATE TABLE hipaa_requests_00075 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00075 ADD CONSTRAINT hr_00075_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00075 ADD CONSTRAINT hr_00075_id_check CHECK (((id >= 75000001) AND (id <= 76000000)));
CREATE INDEX hr_00075_user_id_idx ON hipaa_requests_00075 USING btree (user_id);
CREATE RULE  hipaa_requests_00075 AS ON
INSERT TO hipaa_requests WHERE ( id between 75000001 AND 76000000 )
DO INSTEAD INSERT INTO hipaa_requests_00075 VALUES (NEW.*);

/* hipaa_requests_00076 */
CREATE TABLE hipaa_requests_00076 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00076 ADD CONSTRAINT hr_00076_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00076 ADD CONSTRAINT hr_00076_id_check CHECK (((id >= 76000001) AND (id <= 77000000)));
CREATE INDEX hr_00076_user_id_idx ON hipaa_requests_00076 USING btree (user_id);
CREATE RULE  hipaa_requests_00076 AS ON
INSERT TO hipaa_requests WHERE ( id between 76000001 AND 77000000 )
DO INSTEAD INSERT INTO hipaa_requests_00076 VALUES (NEW.*);

/* hipaa_requests_00077 */
CREATE TABLE hipaa_requests_00077 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00077 ADD CONSTRAINT hr_00077_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00077 ADD CONSTRAINT hr_00077_id_check CHECK (((id >= 77000001) AND (id <= 78000000)));
CREATE INDEX hr_00077_user_id_idx ON hipaa_requests_00077 USING btree (user_id);
CREATE RULE  hipaa_requests_00077 AS ON
INSERT TO hipaa_requests WHERE ( id between 77000001 AND 78000000 )
DO INSTEAD INSERT INTO hipaa_requests_00077 VALUES (NEW.*);

/* hipaa_requests_00078 */
CREATE TABLE hipaa_requests_00078 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00078 ADD CONSTRAINT hr_00078_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00078 ADD CONSTRAINT hr_00078_id_check CHECK (((id >= 78000001) AND (id <= 79000000)));
CREATE INDEX hr_00078_user_id_idx ON hipaa_requests_00078 USING btree (user_id);
CREATE RULE  hipaa_requests_00078 AS ON
INSERT TO hipaa_requests WHERE ( id between 78000001 AND 79000000 )
DO INSTEAD INSERT INTO hipaa_requests_00078 VALUES (NEW.*);

/* hipaa_requests_00079 */
CREATE TABLE hipaa_requests_00079 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00079 ADD CONSTRAINT hr_00079_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00079 ADD CONSTRAINT hr_00079_id_check CHECK (((id >= 79000001) AND (id <= 80000000)));
CREATE INDEX hr_00079_user_id_idx ON hipaa_requests_00079 USING btree (user_id);
CREATE RULE  hipaa_requests_00079 AS ON
INSERT TO hipaa_requests WHERE ( id between 79000001 AND 80000000 )
DO INSTEAD INSERT INTO hipaa_requests_00079 VALUES (NEW.*);

/* hipaa_requests_00080 */
CREATE TABLE hipaa_requests_00080 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00080 ADD CONSTRAINT hr_00080_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00080 ADD CONSTRAINT hr_00080_id_check CHECK (((id >= 80000001) AND (id <= 81000000)));
CREATE INDEX hr_00080_user_id_idx ON hipaa_requests_00080 USING btree (user_id);
CREATE RULE  hipaa_requests_00080 AS ON
INSERT TO hipaa_requests WHERE ( id between 80000001 AND 81000000 )
DO INSTEAD INSERT INTO hipaa_requests_00080 VALUES (NEW.*);

/* hipaa_requests_00081 */
CREATE TABLE hipaa_requests_00081 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00081 ADD CONSTRAINT hr_00081_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00081 ADD CONSTRAINT hr_00081_id_check CHECK (((id >= 81000001) AND (id <= 82000000)));
CREATE INDEX hr_00081_user_id_idx ON hipaa_requests_00081 USING btree (user_id);
CREATE RULE  hipaa_requests_00081 AS ON
INSERT TO hipaa_requests WHERE ( id between 81000001 AND 82000000 )
DO INSTEAD INSERT INTO hipaa_requests_00081 VALUES (NEW.*);

/* hipaa_requests_00082 */
CREATE TABLE hipaa_requests_00082 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00082 ADD CONSTRAINT hr_00082_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00082 ADD CONSTRAINT hr_00082_id_check CHECK (((id >= 82000001) AND (id <= 83000000)));
CREATE INDEX hr_00082_user_id_idx ON hipaa_requests_00082 USING btree (user_id);
CREATE RULE  hipaa_requests_00082 AS ON
INSERT TO hipaa_requests WHERE ( id between 82000001 AND 83000000 )
DO INSTEAD INSERT INTO hipaa_requests_00082 VALUES (NEW.*);

/* hipaa_requests_00083 */
CREATE TABLE hipaa_requests_00083 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00083 ADD CONSTRAINT hr_00083_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00083 ADD CONSTRAINT hr_00083_id_check CHECK (((id >= 83000001) AND (id <= 84000000)));
CREATE INDEX hr_00083_user_id_idx ON hipaa_requests_00083 USING btree (user_id);
CREATE RULE  hipaa_requests_00083 AS ON
INSERT TO hipaa_requests WHERE ( id between 83000001 AND 84000000 )
DO INSTEAD INSERT INTO hipaa_requests_00083 VALUES (NEW.*);

/* hipaa_requests_00084 */
CREATE TABLE hipaa_requests_00084 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00084 ADD CONSTRAINT hr_00084_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00084 ADD CONSTRAINT hr_00084_id_check CHECK (((id >= 84000001) AND (id <= 85000000)));
CREATE INDEX hr_00084_user_id_idx ON hipaa_requests_00084 USING btree (user_id);
CREATE RULE  hipaa_requests_00084 AS ON
INSERT TO hipaa_requests WHERE ( id between 84000001 AND 85000000 )
DO INSTEAD INSERT INTO hipaa_requests_00084 VALUES (NEW.*);

/* hipaa_requests_00085 */
CREATE TABLE hipaa_requests_00085 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00085 ADD CONSTRAINT hr_00085_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00085 ADD CONSTRAINT hr_00085_id_check CHECK (((id >= 85000001) AND (id <= 86000000)));
CREATE INDEX hr_00085_user_id_idx ON hipaa_requests_00085 USING btree (user_id);
CREATE RULE  hipaa_requests_00085 AS ON
INSERT TO hipaa_requests WHERE ( id between 85000001 AND 86000000 )
DO INSTEAD INSERT INTO hipaa_requests_00085 VALUES (NEW.*);

/* hipaa_requests_00086 */
CREATE TABLE hipaa_requests_00086 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00086 ADD CONSTRAINT hr_00086_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00086 ADD CONSTRAINT hr_00086_id_check CHECK (((id >= 86000001) AND (id <= 87000000)));
CREATE INDEX hr_00086_user_id_idx ON hipaa_requests_00086 USING btree (user_id);
CREATE RULE  hipaa_requests_00086 AS ON
INSERT TO hipaa_requests WHERE ( id between 86000001 AND 87000000 )
DO INSTEAD INSERT INTO hipaa_requests_00086 VALUES (NEW.*);

/* hipaa_requests_00087 */
CREATE TABLE hipaa_requests_00087 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00087 ADD CONSTRAINT hr_00087_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00087 ADD CONSTRAINT hr_00087_id_check CHECK (((id >= 87000001) AND (id <= 88000000)));
CREATE INDEX hr_00087_user_id_idx ON hipaa_requests_00087 USING btree (user_id);
CREATE RULE  hipaa_requests_00087 AS ON
INSERT TO hipaa_requests WHERE ( id between 87000001 AND 88000000 )
DO INSTEAD INSERT INTO hipaa_requests_00087 VALUES (NEW.*);

/* hipaa_requests_00088 */
CREATE TABLE hipaa_requests_00088 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00088 ADD CONSTRAINT hr_00088_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00088 ADD CONSTRAINT hr_00088_id_check CHECK (((id >= 88000001) AND (id <= 89000000)));
CREATE INDEX hr_00088_user_id_idx ON hipaa_requests_00088 USING btree (user_id);
CREATE RULE  hipaa_requests_00088 AS ON
INSERT TO hipaa_requests WHERE ( id between 88000001 AND 89000000 )
DO INSTEAD INSERT INTO hipaa_requests_00088 VALUES (NEW.*);

/* hipaa_requests_00089 */
CREATE TABLE hipaa_requests_00089 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00089 ADD CONSTRAINT hr_00089_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00089 ADD CONSTRAINT hr_00089_id_check CHECK (((id >= 89000001) AND (id <= 90000000)));
CREATE INDEX hr_00089_user_id_idx ON hipaa_requests_00089 USING btree (user_id);
CREATE RULE  hipaa_requests_00089 AS ON
INSERT TO hipaa_requests WHERE ( id between 89000001 AND 90000000 )
DO INSTEAD INSERT INTO hipaa_requests_00089 VALUES (NEW.*);

/* hipaa_requests_00090 */
CREATE TABLE hipaa_requests_00090 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00090 ADD CONSTRAINT hr_00090_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00090 ADD CONSTRAINT hr_00090_id_check CHECK (((id >= 90000001) AND (id <= 91000000)));
CREATE INDEX hr_00090_user_id_idx ON hipaa_requests_00090 USING btree (user_id);
CREATE RULE  hipaa_requests_00090 AS ON
INSERT TO hipaa_requests WHERE ( id between 90000001 AND 91000000 )
DO INSTEAD INSERT INTO hipaa_requests_00090 VALUES (NEW.*);

/* hipaa_requests_00091 */
CREATE TABLE hipaa_requests_00091 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00091 ADD CONSTRAINT hr_00091_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00091 ADD CONSTRAINT hr_00091_id_check CHECK (((id >= 91000001) AND (id <= 92000000)));
CREATE INDEX hr_00091_user_id_idx ON hipaa_requests_00091 USING btree (user_id);
CREATE RULE  hipaa_requests_00091 AS ON
INSERT TO hipaa_requests WHERE ( id between 91000001 AND 92000000 )
DO INSTEAD INSERT INTO hipaa_requests_00091 VALUES (NEW.*);

/* hipaa_requests_00092 */
CREATE TABLE hipaa_requests_00092 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00092 ADD CONSTRAINT hr_00092_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00092 ADD CONSTRAINT hr_00092_id_check CHECK (((id >= 92000001) AND (id <= 93000000)));
CREATE INDEX hr_00092_user_id_idx ON hipaa_requests_00092 USING btree (user_id);
CREATE RULE  hipaa_requests_00092 AS ON
INSERT TO hipaa_requests WHERE ( id between 92000001 AND 93000000 )
DO INSTEAD INSERT INTO hipaa_requests_00092 VALUES (NEW.*);

/* hipaa_requests_00093 */
CREATE TABLE hipaa_requests_00093 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00093 ADD CONSTRAINT hr_00093_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00093 ADD CONSTRAINT hr_00093_id_check CHECK (((id >= 93000001) AND (id <= 94000000)));
CREATE INDEX hr_00093_user_id_idx ON hipaa_requests_00093 USING btree (user_id);
CREATE RULE  hipaa_requests_00093 AS ON
INSERT TO hipaa_requests WHERE ( id between 93000001 AND 94000000 )
DO INSTEAD INSERT INTO hipaa_requests_00093 VALUES (NEW.*);

/* hipaa_requests_00094 */
CREATE TABLE hipaa_requests_00094 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00094 ADD CONSTRAINT hr_00094_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00094 ADD CONSTRAINT hr_00094_id_check CHECK (((id >= 94000001) AND (id <= 95000000)));
CREATE INDEX hr_00094_user_id_idx ON hipaa_requests_00094 USING btree (user_id);
CREATE RULE  hipaa_requests_00094 AS ON
INSERT TO hipaa_requests WHERE ( id between 94000001 AND 95000000 )
DO INSTEAD INSERT INTO hipaa_requests_00094 VALUES (NEW.*);

/* hipaa_requests_00095 */
CREATE TABLE hipaa_requests_00095 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00095 ADD CONSTRAINT hr_00095_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00095 ADD CONSTRAINT hr_00095_id_check CHECK (((id >= 95000001) AND (id <= 96000000)));
CREATE INDEX hr_00095_user_id_idx ON hipaa_requests_00095 USING btree (user_id);
CREATE RULE  hipaa_requests_00095 AS ON
INSERT TO hipaa_requests WHERE ( id between 95000001 AND 96000000 )
DO INSTEAD INSERT INTO hipaa_requests_00095 VALUES (NEW.*);

/* hipaa_requests_00096 */
CREATE TABLE hipaa_requests_00096 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00096 ADD CONSTRAINT hr_00096_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00096 ADD CONSTRAINT hr_00096_id_check CHECK (((id >= 96000001) AND (id <= 97000000)));
CREATE INDEX hr_00096_user_id_idx ON hipaa_requests_00096 USING btree (user_id);
CREATE RULE  hipaa_requests_00096 AS ON
INSERT TO hipaa_requests WHERE ( id between 96000001 AND 97000000 )
DO INSTEAD INSERT INTO hipaa_requests_00096 VALUES (NEW.*);

/* hipaa_requests_00097 */
CREATE TABLE hipaa_requests_00097 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00097 ADD CONSTRAINT hr_00097_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00097 ADD CONSTRAINT hr_00097_id_check CHECK (((id >= 97000001) AND (id <= 98000000)));
CREATE INDEX hr_00097_user_id_idx ON hipaa_requests_00097 USING btree (user_id);
CREATE RULE  hipaa_requests_00097 AS ON
INSERT TO hipaa_requests WHERE ( id between 97000001 AND 98000000 )
DO INSTEAD INSERT INTO hipaa_requests_00097 VALUES (NEW.*);

/* hipaa_requests_00098 */
CREATE TABLE hipaa_requests_00098 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00098 ADD CONSTRAINT hr_00098_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00098 ADD CONSTRAINT hr_00098_id_check CHECK (((id >= 98000001) AND (id <= 99000000)));
CREATE INDEX hr_00098_user_id_idx ON hipaa_requests_00098 USING btree (user_id);
CREATE RULE  hipaa_requests_00098 AS ON
INSERT TO hipaa_requests WHERE ( id between 98000001 AND 99000000 )
DO INSTEAD INSERT INTO hipaa_requests_00098 VALUES (NEW.*);

/* hipaa_requests_00099 */
CREATE TABLE hipaa_requests_00099 ( ) INHERITS (hipaa_requests);
ALTER TABLE hipaa_requests_00099 ADD CONSTRAINT hr_00099_pk PRIMARY KEY (id);
ALTER TABLE hipaa_requests_00099 ADD CONSTRAINT hr_00099_id_check CHECK (((id >= 99000001) AND (id <= 100000000)));
CREATE INDEX hr_00099_user_id_idx ON hipaa_requests_00099 USING btree (user_id);
CREATE RULE  hipaa_requests_00099 AS ON
INSERT TO hipaa_requests WHERE ( id between 99000001 AND 100000000 )
DO INSTEAD INSERT INTO hipaa_requests_00099 VALUES (NEW.*);

