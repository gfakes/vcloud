
## v3.7.2 released 2017-08-04

**service-tools** **bugfix:** resolve export failures on > 1000 rows, added order status display

### Updated Components

`service-tools` - v2.1.2

### Service Notes

```bash
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_deploy.sh /tmp/service-tools.war
gf_app_portal_deploy.sh /tmp/portal.war
sudo service glassfish stop
sudo service glassfish start
```

## v3.7.1 released 2017-08-02

* **data-manager, data-model, sdk, service-tools** **new:** added support for SIU HL7 messaging and expanded data model to support more robust order information
* **improvement:** all components now set version in `configuration_variables` table

### Updated Components

* `data-manager` - v3.5.0
* `data-model` - v3.6.1
* `hl7-parser` -v1.2.3
* `indexer` - v1.4.1
* `sdk` - v1.8.1
* `service-tools` - v2.1.0

### Service Notes

```bash
service glassfish stop
service data_manager stop
sudo stop harbinger-indexer
unzip hl7-parser-v1.2.3.zip
cd hl7-parser-v1.2.3
./install.sh
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py # run in screen
unzip data_manager-3.5.0.zip
cd data-manager-3.5.0
./install.sh
unzip harbinger-indexer-1.4.1.zip
cd harbinger-indexer-1.4.1
./install.sh
sudo start harbinger-indexer
unzip harbinger-sdk-1.8.1.zip
cd harbinger-sdk-1.8.1
./install.sh
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
sudo service glassfish start
gf_app_deploy.sh /tmp/service-tools.war
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.7.0 released 2017-07-18

Greatly expanded capability of Service Tools for both management and initial system configuration

* **data-manager, data-model, sdk, service-tools** **new:** added support for bulk import/export of Excel-format data dictionaries, ability to truncate a system to bare minimum configuration to facility rapid iteration for new deployment integration and testing
* **data-manager, data-model, sdk, service-tools** **new:** enabled white-listing function for data governance worklists
* **new:** added 2017 ICD-10-CM and HCPCS code sets
* **service-tools** **improvement:** dozens of interface improvements and bug fixes
* **bugfix:** typos in default ETL handlers
* **bugfix:** the `web-application-messages` exchange is now set to durable in the `rails-extensions` gem

### Updated Components

* `data-manager` - v3.4.0
* `data-model` - v3.6.0
* `hl7-parser` v1.2.2
* `indexer` - v1.4.0
* `js` - v1.0.5
* `rails-extensions` - v0.0.25
* `sdk` - v1.8.0
* `service-tools` - v2.0.0

### Service Notes

> **Note**: you must manually edit the `/servers/harbinger/config/site.config.json` file to update the ICD and HCPCS codes ***before*** running the load scripts, otherwise the new code sets will not be loaded.

This release of Bridge changes the application messaging interface compatibility, so any apps that use messaging (Checklist, Productivity/Quality, Progress, Scanner Utilization, Service Tools, and Sweep) **must** be updated after the Bridge upgrade is complete.

> **Warning**: The link to Service Tools in the portal must change from `/hst` to `/service-tools` and there is a stub WAR file included to redirect from the old to the new link.

```bash
sudo pip install semantic_version
service glassfish stop
service data_manager stop
sudo stop harbinger-indexer
sudo /servers/harbinger/harbinger/management/kill_hl7_parser.py
unzip hl7-parser-v1.2.2.zip
cd hl7-parser-v1.2.2
./install.sh
cd /servers/harbinger/harbinger/deployment
./create-web-application-messages-exchange.py
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py # run in screen
./load-icd_codes.py
./load-cms_hcpcs.py
unzip data_manager-3.4.0.zip
cd data-manager-3.4.0
./install.sh
unzip harbinger-indexer-1.4.0.zip
cd harbinger-indexer-1.4.0
./install.sh
sudo start harbinger-indexer
unzip harbinger-sdk-1.8.0.zip
cd harbinger-sdk-1.8.0
./install.sh
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
sudo service glassfish start
gf_app_portal_deploy.sh /tmp/portal.war
gf_app_deploy.sh /tmp/hst.war
gf_app_deploy.sh /tmp/service-tools.war
```

## v3.6.6 released 2016-07-26

Expanded data model and bugfixes

* **data-manager, data-model, sdk, service-tools** **new:** added scheduler to fact table, new DICOM timestamps
* **data-manager, service-tools** **bugfix:** all employee specialty or clinical roles can now be removed
* **data-manager** **bugfix:** resolved metric calculation race condition for reports that arrive out of chronological order
* **sdk** **bugfix:** now handles special characters in usernames
* **improvement:** beautiful new portal icons and layout
* **improvement:** updated `site.config.json`
* **improvement:** updated default nagios and nrpe configuration files

### Updated Components

* `data-manager` - v3.3.22
* `data-model` - v3.5.6
* `sdk` - v1.7.5
* `service-tools` - v1.2.12

### Service Notes

It is recommended to run the data-model update in `screen` as it may take up to 6 hours to complete.

```bash
gf_app_deploy.sh /tmp/hst.war
service glassfish stop
service data_manager stop
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py # run in screen
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
service data_manager start
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp -v /tmp/harbinger-sdk-1.7.5-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/
sudo service glassfish start
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.6.5 released 2016-05-09

Minor bugfixes

* **data-manager, data-model, sdk, service-tools** **new:** new radiology exam metrics and fact table expansion
* **data-manager** **bugfix:** correctly set `rad_exam_details.previous_procedure_id`
* **sdk** **bugfix:** resolve issue with `stopTime` method
* **service-tools** **bugfix:** revert radiology exam department search to simple search for performance, fix edit employee form

### Updated Components

* `data-manager` - v3.3.20
* `data-model` - v3.5.5
* `rails-extensions` - v0.0.20
* `sdk` - v1.7.3
* `service-tools` - v1.2.10

### Service Notes

```bash
gf_app_deploy.sh /tmp/hst.war
service glassfish stop
service data_manager stop
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
service data_manager start
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp -v /tmp/harbinger-sdk-1.7.3-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/
sudo service glassfish start
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.6.4 released 2016-04-25

Infrastructure improvements

* **data-manager, data-model, sdk** **improvement:** HIPAA audit logs constrained to supported elements
* **general-et** **bugfix:** fix progress bar table walk function of utility library
* **hl7-parser** **bugfix:** resolve memory leak and blocking caused by certain HL7 content
* **service-tools** **bugfix:** resolve errors in patient + claim searches, governance worklist identifier formatting, exams detail view, HIPAA logging, real-time data notification, procedure-HCPCS mapping (now allows duplicate HCPCS codes to be mapped)
* **improvement:** expanded skeleton configs to include HL7 parsing and transform scripts
* **new:** added script for cron job to kill data_manager pings that never stop, added kill script for HL7 parser

### Updated Components

* `data-manager` - v3.3.18
* `data-model` - v3.5.4
* `general-et` - v1.1.7
* `hl7-parser` - v1.2.1
* `service-tools` - v1.2.7
* `sdk` - v1.7.2

### Service Notes

Add the new service script to crontab:

```
# kill dm pings
0 7,19 * * * root /servers/harbinger/harbinger/management/kill_dm_pings.sh
```

```bash
sudo vi /etc/crontab # add new line from above
service data_manager stop
sudo /servers/harbinger/harbinger/management/kill_hl7_parser.py
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/harbinger/management
cp -v /servers/harbinger/harbinger/hl7-parser/et.py /servers/hl7-parser/et.py
cp -v /tmp/harbinger.et-1.2.0-standalone.jar /servers/hl7-parser/
ln -sf /servers/hl7-parser/harbinger.et-1.2.0-standalone.jar /servers/hl7-parser/harbinger.et-standalone.jar
./deploy-data-manager.sh
service data_manager start
gf_app_deploy.sh /tmp/hst.war
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp -v /tmp/harbinger-sdk-1.7.2-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-1.7.2-standalone.jar
sudo service glassfish stop
sudo service glassfish start
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.6.3 released 2016-04-01

Infrastructure improvements

* **data-manager**, **data-model**, **sdk**: **improvement:** added `rad_exam_facts.begin_exam_epoch`
* **general-et** **improvement:** excel formatting
* **hl7-parser** **improvement:** new functions for pulling out data
* **service-tools** **improvement:** more rad exams search options, added pagination to data browser, governance worklists, and HIPAA audit logs
* **improvement:** removed data_manager/sasl.log Nagios check

### Updated Components

* `data-manager` - v3.3.17
* `data-model` - v3.5.3
* `general-et` - v1.1.6
* `hl7-parser` - v1.1.2
* `sdk` - v1.7.1
* `service-tools` - v1.2.5

### Service Notes

```bash
service data_manager stop
ps aux | grep harbinger.et-standalone.jar # look for pid of hl7 parser service, copy to kill command
kill PID
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/harbinger/management
cp -v /servers/harbinger/harbinger/hl7-parser/et.py /servers/hl7-parser/et.py
cp -v /tmp/harbinger.et-1.1.2-standalone.jar /servers/hl7-parser/
ln -sf /servers/hl7-parser/harbinger.et-1.1.2-standalone.jar /servers/hl7-parser/harbinger.et-standalone.jar
./deploy-data-manager.sh
service data_manager start
cp -v /tmp/harbinger-sdk-1.7.1-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-1.7.1-standalone.jar
gf_app_deploy.sh /tmp/hst.war
sudo service glassfish stop
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
sudo service glassfish start
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
vi /servers/harbinger/config/nagios/<path-to>/ai-server.cfg
# remove block for check_dm_sasl_log
sudo service nagios3 restart
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.6.2 released 2016-03-15

Bugfixes and internal improvements

* **data-manager** **bugfix:** for procedure-HCPCS mapping
* **data-model** **improvement:** documentation generation **(no schema/SDK change)**
* **service-tools** **new:** application usage information under `Information > Usage Log`
* **service-tools** **improvement:** additional search options and improved styling for `Data Browser > Rad Exams`

### Updated Components

* `data-manager` - v3.3.16
* `data-model` - v3.5.2
* `service-tools` -v1.2.4

### Service Notes

The following changes need to be made to GlassFish via the admin page. Make these changes before the GlassFish restart (last step of instructions below):

* Turn off application autodeploy
* Turn off application dynamic reloading
* Turn on File Cache for `http-listener-1` (8080); Set file cache max size to 52428800 (bytes) and max age to 120 (seconds)
* Turn on File Cache for `http-listener-2` (8081); Set file cache max size to 52428800 (bytes) and max age to 120 (seconds)
* Change acceptor threads from 1 to the number of physical cores (ignoring hyperthreading). You can also run `cat /proc/cpu_info` to get the number of physical CPU cores, but this includes hyper-threading; lookup CPU model if you just count, you need to lookup the CPU model.
* Allocate all heap space to Java on start up (`-Xmx4G` with `-Xms4G`) effectively giving GlassFish all 4G permanently
* Change `http-thread-pool` max thread pool size to 50 and min thread pool size to 25

The url will be http://ai-server.example.com:4848, the GlassFish admin console (click **Save** after each setting change).

> Domain -> Application Configuration Tab -> Uncheck **Reload: Enabled**
>
> Domain -> Application Configuration Tab -> Uncheck **Auto Deploy: Enabled**
>
> Configurations -> server-config -> Network Config -> Network Listeners -> http-listener-1 -> File Cache Tab -> check **Status: Enabled**, set Max age: **120**, set Max Cache Size: **52428800**
>
> Configurations -> server-config -> Network Config -> Network Listeners -> http-listener-2 -> File Cache Tab -> check **Status: Enabled**, set Max age: **120**, set Max Cache Size: **52428800**
>
> Configurations -> server-config -> Network Config -> Transports -> tcp -> Acceptor Threads: **set to number of physical CPU cores**
>
> Configurations -> server-config -> JVM -> JVM Options Tab -> **Add JVM Option** and set to **"-Xms4G"**
>
> Configurations -> server-config -> Thread Pool -> http-thread-pool -> set Max Thread Pool Size: **50**, set Min Thread Pool Size: **25**
>

```bash
service data_manager stop
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
service data_manager start
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
cp /tmp/hst.war.v1.2.4 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
# make sure the glassfish changes from above have been completed before restarting
sudo service glassfish stop
sudo service glassfish start
```

## v3.6.1 released 2016-03-03

Bugfixes and internal improvements

* **data-manager** **bugfix:** resolve issues in finance and insurance/auth models, updated FK references to allow more merges in Service Tools
* **data-model** **bugfix:** app usage tracking partitioned tables **(no schema/SDK change)**
* **service-tools** **improvement:** more data displayed, ability for `ai-staff` to merge more items
* **new:** scripts for platform management (add employees to ai-staff, display/export app access)

### Updated Components
* `data-manager` - v3.3.15
* `data-model` - v3.5.1
* `service-tools` - v1.2.3

### Service Notes

Includes new contact configuration for Nagios to open Freshdesk tickets instead of email.

```bash
service data_manager stop
# edit cron to disable partition management and usage tracking scripts
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
# edit cron to enable partition management and usage tracking scripts
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
service data_manager start
cp /tmp/hst.war.v1.2.3 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
cp /servers/harbinger/harbinger/skel/nagios/ai-contacts.cfg.default /servers/harbinger/config/nagios/common-cfg/ai-contacts.cfg
sudo service nagios3 restart
```

## v3.6.0 released 2016-02-02

Remove duplicate procedures and resources by moving to `external_system` instead of `site` for uniqueness

* **data-model** **new:** `procedures.site_id` and `procedures.cms_fee` dropped, `procedures.external_system_id` added, `resources.external_system_id` added
* **data-manager, indexer, service-tools, sdk** **improvement:** support above change
* **rails-extensions** **improvement:** now compatible with Rails 3.x
* **service-tools** **improvement:** compatible with new data-model, enhanced search functionality

### Updated Components

* `data-manager` - v3.3.12
* `data-model` - v3.5.0
* `indexer` - v1.3.0
* `rails-extensions` - v0.0.19
* `sdk` - v1.7.0
* `service-tools` - v1.2.0

### Service Notes

Service will require touching almost all platform components. This update is estimated to take up to 2 hours to complete the merges of procedures and resources. The entire index rebuild will scale depending on the size of the install, but can happen in the background.

```bash
sudo stop harbinger-indexer
service data_manager stop
sudo service glassfish stop
cd /servers/harbinger/harbinger/data-model/deployment
# STRONGLY RECOMMEND PROCEEDING IN SCREEN
./update-version.py
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
cp /path/to/harbinger-indexer-1.3.0-standalone.jar /servers/indexer
ln -sfv /servers/indexer/harbinger-indexer-1.3.0-standalone.jar /servers/indexer/harbinger-indexer-standalone.jar
rm -rf /servers/harbinger/lucene/indexes/harbinger.sdk.data.*
cd /servers/harbinger/management
# new screen window
./indexer_mass_index.sh
# after the mass index completes
sudo chown -R harbinger:glassfishadm /servers/harbinger/lucene/indexes/harbinger.sdk.data.*
sudo start harbinger-indexer
# new screen window
# proceed while mass-indexer runs
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp -v /path/to/harbinger-sdk-1.7.0-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-1.7.0-standalone.jar
service data_manager start
sudo service glassfish start
cp ~/hst.war.v1.2.0 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.5.10 released 2016-01-15

* **service-tools** **bugfix:** procedure-HCPCS mappings
* **general-et** **improvement:** infrastructure improvements

### Updated Components

* `general-et` - v1.1.4
* `service-tools` - v1.1.36

### Service Notes

```bash
cd /servers/harbinger/harbinger/management
cp ~/hst.war.v1.1.36 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.5.9 released 2016-01-14

* **data-manager, service-tools** **new:** enhancements to enable `external_system` merges
* **new:** updated ICD-10 and HCPCS code revisions
* **improvement:** Nagios contact email address
* **bugfix:** set bridge version command no longer git dependent

### Updated Components

* `data-manager` - v3.3.11
* `data-model` - v3.4.5
* `service-tools` - v1.1.34

### Service Notes

**YOU MUST EDIT `/servers/harbinger/config/site.config.json`** to point to the new ICD and HCPCS codes, an example is in `/servers/harbinger/harbinger/skel/site.config.json`

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
./load-cms_hcpcs.py
./load-icd_codes.py
cd /servers/harbinger/harbinger/management
service data_manager stop
./deploy-data-manager.sh
service data_manager start
cp ~/hst.war.v1.1.34 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
cp /servers/harbinger/harbinger/skel/nagios/ai-contacts.cfg.default /path/to/ai-contacts.cfg
sudo service nagios3 restart
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.5.8 released 2016-01-04

* **hl7-parser** **new:** added get-obx-type-regex function to allow for a regular expression to segregate out which obx should be used, updated for improved UTF-8 string handling
* **service-tools** **bugfix:** governance worklists
* **general-et** **bugfix:** library fixed typo in `HarbingerETEnv.sftp_connect` function

### Updated Components

* `hl7-parser` - v1.1.1
* `service-tools` - v1.1.33
* `general-et` - v1.1.3

### Service Notes

```bash
service data_manager stop
#stop running hl7-parser manually with kill
cp -v /servers/harbinger/harbinger/hl7-parser/et.py /servers/hl7-parser/et.py
cp -v ~/harbinger.et-1.1.1-standalone.jar /servers/hl7-parser/
ln -sf /servers/hl7-parser/harbinger.et-1.1.1-standalone.jar /servers/hl7-parser/harbinger.et-standalone.jar
service data_manager start
cp ~/hst.war.v1.1.33 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.5.7 released 2015-12-16

* **data-model** **bugfix:** added missing FK for `rad_exam_facts.procedure_id`
* **sdk** **new:** implement `data-model` bug fix

### Updated Components

* `data-model` - v3.4.3
* `sdk` - v1.6.1

### Service Notes

Requires GlassFish restart for new SDK

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/management
./deploy-data-manager.sh
sudo service glassfish stop
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp /path/to/harbinger-sdk-1.6.1-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-1.6.1-standalone.jar
sudo service glassfish start
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
cd /servers/harbinger/portal-static
./warblizer.sh
gf_app_portal_deploy.sh /tmp/portal.war
```

## v3.5.6 released 2015-12-07

* **data-manager** **bugfix:** finance model
* **data-model** **bugfix:** updated release

### Updated Components

* `data-manager` - v3.3.10
* `data-model` - v3.4.3

### Service Notes

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/management
./deploy-data-manager.sh
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.5 released 2015-11-23

* Improved usage worker to handle null values.
* Improved healthchecker to also include application usage.
* Updated data-manager for site_class to external_system uniqueness and rad_exam_department merges.
* Updated rails-extensions to allow application name to be specified.
* Updated service-tools for better site_class searching and rad_exam_department merges.
* Data model bug fixes and data-manager update support

### Updated Components

* `data-manager` - v3.3.9
* `data-model` - v3.4.2
* `rails-extensions` - v0.0.18
* `service-tools` - v1.1.32

### Service Notes

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/management
./deploy-data-manager.sh
cp ~/hst.war.v1.1.32 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.4 released 2015-10-07

Minor bugfixes and improvements, documentation

* Updated crontab.
* Updated service-tools.
* Improved usage worker to handle null employees.

### Updated Components

`service-toos` - v1.1.26

### Service Notes

Update crontab and service tools.

```bash
sudo vi /etc/crontab
cp ~/hst.war.v1.1.26 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.3 released 2015-10-01

Minor bugfixes and improvements, documentation

* Updated portal warblizer script.
* Fixed an issue with the portal deploy script.
* Renamed set-bridge-version.sh file to match documentation.
* Clean up of glassfish deploy scripts.

### Updated Components

None

### Service Notes

Update the warblizer script in customer portal.

```bash
cp -v /servers/harbinger/harbinger/skel/portal-static/warblizer.sh /servers/harbinger/portal-static
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.2 released 2015-09-15

Minor bugfixes and improvements, documentation

### Updated Components

* `general-et` - v1.1.2
* `rails-extensions` - v0.0.13

### Service Notes

Nothing needs to be actively installed.

```bash
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.1 released 2015-09-15

Critical bugfix for billing messages in data-manager, fixes in data-model

* data-manager now adding patient demographics for billing.transaction messages per spec
* data-model documentation generation now works

### Updated Components

* `data-manager` - v3.3.7
* `data-model` - v3.4.1

### Service Notes

update data-manager and data-model

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
cd /servers/harbinger/management
./deploy-data-manager.sh
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
```

## v3.5.0 released 2015-09-15

Patient Age, Volume Counting Logic, and App Usage Statistics

* Adds new patient_age information to radiology exam details and fact tables to enable age-related filters
* Changes volume counting logic for procedures and fact tables to support more customer use cases
* Infrastructure to support application usage statistics and data quality statistics
* Library and utility updates
 * python ET utilities greatly enhanced
 * data-model support scripts greatly enhanced
 * skeleton portal IE fix and new site-build template script
 * backported some 4.x Bridge bash util functions into `deployment/utils.sh`
 * started (non-functional/non-validated) skeleton base buildout script
 * improvement to management shell scripts

### Updated Components

* `data-manager` - v3.3.6
* `data-model` - v3.4.0
* `general-et` - v1.1.1
* `indexer` - v1.2.4
* `js` - v1.0.0
* `rails-extensions` - v0.0.12
* `sdk` - v1.6.0
* `service-tools` - v1.1.24

### Service Notes

* install python egg
* configure usage queue
* update data-model (up to 4 hours)
* update SDK
* update data-manager
* update crontab (see new skel example)
* rebuild fact table (background-only to add zero-vol exams)
* rebuild missing data-manager log indexes (background-only)
* update indexer
* rebuild lucene indexes
* deploy service tools

```bash
sudo pip install iso8601
cd /servers/harbinger/harbinger/data-model/deployment
/servers/harbinger/harbinger/deployment/create-usage-exchange-queue.py
sudo service glassfish stop
sudo service data_manager stop
screen # start a screen session
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py # could take up to 4 hours
rm /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-*
cp /path/to/harbinger-sdk-1.6.0-standalone.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/harbinger-sdk-1.6.0-standalone.jar
cd /servers/harbinger/management
./deploy-data-manager.sh
# add to crontab:
# 0 1 * * * harbinger /servers/harbinger/harbinger/data-model/management/data-quality-aggregator.py
# */10 * * * * harbinger /servers/harbinger/harbinger/management/usage-queue-worker.py
vi /etc/crontab
cd /servers/harbinger/harbinger/management
./set-bridge-version.sh
# in new screen tab (ctrl-a c)
sudo service data_manager attach
  analytics:populate_from_scratch().
  (^-D when finished)
# in new screen tab (ctrl-a c)
cd /servers/harbinger/harbinger/data-model/migrations/3.3.1-3.4.0
./fix-dmel-indexes.sh
# in new screen tab (ctrl-a c)
#also stop glassfish if restarted previously
sudo stop harbinger-indexer
cp /path/to/harbinger-indexer-1.2.4-standalone.jar /servers/indexer
ln -sf /servers/indexer/harbinger-indexer-1.2.4-standalone.jar /servers/indexer/harbinger-indexer-standalone.jar
rm -rf /servers/harbinger/lucene/indexes/harbinger.sdk.data.*
cd /servers/harbinger/management
./indexer_mass_index.sh
sudo chown -R harbinger:glassfishadm /servers/harbinger/lucene/indexes/harbinger.sdk.data.*
sudo start harbinger-indexer
# in new screen tab (ctrl-a c)
# glassfish can be started after the index starts to show a percentage, just not before
sudo service glassfish start
cp ~/hst.war.v1.1.24 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
```

## v3.4.16 released 2015-06-24

`data-manager` fixed the schema facts (foreign key reference data structure) for the procedures table. It had `procedure_cpt_mappings` instead of `procedure_hcpcs_mappings`

### Updated Components

`data-manager` - v3.3.5

### Service Notes

Deploy data-manager:

```bash
cd /servers/harbinger/management
./deploy-data-manager.sh
```

## v3.4.15 released 2015-06-17

* Moved script to match data-manager scripting
* removed header from CHANGELOG per CT request

### Updated Components

None

### Service Notes

None

## v3.4.14 released 2015-06-16

* Updated portal skel to match current style (links in tabs, header)
* Updated mass-indexer script
* indexer upstart job modified to use non-version specific jar
* added basic license auth checkin script
* updated `data-manager` to support license auth checkin

### Updated Components

* `indexer` (still using the v1.2.3 indexer jarfile)
* `data-manager` - v3.3.4

### Service Notes

Copy new files into place for indexer, build and deploy new data manager:


```bash
sudo cp /servers/harbinger/harbinger/indexer/upstart.conf /etc/init/harbinger-indexer.conf
ln -sf /servers/indexer/harbinger-indexer-1.2.3-standalone.jar /servers/indexer/harbinger-indexer-standalone.jar
sudo service data_manager stop
cd /servers/harbinger/management
./deploy-data-manager.sh
sudo service data_manager start
```

## v3.4.13 released 2015-05-12

Fixed bug in `general-et` utils library to handle dates < 1900

### Updated Components
* `general-et` - v1.0.5

### Service Notes

submodule update will deploy new py utils

## v3.4.12 released 2015-05-08

* added OS version info to healthchecker
* updated default crontab to include harbinger-indexer restart
* updated service tools
* added indexer stop to load-db script
* updated gf_app_deploy.sh to save currently running war
* default portal-static open new tab
* crontab healthchecker updated email to healthchecker@analytical.info

### Updated Components

`service-tools` - v1.1.15

### Service Notes

* update crontab email to healthchecker@analytical.info
* update portal
* update hst

## v3.4.11 released 2015-04-15

healthchecker now includes display_nagios

### Updated Components

None

### Service Notes

```bash
#install gem
sudo gem install nagios_parser
#add the user running the healthchecker in crontab to www-data group
gpasswd -a ctoland www-data
```

## v3.4.10 released 2015-04-15

`hl7-parser` updated et.py check jar file

### Updated Components

`hl7-parser` - v1.1.0

### Service Notes

```bash
cp -v /servers/harbinger/harbinger/hl7-parser/et.py /servers/hl7-parser/et.py
```

## v3.4.9 released 2015-04-14

* `indexer` - installation modified to run from standalone jar
* `service-tools`
 * Patient results view no longer will show number of exams for patient.
 * Rad Report details will now show report impression if present.
 * Patient details view now shows full history of events and locations.
 * Short term fix for patient details view where the orders tab causes error.
* `hl7-parser`
 * additional functions, no changes needed to existing configs

### Updated Components

* `indexer` - v1.2.3
* `service-tools` - v1.1.13
* `hl7-parser` - v1.1.0

### Service Notes

* Install new `indexer` and stopping/removing previous war/lein installations.
* Deploy service-tools war

```bash
#indexer:
#ex: sudo stop harbinger-indexer
#ex: gf_app_undeploy.sh harbinger-indexer
#ex: sudo rm -rf /servers/indexer
mkdir -p /servers/indexer/logs
cp -R /servers/harbinger/harbinger/indexer/daemon-resources /servers/indexer
cp -R /servers/harbinger/harbinger/indexer/jndi-resources /servers/indexer
sudo cp /servers/harbinger/harbinger/indexer/upstart.conf /etc/init/harbinger-indexer.conf
cp harbinger-indexer-1.2.3-standalone.jar /servers/indexer
sudo chown -R harbinger:harbinger /servers/indexer
#hst:
cp ~/hst.war.v1.1.13 /tmp/hst.war
gf_app_deploy.sh /tmp/hst.war
#hl7-parser
service data_manager stop
#stop running hl7-parser manually with kill
cp -v /servers/harbinger/harbinger/hl7-parser/et.py /servers/hl7-parser/et.py
cp -v ~/harbinger.et-1.1.0-standalone.jar /servers/hl7-parser/
ln -s /servers/hl7-parser/harbinger.et-1.1.0-standalone.jar /servers/hl7-parser/harbinger.et-standalone.jar
service data_manager start
```

## v3.4.8 released 2015-03-13

* `data-manager` - fix adt patient event handling
* `service-tools` - site class display fix in patient details view

### Updated Components

* `data-manager` - v3.3.3
* `service-tools` - v1.1.12

### Service Notes

Run `data-manager` deploy script, deploy new service tools WAR in GlassFish

```bash
sudo service data_manager stop
cd /servers/harbinger/management
./deploy-data-manager.sh
sudo service data_manager start
sudo service data_manager ping # verify it worked
scp path/to/hst-v1.1.12.war /tmp/hst.war
gf_app_undeploy.sh hst
gf_app_deploy.sh hst.war
```

## v3.4.7 released 2015-03-12

* `data-manager` - minor billing logic change and bugfixes
 * bugfix: change `ca_posting_id` key to `ca_operator_id` key to match spec for `billing.claim_transaction` message handler. This key writes to `claim_transactions.posting_employee_id` **(NOTE: super project is correct, the `data-manager` CHANGELOG description is inaccurate)**
 * bugfix: `insurance_carriers` now includes `external_system_id` in unique lookup
* `service-tools` - bugfix in HCPCS view that broke message history views

### Updated Components

* `data-manager` - v3.3.1
* `service-tools` - v1.1.11

### Service Notes

Run `data-manager` deploy script, deploy new service tools WAR in GlassFish

```bash
sudo service data_manager stop
cd /servers/harbinger/management
./deploy-data-manager.sh
sudo service data_manager start
sudo service data_manager ping # verify it worked
scp path/to/hst-v1.1.11.war /tmp/hst.war
gf_app_undeploy.sh hst
gf_app_deploy.sh hst.war
```

## v3.4.6 released 2015-03-05

Updating `general-et` to expand LDAP and build functionality, getting `skel/site.config.json` ready for future

### Updated Components

* `general-et` - v1.0.4
* `/skel/site.config.json`

### Service Notes

No changes

## v3.4.5 released 2015-02-05

Added 2015 HCPCS code data

### Updated Components

* `/data/RVU15A.zip`
* `/skel/site.config.json`

### Service Notes

Not intended currently to update existing sites, but to be used as default for new sites. No clean/easy/repeatable upgrade path today.

## v3.4.4 released 2015-01-30

Healthchecker switched to html for better readability

### Updated Components

* `healthchecker.sh`
* `/skel/crontab` config

### Service Notes

* update crontab to add arg to mailx `-a 'Content-Type: text/html'`
* Tested with bsd version of mailx

## v3.4.3 released 2015-01-08

Bugfixes in Python utilities for ET and new site builds

### Updated Components

`general-et` - v1.0.2

### Service Notes

No changes

## v3.4.2 released 2015-01-07

* Improvements to Python utilities for ET and new site builds
* Improvements to `hl7-parser` deploy script and leiningen

### Updated Components

`general-et` - v1.0.1

### Service Notes

Deploy updated HL7 parser:

```bash
cd /servers/harbinger/harbinger/management
./deploy-hl7-parser.py
```

## v3.4.1 released 2014-12-10

* Adds new columns in `procedures` table for technical and professional fees
* Updated README and added CHANGELOG to super

### Updated Components

* `data-model` - v3.3.1
* `sdk` - v1.5.1

### Service Notes

* Requires `data-model` update (`data-manager` can safely continue running)
* Updating the SDK in GlassFish is optional (no apps currently use the newly added data elements)

```bash
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
```

## v3.4.0 released 2014-11-27

* Data model and data manager and SDK updated for fact table expansion
 * radiology: new `first_report` FK, `rad_exam_facts` expansion (timestamp fanout, new FKs)
 * finance: new `claim_transaction_facts` fact table
* Service tools app bugfixes and improvements
* Updated javscript
* Data model updates moved from super into `data-model` repo

### Updated Components

* `data-manager` - v3.3.0
* `data-model` - v3.3.0
* `sdk` - v1.5.0
* `service-tools` - v1.1.7

### Service Notes

Requires a new `data-manager` and fact table rebuild and new SDK for GlassFish.

* Stop `data-manager`
* Deploy new `data-manager`
* Update `data-model` (`data-manager` still off)
* Start `data-manager`
* Attach to `data-manager` and rebuild fact table (could take >72 hours)

```bash
sudo service data_manager stop
cd /servers/harbinger/harbinger/management
./deploy-data-manager.sh
cd /servers/harbinger/harbinger/data-model/deployment
./update-version.py
sudo service data_manager start
screen # start a screen session
sudo service data_manager attach
  analytics:populate_from_scratch().
  (^-D when finished)
```

## v3.3.11 released 2014-11-16

Added Nagios-HipChat integration scripts

### Updated Components

No changes

### Service Notes

Update the site repo `/servers/harbinger/config/site.config.json` to include HipChat channel information like the example in `/servers/harbinger/harbinger/skel/site.config.json`

HipChat channel information can be found @ https://analyticalinformatics.hipchat.com/admin/rooms

## v3.3.10 released 2014-11-10

Added lucene index for `RadExams.endExam`

### Updated Components

* `indexer` - v1.1.2
* `sdk` - v1.4.4

### Service Notes

* Updated SDK on GlassFish (mandatory)
* Need to deploy new `indexer` and launch manual re-index script

## v3.3.9 released 2014-11-03

Updated `healthchecker` script to include deployed SDK version

### Updated Components

No changes

### Service Notes

No changes
