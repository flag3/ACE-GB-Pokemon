include "macros/def_banked.asm"

DEF FillMemory EQU $16cc
DEF PlayDefaultMusic EQU $219d
DEF ReloadMapData EQU $3002
DEF JoypadLowSensitivity EQU $3840
DEF AddNTimes EQU $3a96
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3dce
DEF GiveItem EQU $3e38
DEF GivePokemon EQU $3e53
DEF Bankswitch EQU $3e7e

DEFBanked DisplayNameRaterScreen, $01, $6381
DEFBanked ChoosePlayerName, $01, $675F
DEFBanked ChooseRivalName, $01, $67B3

DEF ItemUseEvoStone EQU $587d

DEF InGameTrade EQU $5af5
