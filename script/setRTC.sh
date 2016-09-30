#!/bin/bash

CHIP_ADDR=0x68
SEC_ADDR=0x00
MIN_ADDR=0x01
HOUR_ADDR=0x02
DAY_ADDR=0x03
DATE_ADDR=0x04
MON_ADDR=0x05
YEAR_ADDR=0x06

year=0x`date +%y`
mon=0x`date +%m`
day=0x0$((`date +%w`+1))
date=0x`date +%d`
hour=0x`date +%H`
min=0x`date +%M`
sec=0x`date +%S`

echo "System time is:" `date +%y%m%d%H%M%S`

i2cdetect -y 1 
i2cdump -y 1 $CHIP_ADDR

i2cset -y 1 $CHIP_ADDR $SEC_ADDR $sec
i2cset -y 1 $CHIP_ADDR $MIN_ADDR $min
i2cset -y 1 $CHIP_ADDR $HOUR_ADDR $hour
i2cset -y 1 $CHIP_ADDR $DAY_ADDR $day
i2cset -y 1 $CHIP_ADDR $DATE_ADDR $date
i2cset -y 1 $CHIP_ADDR $MON_ADDR $mon
i2cset -y 1 $CHIP_ADDR $YEAR_ADDR $year

i2cdump -y 1 $CHIP_ADDR



