include "version/_current.asm"
include "ram/wram.asm"

SECTION "ChangePlayerName", ROM0

ChangePlayerName:
    ld   b,$01
    ld   hl,ChoosePlayerName
    call Bankswitch
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
