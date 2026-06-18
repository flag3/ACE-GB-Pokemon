include "version/_current.asm"
include "ram/wram.asm"

SECTION "Screen", ROM0

load "", wramx[$d5e9]
Screen:
    ld   bc,$0907
    ld   hl,$c3e1
    call TextBoxBorder
    ld   de,Name
    ld   hl,$c40b
    call PlaceString
    ld   a,$05
    ld   [wTopMenuItemY],a
    ld   a,$06
    ld   [wTopMenuItemX],a
    ld   a,$03
    ld   [wMaxMenuItem],a
    ld   [wMenuWatchedKeys],a
    call HandleMenuInput
    bit  1,a
    ret  nz
    ld   a,[wCurrentMenuItem]
    and  a
    jp   z,Obtain
    dec  a
    jp   z,Clear
    dec  a
    jp   z,Exec
    ld   hl,HackableText
    jp   PrintText
Obtain:
    ld   bc,$a502
    jp   GivePokemon
Clear:
    ld   hl,ClearText
    call PrintText
    call YesNoChoice
    ld   a,[wCurrentMenuItem]
    and  a
    ret  nz
    xor  a
    ld   hl,wBoxCount
    ldi  [hl],a
    dec  a
    ld   [hl],a
    ld   a,$c9
    ld   [wBoxMon1Nick],a
    ret
Exec:
    ld   hl,ExecText
    call PrintText
    call YesNoChoice
    ld   a,[wCurrentMenuItem]
    and  a
    jp   z,wBoxMon1Nick
    ret

load "text", wramx[$d3af]
Name:
    db $c6, $e1, $b3, $bc, $e1, $4e, $bc, $e2, $b7, $b6, $4e, $2c, $df, $ba, $b3, $4e, $2e, $b2, $2c, $e0, $b8, $50
ClearText:
    db $00, $1c, $ac, $87, $8c, $dd, $7f, $bc, $e2, $b7, $b6, $bc, $cf, $bd, $b6, $e6, $57
ExecText:
    db $00, $1c, $ac, $87, $8c, $dd, $7f, $2c, $df, $ba, $b3, $bc, $cf, $bd, $b6, $e6, $57
HackableText:
    db $00, $2e, $b2, $2c, $e0, $b8, $30, $c5, $e3, $e7, $58
