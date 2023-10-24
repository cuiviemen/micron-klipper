#!/usr/bin/env bash

config="manta-m8p-v11.config"
canuuid="e62ea4016321"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing MCU failed"
    exit $?
fi

echo "Flashing MCU completed"
