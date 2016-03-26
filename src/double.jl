
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

function eftDiv{T<:StdFloat}(a::T, b::T)
    hi = a/b
    remainder = fma(-b,hi,a)
    lo = remainder/b
    remainder = fma(-b,lo,remainder)
    lo += remainder/b
    hi,lo
end

# for use with directed rounding, when only the sign of the lo part is needed
function eftDivApprox{T<:AbstractFloat}(a::T, b::T)
    hi = a/b
    loApprox = -fma(b,hi,-a) # sign is correct, value is actual*b
    hi,loApprox
end
