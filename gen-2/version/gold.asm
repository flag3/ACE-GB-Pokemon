include "macros/def_banked.asm"

DEF Get2bbpViaHDMA EQU $0e5b
DEF LoadStandardFont EQU $0d87
DEF LoadFontsExtra EQU $0d95
DEF CallScript EQU $26f5
DEF OpenSRAM EQU $309d
DEF CloseSRAM EQU $30ad
DEF CopyBytes EQU $30d6
DEF WaitBGMap EQU $33ae
DEF SetDefaultBGPAndOBP EQU $34a8
DEF JoyTextDelay_ForcehJoyDown EQU $36f4

DEFBanked ReceiveKeyItem, $03, $5631

DEFBanked GiftSpearowMail, $22, $6e2c
DEFBanked GiftSpearowName, $22, $6e49
DEFBanked GiftSpearowOTName, $22, $6e4e

DEFBanked FontExtra, $3e, $40f2

DEF vTiles2TileA EQU $9600

DEF wTilemap EQU $c3a0
DEF wWildMonMoves EQU $cc07
DEF wTileDown EQU $ce97
DEF wMenuSelection EQU $cedf
DEF wMenuCursorY EQU $cf14
DEF wCurItem EQU $cffc

DEF wTempEnemyMonSpecies EQU $d0df
DEF wEnemyMonMoves EQU $d0e3
DEF wEnemyMonDVs EQU $d0e7
DEF wBattleMode EQU $d108
DEF wPlayerName EQU $d1b5
DEF wPartyMon1OT EQU $db10

DEF hROMBank EQU $ff9f
DEF hJoyLast EQU $ffab
