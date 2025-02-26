#!/usr/bin/env bash

config="manta-m8p-v11.config"
canuuid="e62ea4016321"
deviceid="usb-katapult_stm32g0b1xx_13001C000C504B4633373520-if00"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config

python3 ~/katapult/scripts/flashtool.py -i can0 -r -u $canuuid
python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/$deviceid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing MCU failed"
    exit $?
fi

echo "Flashing MCU completed"
