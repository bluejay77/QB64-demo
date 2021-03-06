1000 REM **** THE MANDELBROT SET ****
1010 REM DEMONSTRATION OF COMPLEX ARITHMETIC
1012 REM THE MANDELBROT SET IS AN UNCOUNTABLY INFINITE SET
1014 REM OF COMPLEX NUMBERS
1016 REM WHICH LOOKS AS FOLLOWS.
1018 REM IT IS A SO-CALLED FRACTAL SET.
1020 REM TRANSLATION OF GREG TURK'S PROGRAM IN BYTE, SEP 1984
1025 DEFDBL A-Z: REM ALL VARIABLES ARE DOUBLE PRECISION
1030 READ LAMBDAX, LAMBDAY, SCALE, UMIN, UMAX, VMIN, VMAX
1040 DATA 3.2, 0.0, 1.0, -0.1, 1.1, -0.5, 0.5
1050 REM DATA 3.0 0.5 1.0 -0.1 1.1 -0.5 0.5
1052 LET XORIGO = 60!
1054 LET YORIGO = 180!
1060 REM CALCULATE LAMBDA = 4.0 / LAMBDA
1065 REM CARRY OUT THE OPERATION IN COMPLEX
1070 LET S = LAMBDAX * LAMBDAX + LAMBDAY * LAMBDAY
1080 LET LAMBDAX = 4! * LAMBDAX / S
1090 LET LAMBDAY = -4! * LAMBDAY / S
1095 LET X = 0!
1097 LET Y = 0!
1100 RANDOMIZE TIME
1110 CLS
1120 SCREEN 9
1130 PRINT "THE MANDELBROT SET IN THE COMPLEX PLANE"
1140 REM FIRST ITERATE THE F(Z) TEN TIMES
1150 FOR I = 1 TO 10
1160 GOSUB 5000
1170 NEXT I
1180 REM GOSUB 7000: REM DRAW A POINT ON THE SCREEN
1185 REM THE LOOP TO BE ITERATED
1187 FOR I = 1 TO 100000
1190 GOSUB 5000
1192 LET XPIX = XORIGO + 500! * X
1194 LET YPIX = YORIGO - 500! * Y
1200 GOSUB 7000
1210 NEXT I
1220 END
5000 REM THE FUNCTION TO BE ITERATED
5005 REM INPUT VARIABLES: X AND Y, ACTUALLY THE COMPLEX NUMBER <X, Y>
5007 REM OUTPUT VARIABLES: X AND Y, THE SUBROUTINE CALCULATES
5008 REM Z = F(Z)
5010 LET X0 = X
5020 LET Y0 = Y
5030 LET TEMPX = X0
5040 LET TEMPY = Y0
5050 LET X = TEMPX * LAMBDAX - TEMPY * LAMBDAY
5060 LET Y = TEMPX * LAMBDAY + TEMPY * LAMBDAX
5070 LET X = 1! - X
5080 REM CALCULATE THE COMPLEX SQUARE ROOT OF Z = <X, Y>
5090 LET T = Y
5100 LET S = SQR(X * X + Y * Y)
5110 LET Y = SQR((-X + S) / 2!)
5120 LET X = SQR((X + S) / 2!)
5130 IF T < 0! THEN 5150
5140 GOTO 5160
5150 LET X = -X
5160 IF RND < .5 THEN 5180
5170 GOTO 5200
5180 LET X = -X
5190 LET Y = -Y
5200 LET X = 1! - X
5210 LET X = X / 2!
5230 LET Y = Y / 2!
5240 RETURN
7000 REM SUBROUTINE TO SET ONE PIXEL ON THE SCREEN
7010 REM THIS IS CUMBERSOME....... DRAW A ONE PIXEL LINE
7015 REM SET THE PIXEL (XPIX, YPIX)
7020 LINE (XPIX, YPIX)-(XPIX, YPIX), 14, B
7030 RETURN
9999 END


