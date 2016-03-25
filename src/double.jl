
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
    rest = fma(-b,hi,a)
    lo = rest/b
    rest = fma(-b,lo,rest)
    lo += rest/b
    hi,lo
end
