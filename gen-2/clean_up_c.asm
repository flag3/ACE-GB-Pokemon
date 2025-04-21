include "version/crystal.asm"

SECTION "Cleanup", ROM0

load "", wramx[$d300]
ReceiveTM17AsKeyItem:
  ld   a,$d0;
  ld   [wCurItem],a;
  ld   a,$03;
  ld   hl,ReceiveKeyItem
  rst  0x08;
  ret;
