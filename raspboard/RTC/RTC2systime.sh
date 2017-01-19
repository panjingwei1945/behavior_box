#!/bin/bash

CHIP_ADDR=0x68
SEC_ADDR=0x00
MIN_ADDR=0x01
HOUR_ADDR=0x02
DAY_ADDR=0x03
DATE_ADDR=0x04
MON_ADDR=0x05
YEAR_ADDR=0x06

i2cdetect -y 1
i2cdump -y 1 $CHIP_ADDR

sec=`i2cget -y 1 $CHIP_ADDR $SEC_ADDR`
min=`i2cget -y 1 $CHIP_ADDR $MIN_ADDR`
hour=`i2cget -y 1 $CHIP_ADDR $HOUR_ADDR`
day=`i2cget -y 1 $CHIP_ADDR $DAY_ADDR`
date=`i2cget -y 1 $CHIP_ADDR $DATE_ADDR`
mon=`i2cget -y 1 $CHIP_ADDR $MON_ADDR`
year=`i2cget -y 1 $CHIP_ADDR $YEAR_ADDR`

date -s "${hour:2:2}:${min:2:2}:${sec:2:2} 20${year:2:2}${mon:2:2}${date:2:2}"

echo "Sys time is" `date +%y%m%d%H%M%S`
echo "RTC time is" ${year:2:2}${mon:2:2}${date:2:2}${hour:2:2}${min:2:2}${sec:2:2}
