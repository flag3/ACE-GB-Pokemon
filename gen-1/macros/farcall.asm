MACRO farcall
	ld b, \1Bank
	ld hl, \1
	call Bankswitch
ENDM

MACRO farjp
	ld b, \1Bank
	ld hl, \1
	jp Bankswitch
ENDM
