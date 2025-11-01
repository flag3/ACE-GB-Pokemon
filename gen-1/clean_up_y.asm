include "constants/item_constants.asm"
include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "CleanupY", ROM0

load "ChangeName", wramx[$d000]
ChangeName:
    farcall ChoosePlayerName
    ;farcall ChooseRivalName
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
    db   $00, $00

load "Remaining", wramx[$d010]
Remaining:
    xor  a
    ld   hl,wPartyCount
    ld   [hl+],a
    inc  hl
    ld   bc,$01A7
    call FillMemory
    inc  hl
    ld   [hl],a
    ld   [wListScrollOffset],a
    ld   [$D592],a
    ld   a,$16
    ld   [HS_CELADON_MANSION_EEVEE_GIFT],a
    ld   b,FALCON_BADGE
    jp   GiveItem
