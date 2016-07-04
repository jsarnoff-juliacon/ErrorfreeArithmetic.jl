
function eftAdd{T<:StdFloat}(a::T, b::T)
  hi = a + b
  t = hi - a
  lo = (a - (hi - t)) + (b - t)
  hi,lo
end

function eftAddGTE{T<:StdFloat}(a::T, b::T)
  hi = a + b
  lo = b - (hi - a)
  hi,lo
end

function eftAddLTE{T<:StdFloat}(a::T, b::T)
  hi = a + b
  lo = a - (hi - b)
  hi,lo
end

function eftSub{T<:StdFloat}(a::T, b::T)
  hi = a - b
  t = hi - a
  lo = (a - (hi - t)) - (b + t)
  hi,lo
end

function eftSubGTE{T<:StdFloat}(a::T, b::T)
  hi = a - b
  lo = (a - hi) - b
  hi,lo
end

function eftMul{T<:StdFloat}(a::T, b::T)
    hi = a * b
    lo = fma(a, b, -hi)
    hi,lo
end

function accDiv{T<:StdFloat}(a::T, b::T)
    hi = a/b
    remainder = fma(-b,hi,a)
    lo = remainder/b
    remainder = fma(-b,lo,remainder)
    lo += remainder/b
    hi,lo
end

# for use with directed rounding, when only the sign of the lo part is needed
function accDivForSign{T<:StdFloat}(a::T, b::T)
    hi = a/b
    loApprox = -fma(b,hi,-a) # sign is correct, value is actual*b
    hi,loApprox
end

for fn in (:eftAdd, :eftAddGTE, :eftSub, :eftSubGTE, :eftMul, :accDiv, :accDivForSign)
  @eval begin
    ($fn){T1<:Real,T2<:StdFloat}(a::T1, b::T2) = ($fn)(convert(Float64,a), b)
    ($fn){T1<:Real,T2<:StdFloat}(a::T2, b::T1) = ($fn)(a, convert(Float64,b))
    ($fn){T1<:Real,T2<:Real}(a::T1, b::T2) = ($fn)(convert(Float64,a), convert(Float64,b))
  end
end
