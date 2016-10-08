To setup the project and upload the Arduino usbserial application firmware to an ATMEGA32U2 using the Arduino USB DFU bootloader:

1. make sure you have installed the avr-gcc, and add the path to you environment variable.
2. Then unpack the source into LUFA's Projects directory
3. do "make clean; make"
4. using avrdude upload HEX file through the iscp connector. You may use the following cmd:

```bash
sudo avrdude -p atmega16u2 -c usbtiny -U flash:w:Mouse.hex
```
