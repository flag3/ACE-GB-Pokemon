include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "NameRater", ROM0

DEF POKEMON_INDEX EQU $00

NameRater:
    xor  a
    ld   b,a
    add  a,POKEMON_INDEX
    ld   [wWhichPokemon],a
    ld   c,$01
    ld   hl,wPartySpecies
    call AddNTimes
    ld   a,[hl]
    ld   [wCurPartySpecies],a
    farjp DisplayNameRaterScreen
