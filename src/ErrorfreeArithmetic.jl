module ErrorfreeArithmetic

import Base: (+),(-),(*),fma

export eftIncr, eftDecr, eftSqr,          # single
       eftAdd, eftSub, eftMul,            # double
       eftAdd3, eftMul3, eftFMA,          # triple
       eftMul3to3, eftMult3to2

include "single.jl"
include "double.jl"
include "triple.jl"

end # module
