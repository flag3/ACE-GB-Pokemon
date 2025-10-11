include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "ChangeRivalName", ROM0

ChangeRivalName:
    farcall ChooseRivalName
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
