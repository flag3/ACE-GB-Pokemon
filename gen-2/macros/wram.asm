MACRO WRAM
    SECTION "\1", ROMX[\2 & $7fff], BANK[\2 >> 14]
\1:
    DEF \1Addr EQU ((BANK(\1) << 14) | (\1 & $3fff))
ENDM
