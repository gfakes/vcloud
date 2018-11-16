CREATE OR REPLACE FUNCTION compact_array(anyarray) RETURNS anyarray
    LANGUAGE sql
    AS $_$ 
SELECT ARRAY(SELECT x FROM unnest($1) g(x) WHERE x IS NOT NULL) 
$_$;

UPDATE public.configuration_variables SET configuration_value='3.4.3', updated_at=now() WHERE configuration_key='data-model-version';
