include "macros/def_banked.asm"

DEF Get2bbpViaHDMA EQU $0db3
DEF LoadStandardFont EQU $0e3b
DEF LoadFontsExtra EQU $0e49
DEF ReturnToMapFromSubMenu EQU $21ed
DEF OpenSRAM EQU $2f9d
DEF CloseSRAM EQU $2fad
DEF CopyBytes EQU $2ff2
DEF WaitBGMap EQU $31c2
DEF SetDefaultBGPAndOBP EQU $32c5
DEF JoyTextDelay_ForcehJoyDown EQU $351b

DEFBanked ReceiveKeyItem, $03, $55d7
DEF CopyBoxmonToTempEnd EQU $688c

DEFBanked FontExtra, $3e, $4000

DEF vTiles2TileA EQU $9600

DEFBanked sBox10, $03, $afde

DEF wTilemap EQU $c4a0
DEF wWildMonMoves EQU $c729
DEF wOverwoldMapBlocks EQU $c800
DEF wMenuSelection EQU $cf68
DEF wMenuCursorY EQU $cf9d

DEF wCurItem EQU $d0c6
DEF wTileDown EQU $d13e
DEF wTempEnemyMonSpecies EQU $d235
DEF wEnemyMonMoves EQU $d239
DEF wEnemyMonDVs EQU $d23d
DEF wBattleMode EQU $d25e

DEF hROMBank EQU $ff9d
DEF hJoypadDown EQU $ffa4
DEF hJoyLast EQU $ffa9
