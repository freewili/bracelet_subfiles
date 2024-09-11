#!/bin/sh

if ! type fwi-serial > /dev/null; then
  echo "Error, fwi-serial is needed. Please install it from pypi!"
  exit 1
fi

if [ -z $1 ]; then
  fwi-serial -l
  echo "Index needed, please select Main Processor index"
  exit 1
fi

for sub_file in "./"*.sub; do
  base_sub_file=`basename ${sub_file}`
  fw_location=/radio/${base_sub_file}
  fwi-serial -mi $1 -s ${sub_file} -fn ${fw_location}
done
