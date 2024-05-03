# zx81-external-eprom
The primary aim of this project is to enable the use of an upgraded version of the ZX81 ROM without requiring the ZX81 to be opened up for ROM replacement. I decided upon the W27C512 EEPROM, allowing storage of 8 x 8kb ROMs, each selectable via dip switches.

# the prototype
It all started with a breadboard and a lot of wires! It is chaos, yes, but it turned out to work as intended. With this PoC it is possible to run a ZX81 with a custom ROM externally, without the need to open and replace the original ROM chip. It does however stil needs the original ROM inside the ZX81, but mainly because of the way the display system works on the ZX81 - it's clever, but at the same time a main challenge these days.

![437778001_10220643056586831_7843453154083253458_n](https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/87253a16-ab56-491b-8140-caf4ac7e76ad)

# version 1
Basic version, requires the original ROM in the ZX81 - because of the way the display system works.
KiCad 8 files available as well as Gerber files for PCB production.

BOM for v1:
- [ ] WINBOND W27C512 EEPROM
- [ ] 74LS138
- [ ] 3 x 10K Resistors
- [ ] BC549 Transistor
- [ ] 2 x 100nF ceramic capacitor, 2,5mm
- [ ] DIP Switch 3 x ON-OFF
- [ ] Sockets for IC, Edge Connector (RM 2,54)

The PCB can be fitted with a standard Edge Connector for ZX81, or it can be used as a plug-in card in the [Bus Extender](https://github.com/thomasheckmann/zx81-bus-extender)

![IMG_0138](https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/8602e070-fe87-4aac-869a-331a85886e2d)

## Planned changes / improvement for v2
- The silkscreen says 4K7 for the resistors, but with the WINBOND they can all be changed to 10K (as in this picture).
- The DIP switches from left to right are, A13, A14, A15 - but should really be the other way around, to match the binary pattern and bank number in EEPROM.
- Support for 16kb ROM, needed to run SPonZY (ZX Spectrum ROM modified to run on ZX81 Hardware).
- Rotate the ICs 180 degree, just to make the text in the right direction (I know - it's not important, but...)

# version 2
Coming soon...
