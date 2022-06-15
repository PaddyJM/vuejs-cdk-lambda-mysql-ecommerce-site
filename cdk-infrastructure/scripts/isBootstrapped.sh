#!/usr/bin/env bash
OUTPUT=$(aws --endpoint-url=http://localhost:4566 cloudformation list-stacks)
X=$(echo "$OUTPUT" | grep CDKToolkit)
if [ -z "${X}" ]; then cdklocal bootstrap; else echo "CDK has already been bootstrapped! Ready to deploy..."; fi