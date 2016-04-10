module ErrorfreeArithmetic

import Base: (+),(-),(*),(/),fma,sqrt

export eftIncr, eftDecr, eftSqr, eftRecip,   # single
       accSqrt, accSqrtForSign,
       eftAdd, eftSub, eftMul, eftDiv,       # double
       eftAddGTE, eftSubGTE, eftDivApprox,
       eftAddAs2, eftMulAs4, eftMulAs2,      # triple (also eftAdd, eftAddGTE, eftMul)
       eftFMA, eftFMA, eftFMAas2, eftFMSas2,
       eftAddAs3, eftAddGTEas3               # quadruple (also eftAdd, eftAddGTE)

if isdefined(Main,:StdFloat)
    import Main:StdFloat
elseif isdefined(:StdFloat)
    import StdFloat
else    
    typealias StdFloat Union{Float64,Float32,Float16}
end    

include("single.jl")
include("double.jl")
include("triple.jl")
include("quadruple.jl")

end # module
