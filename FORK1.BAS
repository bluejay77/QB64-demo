' Find the zero of a function with the halving algorithm.
'
' AJY 2017-02-08 MikroBITTI-lehdelle
'
' The interval halving algorithm is one of the simplest zero finding
' algorithm, but it is foolproof and converges exponentially.
'
' The function whose zero is sought is F (X)
'
' The interval and the desired max value of F at the zero point are:
' AB = lower bound, BB = upper bound, MAXVAL = the desired maximum
' value of the function F at the found zero point.
'
' Call the function simply as
'   X = ZERO (AB, BB, MAXVAL)
'

' THE FOLLOWING DOES THE MAGIC:

ZER = ZERO(1.0, 2.0, 0.000001)
PRINT "The zero is            : "; ZER
PRINT "The value of fun there : "; F(ZER)

END


FUNCTION ZERO (AB, BB, MAXVAL)
' IN THE QB64 A FUNCTION CANNOT
' BE GIVEN AS A PARAMETER

MIDPOINT = (AB + BB) / 2.0
MLOW = SGN(F(AB))
MHI = SGN(F(BB))

IF (MLOW = MHI) THEN
    PRINT "Same sign of F on both interval ends!"
    EXIT FUNCTION
ELSE
    MIDVAL = F(MIDPOINT)
    ' convergence criterion:
    IF (ABS(MIDVAL) <= MAXVAL) THEN
        ZERO = MIDPOINT: ' RETURN THE RESULT
    ELSE
        M = SGN(MIDVAL): ' RECURSE ON EITHER SUBINTERVAL
        IF (M = MLOW) THEN
            ZERO = ZERO(MIDPOINT, BB, MAXVAL)
        ELSEIF (M = MHI) THEN
            ZERO = ZERO(AB, MIDPOINT, MAXVAL)
        ELSE
            PRINT "SIGN ERROR"
            EXIT FUNCTION
        END IF
    END IF
END IF
END FUNCTION


' This is the function whose zero is sought;
' A third degree polynomial.

FUNCTION F (X)
F = X ^ 3 - X ^ 2 + 3 * X - 4
END FUNCTION


