#!/bin/bash
FIRMWARE=$1
DUE="/home/pi/.arduino15"
GPIO="/sys/class/gpio/gpio"
EXPORT="/sys/class/gpio/export"
UNEXPORT="/sys/class/gpio/unexport"
REQ=6
PER=5
ERA=7
RES=4
#init pins

if [ ! -d ${GPIO}${RES} ]
then  
echo ${RES} > ${EXPORT}
fi 
sleep 0.1
echo "out" > "${GPIO}${RES}/direction"
sleep 0.1
echo "1" > "${GPIO}${RES}/value"
sleep 0.1


if [ ! -d ${GPIO}${ERA} ]
then  
echo ${ERA} > ${EXPORT}
fi 

sleep 0.1
echo "out" > "${GPIO}${ERA}/direction"
sleep 0.1
echo "1" > "${GPIO}${ERA}/value"
sleep 0.1

if [ ! -d ${GPIO}${REQ} ]
then  
echo ${REQ} > ${EXPORT}
fi 

sleep 0.1
echo "out" > "${GPIO}${REQ}/direction"
sleep 0.1
echo "1" > "${GPIO}${REQ}/value"
sleep 0.1


if [ ! -d ${GPIO}${PER} ]
then  
echo ${PER} > ${EXPORT}
fi 

sleep 0.1
echo "in" > "${GPIO}${PER}/direction"
sleep 0.1




#gpio mode $REQ out
#gpio write $REQ 1
#gpio mode $PER in
#gpio mode $ERA out
#gpio write $ERA 1
#gpio mode $RES out
#gpio write $RES 1

#erase Due
#gpio write $REQ 0
echo "0" > "${GPIO}${REQ}/value"
permission=`cat "${GPIO}${PER}/value"`
until [ $permission == 1 ]
do
	permission=`cat "${GPIO}${PER}/value"`
done

#gpio write $ERA 0
echo "0" > "${GPIO}${ERA}/value"
sleep 0.1
#gpio write $RES 0
echo "0" > "${GPIO}${RES}/value"
sleep 0.1
#gpio write $RES 1
echo "1" > "${GPIO}${RES}/value"
sleep 0.5
#gpio write $ERA 1
echo "1" > "${GPIO}${ERA}/value"
sleep 0.1

#upload
stty -F /dev/ttyAMA0 speed 1200 cs8;${DUE}/packages/arduino/tools/bossac/1.6.1-arduino/bossac -i -d --port=ttyAMA0 -U false -e -w -v -b ${FIRMWARE} -R
sleep 0.1

#reset
#gpio write $RES 0
echo "0" > "${GPIO}${RES}/value"
sleep 0.1
#gpio write $RES 1
echo "1" > "${GPIO}${RES}/value"
sleep 0.1

#release
#gpio write $REQ 1
echo "1" > "${GPIO}${REQ}/value"
sleep 0.1


#echo ${REQ} > ${UNEXPORT}
#echo ${PER} > ${UNEXPORT}
#echo ${ERA} > ${UNEXPORT}
#echo ${RES} > ${UNEXPORT}


