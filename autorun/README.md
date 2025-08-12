# ZX81 ROM Disassembly
The ROM used for this is found here: [ZXSpectrumVault](https://github.com/ZXSpectrumVault/rom-disassemblies/blob/master/Sinclair%20ZX81/Sinclair-ZX81.asm)

# AUTOBAS
Concept of auto running a program from ROM is described here: [Wilf Rigter](https://quix.us/timex/rigter/AutoBasic.html)

# LAUNCHER
ROM jumps to 0x2000 - 

CALL 0x0f23 (enter FAST)
DECOMPRESS data to 0x4009
JP 0x0f2b (exit via SLOW)

# COMPILE ZX7 for macOS
gcc -o zx7 zx7.c optimize.c compress.c