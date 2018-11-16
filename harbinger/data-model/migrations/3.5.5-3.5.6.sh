#!/bin/bash
# bugfix for oprhaned people/employee FK issue
cd /servers/harbinger/harbinger/data-model/migrations/3.5.5-3.5.6
./fix-people.py
if [ $? != 0 ]; then
    exit 2
fi
# updte messaging spec
cd /servers/harbinger/harbinger/data-model/default-data
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "TRUNCATE TABLE documentation.message_types, documentation.message_element_mappings, documentation.element_groupings, documentation.department_models, documentation.data_types, documentation.data_elements;"
if [ $? != 0 ]; then
    exit 2
fi
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -f documentation.sql
if [ $? != 0 ]; then
    exit 2
fi
# migrate schema
cd /servers/harbinger/harbinger/data-model/migrations/3.5.5-3.5.6
psql -X -v ON_ERROR_STOP=1 -e -f 3.5.5-3.5.6.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
# update data
./3.5.5-3.5.6.py
if [ $? != 0 ]; then
    exit 2
# set config vars
else
    psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "UPDATE public.configuration_variables SET configuration_value='3.5.6', updated_at=now() WHERE configuration_key='data-model-version';"
fi
