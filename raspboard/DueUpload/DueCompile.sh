#!/bin/bash
ARDUINO="/home/pi/arduino-1.6.11"
DUE="/home/pi/.arduino15"
USERLIB="/home/pi/Arduino/libraries"
CODE=$1
CODEFILENAME=`basename $1`
TEMPFILE="tmp_`date +%y%m%d%H%M%S`"
BUILDPATH="/tmp/${TEMPFILE}"
BINFILE=${BUILDPATH}/${CODEFILENAME}.bin
mkdir ${BUILDPATH}

${ARDUINO}/arduino-builder -dump-prefs -logger=machine -hardware ${ARDUINO}/hardware -hardware ${DUE}/packages -tools ${ARDUINO}/tools-builder -tools ${ARDUINO}/hardware/tools/avr -tools ${DUE}/packages -built-in-libraries ${ARDUINO}/libraries -libraries ${USERLIB} -fqbn=arduino:sam:arduino_due_x_dbg -vid-pid=0X2341_0X003D -ide-version=10611 -build-path ${BUILDPATH} -warnings=none -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.bossac.path=${DUE}/packages/arduino/tools/bossac/1.6.1-arduino -prefs=runtime.tools.arm-none-eabi-gcc.path=${DUE}/packages/arduino/tools/arm-none-eabi-gcc/4.8.3-2014q1 -verbose ${CODE}
${ARDUINO}/arduino-builder -compile -logger=machine -hardware ${ARDUINO}/hardware -hardware ${DUE}/packages -tools ${ARDUINO}/tools-builder -tools ${ARDUINO}/hardware/tools/avr -tools ${DUE}/packages -built-in-libraries ${ARDUINO}/libraries -libraries ${USERLIB} -fqbn=arduino:sam:arduino_due_x_dbg -vid-pid=0X2341_0X003D -ide-version=10611 -build-path ${BUILDPATH} -warnings=none -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.bossac.path=${DUE}/packages/arduino/tools/bossac/1.6.1-arduino -prefs=runtime.tools.arm-none-eabi-gcc.path=${DUE}/packages/arduino/tools/arm-none-eabi-gcc/4.8.3-2014q1 -verbose ${CODE}

echo "firmware location is ${BINFILE}"


