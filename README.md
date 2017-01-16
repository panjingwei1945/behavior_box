[TOC]
# behavior_box

This repository contains all the firmware and src of behavior_box system.
# MCU board

## Due modification

> Arduino Due is different from the avr based arduino board (like uno). It must be erased before uploading. Therefore Due must be modified before assembling, to ensure raspberry pi can upload program from it's onboard native serial port(ttyAMA0).

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
