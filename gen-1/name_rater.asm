include "version/_current.asm"
include "ram/wram.asm"

SECTION "NameRater", ROM0

load "", wramx[$d000]
NameRater:
    xor  a
    ld   b,a
    add  a,$00
    ld   [wWhichPokemon],a
    ld   c,$01
    ld   hl,wPartySpecies
    call AddNTimes
    ld   a,[hl]
    ld   [wCurPartySpecies],a
    ld   b,$01
    ld   hl,DisplayNameRaterScreen
    jp   Bankswitch
