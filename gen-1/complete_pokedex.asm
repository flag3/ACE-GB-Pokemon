include "version/_current.asm"
include "ram/wram.asm"

SECTION "CompletePokedex", ROM0

CompletePokedex:
    ld   a,$ff
    ld   bc,wPokedexSeenEnd - wPokedexOwned - 1
    ld   hl,wPokedexOwned
    call FillMemory
    ld   a,$7f
    ld   [hl],a
    ld   [wPokedexOwnedEnd - 1],a
    ret
