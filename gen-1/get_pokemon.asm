include "version/_current.asm"
include "ram/wram.asm"
include "macros/code.asm"

SECTION "GetPokemon", ROM0

DEF POKEMON_SPECIES EQU $15
DEF POKEMON_LEVEL   EQU $05

GetPokemon:
    lb   bc,POKEMON_SPECIES,POKEMON_LEVEL
    jp   GivePokemon
