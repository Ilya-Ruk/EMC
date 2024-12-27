ORG 0x000
GOTO Start ; Reset vector

ORG 0x004
GOTO Int ; Interrupt vector

Start:
MOVW 0xAA
MOVWF 0x10 ; DM[0x10] = 0xAA

MOVW 0x55
MOVWF 0x11 ; DM[0x11] = 0x55

MOVW 0x80
MOVWF ConfigA ; PortA[7] - Input, PortA[6..0] - Output

MOVW 0x00
MOVWF ConfigB ; PortB - Output

CLRF PortA ; Clear PortA
CLRF PortB ; Clear PortB

MOVW 0x07
MOVWF ConfigInt ; GIE = 1, TMRIE = 1, PAIE = 1

CLRF Int ; Clear Int

MOVW 0xF0
MOVWF TimerCounter ; Set TimerCounter

MOVW 0x01
MOVWF ConfigTimer ; Timer On

L1:
GOTO L1 ; Forever

Int:
BTFC Int, 1 ; Test Int[1]
CALL PortA_Int

BTFC Int, 0 ; Test Int[0]
CALL Timer_Int

RETI

Timer_Int:
BCF Int, 0 ; TMRI = 0

MOVW 0xF0
MOVWF TimerCounter ; Set TimerCounter

BTFC PortB, 7 ; Test PortB[7]
GOTO L2

MOVFW 0x10 ; W = DM[0x10]
MOVWF PortB ; Set PortB

RETURN

L2:
MOVFW 0x11 ; W = DM[0x11]
MOVWF PortB ; Set PortB

RETURN

PortA_Int:
BCF Int, 1 ; PAI = 0

BTFC 0x10, 6 ; Test DM[0x10][6]
GOTO L3

MOVW 0xF0
MOVWF 0x10 ; DM[0x10] = 0xF0

MOVW 0x0F
MOVWF 0x11 ; DM[0x11] = 0x0F

RETURN

L3:
MOVW 0xAA
MOVWF 0x10 ; DM[0x10] = 0xAA

MOVW 0x55
MOVWF 0x11 ; DM[0x11] = 0x55

RETURN
