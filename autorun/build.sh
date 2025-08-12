#!/bin/sh

sjasmplus autorun.asm --raw=autorun.rom --lst=autorun.lst

# create 64K ROM
cat autorun.rom autorun.rom autorun.rom autorun.rom  > TESTROM.bin
