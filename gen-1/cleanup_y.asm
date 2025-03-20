;include "version/yellow.asm"
;include "version/yellow11.asm"
;include "version/yellow12.asm"
include "version/yellow13.asm"
include "ram/wram.asm"

SECTION "CleanupY", ROM0

load "ChangeName", wramx[$d000]
ChangeName:
    ld   b,$01
    ld   hl,ChoosePlayerName
    ;ld   hl,ChooseRivalName
    call Bankswitch
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
    ld   b,$65
    jp   GiveItem
