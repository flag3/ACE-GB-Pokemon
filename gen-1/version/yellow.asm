include "macros/def_banked.asm"

DEF FillMemory EQU $16c6
DEF PlayDefaultMusic EQU $2194
DEF ReloadMapData EQU $2ffd
DEF JoypadLowSensitivity EQU $383f
DEF AddNTimes EQU $3a95
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3dcd
DEF GiveItem EQU $3e38
DEF GivePokemon EQU $3e52
DEF Bankswitch EQU $3e7d

DEFBanked DisplayNameRaterScreen, $01, $6381
DEFBanked ChoosePlayerName, $01, $675F
DEFBanked ChooseRivalName, $01, $67B3

DEF ItemUseEvoStone EQU $5886

DEFBanked InGameTrade, $1c, $5af5
