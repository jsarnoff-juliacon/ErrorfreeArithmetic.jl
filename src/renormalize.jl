#=
    arguments to renormalize must be in nonincreasing magnitude order
        and adjacent argument magnitudes (abs(value)) must be separated by 
        ?4 significant bits?
=#





renormalize{T<:StdFloat}(a0::T,a1::T) = eftSumGTE(a0,a1)
renormalizeAs1{T<:StdFloat}(a0::T,a1::T) = a0+a1



function renormalize{T<:StdFloat}(a0::T,a1::T,a2::T)
   s,t1 = eftSumGTE(a1,a3)
   b0,t0 = eftSumGTE(a0,s)
   
   b1,t0 = eftSumGTE(t0,s)
   b2 = t0+t1
   
   b0,b1,b2
end

function renormalizeAs2{T<:StdFloat}(a0::T,a1::T,a2::T)
   s,t1 = eftSumGTE(a1,a3)
   b0,t0 = eftSumGTE(a0,s)
   
   b1 = t0+s

   b0,b1
end

function renormalizeAs1{T<:StdFloat}(a0::T,a1::T,a2::T)
   b0  = a1+a3
   b0 += a0

   b0
end

#=
   follows Algorithm A.9
   in Mixed Precision Iterative Methods using High Precision Arithmetic
   by Hidehiko Hasegawa, 2013
=#

function renormalize{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T)
   s,t2 = eftSumGTE(a2,a3)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s,t1 = eftSumGTE(t1,t2)
   b1,t0 = eftSumGTE(t0,s)
   b2,b3 = eftSumGTE(t0,t1)
   
   b0,b1,b2,b3
end

function renormalizeAs3{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T)
   s,t2 = eftSumGTE(a2,a3)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s,t1 = eftSumGTE(t1,t2)
   b1,t0 = eftSumGTE(t0,s)
   b2 = t0+t1
   
   b0,b1,b2
end

function renormalizeAs2{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T)
   s,t2 = eftSumGTE(a2,a3)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s = t1+t2
   b1 = t0+s

   b0,b1
end

function renormalizeAs1{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T)
   b0 = a2+a3
   b0 += a1
   b0 += a0

   b0
end

#=
   follows Algorithm A.8 
   in Mixed Precision Iterative Methods using High Precision Arithmetic
   by Hidehiko Hasegawa, 2013
=#

function renormalizeAs4{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T,a4::T)
   s,t3 = eftSumGTE(a3,a4)
   s,t2 = eftSumGTE(a2,s)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s,t2 = eftSumGTE(t2,t3)
   s,t1 = eftSumGTE(t1,s)
   b1,t0 = eftSumGTE(t0,s)
   s,t1 = eftSumGTE(t1,t2)
   b2,t0 = eftSumGTE(t0,s)
   b3 = t0+t1
   
   b0,b1,b2,b3
end

function renormalizeAs3{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T,a4::T)
   s,t3 = eftSumGTE(a3,a4)
   s,t2 = eftSumGTE(a2,s)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s,t2 = eftSumGTE(t2,t3)
   s,t1 = eftSumGTE(t1,s)
   b1,t0 = eftSumGTE(t0,s)
   s,t1 = eftSumGTE(t1,t2)
   b2 = t0+s

   b0,b1,b2
end

function renormalizeAs2{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T,a4::T)
   s,t3 = eftSumGTE(a3,a4)
   s,t2 = eftSumGTE(a2,s)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s = t2+t3
   s = t1+s
   b1 = t0+s
   
   b0,b1
end   

