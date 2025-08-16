include "constants/hardware.asm"
include "version/_current.asm"
include "ram/wram.asm"
include "ram/hram.asm"

SECTION "InGameTrade", ROM0

DEF CustomGiveMonSpecies EQU $24
DEF CustomReceiveMonSpecies EQU $15

load "CustomInGameTrade", wramx[$d000]
CustomInGameTrade:
    ld hl,wCompletedInGameTradeFlags
    ld a,[hl]
    push af;
    res  0,[hl]
    ld   hl,TradeData
    ld   a,[hl+]
    ld   [wInGameTradeGiveMonSpecies],a
    ld   a,[hl+]
    ld   [wInGameTradeReceiveMonSpecies],a
    ld   a,$1c
    ldh  [hLoadedROMBank],a
    ld   [MBC1RomBank],a
    xor  a
    ld   [wWhichTrade],a
    call InGameTrade
    pop  af
    ld   [wCompletedInGameTradeFlags],a
    ret
TradeData:
    db CustomGiveMonSpecies
    db CustomReceiveMonSpecies
    db $9e, $ae, $82, $50

