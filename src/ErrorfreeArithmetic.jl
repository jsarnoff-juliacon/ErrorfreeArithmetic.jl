module ErrorfreeArithmetic

import Base: (+),(-),(*),(/),fma,sqrt

export HasFMAonChip,
       eftIncr, eftDecr, eftSqr, eftRecip,   # single
       accInv, accInvForSign, accSqrt, accSqrtForSign,
       eftAdd, eftSub, eftMul, accDiv,       # double
       eftAddGTE, eftAddLTE, eftSubGTE, accDivForSign,
       eftAddAs2, eftMulAs4, eftMulAs2,      # triple (also eftAdd, eftAddGTE, eftMul)
       eftFMA, eftFMA, eftFMAas2, eftFMSas2,
       eftAddAs3, eftAddGTEas3,              # quadruple (also eftAdd, eftAddGTE)
       eftIncr_inline, eftDecr_inline,       # inline versions
       eftSqr_inline,
       eftAdd_inline, eftAddAs2_inline, eftAddGTE_inline,
       eftSub_inline, eftSubGTE_inline,
       eftMul_inline, eftMulAs2_inline


# all functions use type StdFloat
if !isdefined(:StdFloat)
  if isdefined(Main,:StdFloat)
    import Main:StdFloat
  else    
    typealias StdFloat Union{Float64,Float32,Float16}
  end
end    

include("support/HasFMAonChip.jl")  # const HasFMAonChip::Bool

include("eft_acc/single.jl")
include("eft_acc/double.jl")
include("eft_acc/triple.jl")
include("eft_acc/quadruple.jl")

include("hiloType/inline.jl")
include("hiloType/FloatFloats.jl")
include("hiloType/renormalize.jl")

end # module
