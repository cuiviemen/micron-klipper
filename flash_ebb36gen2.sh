#!/usr/bin/env bash

config="ebb36-v12.config"
canuuid="32711ea57232"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing EBB36 Gen2 failed"
    exit $?
fi

echo "Flashing EBB36 Gen2 completed"
