#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
export PGPASSWORD=$HARBINGER_PW
start_log
echo 'Restoring site configuration tables...' | tee -a $LOGFILE
psql -e -U harbinger harbinger -c 'truncate configuration_variables, identifier_types, demographic_types, sites, metasites, metasite_associations, external_systems, external_system_role_mappings, external_system_statuses, people, employees, identifiers, specialties, employee_specialty_mappings, employee_clinical_role_mappings, employee_demos, patient_types, site_classes, site_locations, site_sublocations, resources, modalities, cms_hcpcs_code_revisions, cms_hcpcs_codes, cms_modifiers, cms_gpci, cms_facility_types, icd_code_revisions, icd_codes, procedures, procedure_hcpcs_mappings, residents, rad_exam_departments cascade;' | tee -a $LOGFILE
psql -U harbinger harbinger -f /servers/harbinger/data/harbinger-site-config-1-core.sql
psql -U harbinger harbinger -f /servers/harbinger/data/harbinger-site-config-2-employees-procs.sql
psql -U harbinger harbinger -f /servers/harbinger/data/harbinger-site-config-3-post-employees-procs.sql
end_log
