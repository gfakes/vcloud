## v1.1.7 released 2016-04-07

**bugfix:** resolve name collision in `utils.walk_table`, `tqdm` arg is now `progressBar`

## v1.1.6 released 2016-03-25

**improvement:** updated Excel module to add bold formatting option for rows that are majority formula

## v1.1.5 released 2016-02-11

**improvement:** updated Excel module to discount formula text when calculating cell width

## v1.1.4 released 2016-01-15

**improvement:** updated `HarbingerETEnv` in `utils`

* refactor database connection to use stand-alone `schemaConnect` class
* first push to new convention of using `h.cursor` and `h.db` (deprecating: `h.hcurs` and `h.hdb`, respectively)

## v1.1.3 released 2015-11-25

**bugfix:** fixed typo in `HarbingerETEnv.sftp_connect` function

## v1.1.2 released 2015-09-15

**bugfix:** `AmqpSender.wait_quiesce` now ignores the `harbinger-usage-request` queue since it isn't managed by data-manager

## v1.1.1 released 2015-09-02

**bugfix:** moved `dt_to_json` default tz definition out of args (stops `local_timezone()` call at `utils` module import failing, then trying to log before handler defined, preventing future logging)

## v1.1.0 released 2015-08-31

Lots of new functionality and refactoring

* **new:** new function to set `employee_clinical_role_mappings` for site builds
* **new:** new function to print money (for excel/csv/display purposes)
* **new:** new functions to get config_var/vars
* **improvement:** updated `HarbingerETEnv` to add SFTP support w/ optional RSA PK, refactored AMQP connection to use stand-alone `AMQPSender` class
* **improvement:** `AMQPSender` class now supports data-manager control messages
* **improvement:** `walk_table` now hides console progress bar by default
* **improvement:** better timestamp handling: new function to extract local timezone, all existing timestamp functions use local time default instead of `US/Eastern` hardcoding, removed `json_to_dt` (use pyiso8601 library: `import iso8601; iso8601.parse_date(jsondt)`)
* **improvement:** improved documentation

## v1.0.5 released 2015-05-12

**bugfix:** in `utils.py` `dt_to_json` can now handle dates < 1900 (will convert to `None`)

## v1.0.4 released 2015-03-05

**bugfix:** resolve issue with LDAP module

## v1.0.3 released 2015-03-04

Expanded/modernized LDAP functionality

* **improvement:** updated `ldaputils` module: added delete, connection close, and DN creation functions; added documentation; prefixed logging statements with `LDAP:`
* **improvement:** expanded `utils` module: new migration-oriented functions, prefixed logging statements with `UTILS:`, better documentation

## v1.0.2 released 2015-01-08

**bugfix:** resolve errors introduced in v1.0.1

## v1.0.1 released 2015-01-07

**new:** added migration-oriented functions in `utils`

## v1.0.0 released 2014-10-23

**new:** initial release of Python ET/reporting utilities library
