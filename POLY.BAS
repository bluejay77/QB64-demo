10 REM THE POLYNOMIAL FUNCTIONS X, X^2, X^3, X^4, X^5
20 LET XORIGO = 300
30 LET YORIGO = 180
40 CLS
50 SCREEN 9
55 GOSUB 8000
60 FOR X = -4! TO 4! STEP .001
70 LET Y = X
80 LET X0 = XORIGO + 80! * X
90 LET Y0 = YORIGO - 80! * Y
100 GOSUB 7000
110 NEXT X
120 FOR X = -4! TO 4! STEP .001
130 LET Y = X ^ 2
140 LET X0 = XORIGO + 80! * X
150 LET Y0 = YORIGO - 80! * Y
160 GOSUB 7000
170 NEXT X
180 FOR X = -4! TO 4! STEP .001
190 LET Y = X ^ 3
200 LET X0 = XORIGO + 80! * X
210 LET Y0 = YORIGO - 80! * Y
220 GOSUB 7000
230 NEXT X
240 FOR X = -4! TO 4! STEP .001
250 LET Y = X ^ 4
260 LET X0 = XORIGO + 80! * X
270 LET Y0 = YORIGO - 80! * Y
280 GOSUB 7000
290 NEXT X
300 FOR X = -4! TO 4! STEP .001
310 LET Y = X ^ 5
320 LET X0 = XORIGO + 80! * X
330 LET Y0 = YORIGO - 80! * Y
340 GOSUB 7000
350 NEXT X
5000 END
7000 REM SUBROUTINE TO SET ONE PIXEL ON THE SCREEN
7010 REM THIS IS CUMBERSOME....... DRAW A ONE PIXEL LINE
7020 LINE (X0, Y0)-(X0, Y0), 2, B
7030 RETURN
8000 REM SUBROUTINE TO DRAW THE COORDINATE AXIS
8010 LINE (-1000, YORIGO)-(1000, YORIGO), 4, B
8020 LINE (XORIGO, 1000)-(XORIGO, -1000), 4, B
8030 RETURN
9999 END

