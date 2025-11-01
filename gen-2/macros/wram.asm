MACRO WRAM
    SECTION "\1", ROMX[\2 & $7fff], BANK[\2 >> 14]
\1:
    DEF \1Addr EQU \2
ENDM
