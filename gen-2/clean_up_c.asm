include "constants/item_constants.asm"
include "macros/farcall.asm"
include "version/crystal.asm"

SECTION "Cleanup", ROM0

load "", wramx[$d300]
ReceiveTM17AsKeyItem:
  ld   a,TM17
  ld   [wCurItem],a
  farcall ReceiveKeyItem
  ret
