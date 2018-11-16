
-- fix bug from 2.3.26-2.3.27 upgrade that only affects installs before 2014-01-14
ALTER TABLE residents
      ALTER COLUMN pgy2 DROP NOT NULL,
      ALTER COLUMN pgy3 DROP NOT NULL,
      ALTER COLUMN pgy4 DROP NOT NULL,
      ALTER COLUMN pgy5 DROP NOT NULL;

DROP FUNCTION percentile_cont(myarray real[], percentile real);

CREATE OR REPLACE FUNCTION ai_percentile_cont(myarray real[], percentile real) RETURNS real
    LANGUAGE plpgsql IMMUTABLE
    AS $$

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
$$;

DELETE FROM public.configuration_variables WHERE configuration_key='data-model-commit-id';
UPDATE public.configuration_variables SET configuration_value='3.6.0', updated_at=now() WHERE configuration_key='data-model-version';
