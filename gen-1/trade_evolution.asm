include "version/_current.asm"
include "ram/wram.asm"

SECTION "TradeEvolution", ROM0

TradeEvolution:
    xor a
    add a,$32
.done
    ld  [wLinkState],a
    ret z
    call ItemUseEvoStone
    call PlayDefaultMusic
    call ReloadMapData
    call RestoreScreenTilesAndReloadTilePatterns
    xor  a
    jr   .done
