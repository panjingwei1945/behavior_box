[TOC]
# behavior_box

This repository contains all the firmware and src of behavior_box system.
# RaspBoard

## Upload firmware to onboard arduino

There is a atmega328p to manage ATX power supply on RaspBoard. It work  at 3.3V, 8MHz. So you can consider it as a "arduino pro mini". You can upload firemware through USBtinyISP or linuxspi. The firmware is in ./raspboard/ATX/RaspBoardPowCtrl/

## Install ATX service

Then raspberry pi can't control ATX power supply directly. So we design a circuit of atmega328p to manage ATX. And raspberry pi will send system status to atmega328p to control ATX indirectly.

It can send two kinds of status. First one is "system on". When atmega328p get this signal, it will hold on ATX power supply. And when it get "system off" signal, it will hold on ATX for one minitus, then turn off. Second one is "reset". In this situation, atmega328p will hold on ATX and wait "system on" signal for 5 minitus.

Script is in "./raspboard/ATX/"

```sh
# install sys on service
sudo ./sys_on_service.sh

# install reset service
sudo ./reset_service.sh
```


## Real time clock

Because raspberry pi doesn't have any real time clock(RTC) chip on raspboard. RTC chip on it. So when you power on it, raspberry pi must connect to internet and read web time. But when internet is unreachalbe, system time goes wrong. So we design a external RTC for raspberry pi on the raspboard. Therefor you can get "real time" without internet.

Before using it, you should put in battery(CR2302) and set time. There are three scripts in folder [./raspberry/RTC][8] help you read or set RTC chip .

```sh
# read RTC
./readRTC.sh
```
```sh
# read time from system and write it to RTC
./systime2RTC.sh
```
```sh
# read time from RTC and write it to system
sudo ./RTC2systime.sh
```


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



[1]: https://raw.githubusercontent.com/xulab/behavior_box/master/LUFA-100807/Projects/atmega16u2_due/Arduino-usbserial.hex  "Arduino-usbserial.hex"
[2]: https://github.com/xulab/behavior_box/tree/maste/LUFA-100807/Projects/atmega16u2_due
[3]: http://www.fourwalledcubicle.com/LUFA.php "LUFA"
[4]: https://sourceforge.net/projects/avrdudegui/?source=typ_redirect  "AVRdue GUI"
[5]: http://kevincuzner.com/2013/05/27/raspberry-pi-as-an-avr-programmer/ "raspberry-pi-as-an-avr-programmer"
[6]: https://github.com/xulab/behavior_box/raw/master/BOSSA/bin/bossac
[7]: https://github.com/xulab/behavior_box/tree/master/raspboard/CLI
[8]: https://github.com/xulab/behavior_box/tree/master/raspboard/RTC
