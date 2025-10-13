include "macros/def_banked.asm"

DEF PlayDefaultMusic EQU $0d89
DEF ReloadMapData EQU $1b74
DEF Bankswitch EQU $360e
DEF FillMemory EQU $3718
DEF JoypadLowSensitivity EQU $3867
DEF AddNTimes EQU $3abf
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3ddc
DEF GiveItem EQU $3e4c
DEF GivePokemon EQU $3e66

DEFBanked DisplayNameRaterScreen, $01, $64a0
DEFBanked ChoosePlayerName, $01, $687f
DEFBanked ChooseRivalName, $01, $68d3

DEF ItemUseEvoStone EQU $5b77

DEFBanked InGameTrade, $1c, $5fb7
