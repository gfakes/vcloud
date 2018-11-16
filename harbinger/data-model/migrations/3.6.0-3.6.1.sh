#!/bin/bash

# documentation schema
cd /servers/harbinger/harbinger/data-model/default-data
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "TRUNCATE TABLE documentation.message_types, documentation.message_element_mappings, documentation.element_groupings, documentation.department_models, documentation.data_types, documentation.data_elements;"
if [ $? != 0 ]; then
    exit 2
fi
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -f documentation.sql
if [ $? != 0 ]; then
    exit 2
fi

# data model changes
cd /servers/harbinger/harbinger/data-model/migrations/3.6.0-3.6.1
psql -X -v ON_ERROR_STOP=1 -e -f 3.6.0-3.6.1.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
