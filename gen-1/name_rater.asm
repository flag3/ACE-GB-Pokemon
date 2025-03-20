;include "version/red.asm"
include "version/red11.asm"
;include "version/green.asm"
;include "version/green11.asm"
;include "version/blue.asm"
;include "version/yellow.asm"
;include "version/yellow11.asm"
;include "version/yellow12.asm"
;include "version/yellow13.asm"
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
