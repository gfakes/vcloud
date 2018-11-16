#!/bin/bash

for i in `find /servers/glassfish/glassfish3/glassfish/domains/domain1/applications -name _*version*`; do echo -n "$(echo $i| cut -f9 -d\/ ): " ; cat $i;done


