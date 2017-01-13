#!/bin/bash
FIRMWARE=$1
DUE="/home/pi/.arduino15"
REQ=22
PER=21
ERA=11
RES=7
#init pins
gpio mode $REQ out
gpio write $REQ 1
gpio mode $PER in
gpio mode $ERA out
gpio write $ERA 1
gpio mode $RES out
gpio write $RES 1

#erase Due
gpio write $REQ 0
permission=`gpio read ${PER}`
until [ $permission == 1 ]
do
	permission=`gpio read ${PER}`
done

gpio write $ERA 0
gpio write $RES 0
sleep 0.1
gpio write $RES 1
sleep 0.5
gpio write $ERA 1
sleep 0.1

#upload
stty -F /dev/ttyAMA0 speed 1200 cs8;${DUE}/packages/arduino/tools/bossac/1.6.1-arduino/bossac -i -d --port=ttyAMA0 -U false -e -w -v -b ${FIRMWARE} -R

gpio write $REQ 1
sleep 0.1

