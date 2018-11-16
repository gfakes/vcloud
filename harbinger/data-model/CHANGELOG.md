
## v3.6.1 released 2017-08-02

* **new:** support for SIU HL7 messages: similar to ORM, but require less information and don't create a radiology exam when missing accession number
* **improvement:** added `appointment_duration` value (in seconds) for `orders`, `rad_exam_times`, and `rad_exam_facts` (all kept in sync by data-manager) to support specific exam duration (versus current mapping of default from procedure type), supported by all radiology message types and SIU messages
* **improvement:** expand `orders` table to track additional attributes (site class, exam priority, ordering provider, procedure, resource, status, appointment duration) and two timestamp columns for `order_arrival` and `appointment`. The timestamps can be set by radiology or SIU messages, but once an exam exists the values in the `orders` table will be overwritten by radiology messages only (SIU message updates sent after any ORM/ORU will not push changes to `rad_exam_times` or `rad_exam_facts`).
* **bugfix:** cleanup legacy `configuration_variables`

## v3.6.0 released 2017-07-17

* **new:** added `servicetools` schema to support new Service Tools application functionality (whitelists and file-based import)
* **improvement:** better upgrade script (removed legacy commit-id support, only use tagged versions, proper semver library)
* **bugfix:** typo in default `etl_handlers` config
* **bugfix:** correct regression of incorrect setting NOT NULL columns in `residents` table from v2.3.26 to v2.3.27 upgrade (only affected installs before 2014-01-14)

## v3.5.6 released 2016-07-18

New imaging workflow timestamps, expanded fact table and metric additions:

* **new:** added support for DICOM begin and end timestamps in `rad_pacs_metadata`
* **new:** expanded `rad_exam_metrics` based on new DICOM begin and end timestamps:  `send_delay`, `acquisition_duration`, `order_begin_acquisition`, `order_end_acquisition`, `acquisition_wait`, `acquisition_delay`, `acquisition_ready`, `acquisition_first_report`, `acquisition_first_prelim`, `acquisition_first_final`
* **new:** added scheduler and new metrics to `rad_exam_facts`
* **bugfix:** database cleanup scripts to fix metric calculation errors made (present in `data-manager` versions < v3.3.21), and repair orphaned `people` rows after merges (caused by bug introduced in `data-manager` v3.3.13 and fixed in v3.3.21)
* **bugfix:** fix v3.5.3 -> v3.5.4 upgrade script bugs

Details on the new metrics:

| Metric | Description | Definition|
|--------|-------------|-----------|
| `send_delay` | delay from image acquisition to start of transmission to PACS | `rad_pacs_metadata.first_image` - `rad_pacs_metadata.dicom_end` |
| `acquisition_duration` | duration of image acquisition | `rad_pacs_metadata.dicom_end` - `rad_pacs_metadata.dicom_begin` |
| `order_begin_acquisition` | how long it took for the first image to be acquired after the order was placed | `rad_pacs_metadata.dicom_begin` - `rad_exam_times.order_arrival` |
| `order_end_acquisition` | how long it took for the entire study to be acquired after the order was placed | `rad_pacs_metadata.dicom_end` - `rad_exam_times.order_arrival` |
| `acquisition_wait` | total time patient waited for image acquisition to start after patient arrival | `rad_pacs_metadata.dicom_begin` - `rad_exam_times.sign_in` |
| `acquisition_delay` | how delayed image acquisition started compared to the appointment time | `rad_pacs_metadata.dicom_begin` - `rad_exam_times.appointment` |
| `acquisition_ready` | how long it took from image acquisition to end of transmission to PACS | `rad_pacs_metadata.last_image` - `rad_pacs_metadata.dicom_end` |
| `acquisition_first_report` | how long after image acquisition is complete for the first preliminary or final report to be rendered (the `report_event` time is from the `first_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.dicom_end` |
| `acquisition_first_prelim` | how long after image acquisition is complete for a preliminary report to be rendered (the `report_event` time is from the `first_prelim_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.dicom_end` |
| `acquisition_first_final` | how long after image acquisition is complete for a final report to be rendered (the `report_event` time is from the `first_final_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.dicom_end` |

## v3.5.5 released 2016-05-05

Fact table and metric additions:

* **new:** added new `rad_exam_metrics`: `transport`, `schedule_first_report`, `schedule_first_prelim`, `schedule_first_final`, `order_first_report`, `order_first_prelim`, `order_first_final`
* **new:** added above new metrics and `exam_priority` FK to `rad_exam_facts`
* **improvement:** updated documentation generation

Details on the new metrics:

| Metric | Description | Definition|
|--------|-------------|-----------|
|`transport` | how quickly a patient can be transported from the floor to radiology | `rad_exam_times.begin_exam` - `rad_exam_times.schedule_event` |
|`order_first_report` | how long after an order is placed for the first preliminary or final report to be rendered (the `report_event` time is from the `first_report_id`) |`rad_reports.report_event` - `rad_exam_times.order_arrival` |
|`order_first_prelim` | how long after an order is placed for a preliminary report to be rendered (the `report_event` time is from the `first_prelim_report_id`) |`rad_reports.report_event` - `rad_exam_times.order_arrival` |
|`order_first_final` | how long after an order is placed for a final report to be rendered (the `report_event` time is from the `first_final_report_id`) |`rad_reports.report_event` - `rad_exam_times.order_arrival` |
|`schedule_first_report` | how long after an exam is scheduled for the first preliminary or final report to be rendered (the `report_event` time is from the `first_report_id`) |`rad_reports.report_event` - `rad_exam_times.schedule_event` |
|`schedule_first_prelim` | how long after an exam is scheduled for a preliminary report to be rendered (the `report_event` time is from the `first_prelim_report_id`) |`rad_reports.report_event` - `rad_exam_times.schedule_event` |
|`schedule_first_final` | how long after an exam is scheduled for a final report to be rendered (the `report_event` time is from the `first_final_report_id`) |`rad_reports.report_event` - `rad_exam_times.schedule_event` |

## v3.5.4 released 2016-04-19

> **NO SCHEMA CHANGES**

* **bugfix:** cleanup HIPAA audit log key issues
* **improvement:** updated documentation schema to include default HL7 location for ICD codes
* **improvement:** modernized default etl_handlers configuration

## v3.5.3 released 2016-03-22

* **new:** added `rad_exam_facts.begin_exam_epoch`
* **bugfix:** fixed condition where db upgrade failure and did not stop upgrade process (BRIDGE-179)

## v3.5.2 released 2016-03-09

> **NO SCHEMA CHANGES**

**improved:** better documentation generation scripts

## v3.5.1 released 2016-03-04

**bugfix:** `app_tracking` partition rules now include `browser_ip`

## v3.5.0 released 2016-02-02

Condense procedures and resources to be unique to an `external_system` instead of `site`

* **new:** `procedures.site_id` and `procedures.cms_fee` dropped, `procedures.external_system_id` added
* **new:** `resources.external_system_id` added

## v3.4.5 released 2016-01-14

> **NO SCHEMA CHANGES**

**improved:** modernization and enhancements to ICD and HCPCS loading scripts

* scripts now check if codeset they try to load is already loaded and bail gracefully
* scripts follow current project python conventions

## v3.4.4 released 2015-12-16

**bugfix:** added missing FK constraint for `rad_exam_facts.procedure_id`

## v3.4.3 released 2015-12-07

**new:** added `compact_array` function for next-gen Quality/Productivity app performance improvement

## v3.4.2 released 2015-11-17

* **new:** add `app_tracking.browser_ip` column
* **new:** set `site_classes.site_id` to be non-null for safely adding to composite key
* **bugfix:** `app_tracking` PK sequence was wrongly set to share with `claim_transaction_cms_modifiers` PK sequence

## v3.4.1 released 2015-09-15

> **NO SCHEMA CHANGES**

**improvement:** Scripting improvements for documentation generation:

* consolidated into single `generate-all-docs.sh` bash script for ease of use: runs HL7, bridge, and schema generators
* modernized Python scripts
* corrected output paths to use `site.config.json`

## v3.4.0 released 2015-09-09

Changed procedure `volume_countable`, new `patient_age` cols, documentation schema expansion, app usage tracking, and data quality tracking

* **new:** dropped `procedures.volume_countable` boolean and added `procedures.volume` integer: the correct way to count volumes now is to sum the `procedures.volume` instead of summing `rad_exam` counts `where volume_countable = true`
* **new:** updated `rad_exam_facts` to add `volume` column in light of above changes - previously, fact table did not contain exams with `volume_countable = false`, now it will, but they will have `volume = 0`, so similar to above, sum the `volume` column instead of counting for proper volume measurement
* **new:** added `rad_exam_details.patient_age` and `rad_exam_facts.patient_age` columns: this value is the number of days between the `rad_exam_times.end_exam` and `patients.birthdate`
* **new:** added new infrastructure to track application usage and data quality, new data quality stats aggregator script
* **new:** expanded documentation schema to include HL7 information for data_elements to enable new HL7 spec generation script
* **improvement:** improved scripting and reorganized file layout: manage and build partition scripts now use same JSON config, streamlined reindexing script
* **bugfix:** `data_manager_error_logs` partitions were missing indexes, update-version restores missing indexes, management script fixed
* **bugfix:** `roharbinger` role can now read documentation schema, update-version fixes via role recreation

## v3.3.1 released 2014-12-10

**new:** added columns to `procedures` for pro and tech fees

## v3.3.0 released 2014-11-24

**new:** metric and fact table expansion `rad_exam_facts` updates and additions:

* expanded `end_exam` timestamp fan-out to add minute, day of week, week of year
* added new timestamp fan-outs for `first_report`, `first_prelim`, `first_final` (from the `report_event` time of the corresponding `rad_reports` FK)
* added new `resident_id` FK to `employees` for capturing `rad_reports.rad2_id` from the `first_report` `rad_reports` FK
* added `site_location_id` and `delay_reason_id` FKs
* added new finance data model columns (`charges`, `payments`, `adjustments`, `accounts_receivable` from associated `claims`)

Additional changes:

* **new:** added `claim_transaction_facts` table, similar to `rad_exam_facts`, but for `claim_transactions` (finance data model)
* **new:** added `rad_exams.first_report_id` FK to `rad_reports` for the first report that has a `universal_event_type` of `prelim`, `final`, or `addendum`
* **new:** added `first_report_turn_around` column to `rad_exam_metrics` and `rad_exam_facts`: `first_report_turn_around = rad_reports.report_event - rad_exam_times.end_exam` (the `report_event` time is from the `first_report_id`)
* **improvement:** scripting and maintenance enhancements

## v3.2.4 released 2014-10-29

> **NO SCHEMA CHANGES**

**improvement:** scripting and maintenance enhancements

## v3.2.3 released 2014-10-17

> **NO SCHEMA CHANGES**

**improvement:** scripting and maintenance enhancements

## v3.2.2 released 2014-09-02

> **NO SCHEMA CHANGES**

**improvement:** scripting and maintenance enhancements

## v3.2.1 released 2014-08-29

> **NO SCHEMA CHANGES**

**improvement:** scripting and maintenance enhancements

## v3.2.0 released 2014-07-07

* **new:** `insurance_carriers.external_system_id` is now NOT NULL (mandatory)
* **new:** changed cardinality of `insurance_carrier_plan_groupings`:`insurance_carrier_plans` associations from N:N to 1:N
* **new:** dropped the `insurance_carrier_plan_grouping_associations` table
* **new:** created an optional (NULLable) `insurance_carrier_plans.insurance_carrier_plan_grouping_id` column

## v3.1.3 released 2014-06-25

* **new:** added `external_system_roles` values
* **bugfix:** fixed sequence name for `rad_exam_departments` to match convention
* **bugfix:** updated 2.x-3.x upgrade scripts

## v3.1.2 released 2014-06-17

* **new:** added `external_systems_id` FK to `insurance_carriers`
* **new:** added new grouping tables `insurance_plan_groupings` and `insurance_plan_grouping_associations` to enable insurance plan groupings commonly used in finance-based applications
* **new:** `insurance_plan_groupings` behaves like `metasites` but for `insurance_plans` (instead of `sites`)
* **new:** `insurance_plan_grouping_associations` is designed similarly to the `metasite_associations` table, but for `insurances_plan_id` and `insurance_plan_grouping_id` (instead of `site_id` and `metasite_id`)

## v3.1.1 released 2014-05-05

**new** added timestamp columns to `rad_exam_times` and `rad_pacs_metadata`:

* `rad_pacs_metadata.first_image` - timestmap of first image in exam to arrive on PACS
* `rad_pacs_metadata.last_image` - timestmap of last image in exam to arrive on PACS
* `rad_exam_times.cancelled` - timestamp when a Radiology exam is cancelled

**new:** `rad_exam_metric` and `rad_exam_fact` cols based on new timestamps:

| Metric | Description | Definition|
|--------|-------------|-----------|
| `order_first_image` | how long it took for the first image to be available after the order was placed | `rad_pacs_metadata.first_image` - `rad_exam_times.`order_arrival` |
| `order_last_image` | how long it took for the entire study to be available after the order was placed | `rad_pacs_metadata.last_image` - `rad_exam_times.`order_arrival` |
| `first_image_prelim` | how long after the first image was available for a preliminary report to be rendered (the `report_event` time is from the `first_prelim_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.first_image` |
| `last_image_prelim` | how long after the entire study was available for a preliminary report to be rendered (the `report_event` time is from the `first_prelim_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.last_image` |
| `first_image_final` | how long after the first image was available for a final report to be rendered (the `report_event` time is from the `first_final_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.first_image` |
| `last_image_final` | how long after the entire study was available for a final report to be rendered (the `report_event` time is from the `first_final_report_id`) | `rad_reports.report_event` - `rad_pacs_metadata.last_image` |
| `end_exam_first_image` | delay from when study was completed to when image transmission began | `rad_pacs_metadata.first_image` - `rad_exam_times.end_exam` |
| `end_exam_last_image` | delay from when study was completed to when entire exam was available for interpretation | `rad_pacs_metadata.last_image` - `rad_exam_times.end_exam` |
| `send_duration` | duration of transmitting the entire study to PACS (implicitly omits send time for first image) | `rad_pacs_metadata.last_image` - `rad_pacs_metadata.first_image` |

Other updates:

* **bugfix:** dropped `claims.service_performed` since `claim_transactions` on the same `claim` can have >=1 date of service
* **bugfix:** fixed index, documentation, and 2.x-3.x upgrade scripts

## v3.1.0 released 2014-04-30

**new:** added `rad_exam_facts` fact table to support analytics / business intelligence apps:

* similar to `rad_exams` but with additional foreign keys and timestamps
* foreign key `rad_exam_id` links back to `rad_exams`
* created stored procedures for use in SDK to support analytics / business intelligence apps

## v3.0.7 released 2014-04-30

**improvement:** 2.x-3.x upgrade and documentation scripts

## v3.0.6 released 2014-04-22

**improvement:**  2.x-3.x upgrade and documentation scripts

## v3.0.5 released 2014-04-07

**improvement:**  2.x-3.x upgrade and documentation scripts

## v3.0.4 released 2014-04-03

**new:** added `universal_event_types` values for finance model

## v3.0.3 released 2014-03-31

**new:** added message documentation for finance messages

## v3.0.2 released 2014-03-27

* **improvement:**  message documentation
* **improvement:**  2.x-3.x upgrade scripts

## v3.0.1 released 2014-03-25

**new:** added `rad_reports.report_impression` column from v2.4.0

## v3.0.0 released 2014-03-18

This is a major update to the data model which renames and adds many things, with the primary focus being the addition of a finance data model domain.

###Altered Tables###

* `trip_statuses` renamed to `universal_event_types` (also renamed all foreign key reference columns in other tables)
* `exam_statuses` renamed to `external_system_statuses` (also renamed all foreign key columns in other tables)
* `patient_events` and `patient_events_history` now have an FK reference to `site_class_id`
* `rad_external_system_statuses` renamed to `rad_exam_external_system_statuses`
* `sites` table has added `name` and `application_visible` (for display help), `cms_facility` boolean for if the `site` is considered a facility or not (details below) and also the `cms_gpci_id` foreign key (also described in detail below)
* `site_classes` table has added `cms_facility_type_id` foreign key (described in detail below)
* changing `patient_events` (and `patient_events_history`) to use `external_system_statuses` instead of `patient_event_types` (upgrade merges tables together)
* changed data types of anything related to currency from `double precision` to `money` ([PostgreSQL documentation](http://www.postgresql.org/docs/9.1/static/datatype-money.html))
* `reasons` now have an `external_system_id` FK constraint to improve the ability of apps to sort/filter/display reason lists intelligently
* `rad_exams` now have an additional report foreign key column, `last_prelim_report_id` for the most recent (by `report_event`) `preliminary` (normalized) status `rad_report`

###Procedures and HCPCS Codes###

References to CPT have been replaced w/ HCPCS.  [HCPCS is a superset of CPT](http://en.wikipedia.org/wiki/Healthcare_Common_Procedure_Coding_System).

* `cpt_codes` has been renamed to `cms_hcpcs_codes` to reflect the source more accurately and increase naming consistency amongst CMS core tables
* the `active` and `revision` columns have been removed from `cpt_codes` and put into the `cms_hcpcs_code_revisions` table - now entire sets of codes are active/disabled at once (instead of per-code)
* the `modifiers` column has been removed from `cpt_codes` and replaced with a reference to the `cms_modifiers` table
* `fees` are no longer in `cpt_codes`, since these are location-based, they are now in the procedures table (since `procedures` are tied to `sites`, which have a GPCI location, this is the only consistent/correct place to calculate) and the components used to calculate are now in the `cms_hcpcs` table
* `procedure_cpt_mappings` has been renamed to `procedure_hcpcs_mappings`
* the `sites` table now has references to the `cms_gpci` and `cms_facility_types` tables so that fees can be calculated for procedures
* `cms_facility_types` is needed for charge data, as well as calculating the RVU/fees (facility vs non-facility)
* `cms_hcpcs_code_revisions` tracks which revision of HCPCS codes is active at any given time (should only be one active row)
* `cms_gpci` the geographic modifiers needed calculate RVU/fees for HCPCS
* `cms_modifiers` is needed for charge data as well as HCPCS

Having said all that, you need to know if a particular site is a facility or non-facility, as well as the GPCI constants to [calculate the CMS fee](http://www.cms.gov/apps/physician-fee-schedule/documentation.aspx)

Finally: this is only regarding CMS fees (and skips several obscure rules about outpatient imaging, specific CPT codes, etc.).  Radiologist professional RVU is still tied to CPT (and is now called `cms_hcpcs.work_rvu`), however since fees moved to procedure-level, RVU is now duplicated there also.  This should further simplify providing RVU for 1:N-CPT-mapped procedures.

###Billing Data Model###

The new, universal billing model is based on the fundamental table `claims`, a summary containing the claim/invoice number and a foreign key to the most recent `claim_transactions` (which are the detailed, individual transactions records).

* `claims` is a summary of `claim_transactions`, with foreign keys to the most recent `claim_transactions` as well as details like `patient_mrn`, `site,`visit`, `site_class`, etc. and summary data like `current_claim_status` and `current_balance`
* `claim_transactions` are the actual transaction-level billing data, including `balance`, `amounts`, etc. and details about the clinical data like providers, HCPCS code, date of service, etc.
* `claim_transaction_cms_modifiers` is a 1:N mapping of modifiers for the HCPCS code in a particular `claim_transaction`
* `claim_transaction_diagnoses` is a 1:N mapping of diagnoses to a particular `claim_transaction` (similar to `employee_clinical_role_mappings`)
* `claim_transaction_types` is a description of the type of transaction for display purposes (e.g. charge, adjustment, etc.)
* `insurance_carrier_demographics` similar to other demographic lookup tables (`employee_demos`, etc.) this is just set of demographic data for an insurance carrier (e.g. phone number, address, etc.)
* `insurance_carrier_plans` specific coverage plans for a carrier
* `insurance_carriers` the insurance providers
* `insurance_policies` a policy is held by someone and is an instance of a particular plan for a particular carrier
* `relationship_types` oftentimes, a generic list of relationship types, used in `insurance_policies` to describe relationship between the covered patient and the policy holder

###ICD Codes###

Diagnosis codes have been a long-requested feature, and are now included for charge data and to expand patient visit information.

* `icd_codes` the diagnosis codes from the [WHO](http://en.wikipedia.org/wiki/ICD), designed to be compatible with ICD-9-CM and ICD-10-CM
* `icd_code_revisions` similar to `cms_hcpcs_revisions`, which tracks the version and revision of loaded codes, as well as which set(s) of codes are active

###Other New Tables###

* `visit_diagnoses` child of `visits` table, vertical relationship with the diagnoses code(s) for a particular patient encounter
* `visit_insurance_policies` is a mapping table to associate 1:N `visits` to `insurance_policies`
* `external_system_roles` dictionary of role types of an `external_system` (e.g. PACS, EMR, etc.), to facilitate more intelligent app behavior when displaying/filtering data
* `external_system_roles_mappings` maps `external_systems` to roles (similar to `employee_clinical_role_mappings`)
* `rad_exam_authorizations` is a mapping table to associate N:N insurance authorizations to `rad_exams`
* `rad_exam_claims` is a mapping table to associate N:N `claims` to `rad_exams`
* `radonc_case_authorizations` is a mapping table to associate N:N insurance authorizations to `radonc_cases`
* `radonc_case_claims` is a mapping table to associate N:N `claims` to `radonc_cases`
* `radonc_cases` analogous to `rad_exams` for a basic start to modeling radiation oncology data

## v2.4.0 released 2014-03-25

added new column `rad_reports.report_impression` to enable new radiology report functionality

## v2.3.27 released 2014-01-14

updated `residents` table to allow `NULL` values in columns

## v2.3.26 released 2014-01-07

New TRIP status for additional workflow step, revised descriptions to be more concise

## v2.3.25 released 2013-11-10

updated documentation for new data manager messages

## v2.3.24 released 2013-10-28

New TRIP statuses for more workflow steps

## v2.3.23 released 2013-08-13

documentation for data manager messaging now up-to-date

## v2.3.22 released 2013-08-08

documentation for data manager messaging now included

## v2.3.21 released 2013-08-06

* `site_classes.patient_type_id` is now `NOT NULL`
* all site classes must now have a patient type attribute, enforced at the database level

## v2.3.20 released 2013-07-25

expanded data manager infrastructure to support future features

## v2.3.19 released 2013-07-22

improved scripts to generate schema documentation with [SchemaSpy](http://schemaspy.sourceforge.net)

## v2.3.18 released 2013-07-22

added scripts to generate schema documentation with [SchemaSpy](http://schemaspy.sourceforge.net)

## v2.3.17 released 2013-07-03

added new clinical roles for employee mappings

## v2.3.16 released 2013-07-01

* fixed bug in partitioned table management infrastructure
* updated scripts used for new installs

## v2.3.15 released 2013-06-30

* fixed bug in partitioned table management infrastructure
* updated scripts used for new installs

## v2.3.14 released 2013-06-30

* fixed bug in partitioned table management infrastructure
* updated scripts used for new installs

## v2.3.13 released 2013-06-14

* added `employee_specialty_mappings.primary` boolean attribute to allow for grouping by specialty for employees w/ >1 specialty
* expanded data manager infrastructure to support future features

## v2.3.12 released 2013-05-24

added additional indexes for performance

## v2.3.11 released 2013-03-29

removed foreign key constraint from `people.current_employee_id` to avoid recusion problems when creating new `people` and `employees`

## v2.3.10 released 2013-03-15

updated scripts used for new installs

## v2.3.9 released 2013-03-13

* updated default data for new installs
* added additional indexes for performance

## v2.3.8 released 2013-03-13
* updated default data for new installs
* added additional indexes for performance

## v2.3.7 released 2013-03-07

* added additional indexes for performance
* set `visits.site_id` to allow `NULL`
  * not all visits will have a facility assigned in all messages

## v2.3.6 released 2013-03-07
* added additional indexes for performance
* set `visits.site_id` to allow `NULL`
  * not all visits will have a facility assigned in all messages

## v2.3.5 released 2013-02-28

* improved and automated partition management for partitioned tables in schema used by data manager as infrastructure for message logging
* added `rad_exam_personnel.assisting_techN` for 1<=N<=3 columns to allow capture of additional assisting staff for `rad_exams`

## v2.3.3 released 2013-02-28

* improved and automated partition management for partitioned tables in schema used by data manager as infrastructure for message logging
* added `rad_exam_personnel.assisting_techN` for 1<=N<=3 columns to allow capture of additional assisting staff for `rad_exams`

## v2.3.2 released 2013-02-28

* improved and automated partition management for partitioned tables in schema used by data manager as infrastructure for message logging
* added `rad_exam_personnel.assisting_techN` for 1<=N<=3 columns to allow capture of additional assisting staff for `rad_exams`

## v2.3.1 released 2013-02-28

* improved and automated partition management for partitioned tables in schema used by data manager as infrastructure for message logging
* added `rad_exam_personnel.assisting_techN` for 1<=N<=3 columns to allow capture of additional assisting staff for `rad_exams`

## v2.3.0 released 2013-02-27

* improved and automated partition management for partitioned tables in schema used by data manager as infrastructure for message logging
* added `rad_exam_personnel.assisting_techN` for 1<=N<=3 columns to allow capture of additional assisting staff for `rad_exams`

## v2.2.2 released 2013-02-25

added additional indexes for performance

## v2.2.1 released 2013-02-13

fixed read-only used by SDK

## v2.2.0 released 2013-02-13

added read-only used by SDK

## v2.1.6 released 2013-01-31

added additional indexes for performance

## v2.1.5 released 2013-01-31

added additional indexes for performance

## v2.1.4 released 2013-01-31

added additional indexes for performance

## v2.1.3 released 2013-01-10

added additional indexes for performance

## v2.1.2 released 2012-12-28

added `rad_exams.visit_id` foreign key

## v2.1.1 released 2012-12-20

added additional indexes for performance

## v2.1.0 released 2012-12-18

added additional indexes for performance

## v2.0.1 released 2012-12-03

`rad_exam_metrics` columns changed from `integer` to `bigint`

## v2.0.0 released 2012-11-02

major changes from 1.x data model

* `external_system_id` added to many tables
* changes `rad_exams.patient_id` to `rad_exams.patient_mrn_id`
* support for `patient_mrns.empi` attribute
* updated supporting scripts for new installs
