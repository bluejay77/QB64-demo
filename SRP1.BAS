' Using LINE to draw one Sierpinski curve.
'
' Graph demo by AJY 2013-03-02.
'
' For the QB64 system AJY 2015-05-07
'


DIM SHARED x AS INTEGER, y AS INTEGER
DIM SHARED oldx AS INTEGER, oldy AS INTEGER
DIM SHARED width AS INTEGER, height AS INTEGER
DIM SHARED scale AS DOUBLE

width = 450
height = 450

CLS
SCREEN 12

sierpinskiCurve (5)

END




SUB sierpinskiCurve (n AS INTEGER)

DIM aux1 AS INTEGER

scale = 2.0 ^ (n + 3)
aux1 = scale / 8.0
x = 3: oldx = 3
y = aux1: oldy = aux1

a (n): x = x + 2: y = y - 2: sierpinskiDraw
b (n): x = x - 2: y = y - 2: sierpinskiDraw
c (n): x = x - 2: y = y + 2: sierpinskiDraw
d (n): x = x + 2: y = y + 2: sierpinskiDraw

END SUB




SUB a (i AS INTEGER) STATIC
IF (i > 0) THEN
    a (i - 1): x = x + 2: y = y - 2: sierpinskiDraw
    b (i - 1): x = x + 4: sierpinskiDraw
    d (i - 1): x = x + 2: y = y + 2: sierpinskiDraw
    a (i - 1)
END IF
END SUB

SUB b (i AS INTEGER) STATIC
IF (i > 0) THEN
    b (i - 1): x = x - 2: y = y - 2: sierpinskiDraw
    c (i - 1): y = y - 4: sierpinskiDraw
    a (i - 1): x = x + 2: y = y - 2: sierpinskiDraw
    b (i - 1)
END IF
END SUB

SUB c (i AS INTEGER) STATIC
IF (i > 0) THEN
    c (i - 1): x = x - 2: y = y + 2: sierpinskiDraw
    d (i - 1): x = x - 4: sierpinskiDraw
    b (i - 1): x = x - 2: y = y - 2: sierpinskiDraw
    c (i - 1)
END IF
END SUB

SUB d (i AS INTEGER) STATIC
IF (i > 0) THEN
    d (i - 1): x = x + 2: y = y + 2: sierpinskiDraw
    a (i - 1): y = y + 4: sierpinskiDraw
    c (i - 1): x = x - 2: y = y + 2: sierpinskiDraw
    d (i - 1)
END IF
END SUB




SUB sierpinskiDraw ()

DIM ax AS INTEGER, ay AS INTEGER
DIM aoldx AS INTEGER, aoldy AS INTEGER

ax = CINT(CDBL(width) * (CDBL(x) / CDBL(scale)))
ay = CINT(CDBL(height) * (CDBL(y) / CDBL(scale)))

aoldx = CINT(CDBL(width) * (CDBL(oldx) / CDBL(scale)))
aoldy = CINT(CDBL(height) * (CDBL(oldy) / CDBL(scale)))

' PRINT "X, Y:", ax, ay

LINE (aoldx + 100, aoldy + 400)-(ax + 100, ay + 400), 4 ' WITH THE RED COLOR

oldx = x: oldy = y
    
END SUB

