#!/usr/bin/env bash

config="gbb15.config"
canuuid="d89beebe5729"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing GBB15 failed"
    exit $?
fi

echo "Flashing GBB15 completed"
