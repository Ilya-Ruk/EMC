org 0x000
goto Start

org 0x004
goto Interrupt

Start:
movw 0x00; b#00000000
movwf ConfigA

movw 0xFF; b#11111111
movwf ConfigB

clrf PortA
clrf PortB

movw 0x09; b#00001001
movwf ConfigInt

clrf Int

L1:
goto L1

Interrupt:
bcf Int, 2

movfw PortB
movwf PortA

clrf PortB

reti
