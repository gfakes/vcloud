
## Usage

Load/reload a clean database with default values in core tables:

`bash
./deployment/drop-load-db.sh
`

## Development Usage

Normal workflow is to install a non-partitioned schema:

```bash
./deployment/drop-load-unpartitioned-nodata.sh
```

Then do your work and export the changes:

```bash
./management/export-unpartitioned-schema.sh
```

### Creating an "Upgrade" Script

* checkout "old" version of schema, copy schema to different file, checkout current master
* run `apgdiff` on the old and new schema
* manually edit the SQL output to add in any necessary update/delete statements so data integrity is intact

```bash
git checkout OLDCOMMIT
cp harbinger-schema.sql old.sql
git checkout master
apgdiff --ignore-function-whitespace old.sql harbinger-schema.sql > update.sql
emacs update.sql
```

### Paritioned Tables

The rules to generate the partitioned tables are in `generate-partitions.rb`  Once you've updated the rules, update the partitioned tables SQL that actually gets deployed:

```bash
./tools/generate-partitions.rb > harbinger-partitions.sql
```

### Generating Documentation

Run the `tools/generate-all-docs.sh` script to export schema documentation for the `public` schema on the local PostgreSQL server, excluding the parititioned tables, as well as XLS and Markdown exports of the data-manager and HL7 interface specifications. The output paths will be printed after the exports are completed.  This has a requirement of a "normal" Harbinger install to `/servers/harbinger/` and the `graphviz` package being installed (this has only been validated to work on Ubuntu).

## Requirements

* [apgdiff](http://www.apgdiff.com) in path for `export-unpartitioned-schema.sh`
* [graphviz](http://www.graphviz.org) in path for `generate-all-docs.sh`
