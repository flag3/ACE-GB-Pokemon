include "home/header.asm"
include "version/gold.asm"
include "constants/charmap.asm"
include "macros/code.asm"

SECTION "RAMWriter", ROM0

load "", wramx[$d6e6]
Init:
    call SetDefaultBGPAndOBP
    call WaitBGMap
    call LoadStandardFont
    call LoadFontsExtra
    ld   de,FontExtra
    ld   hl,vTiles2TileA
    lb   bc,FontExtraBank,$19
    call Get2bbpViaHDMA
    ldh  a,[hROMBank]
    push af
    ld   hl,$d000
Display:
    call HandleInput
    push hl
    ld   de,-$0008
    add  hl,de
    push hl
    pop  de
    ld   hl,wTilemap + $09
    ldh  a,[hROMBank]
    call OpenSRAM
    call PrintHex
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
    cp   $c6
    jr   nz,.loop
    call CloseSRAM
    ld   a,"▶"
    ld   [wTilemap + $ab],a
    pop  hl
    jr   Display
HandleInput:
    call JoyTextDelay_ForcehJoyDown
    ldh  a,[hJoyLast]
    ld   e,a
    ld   bc,$0001
    rlca
    jr   c,.checkIfaButtonOrSelectButtonPressed
    dec  bc
    dec  bc
    rlca
    jr   c,.checkIfaButtonOrSelectButtonPressed
    ld   c,-$10
    rlca
    jr   c,.checkIfaButtonOrSelectButtonPressed
    ld   bc,$0010
    rlca
    jr   c,.checkIfaButtonOrSelectButtonPressed
    ld   c,b
    rlca
    jr   nc,.checkIfaButtonOrSelectButtonPressed
    pop  hl
    pop  af
    rst  Bankswitch
    ret
.checkIfaButtonOrSelectButtonPressed:
    ld   a,e
    rrca
    jr   nc,.aButtonNotPressed
    rrca
    rrca
    jr   nc,.aButtonPressedSelectButtonNotPressed
    jp   hl
.aButtonPressedSelectButtonNotPressed:
    ldh  a,[hROMBank]
    call OpenSRAM
    ld   a,c
    add  a,[hl]
    ld   [hl],a
    jp   CloseSRAM
.aButtonNotPressed:
    rrca
    jr   c,.bButtonPressed
    rrca
    jr   c,.aButtonNotPressedSelectButtonPressed
    add  hl,bc
    ret
.bButtonPressed:
    ld   a,c
    add  a,h
    ld   h,a
    ret
.aButtonNotPressedSelectButtonPressed:
    ld   a,[hROMBank]
    add  a,c
    rst  Bankswitch
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
    ld  [hl+],a
    ret
