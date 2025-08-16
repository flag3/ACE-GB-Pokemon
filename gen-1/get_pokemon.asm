include "version/_current.asm"
include "ram/wram.asm"

SECTION "GetPokemon", ROM0

DEF POKEMON_SPECIES EQU $15
DEF POKEMON_LEVEL   EQU $05

GetPokemon:
    ld   bc,(POKEMON_SPECIES << 8) | POKEMON_LEVEL
    jp   GivePokemon
