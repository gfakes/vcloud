#!/bin/bash
cd /servers/harbinger/harbinger/data-model/migrations/2.4.0-3.2.0
echo "Running pre-flight to check to ensure compatability and preparedness for data model 3.0..."
./preflight-check.py
if [ $? != 0 ]; then
    exit 2
fi
echo "...finished pre-flight check, database is ready!"
echo " ... starting upgrade ..."
echo "Creating new tables and adding columns..."
psql -e -f dm3-upgrade-pt1-creates.sql -U harbinger
echo "Finished creating new tables and adding columns, updating roharbinger role..."
cd /servers/harbinger/harbinger/data-model/deployment
psql -e -f recreate-ro.sql -U postgres harbinger
echo "Finished updating roharbinger role, loading HCPCS..."
./load-cms_hcpcs.py
if [ $? != 0 ]; then
    exit 2
fi
echo "Finished loading HCPCS codes, exporting procedure mappings..."
cd /servers/harbinger/harbinger/data-model/migrations/2.4.0-3.2.0
./export-import-proc-mappings.py
if [ $? != 0 ]; then
    exit 2
fi
echo "Finished exporting procedure mappings, re-mapping patient_event_types..."
./fix-patient-event-statuses.py
if [ $? != 0 ]; then
    exit 2
fi
echo "Finished re-mapping patient_event_types, adding external_system_id to reasons..."
./fix-reasons.py
if [ $? != 0 ]; then
    exit 2
fi
echo "Finished adding external_system_id to reasons, completing database alters..."
psql -e -f dm3-upgrade-pt2-alters.sql -U harbinger
echo "Finished database alters, updating managed tables..."
psql -e -f update-clinical_roles.sql -U harbinger
psql -e -f update-departments.sql -U harbinger
cd /servers/harbinger/harbinger/data-model/default-data
psql -e -f external_system_roles.sql -U harbinger
psql -e -f cms_facility_types.sql -U harbinger
psql -e -U harbinger -c "update rad_exam_metrics set access_wait=null where access_wait<0;"
psql -e -U harbinger -c "update rad_exam_metrics set reg_wait=null where reg_wait<0;"
psql -e -U harbinger -c "update rad_exam_metrics set reg_duration=null where reg_duration<0;"
psql -e -U harbinger -c "update rad_exam_metrics set exam_wait=null where exam_wait<0;"
psql -e -U harbinger -c "update rad_exam_metrics set exam_duration=null where exam_duration<0;"
psql -e -U harbinger -c "update rad_exam_metrics set total_wait=null where total_wait<0;"
psql -e -U harbinger -c "update rad_exam_metrics set order_complete=null where order_complete<0;"
psql -e -U harbinger -c "update rad_exam_metrics set prelim_turn_around=null where prelim_turn_around<0;"
psql -e -U harbinger -c "update rad_exam_metrics set turn_around=null where turn_around<0;"
psql -e -U harbinger -c "TRUNCATE documentation.data_elements, documentation.data_types, documentation.department_models, documentation.element_groupings, documentation.message_element_mappings, documentation.message_types;"
psql -e -f documentation.sql -U harbinger
echo "Finished updating managed tables, updating rad_exam.last_prelim_report_id..."
cd /servers/harbinger/harbinger/data-model/migrations/2.4.0-3.2.0
./fix-exam-report-fks.py
if [ $? != 0 ]; then
    exit 2
fi
echo "Finished updating rad_exam.last_prelim_report_id, loading ICD codes..."
cd /servers/harbinger/harbinger/data-model/deployment
./load-icd_codes.py
if [ $? != 0 ]; then
    exit 2
fi
