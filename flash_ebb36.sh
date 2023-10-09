#!/usr/bin/env bash

config="ebb36.config"
canuuid="a3605965c267"

pushd ~/klipper

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing EBB36 failed"
    exit $?
fi

echo "Flashing EBB36 completed"
