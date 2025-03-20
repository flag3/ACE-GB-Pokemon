;include "version/yellow.asm"
;include "version/yellow11.asm"
;include "version/yellow12.asm"
include "version/yellow13.asm"
include "ram/wram.asm"

SECTION "CleanupYNSC", ROM0

load "ChangeName", wramx[$d000]
ChangeName:
    ld   b,$01
    ld   hl,ChoosePlayerName
    call Bankswitch
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
    ld   bc,$6500
    jp   GiveItem
