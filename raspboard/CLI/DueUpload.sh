#!/bin/bash

BOSSAC="/home/pi/.arduino15/packages/arduino/tools/bossac/1.6.1-arduino/bossac"

if[ -n ${BINFILE} ]
then
  FIRMWARE=${BINFILE}
else
  FIRMWARE=$1
fi

#upload
stty -F /dev/ttyAMA0 speed 1200 cs8;${BOSSAC} -i -d --port=ttyAMA0 -U false -e -w -v -b ${FIRMWARE} -R
