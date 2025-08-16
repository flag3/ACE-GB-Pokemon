include "version/_current.asm"
include "ram/wram.asm"

SECTION "ChangeRivalName", ROM0

ChangeRivalName:
    ld   b,$01
    ld   hl,ChooseRivalName
    call Bankswitch
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
