[TOC]
# behavior_box

This repository contains all the firmware and src of behavior_box system.
# RaspBoard

## Upload firmware to onboard arduino

There is a atmega328p to manage ATX power supply on RaspBoard. It work  at 3.3V, 8MHz. So you can consider it as a arduino pro mini. You can upload firemware through USBtinyISP or linuxspi.


## Real time clock

There is a RTC(real time clock) chip on raspboard. Raspberry doesn't have any RTC chip on it. It just connect to server and read web time. So if the web is unreachable, then we can get right time from the RTC chip on raspboard. Before using it, we should put in battery and set time.


# MCU board

## Due modification

> Arduino Due is different from the avr based arduino board (like uno). It must be erased before uploading. For normal usage, the atmega16u2 acting as USB bridge to expose the UART, If the host pc set it's sertial port at baud rate 1200, the ATMEGA16U2 will assert the Erase pin and Reset pin of the SAM3X. Then SAM3X will switch to bootloader mode. But native serial port on raspberry pi doesn't have this  function. Therefore Due must be added extra pins to receive erase and reset signal.

1. Solder the **missing pin** on Due
  ![/README/SolderMissingPins.PNG](/README/SolderMissingPins.PNG)

  > These pins can receive the erase signal from raspberry pi.

2. upload new firmware to **atmega16u2** on Due

  [precompiled hexfile][1]
  [source code][2]

  > With new firmware, the onboard programmer atmega16u2 can recieve the erase signal from raspberry pi, then it process the erasing and reseting routine. Because this firmware is base on [LUFA][3]. So the firmware can't be uploaded with arduino IDE. In stead, you can use external programmer (for example , USBtinyISP) to upload the firmware.

    For **windows** user, you can upload hexfile with software "AVRdude GUI", you can download it [here][4].

    For **linux** user, you can using command below to upload hexfile.
    `sudo avrdude -p atmega16u2 -c usbtiny -U flash:w:xxx.hex` (recommended)

    For **raspberry linuxspi** mode user, before uploading you should edit "/etc/avrdude.conf" firstly. Then use the command below :
    `sudo avrdude -p atmega16u2 -c linuxspi -P /dev/spidev0.0 -U flash:w:xxx.hex` ([detail instruction][5])

3. Then you can attach due to MCU board.

## Compile and Upload firmware from raspberry pi3 to Due

### Patch bossac

Before upload firmware to Due, the programmer bossac must be patched. The new programmer will trigger the erase and reset proccess before uploading. Original bossac locate in "/home/pi/.arduino15//packages/arduino/tools/bossac/1.6.1-arduino/bossac", and replace it with [patched bossac][6].

After patch, you can simply use arduino IDE to compile and upload your code.

### CLI mode

You also can use command line to compile and upload your code.(bossac patch needed)
These scripts are in [./raspberry/CLI][7].

```sh
# compile, and binary file will be putted in a temporary folder.
./DueCompile.sh Blink/Blink.ino

# compile and specify a folder which binary file will be putted in.
./DueCompile.sh Blink/Blink.ino ./FirmwarFolder

```


```sh
# upload
./DueUpload.sh Blink.ino.bin

```

```sh
# Compile and upload
./DueCompileUpload.sh Blink/Blink.ino

```



[1]: https://raw.githubusercontent.com/panjingwei1945/behavior_box/master/LUFA-100807/Projects/atmega16u2_due/Arduino-usbserial.hex  "Arduino-usbserial.hex"
[2]: https://github.com/panjingwei1945/behavior_box/tree/maste/LUFA-100807/Projects/atmega16u2_due
[3]: http://www.fourwalledcubicle.com/LUFA.php "LUFA"
[4]: https://sourceforge.net/projects/avrdudegui/?source=typ_redirect  "AVRdue GUI"
[5]: http://kevincuzner.com/2013/05/27/raspberry-pi-as-an-avr-programmer/ "raspberry-pi-as-an-avr-programmer"
[6]: https://github.com/panjingwei1945/behavior_box/raw/master/BOSSA/bin/bossac
[7]: https://github.com/panjingwei1945/behavior_box/tree/master/raspboard/CLI
