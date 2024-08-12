#!/bin/bash
script_dir=$(dirname "$(realpath "$0")")
cd "$script_dir" || exit

cd ../../iac || exit
OUTPUT_VALUE=$(terraform output $1)
if [ -z "$OUTPUT_VALUE" ]; then
  exit 1
fi
echo $OUTPUT_VALUE | sed 's/"//g'
