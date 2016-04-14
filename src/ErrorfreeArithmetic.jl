module ErrorfreeArithmetic

import Base: (+),(-),(*),(/),fma,sqrt

export eftIncr, eftDecr, eftSqr, eftRecip,   # single
       accInv, accSqrt, accSqrtForSign,
       eftAdd, eftSub, eftMul, accDiv,       # double
       eftAddGTE, eftSubGTE, accDivForSign,
       eftAddAs2, eftMulAs4, eftMulAs2,      # triple (also eftAdd, eftAddGTE, eftMul)
       eftFMA, eftFMA, eftFMAas2, eftFMSas2,
       eftAddAs3, eftAddGTEas3               # quadruple (also eftAdd, eftAddGTE)


# all functions use type StdFloat
if !isdefined(:StdFloat)
  if isdefined(Main,:StdFloat)
    import Main:StdFloat
  else    
    typealias StdFloat Union{Float64,Float32,Float16}
  end
end    

include("single.jl")
include("double.jl")
include("triple.jl")
include("quadruple.jl")

end # module
