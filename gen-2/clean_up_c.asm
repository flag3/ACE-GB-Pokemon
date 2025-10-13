include "macros/farcall.asm"
include "version/crystal.asm"

SECTION "Cleanup", ROM0

load "", wramx[$d300]
ReceiveTM17AsKeyItem:
  ld   a,$d0;
  ld   [wCurItem],a;
  farcall ReceiveKeyItem
  ret;
