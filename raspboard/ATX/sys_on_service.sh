echo '#!/bin/bash

#when system turn on, set pin26 to high.
syson=26
echo "$syson" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$SHUTDOWN/direction
echo "1" > /sys/class/gpio/gpio$SHUTDOWN/value' > /etc/syson_pin.sh
sudo chmod 755 /etc/syson_pin.sh
sudo sed -i '$ i /etc/syson_pin.sh &' /etc/rc.local
