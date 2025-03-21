include "version/_current.asm"
include "constants/charmap.asm"
include "ram/wram.asm"

SECTION "RAMWriter", ROM0

load "", wramx[$d5e9]
HandleInput:
    call JoypadLowSensitivity
    ldh  a,[$ffb3]
    ld   bc,$0001
    rlca
    jr   c,.checkIfaButtonOrbButtonPressed
    dec  bc
    dec  bc
    rlca
    jr   c,.checkIfaButtonOrbButtonPressed
    ld   c,$f0
    rlca
    jr   c,.checkIfaButtonOrbButtonPressed
    ld   bc,$0010
    rlca
    jr   c,.checkIfaButtonOrbButtonPressed
    rlca
    jr   c,.startButtonPressed
    rlca
    ret  nc
    jp   hl
.startButtonPressed:
    pop  hl
    ret
.checkIfaButtonOrbButtonPressed:
    ld   a,c
    bit  0,e
    jr   nz,.aButtonPressed
    bit  1,e
    jr   nz,.bButtonPressed
    add  hl,bc
    ret
.aButtonPressed:
    add  a,[hl]
    ld   [hl],a
    ret
.bButtonPressed:
    add  a,h
    ld   h,a
    ret
PrintHex:
    push af
    swap a
    call .digit
    pop  af
.digit:
    and  $0f
    add  a,"０"
    or   "A"
    ld   [hl+],a
    ret
Init:
    ld   hl,Initial
Display:
    call HandleInput
    push hl
    ld   de,$10000 - $0008
    add  hl,de
    push hl
    pop  de
    ld   hl,wTileMap + $0B
    ld   bc,$000c
.loop:
    ld   [hl],"│"
    inc  hl
    ld   a,d
    call PrintHex
    ld   a,e
    call PrintHex
    ld   [hl],"　"
    inc  hl
    ld   a,[de]
    call PrintHex
    inc  de
    ld   [hl],"│"
    add  hl,bc
    ld   a,h
    cp   $c5
    jr   nz,.loop
    ld   a,"▶"
    ld   [wTileMap + $ab],a
    pop  hl
    jr   Display
