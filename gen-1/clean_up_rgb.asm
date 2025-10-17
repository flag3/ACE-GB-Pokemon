include "macros/farcall.asm"
include "version/_current.asm"
include "ram/wram.asm"

SECTION "CleanupRGB", ROM0

load "ChangeRivalName", wramx[$d000]
ChangeRivalName:
    farcall ChooseRivalName
    call ReloadMapData
    jp   RestoreScreenTilesAndReloadTilePatterns
    db   $00, $00

load "Remaining", wramx[$d010]
Remaining:
    ld   hl,HS_CELADON_MANSION_EEVEE_GIFT
    res  5,[hl]
    xor  a
    ld   [wPartyCount],a
    ld   a,[wPlayerStarter]
    ld   b,a
    ld   c,5
    jp   GivePokemon
