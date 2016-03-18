module ErrorfreeArithmetic

import Base: (+),(-),(*),fma

export eftAdd1, eftSub1, eftAdd, eftSub, eftMul, eftAdd3, eftMul3, eftFMA

include "single.jl"
include "double.jl"
include "triple.jl"

end # module
