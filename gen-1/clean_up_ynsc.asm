include "constants/item_constants.asm"
include "macros/code.asm"
include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "CleanupYNSC", ROM0

load "ChangeName", wramx[$d000]
ChangeName:
    farcall ChoosePlayerName
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
    db   $00, $00

load "Remaining", wramx[$d010]
Remaining:
    xor  a
    ld   [wListScrollOffset],a
    ld   hl,$D28B
    res  4,[hl]
    ld   [wNumBagItems],a
    ld   hl,HS_CELADON_MANSION_EEVEE_GIFT
    res  5,[hl]
    ld   [$D592],a
    lb   bc,FALCON_BADGE,0
    jp   GiveItem
