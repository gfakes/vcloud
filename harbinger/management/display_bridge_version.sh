#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
COMMIT=$(get_config "bridge-commit-id")
TAG=$(get_config "bridge-version")
echo "current configuration_variables: bridge-version: $TAG bridge-commit-id: $COMMIT"
