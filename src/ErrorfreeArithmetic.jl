module ErrorfreeArithmetic

import Base: (+),(-),(*),fma

export eftAdd1, eftSub1, eftSqr, eftCube, # single
       eftAdd, eftSub, eftMul,            # double
       eftAdd3, eftMul3, eftFMA           # triple

include "single.jl"
include "double.jl"
include "triple.jl"

end # module
