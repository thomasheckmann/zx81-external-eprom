# zx81-external-eprom
The primary aim of this project is to enable the use of an upgraded version of the ZX81 ROM without requiring the ZX81 to be opened up for ROM replacement. I decided upon the W27C512 EEPROM, allowing storage of 8 x 8kb ROMs, each selectable via dip switches.

# the prototype
It all started with a breadboard and a lot of wires! It is chaos, yes, but it turned out to work as intended. With this PoC it is possible to run a ZX81 with a custom ROM externally, without the need to open and replace the original ROM chip. It does however stil needs the original ROM inside the ZX81, but mainly because of the way the display system works on the ZX81 - it's clever, but at the same time a main challenge these days.

![437778001_10220643056586831_7843453154083253458_n](https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/87253a16-ab56-491b-8140-caf4ac7e76ad)

# version 1.0
Basic version, requires the original ROM in the ZX81 - because of the way the display system works.
KiCad 8 files available as well as Gerber files for PCB production.

BOM for v1.0:
- [ ] WINBOND W27C512 EEPROM
- [ ] 74LS138
- [ ] 3 x 10K Resistors
- [ ] BC549 Transistor
- [ ] 2 x 100nF ceramic capacitor, 2,5mm
- [ ] DIP Switch 3 x ON-OFF
- [ ] Sockets for IC, Edge Connector (RM 2,54)

The PCB can be fitted with a standard Edge Connector for ZX81, or it can be used as a plug-in card in the [Bus Extender](https://github.com/thomasheckmann/zx81-bus-extender)

![IMG_0138](https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/8602e070-fe87-4aac-869a-331a85886e2d)

## Planned changes / improvement for v1.1
- The silkscreen says 4K7 for the resistors, but with the WINBOND they can all be changed to 10K (as in this picture).
- The DIP switches from left to right are, A13, A14, A15 - but should really be the other way around, to match the binary pattern and bank number in EEPROM.
- Support for 16kb ROM, needed to run SPonZY (ZX Spectrum ROM modified to run on ZX81 Hardware).
- Rotate the ICs 180 degree, just to make the text in the right direction (I know - it's not important, but...)

# version 1.1
A version with the changes mentioned above was produced, it worked out OK - but as I already had a few other changes in mind, it was never released as such. But for the curious minds, here are some pictures of how it looked like - and as can be seen, it runs the SPonZY ROM quite well :-)

<img src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/908d6fa9-f1c4-43f9-9e35-517dcd03677c" width="410"><img src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/ab6eb709-44dd-485b-a4fe-c9816a48fb98" width="410">
<img src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/70efa672-26ee-4a6d-a4da-e9d09e4df717" width="410"><img src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/d2cbfafc-f462-485c-9fe3-703eca0f0ae9" width="410">

# version 1.2
Getting close to the final version of external ROM switcher for support for 8KiB or 16KiB banks. Changes from 1.1 to the board:
- Making PADS 2mm longer, to prevent potential issues with some connectors (when used in the Expander board)
- Changed from pull-ups to pull-downs, to match actual behaviour of DIP-SWITCH (up = 1/ON/HIGH, down = 0/OFF/LOW)

| SCHEMA | PCB |
| ------ | --- |
|<img width="410" src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/9e6f7f84-8e71-46af-84df-7289f5c6422e">|<img width="410" src="https://github.com/thomasheckmann/zx81-external-eprom/assets/14136378/4db67072-9141-4cce-8b51-c57d8c995c3d">|

## Instructions on how to use

- DIP-4 (right) - sets the mode of operation, DOWN = use 8KiB banks, UP = use 16KiB banks
- DIP-1 to 3, selects which banks is used as ROM - in case of 16KiB banking, DIP-3 (A13) is ignored.

## How to create image for EEPROM
The W27C512 EEPROM can contain 8x 8KiB or 4 x 16KiB images - selectable with the switch, forming the binary number 0-3 or 0-7 for the active bank.

For Windows
```
COPY /B ROM_0+ROM_1+ROM_2+ROM_3 IMAGE.BIN
```

For Unix/Mac
```
cat ROM_0 ROM_1 ROM_2 ROM_3 >IMAGE.BIN
```

Use your favorite (E)EPROM programmer to transfer the IMAGE.BIN to the EEPROM
```
LEFT|RIGHT
OFF | OFF - 0: ROM_0
OFF | ON  - 1: ROM_1
ON  | OFF - 2: ROM_2
ON  | ON  - 3: ROM_3
```

# SPECIAL ROMs
A few ROMs from different interfaces does not sit in the 0-8K memory space, using the 16K configuration of this interface - it is possible to get them running on your ZX81. The following sections provides instruction on how to run the ones I know of.

## Timex Store Demonstrator ROM
To run the [ROM](http://zx81.ordi5.free.fr/CartesZx81/Timex/StoreDemonstrator/) from the Timex Store Demonstrator Board, the setup needs to be like this:
- 0-8K, 8K ROM - ZX81 rom, use v2 - 649 (MD5: db398d4e4e93a6d4dee3bfe146918219)
- 8-18K, 8K DemoStore ROM

Modify ZX81 rom - Change byte offset 0x09DB from 0x40 to 0x20 (ZX81v2_mod.rom)

Unix/MacOS
````
cat ZX81v2_mod.rom StoreDemo.rom >SD.rom
cat SD.rom SD.rom SD.rom SD.rom > SDx4.rom
````
Resulting SD.rom shoulb be a 16K rom image and SDx4.rom should be 64K (contains SD.rom in all 4 banks), ready to be programmed in W27C512.
To start the demo program, run type RUN

## Memotech MemoCalc
This is a 4K rom that resides in the upper 4K of the mirror area. Layout of a 16K rom containing this, should be:
- 0-8K, 8K ROM - ZX81 rom, use v2 - 649 (MD5: db398d4e4e93a6d4dee3bfe146918219)
- 8-12K, copy of first 4K of the ZX81 ROM
- 12-16, the [MemoCalc Rom](https://www.zx81stuff.org.uk/zx81/hardware/Memocalc)

Unix/MacOS
````
split -b 4k ZX81v2.rom ZX81
cat ZX81v2.rom ZX81aa Memocalc.rom >MC.rom
cat MC.rom MC.rom MC.rom MC.rom > MCx4.rom
````
Resulting MC.rom is the 16K image and MCx4.rom should be 64K (contains MC.rom in all 4 banks).

MemoCalc is started with RAND USR 13824

## TS 1510 Command Cartridge Player
A ROM Catridge interface for the TS1000/1500 - only 4 cartidges was produced, 3 8K and 1 16K

To use the 8K Catridge - the layout of the 16K rom should be:
- 0-8K, 8K ROM - ZX81, use v2 - 649 (MD5: db398d4e4e93a6d4dee3bfe146918219) (or the TS1500 rom, not tested yet)
- 8-16K, the Catridge ROM

Unix/MacOS
````
cat ZX81v2.rom chess.rom > TS1510_CHESS.rom
cat TS1510_CHESS.rom TS1510_CHESS.rom TS1510_CHESS.rom TS1510_CHESS.rom > TS1510_CHESSx4.rom
````
When ZX81 has booted up, start the game with RAND USR 8192
