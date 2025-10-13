include "home/header.asm"

MACRO farcall ; bank, address
	ld a, \1Bank
	ld hl, \1
	rst FarCall
ENDM
