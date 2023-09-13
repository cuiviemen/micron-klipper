#!/usr/bin/env bash

config="manta-m8p-v1_1.config"
device="/dev/serial/by-id/usb-Klipper_stm32g0b1xx_m8p-if00"
board="btt-octopus-pro-f429-v1.0"

function pause(){
   while read -r -t 0.001; do :; done # dump the buffer
 read -n1 -rsp "Powercycle is required to apply the firmware. Press any key to shutdown host or Ctrl+C to exit..."
}

pushd ~/klipper

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config

./scripts/flash-sdcard.sh $device $board
pause
sudo shutdown -h now
