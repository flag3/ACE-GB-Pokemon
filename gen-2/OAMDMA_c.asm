include "macros/wram.asm"
include "constants/item_constants.asm"
include "constants/hardware_constants.asm"
include "version/crystal.asm"

WRAM OAMDMACode, $d6e9
    ldh  a, [rSVBK]
    sub  a, $f9
    call z, RoutineAddr
    ld   a, $c4
    db   $18, $83

WRAM Routine, $d6f4
    xor  a
    call c, WalkingWallsAddr
    xor  a
    call c, CatchTrainerPokemonAddr
    xor  a
    call c, WildShinyAddr
    xor  a
    call c, EncounterSpecificPokemonAddr
    xor  a
    call c, RAMWriterInBattleAddr
    ret

WRAM SetUp, $dace
    ld   a, $18
    ld   hl, $ff80
    ld   [hl+], a
    ld   [hl], $72
    ld   hl, OAMDMACodeAddr
    ld   de, $fff4
    ld   bc, $000b
    jp   CopyBytes

WRAM WalkingWalls, $db1f
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

WRAM CatchTrainerPokemon, $da86
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

WRAM WildShiny, $da01
    ld   hl, wBattleMode
    bit  0, [hl]
    ret  z
    ld   hl, wEnemyMonDVs
    ld   [hl], $fa
    inc  hl
    ld   [hl], $aa
    ret

WRAM EncounterSpecificPokemon, $da10
    ld   hl, wBattleMode
    bit  1, [hl]
    ret  nz
    ld   hl, wTempEnemyMonSpecies
    ld   [hl], $fb
    ld   l, $44
    ld   [hl], $1e
    ret

WRAM RAMWriterInBattle, $da9e
    ld   a, [wMenuSelection]
    cp   TM17
    ret  nz
    ld   a, [$cf7f]
    cp   $d4
    ret  nz
    ld   a, $0d
    ld   [wMenuCursorY], a
    ret

WRAM CleanUp, $d2b1
    ld   hl, $ff80
    ld   [hl], $3e
    inc  hl
    ld   [hl], $c3
    ret
