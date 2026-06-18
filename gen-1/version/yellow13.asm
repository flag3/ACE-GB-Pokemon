include "macros/def_banked.asm"

DEF FillMemory EQU $16cc
DEF TextBoxBorder EQU $1765
DEF PlaceString EQU $1798
DEF PlayDefaultMusic EQU $219d
DEF ReloadMapData EQU $3002
DEF YesNoChoice EQU $3611
DEF JoypadLowSensitivity EQU $3840
DEF AddNTimes EQU $3a96
DEF HandleMenuInput EQU $3acd
DEF PrintText EQU $3c42
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3dce
DEF GiveItem EQU $3e38
DEF GivePokemon EQU $3e53
DEF Bankswitch EQU $3e7e

DEFBanked DisplayNameRaterScreen, $01, $6381
DEFBanked ChoosePlayerName, $01, $675F
DEFBanked ChooseRivalName, $01, $67B3

DEF ItemUseEvoStone EQU $587d

DEFBanked InGameTrade, $1c, $5af5
