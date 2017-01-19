#!/bin/bash

filename="syson_pin.sh"
echo '#!/bin/bash
#when system reset, set pin17 to high.Then hold on 500ms.
syson=17
echo "$syson" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$SHUTDOWN/direction
echo "1" > /sys/class/gpio/gpio$SHUTDOWN/value' > /tmp/${filename}
chmod 755 /tmp/${filename}
mv /tmp/${filename} /etc/init.d/${filename}
ln -s /etc/init.d/${filename} /etc/rc6.d/K01${filename}
