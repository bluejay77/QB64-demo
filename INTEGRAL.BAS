2 REM **** NUMEERINEN INTEGROINTI, SIMPSONIN S��NT� *****
4 REM **** OHJELMAN IDEA LAINATTU OTADATA'N KIRJASTA:
5 REM **** PERUSTIETOJA TIETOJENK�SITTELYST�,
6 REM **** ISBN 951-767-023-0
7 DEFDBL A-Z: REM ALL VARIABLES ARE DOUBLE PRECISION
8 CLS
9 REM **** SIMPSON-INTEGRAALI ON KIRJOITTAJAN LUOMUS (A. J. YLIKOSKI)
10 PRINT "T�M� OHJELMA LASKEE PINTA-ALAN"
20 PRINT "JOKA J�� M��RITELLYN FUNKTION JA X-AKSELIN"
30 PRINT "V�LIIN, ELI, NUMEERISEN INTEGRAALIN"
40 DEF FNA (X) = 1 + 2 * X + X ^ 2: REM THE FUNCTION TO BE INTEGRATED
50 PRINT "ALKUARVO, LOPPUARVO, ASKEL"
60 INPUT A, B, D
72 LET DELTA = D
80 GOSUB 3000
110 PRINT "PINTA-ALA = N."; SIMPSON
115 PRINT "SIMPSON'IN SAANTOA SOVELLETTIIN "; TIMES; "KERTAA"
120 END
3000 REM THE SIMPSON RULE FOR INTEGRATION
3010 REM INTEGRAL [A TO B] = (B - A) / 6.0 *
3015 REM                       (F(A) +
3020 REM                        4.0 * F((A + B) / 2) +
3030 REM                        F(B))
3040 REM REPEATED USE OF THE SIMPSON RULE
3050 REM THE FUNCTION TO BE INTEGRATED = FNA(X)
3060 REM INPUT VARIABLES: A AND B, AND, DELTA
3065 REM OUTPUT VARIABLE: SIMPSON
3070 LET TIMES = (B - A) / DELTA
3075 LET SIMPSON = 0!
3080 FOR T = A TO B STEP DELTA
3090 LET TEMP = FNA(T) + 4! * FNA((T + DELTA / 2!)) + FNA(T + DELTA)
3100 LET SIMP = DELTA / 6! * TEMP
3110 LET SIMPSON = SIMPSON + SIMP
3120 NEXT T
3130 RETURN
9999 END

