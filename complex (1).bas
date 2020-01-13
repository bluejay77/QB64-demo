
' QB64 complex library
' Antti J Ylikoski and Matt "DSMan195276" 2013-03-05
'
' Define the type CX_Complex and operators whose result always is
' the last argument
'
' Very very straightforward translation from Java
' Originally written to carry out Fourier transforms in Java
'


TYPE CX_Complex
    re AS DOUBLE ' real part
    im AS DOUBLE ' imaginary part
    md AS DOUBLE ' modulus (polar rep)
    ar AS DOUBLE ' argument (polar rep)
END TYPE



'sum
SUB CX_plus (c1 AS CX_Complex, c2 AS CX_Complex, result AS CX_Complex)
result.re = c1.re + c2.re
result.im = c1.im + c2.im
END SUB

'difference
SUB CX_minus (c1 AS CX_Complex, c2 AS CX_Complex, result AS CX_Complex)
result.re = c1.re - c2.re
result.im = c1.im - c2.im
END SUB

' product
SUB CX_times (c1 AS CX_Complex, c2 AS CX_Complex, result AS CX_Complex)
result.re = c1.re * c2.re - c1.im * c2.im
result.im = c1.im * c2.re + c1.re * c2.im
END SUB

' division, quotient
SUB CX_div (c1 AS CX_Complex, c2 AS CX_Complex, result AS CX_Complex)
result.re = (c1.re * c2.re + c1.im * c2.im) / (c2.re ^ 2 + c2.im ^ 2)
result.im = (c1.im * c2.re - c1.re * c2.im) / (c2.re ^ 2 + c2.im ^ 2)
END SUB

' multiply by a real number
SUB CX_RealMul (c1 AS CX_Complex, v AS DOUBLE, result AS CX_Complex)
result.re = c1.re * v
result.im = c1.im * v
END SUB

' inverse, reciprocal
SUB CX_reciprocal (c1 AS CX_Complex, result AS CX_Complex)
DIM conj AS CX_Complex
CX_Conjugate c1, conj
CX_RealMul conj, 1.0 / (c1.re * c1.re + c1.im * c1.im), result
END SUB

'Conj is the complex conjugate
SUB CX_Conjugate (c1 AS CX_Complex, conj AS CX_Complex)
conj.re = c1.re
conj.im = -c1.im
END SUB

' square of a complex number
SUB CX_Square (c1 AS CX_Complex, result AS CX_Complex)
CX_times c1, c1, result
END SUB

' convert the representation to polar (rect is the default)
SUB CX_ConvPolar (c1 AS CX_Complex)
c1.md = SQR(c1.re ^ 2 + c1.im ^ 2)
c1.ar = ATN(c1.im / c1.re)
END SUB

' convert representation to rectangular
SUB CX_ConvRect (c1 AS CX_Complex)
c1.re = c1.md * COS(c1.ar)
c1.im = c1.md * SIN(c1.ar)
END SUB

' Some nontrivial functions of complex numbers.
' For the formulae see e. g. the Wikipedia.

' e to complex power
' exp(x + yj) = exp(x) * exp(yj)
'             = exp(x) * (cos(y) + j*sin(y))
SUB CX_exp (c1 AS CX_Complex, result AS CX_Complex)
DIM aux AS CX_Complex
aux.re = COS(c1.im) ' cos(y)
aux.im = SIN(c1.im) ' j*sin(y)
CX_RealMul aux, EXP(c1.re), result
END SUB

' natural logarithm of a complex number
SUB CX_ln (c1 AS CX_Complex, result AS CX_Complex)
DIM aux AS CX_Complex
aux.re = LOG(ABS(modulus(c1)))
aux.im = argument(c1)
result = aux
END SUB

' the modulus of a complex number
FUNCTION modulus (c1 AS CX_Complex)
CX_ConvPolar c1
modulus = c1.md
END FUNCTION

' the argument of a complex number
FUNCTION argument (c1 AS CX_Complex)
CX_ConvPolar c1
argument = c1.ar
END FUNCTION

' raise a complex number to an integer power
' the deMoivre formula
SUB CX_powerInt (c1 AS CX_Complex, n AS INTEGER, result AS CX_Complex)
DIM aux AS CX_Complex, aux2 AS CX_Complex
aux.re = modulus(c1) ^ n
aux.im = 0
aux2.re = COS(n * argument(c1))
aux2.im = SIN(n * argument(c1))
CX_times aux, aux2, result
END SUB

' raise a complex number to a complex power
' utilize the definition of the power with the EXP() and LOG()
' functions
SUB CX_powerCX (c1 AS CX_Complex, c2 AS CX_Complex, result AS CX_Complex)
DIM aux1 AS CX_Complex, aux2 AS CX_Complex
CX_ln c1, aux1 ' logarithm of the number to be raised ==> aux1
CX_times aux1, c2, aux2 ' multiply it with the exponent ==> aux2
CX_exp aux2, result ' raise e to the aux2 power
END SUB

' complex square root
' raise the argument to the power 1/2
SUB CX_sqrt (c1 AS CX_Complex, result AS CX_Complex)
DIM onehalf AS CX_Complex
onehalf.re = 1.0 / 2.0
onehalf.im = 0.0
CX_powerCX c1, onehalf, result
END SUB

' the negative of a complex number
SUB CX_neg (c1 AS CX_Complex, result AS CX_Complex) ' -z
result.re = -c1.re
result.im = -c1.im
END SUB

' the classical signum function
FUNCTION signum (x AS DOUBLE)
IF (x = 0.0) THEN
    signum = 0
ELSEIF (x < 0.0) THEN
    signum = -1
ELSE
    signum = 1
END IF
END FUNCTION

' another complex square root
SUB CX_sqrt2 (c1 AS CX_Complex, result AS CX_Complex) ' another sqrt()
DIM gamma AS DOUBLE
DIM delta AS DOUBLE
gamma = SQR((c1.re + modulus(c1)) / 2.0)
delta = signum(c1.im) * SQR((-c1.re + modulus(c1)) / 2.0)
result.re = gamma
result.im = delta
END SUB

