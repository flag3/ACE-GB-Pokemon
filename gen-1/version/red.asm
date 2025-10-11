include "macros/def_banked.asm"

DEF PlayDefaultMusic EQU $0d9b
DEF ReloadMapData EQU $1b86
DEF Bankswitch EQU $3620
DEF FillMemory EQU $372a
DEF JoypadLowSensitivity EQU $3879
DEF AddNTimes EQU $3ad1
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3dee
DEF GiveItem EQU $3e5e
DEF GivePokemon EQU $3e78

DEFBanked DisplayNameRaterScreen, $01, $64fa
DEFBanked ChoosePlayerName, $01, $68d9
DEFBanked ChooseRivalName, $01, $692d

DEF ItemUseEvoStone EQU $5b77

DEF InGameTrade EQU $5fb7
