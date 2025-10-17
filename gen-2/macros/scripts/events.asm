include "constants/item_constants.asm"
include "constants/misc_constants.asm"

DEF givepoke_command EQU $2d
MACRO givepoke
	if _NARG == 2
		givepoke \1, \2, NO_ITEM, FALSE
	elif _NARG == 3
		givepoke \1, \2, \3, FALSE
	elif _NARG == 5
		givepoke \1, \2, \3, TRUE, \4, \5
	else
		db givepoke_command
		db \1 ; pokemon
		db \2 ; level
		db \3 ; item
		db \4 ; trainer
		if \4
			dw \5 ; nickname_pointer
			dw \6 ; ot_name_pointer
		endc
	endc
ENDM

DEF giveegg_command EQU $2e
MACRO giveegg
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

DEF givepokemail_command EQU $2f
MACRO givepokemail
	db givepokemail_command
	dw \1 ; pointer
ENDM


DEF opentext_command EQU $47
MACRO opentext
	db opentext_command
ENDM

DEF closetext_command EQU $49
MACRO closetext
	db closetext_command
ENDM

DEF end_command EQU $90
MACRO end
	db end_command
ENDM
