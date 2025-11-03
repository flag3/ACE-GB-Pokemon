include "macros/wram.asm"
include "constants/item_constants.asm"
include "version/gold.asm"

WRAM OAMDMACode, $d41b
    call Routine
    ld   a, $c3
    db   $18, $83

WRAM Routine, $d422
    xor  a
    call c, WalkingWalls
    xor  a
    call c, CatchTrainerPokemon
    xor  a
    call c, WildShiny
    xor  a
    call c, EncounterSpecificPokemon
    xor  a
    call c, RAMWriterInBattle
    ret

WRAM SetUp, $d813
    ld   a, $18
    ld   hl, $ff80
    ld   [hl+], a
    ld   [hl], $76
    ld   hl, OAMDMACode
    ld   de, $fff8
    ld   bc, $0007
    jp   CopyBytes

WRAM WalkingWalls, $d864
    ldh  a, [hJoypadDown]
    bit  1, a
    ret  z
    xor  a
    ld   hl, wTileDown
    ld   [hl+], a
    ld   [hl+], a
    ld   [hl+], a
    ld   [hl], a
    ret

WRAM CatchTrainerPokemon, $d7cb
    ld   hl, wBattleMode
    ld   a, $02
    sub  [hl]
    ret  nz
    ld   b, a
    ldh  a, [hJoypadDown]
    and  $04
    ret  z
    ld   c, a
    dec  [hl]
    ld   de, wWildMonMoves
    ld   hl, wEnemyMonMoves
    jp   CopyBytes

WRAM WildShiny, $d67a
    ld   hl, wBattleMode
    bit  0, [hl]
    ret  z
    ld   hl, wEnemyMonDVs
    ld   [hl], $fa
    inc  hl
    ld   [hl], $aa
    ret

WRAM EncounterSpecificPokemon, $d689
    ld   hl, wBattleMode
    bit  1, [hl]
    ret  nz
    ld   hl, wTempEnemyMonSpecies
    ld   [hl], $fb
    ld   l, $ee
    ld   [hl], $1e
    ret

WRAM RAMWriterInBattle, $d7e3
    ld   a, [wMenuSelection]
    cp   TM33
    ret  nz
    ld   a, [$cef6]
    cp   $d4
    ret  nz
    ld   a, $0d
    ld   [wMenuCursorY], a
    ret

WRAM CleanUp, $dcc6
    ld   hl, $ff80
    ld   [hl], $3e
    inc  hl
    ld   [hl], $c3
    ret
