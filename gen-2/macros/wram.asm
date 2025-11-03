MACRO WRAM
    SECTION "\1", ROMX[\2 & $7fff], BANK[\2 >> 14]
\1Prog:
    DEF \1 EQU \2
ENDM
