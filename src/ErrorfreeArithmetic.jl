module ErrorfreeArithmetic

import Base: (+),(-),(*),(/),fma,sqrt

import Genera: Float, StdFloat

export eftIncr, eftDecr, eftSqr, eftRecip,  # single
       accSqrt, accSqrtForSign,
       eftAdd, eftSub, eftMul, eftDiv,      # double
       eftAddGTE, eftSubGTE, eftDivApprox,
       eftAdd3to2, eftMul3to4, eftMult3to2, # triple (also eftAdd, eftAddGTE, eftMul)
       eftFMA, eftFMA, eftFMAto2, eftFMSto2,
       eftAdd4to3, eftAddGTE4to3            # quadruple (also eftAdd, eftAddGTE)

include("single.jl")
include("double.jl")
include("triple.jl")
include("quadruple.jl")

end # module
