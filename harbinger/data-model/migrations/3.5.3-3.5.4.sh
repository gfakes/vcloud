#!/bin/bash
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "TRUNCATE TABLE documentation.message_types, documentation.message_element_mappings, documentation.element_groupings, documentation.department_models, documentation.data_types, documentation.data_elements;"
if [ $? != 0 ]; then
    exit 2
fi
cd /servers/harbinger/harbinger/data-model/default-data
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -f documentation.sql
if [ $? != 0 ]; then
    exit 2
fi
cd /servers/harbinger/harbinger/data-model/migrations/3.5.3-3.5.4
./3.5.3-3.5.4.py
if [ $? != 0 ]; then
    exit 2
else
    psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "UPDATE public.configuration_variables SET configuration_value='3.5.4', updated_at=now() WHERE configuration_key='data-model-version';"
fi
