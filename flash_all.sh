#!/usr/bin/env bash

scripts=(flash_ebb36.sh flash_gbb15.sh flash_mcu.sh)

sudo service klipper stop

for script in "${scripts[@]}"
do
  ./$script
  if [ $? -ne 0 ]
    then
      exit $?
  fi
done

sudo service klipper start

exit $?
