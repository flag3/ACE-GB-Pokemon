include "macros/farcall.asm"
include "version/gold.asm"

SECTION "Cleanup", ROM0

load "", wramx[$dd90]
ReceiveTM17AsKeyItem:
  ld   a,$e1;
  ld   [wCurItem],a;
  farcall ReceiveKeyItem
  ret;
  db $00, $00, $00, $00

Copy:
  ld   bc,$0006;
  ld   de,wPartyMon1OT;
  ld   hl,wPlayerName;
  jp   CopyBytes;
  db $00, $00, $00, $00

Init:
  ld   a,$22;
  ld   hl,script;
  jp   CallScript;
script:
  db $47;
  db $2e, $af, $05;
  db $2d, $3f, $0a, $00, $00;
  db $2d, $15, $0a, $00, $01, $49, $6e, $4e, $6e;
  db $2f, $2c, $6e;
  db $49, $90;
