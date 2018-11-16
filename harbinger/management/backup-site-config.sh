#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
export PGPASSWORD=$HARBINGER_PW
start_log
echo 'Saving site configuration tables...' | tee -a $LOGFILE
# core
pg_dump -U harbinger harbinger -a --column-inserts \
-t configuration_variables -t configuration_variables_id_seq -t sites -t sites_id_seq -t metasites -t metasites_id_seq -t metasite_associations -t metasite_associations_id_seq \
-t external_systems -t external_systems_id_seq -t external_system_statuses -t external_system_statuses_id_seq \
-t people -t people_id_seq -t identifier_types -t identifier_types_id_seq -t specialties -t specialties_id_seq -t modalities -t modalities_id_seq -t demographic_types_id_seq -t demographic_types \
-t cms_hcpcs_code_revisions -t cms_hcpcs_code_revisions_id_seq -t cms_modifiers -t cms_modifiers_id_seq -t cms_gpci -t cms_gpci_id_seq -t cms_facility_types -t cms_facility_types_id_seq -t icd_code_revisions -t icd_code_revisions_id_seq \
-t patient_types -t patient_types_id_seq -t site_locations -t site_locations_id_seq -t site_sublocations -t site_sublocations_id_seq \
-t insurance_carriers -t insurance_carriers_id_seq -t insurance_carrier_plan_groupings -t insurance_carrier_plan_groupings_id_seq > /servers/harbinger/data/harbinger-site-config-1-core.sql

# employees and codes
pg_dump -U harbinger harbinger -a --column-inserts -t resources -t resources_id_seq -t employees -t employees_id_seq -t procedures -t procedures_id_seq -t cms_hcpcs_codes -t cms_hcpcs_codes_id_seq \
 -t icd_codes -t icd_codes_id_seq > /servers/harbinger/data/harbinger-site-config-2-employees-procs.sql

# post-employees and codes
pg_dump -U harbinger harbinger -a --column-inserts \
-t identifiers -t identifiers_id_seq -t employee_specialty_mappings -t employee_specialty_mappings_id_seq -t employee_clinical_role_mappings -t employee_clinical_role_mappings_id_seq -t employee_demos_id_seq -t employee_demos -t site_classes -t site_classes_id_seq \
-t external_system_role_mappings -t external_system_role_mappings_id_seq -t insurance_carrier_demographics -t insurance_carrier_demographics_id_seq -t insurance_carrier_plans -t insurance_carrier_plans_id_seq \
-t residents -t residents_id_seq -t procedure_hcpcs_mappings -t procedure_hcpcs_mappings_id_seq -t rad_exam_departments -t rad_exam_departments_id_seq > /servers/harbinger/data/harbinger-site-config-3-post-employees-procs.sql
end_log
