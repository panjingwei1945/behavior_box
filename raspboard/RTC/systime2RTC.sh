
#!/bin/bash

CHIP_ADDR=0x68
SEC_ADDR=0x00
MIN_ADDR=0x01
HOUR_ADDR=0x02
DAY_ADDR=0x03
DATE_ADDR=0x04
MON_ADDR=0x05
YEAR_ADDR=0x06

tmp_date=`date +%y%m%d%H%M%S`

year=0x${tmp_date:0:2}
mon=0x${tmp_date:2:2}
day=0x0${tmp_date:4:2}
date=0x${tmp_date:6:2}
hour=0x${tmp_date:8:2}
min=0x${tmp_date:10:2}
sec=0x${tmp_date:12:2}

echo "System time is:${tmp_date}"


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

sec=`i2cget -y 1 $CHIP_ADDR $SEC_ADDR`
min=`i2cget -y 1 $CHIP_ADDR $MIN_ADDR`
hour=`i2cget -y 1 $CHIP_ADDR $HOUR_ADDR`
day=`i2cget -y 1 $CHIP_ADDR $DAY_ADDR`
date=`i2cget -y 1 $CHIP_ADDR $DATE_ADDR`
mon=`i2cget -y 1 $CHIP_ADDR $MON_ADDR`
year=`i2cget -y 1 $CHIP_ADDR $YEAR_ADDR`

echo "Sys time is" `date +%y%m%d%H%M%S`
echo "RTC time is" ${year:2:2}${mon:2:2}${date:2:2}${hour:2:2}${min:2:2}${sec:2:2}
