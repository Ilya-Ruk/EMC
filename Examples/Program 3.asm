org 0x000

movw 0x00
movwf ConfigA
movwf ConfigB

clrf PortA
clrf PortB

movw 0x01

Start:
movwf PortA
movwf PortB
addwf PortA, 0
btfc Status, 0
movw 0x01
call Pause
goto Start

Pause:
nop
nop
nop
return
