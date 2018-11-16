-- old: 3.0.07 ca45416d8618b9f80c90a928f77afb6bcd9b03ce
-- new: 3.1.00 e2199a9fb7ad08a73f0ea5dbc474d111604c158b.sql

CREATE SEQUENCE rad_exam_facts_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE rad_exam_facts (
	id bigint DEFAULT nextval('rad_exam_facts_id_seq'::regclass) NOT NULL,
	rad_exam_id bigint,
	end_exam_year smallint NOT NULL,
	end_exam_month smallint NOT NULL,
	end_exam_day smallint NOT NULL,
	end_exam_hour smallint NOT NULL,
	end_exam_epoch bigint NOT NULL,
	modality_id bigint,
	ordering_provider_id bigint,
	patient_type text,
	procedure_id bigint,
	procedure_specialty_id bigint,
	reportable boolean,
	radiologist_id bigint,
	radiologist_specialty_id bigint,
	resource_id bigint,
	site_id bigint,
	rad_exam_department_id bigint,
	site_class_id bigint,
	technologist_id bigint,
	patient_priority text,
	patient_priority_specified_date boolean,
	pro_rvu double precision,
	tech_rvu double precision,
	access_wait bigint,
	reg_wait bigint,
	reg_duration bigint,
	exam_wait bigint,
	exam_duration bigint,
	total_wait bigint,
	order_complete bigint,
	prelim_turn_around bigint,
	turn_around bigint,
	updated_at timestamp with time zone NOT NULL
);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_id PRIMARY KEY (id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_modality_id_fk FOREIGN KEY (modality_id) REFERENCES modalities(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_ordering_provider_id_fk FOREIGN KEY (ordering_provider_id) REFERENCES employees(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_procedure_specialty_id_fk FOREIGN KEY (procedure_specialty_id) REFERENCES specialties(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_rad_exam_department_id_fk FOREIGN KEY (rad_exam_department_id) REFERENCES rad_exam_departments(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_rad_exam_id_fk FOREIGN KEY (rad_exam_id) REFERENCES rad_exams(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_radiologist_id_fk FOREIGN KEY (radiologist_id) REFERENCES employees(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_radiologist_specialty_id_fk FOREIGN KEY (radiologist_specialty_id) REFERENCES specialties(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_resource_id_fk FOREIGN KEY (resource_id) REFERENCES resources(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_site_class_id_fk FOREIGN KEY (site_class_id) REFERENCES site_classes(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_site_id_fk FOREIGN KEY (site_id) REFERENCES sites(id);

ALTER TABLE rad_exam_facts
	ADD CONSTRAINT rad_exam_facts_technologist_id_fk FOREIGN KEY (technologist_id) REFERENCES employees(id);

CREATE INDEX rad_exam_fact_end_exam_day_idx ON rad_exam_facts USING btree (end_exam_day);

CREATE INDEX rad_exam_fact_end_exam_epoch_idx ON rad_exam_facts USING btree (end_exam_epoch);

CREATE INDEX rad_exam_fact_end_exam_hour_idx ON rad_exam_facts USING btree (end_exam_hour);

CREATE INDEX rad_exam_fact_end_exam_month_idx ON rad_exam_facts USING btree (end_exam_month);

CREATE INDEX rad_exam_fact_end_exam_year_idx ON rad_exam_facts USING btree (end_exam_year);

CREATE INDEX rad_exam_fact_modality_id_idx ON rad_exam_facts USING btree (modality_id);

CREATE INDEX rad_exam_fact_ordering_provider_id_idx ON rad_exam_facts USING btree (ordering_provider_id);

CREATE INDEX rad_exam_fact_patient_priority_idx ON rad_exam_facts USING btree (patient_priority);

CREATE INDEX rad_exam_fact_patient_priority_specified_date_idx ON rad_exam_facts USING btree (patient_priority_specified_date);

CREATE INDEX rad_exam_fact_patient_type_idx ON rad_exam_facts USING btree (patient_type);

CREATE INDEX rad_exam_fact_procedure_id_idx ON rad_exam_facts USING btree (procedure_id);

CREATE INDEX rad_exam_fact_procedure_specialty_id_idx ON rad_exam_facts USING btree (procedure_specialty_id);

CREATE INDEX rad_exam_fact_rad_exam_department_id_idx ON rad_exam_facts USING btree (rad_exam_department_id);

CREATE INDEX rad_exam_fact_rad_exam_id_idx ON rad_exam_facts USING btree (rad_exam_id);

CREATE INDEX rad_exam_fact_radiologist_id_idx ON rad_exam_facts USING btree (radiologist_id);

CREATE INDEX rad_exam_fact_radiologist_specialty_id_idx ON rad_exam_facts USING btree (radiologist_specialty_id);

CREATE INDEX rad_exam_fact_reportable_idx ON rad_exam_facts USING btree (reportable) WHERE (reportable IS TRUE);

CREATE INDEX rad_exam_fact_resource_id_idx ON rad_exam_facts USING btree (resource_id);

CREATE INDEX rad_exam_fact_site_class_id_idx ON rad_exam_facts USING btree (site_class_id);

CREATE INDEX rad_exam_fact_site_id_idx ON rad_exam_facts USING btree (site_id);

CREATE INDEX rad_exam_fact_technologist_id_idx ON rad_exam_facts USING btree (technologist_id);

CREATE OR REPLACE FUNCTION array_sort (ANYARRAY)
RETURNS ANYARRAY LANGUAGE SQL
AS $$
SELECT ARRAY(
    SELECT $1[s.i] AS "foo"
    FROM
        generate_series(array_lower($1,1), array_upper($1,1)) AS s(i)
    ORDER BY foo
);
$$;

CREATE OR REPLACE FUNCTION fn_array_agg_notnull (
    a anyarray
    , b anyelement
) RETURNS ANYARRAY
AS $$
BEGIN

    IF b IS NOT NULL THEN
        a := array_append(a, b);
    END IF;

    RETURN a;

END;
$$ IMMUTABLE LANGUAGE 'plpgsql';

CREATE AGGREGATE array_agg_notnull(ANYELEMENT) (
    SFUNC = fn_array_agg_notnull,
    STYPE = ANYARRAY,
    INITCOND = '{}'
);

CREATE OR REPLACE FUNCTION percentile_cont(myarray real[], percentile real)
RETURNS real AS
$$

DECLARE
  ary_cnt INTEGER;
  row_num real;
  crn real;
  frn real;
  calc_result real;
  new_array real[];
BEGIN
  ary_cnt = array_length(myarray,1);
  row_num = 1 + ( percentile * ( ary_cnt - 1 ));
  new_array = array_sort(myarray);

  crn = ceiling(row_num);
  frn = floor(row_num);

  if crn = frn and frn = row_num then
    calc_result = new_array[row_num];
  else
    calc_result = (crn - row_num) * new_array[frn]
            + (row_num - frn) * new_array[crn];
  end if;

  RETURN calc_result;
END;
$$
  LANGUAGE 'plpgsql' IMMUTABLE;

grant select on rad_exam_facts to productivity;
grant select on rad_exam_facts to quality;

UPDATE public.configuration_variables SET configuration_value='e2199a9fb7ad08a73f0ea5dbc474d111604c158b', updated_at=now() WHERE configuration_key='data-model-commit-id';
