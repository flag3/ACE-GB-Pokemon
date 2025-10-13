include "macros/def_banked.asm"

DEF Get2bbpViaHDMA EQU $0db3
DEF LoadStandardFont EQU $0e3b
DEF LoadFontsExtra EQU $0e49
DEF ReturnToMapFromSubMenu EQU $21ed
DEF OpenSRAM EQU $2f9d
DEF CloseSRAM EQU $2fad
DEF WaitBGMap EQU $31c2
DEF SetDefaultBGPAndOBP EQU $32c5
DEF JoyTextDelay_ForcehJoyDown EQU $351b

DEFBanked ReceiveKeyItem, $03, $55d7

DEFBanked FontExtra, $3e, $4000

DEF vTiles2TileA EQU $9600
DEF wTilemap EQU $c4a0
DEF wCurItem EQU $d0c6

DEF hROMBank EQU $ff9d
DEF hJoyLast EQU $ffa9
