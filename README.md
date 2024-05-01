# zx81-external-eprom
The main goal for this project is make it possible to run one of the improved version of the ZX81 ROM, without the need to opening up for ZX81 and replacing the original ROM. I decided to use the W27C512 EEPROM, which makes it possible to store 8 x 8kb ROM - and made them selectable using the dip switches.

# version 1
Basic version, requires the original ROM in the ZX81 - because of the way the display system works.
KiCad 8 files available as well as Gerber files for PCB production.

BOM for v1:
- [ ] WINBOND W27C512 EEPROM
- [ ] 74LS138
- [ ] 3 x 10K Resistors
- [ ] BC549 Transistor
- [ ] 2 x 100nF ceramic capacitor
- [ ] DIP Switch 3 x ON-OFF
- [ ] Sockets for IC, Edge Connector (RM 2,54)

![IMG_0138](https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/8602e070-fe87-4aac-869a-331a85886e2d)

## Planned changes / improvement for v2
The silkscreen says 4K7 for the resistors, but with the WINBOND they can all be changed to 10K (as in this picture). The DIP switches from left to right are, A13, A14, A15 - but should really be the other way around, to match the binary pattern and bank nunber in EEPROM.

# version 2
Coming soon...
