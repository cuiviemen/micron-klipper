#!/usr/bin/env bash

scripts=(flash_ebb36gen2.sh flash_gbb15.sh flash_manta-m8p.sh)

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
