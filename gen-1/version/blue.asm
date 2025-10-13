include "macros/def_banked.asm"

DEF PlayDefaultMusic EQU $22e7
DEF ReloadMapData EQU $30cf
DEF Bankswitch EQU $3636
DEF FillMemory EQU $3740
DEF JoypadLowSensitivity EQU $388f
DEF AddNTimes EQU $3ae5
DEF RestoreScreenTilesAndReloadTilePatterns EQU $3e02
DEF GiveItem EQU $3e72
DEF GivePokemon EQU $3e8c


DEFBanked DisplayNameRaterScreen, $01, $660d
DEFBanked ChoosePlayerName, $01, $69ec
DEFBanked ChooseRivalName, $01, $6a40

DEF ItemUseEvoStone EQU $5b9e

DEFBanked InGameTrade, $1c, $5fa9
