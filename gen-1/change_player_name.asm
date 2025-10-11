include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "ChangePlayerName", ROM0

ChangePlayerName:
    farcall ChoosePlayerName
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
