#!/bin/bash
apgdiff --ignore-start-with /dev/null <(pg_dump -O -s -x -n public -U postgres harbinger) > ../harbinger-schema.sql
apgdiff --ignore-start-with /dev/null <(pg_dump -O -s -x -n documentation -U postgres harbinger) > ../harbinger-documentation-schema.sql
apgdiff --ignore-start-with /dev/null <(pg_dump -O -s -x -n servicetools -U postgres harbinger) > ../servicetools-schema.sql
