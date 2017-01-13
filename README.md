[TOC]
# behavior_box

This repository contains all the firmware and src of behavior_box system.
# MCU board

## Due modification

> Arduino Due is different from the avr based arduino board (like uno). It must be erased before uploading. Therefore Due must be modified before assembling, to ensure raspberry pi can upload program from it's own native serial port(ttyAMA0).

1. Solder the **missing pin** on Due
  ![/README/SolderMissingPins.PNG](/README/SolderMissingPins.PNG)

  > These pins can receive the erase signal from raspberry pi.

2. upload new firmware to **atmega16u2** on Due

  [precompiled hexfile][1]
  [source code][2]

  > With new firmware, the onboard programmer atmega16u2 can recieve the erase signal from raspberry pi, then it process the erasing and reseting routine. Because this firmware is base on [LUFA][3]. So the firmware can't be uploaded by arduino IDE. In stead of it, you should use external programmer (for example , USBtinyISP) to upload the firmware.

    For **windows** user, you can upload hexfile with software "AVRdude GUI", you can download it [here][4].

    For **linux** user, you can using command below to upload hexfile.
    `sudo avrdude -p atmega16u2 -c usbtiny -U flash:w:xxx.hex` (recommended)

    For **raspberry linuxspi** mode user, before uploading you should edit "/etc/avrdude.conf" firstly. Then use the command below :
    `sudo avrdude -p atmega16u2 -c linuxspi -P /dev/spidev0.0 -U flash:w:xxx.hex` ([detail instruction][5])

3. Then you can attach due to MCU board.

## Compile and Upload firmware to Due

### Compiling

```sh
/home/pi/arduino-1.6.11/arduino-builder -dump-prefs -logger=machine -hardware /home/pi/arduino-1.6.11/hardware -hardware /home/pi/.arduino15/packages -tools /home/pi/arduino-1.6.11/tools-builder -tools /home/pi/arduino-1.6.11/hardware/tools/avr -tools /home/pi/.arduino15/packages -built-in-libraries /home/pi/arduino-1.6.11/libraries -libraries /home/pi/Arduino/libraries -fqbn=arduino:sam:arduino_due_x_dbg -vid-pid=0X2341_0X003D -ide-version=10611 -build-path /tmp/build965ab5f1a67792a9c5043012fccdb530.tmp -warnings=none -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.bossac.path=/home/pi/.arduino15/packages/arduino/tools/bossac/1.6.1-arduino -prefs=runtime.tools.arm-none-eabi-gcc.path=/home/pi/.arduino15/packages/arduino/tools/arm-none-eabi-gcc/4.8.3-2014q1 -verbose /home/pi/Software/arduino-1.6.9/examples/01.Basics/Blink/Blink.ino

/home/pi/arduino-1.6.11/arduino-builder -compile -logger=machine -hardware /home/pi/arduino-1.6.11/hardware -hardware /home/pi/.arduino15/packages -tools /home/pi/arduino-1.6.11/tools-builder -tools /home/pi/arduino-1.6.11/hardware/tools/avr -tools /home/pi/.arduino15/packages -built-in-libraries /home/pi/arduino-1.6.11/libraries -libraries /home/pi/Arduino/libraries -fqbn=arduino:sam:arduino_due_x_dbg -vid-pid=0X2341_0X003D -ide-version=10611 -build-path /tmp/build965ab5f1a67792a9c5043012fccdb530.tmp -warnings=none -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.bossac.path=/home/pi/.arduino15/packages/arduino/tools/bossac/1.6.1-arduino -prefs=runtime.tools.arm-none-eabi-gcc.path=/home/pi/.arduino15/packages/arduino/tools/arm-none-eabi-gcc/4.8.3-2014q1 -verbose /home/pi/Software/arduino-1.6.9/examples/01.Basics/Blink/Blink.ino
```

### Uploading

```sh
#this for USB program port
stty -F /dev/ttyACM0 speed 1200 cs8 -cstopb -parenb; /home/pi/.arduino15/packages/arduino/tools/bossac/1.6.1-arduino/bossac -i -d --port=ttyACM0 -U false -e -w -v -b /tmp/build965ab5f1a67792a9c5043012fccdb530.tmp/Blink.ino.bin -R

#this for raspberry pi 3 ttyAMA0 port
stty -F /dev/ttyAMA0 speed 1200 cs8;/home/pi/.arduino15/packages/arduino/tools/bossac/1.6.1-arduino/bossac -i -d --port=ttyAMA0 -U false -e -w -v -b /tmp/build965ab5f1a67792a9c5043012fccdb530.tmp/Blink.ino.bin -R
```

[1]: https://raw.githubusercontent.com/panjingwei1945/behavior_box/master/LUFA-100807/Projects/atmega16u2_due/Arduino-usbserial.hex  "Arduino-usbserial.hex"
[2]: https://github.com/panjingwei1945/behavior_box/tree/maste/LUFA-100807/Projects/atmega16u2_due
[3]: http://www.fourwalledcubicle.com/LUFA.php "LUFA"
[4]: https://sourceforge.net/projects/avrdudegui/?source=typ_redirect  "AVRdue GUI"
[5]: http://kevincuzner.com/2013/05/27/raspberry-pi-as-an-avr-programmer/ "raspberry-pi-as-an-avr-programmer"
