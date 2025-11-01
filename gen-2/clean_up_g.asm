include "constants/battle_constants.asm"
include "constants/pokemon_constants.asm"
include "constants/text_constants.asm"
include "macros/farcall.asm"
include "macros/scripts/events.asm"
include "version/gold.asm"

SECTION "Cleanup", ROM0

load "", wramx[$dd90]
ReceiveTM33AsKeyItem:
  ld   a,TM33
  ld   [wCurItem],a
  farcall ReceiveKeyItem
  ret
  db $00, $00, $00, $00

Copy:
  ld   bc,NAME_LENGTH
  ld   de,wPartyMon1OT
  ld   hl,wPlayerName
  jp   CopyBytes
  db $00, $00, $00, $00

Init:
  ld   a,GiftSpearowMailBank
  ld   hl,script
  jp   CallScript
script:
  opentext
  giveegg TOGEPI, EGG_LEVEL
  givepoke ABRA, 10
  givepoke SPEAROW, 10, NO_ITEM, GiftSpearowName, GiftSpearowOTName
  givepokemail GiftSpearowMail
  closetext
  end
