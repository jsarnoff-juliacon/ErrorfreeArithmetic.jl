function eftAddHiLo{T<:StdFloat}(ahi::T, alo::T, bhi::T, blo::T)
    s1, s2 = eftAdd(ahi,bhi)
    t1, t2 = eftAdd(alo,blo)
    s2 += t1
    s1, s2 = eftAddGTE(s1,s2)
    s2 += t2
    eftAddGTE(s1,s2)
end

function eftAddHiLo{T<:StdFloat}(ahi::T, alo::T, b::T)
    s1, s2 = eftAdd(ahi,b)
    s2 += alo
    eftAddGTE(s1,s2)
end


function eftSubHiLo{T<:StdFloat}(ahi::T, alo::T, bhi::T, blo::T)
    s1, s2 = eftSub(ahi,bhi)
    t1, t2 = eftSub(alo,blo)
    s2 += t1
    s1, s2 = eftAddGTE(s1,s2)
    s2 += t2
    eftAddGTE(s1,s2)
end

function eftSubHiLo{T<:StdFloat}(ahi::T, alo::T, b::T)
    s1, s2 = eftSub(ahi,b)
    s2 += a.lo
    eftAddGTE(s1,s2)
end

@inline function inlEftAddGTE{T<:StdFloat}(a::T, b::T)
  hi = a + b
  lo = b - (hi - a)
  hi, lo
end

@inline function inlEftMul{T<:StdFloat}(a::T, b::T)
    hi = a * b
    lo = fma(a, b, -hi)
    hi,lo
end
  
function eftMulHiLo{T<:StdFloat}(ahi::T, alo::T, bhi::T, blo::T)
  #t1,t2 = eftMul(ahi,bhi)
  t1, t2 = inlEftMul(ahi, bhi)
  t3 = ahi * blo
  t4 = alo * bhi
  t3 = t3 + t4
  t4 = t2 + t3
  inlEftAddGTE(t1,t4)
end

function eftMulHiLo{T<:StdFloat}(ahi::T, alo::T, b::T)
  t1,t2 = eftMul(ahi,b)
  t4 = alo * b
  t6 = t2 + t4
  eftAddGTE(t1,t6)
end

#=
function inv{T<:StdFloat}(bhi::T, blo::T)
  q1 = one(T) / bhi
  r  = one(T) - (q1 * b)

  q2 = r.hi / bhi
  r = r - (q2 * b)

  q3 = r.hi / b.hi

  q1,q2 = eftAddGTE(q1, q2)
  q1,q2 = eftAddAs2(q1,q2,q3)
  FloatFloat(q1,q2)
end

function (/){T<:StdFloat}(a::FloatFloat{T}, b::FloatFloat{T})
  q1 = a.hi / b.hi
  r  = a - (q1 * b)

  q2 = r.hi / b.hi
  r = r - (q2 * b)

  q3 = r.hi / b.hi

  q1,q2 = eftAddGTE(q1, q2)
  q1,q2 = eftAddAs2(q1,q2,q3)
  
  FloatFloat(q1,q2)
end

function (/){T<:StdFloat}(a::FloatFloat{T}, b::T)
  q1 = a.hi / b
  r  = a - (q1 * b)

  q2 = r.hi / b
  r = r - (q2 * b)

  q3 = r.hi / b

  q1,q2 = eftAddGTE(q1, q2)
  q1,q2 = eftAddAs2(q1,q2,q3)
  
  FloatFloat(q1,q2)
end
=#
