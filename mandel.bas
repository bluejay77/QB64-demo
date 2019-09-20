' Draw the Mandelbrot set in the complex plane.
'
' Antti J Ylikoski 2018-02-26 Skrolli -lehdelle
'
' This version for QB64 by AJY 2013-02-14.
'
'
' After Joel Kahn's program for the BASIC256 (Kids' BASIC)
'
' Converted, edited and debugged by Antti Ylikoski 01-07-2010.
' But many thanks for Bernd Noetscher for his help involving
' the sophisticated KBasic system.
'
'




DIM kt AS INTEGER
DIM k AS INTEGER
DIM m AS DOUBLE
DIM xmin AS DOUBLE
DIM xmax AS DOUBLE
DIM ymin AS DOUBLE
DIM ymax AS DOUBLE
DIM dx AS DOUBLE
DIM dy AS DOUBLE
DIM x AS INTEGER
DIM y AS INTEGER
DIM tx AS DOUBLE
DIM ty AS DOUBLE
DIM r AS DOUBLE
DIM jx AS DOUBLE
DIM jy AS DOUBLE
DIM wx AS DOUBLE
DIM wy AS DOUBLE

DIM XORIGO AS INTEGER
DIM YORIGO AS INTEGER

DIM DarkBlue AS INTEGER, Blue AS INTEGER
DIM DarkGreen AS INTEGER, Green AS INTEGER
DIM DarkRed AS INTEGER, Red AS INTEGER
DIM DarkPurple AS INTEGER, Purple AS INTEGER
DIM Black AS INTEGER

DIM C AS INTEGER


XORIGO = 350.0
YORIGO = 200.0

CLS
SCREEN 12


DarkBlue = 1
Blue = 11
DarkGreen = 2
Green = 10
DarkRed = 4
Red = 12
DarkPurple = 3
Purple = 13
Black = 0

kt = 50: m = 4.0
xmin = -2.0: xmax = 1.0: ymin = -1.5: ymax = 1.5
dx = (xmax - xmin) / CDBL(500): dy = (ymax - ymin) / CDBL(500)

FOR x = 0 TO 500
    jx = xmin + CDBL(x) * dx
    FOR y = 0 TO 500
        jy = ymin + CDBL(y) * dy
        k = 0: wx = 0.0: wy = 0.0

        MainCalculation:
        tx = wx * wx - wy * wy + jx
        ty = 2.0 * wx * wy + jy
        wx = tx
        wy = ty
        r = wx * wx + wy * wy
        k = k + 1
        IF (r <= m) AND (k < kt) THEN GOTO MainCalculation

        IF (k >= 0) AND (k <= 5) THEN
            C = DarkBlue
        ELSEIF (k > 5) AND (k <= 10) THEN
            C = DarkBlue
        ELSEIF (k > 10) AND (k <= 15) THEN
            C = Blue
        ELSEIF (k > 15) AND (k <= 20) THEN
            C = DarkGreen
        ELSEIF (k > 20) AND (k <= 25) THEN
            C = Green
        ELSEIF (k > 25) AND (k <= 30) THEN
            C = DarkRed
        ELSEIF (k > 30) AND (k <= 35) THEN
            C = Red
        ELSEIF (k > 35) AND (k <= 40) THEN
            C = DarkPurple
        ELSEIF (k > 40) AND (k <= 45) THEN
            C = Purple
        ELSEIF (k > 45) THEN
            C = Black
        END IF


        ' SET ONE PIXEL ON THE SCREEN
        ' THIS IS CUMBERSOME....... DRAW A ONE PIXEL LINE
        LINE ((50 + x), (-20 + y))-((50 + x), (-20 + y)), C

    NEXT y

NEXT x
  
'  PrintScreen(true)
  

END


