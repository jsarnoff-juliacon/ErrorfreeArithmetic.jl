module ErrorfreeArithmetic

import Base: (+),(-),(*),(/),fma,sqrt

import JAS: Float, StdFloat

export eftIncr, eftDecr, eftSqr, eftRecip, # single
       eftSqrtApprox,
       eftAdd, eftSub, eftMul, eftDiv,     # double
       eftAddGTE, eftSubGTE, eftDivApprox,
       eftAdd3, eftMul3,                   # triple
       eftAdd3to2, eftMul3to4, eftMult3to2,
       eftFMA, eftFMA, eftFMAto2, eftFMSto2,
       eftAdd4                             # quadruple

include("single.jl")
include("double.jl")
include("triple.jl")
include("quadruple.jl")

end # module
