# single argument

@inline function eftSqr_inline{T<:StdFloat}(a::T)
    hi = a * a
    lo = fma(a, a, -hi)
    hi,lo
end

@inline function eftIncr_inline{T<:StdFloat}(a::T)
    b = one(T)
    hi = a + b
    t = hi - a
    lo = (a - (hi - t)) + (b - t)
    hi,lo
end

@inline function eftDecr_inline{T<:StdFloat}(a::T)
    b = one(T)
    hi = a - b
    t = hi - a
    lo = (a - (hi - t)) - (b + t)
    hi,lo
end

# two arguments


@inline function eftAdd_inline{T<:StdFloat}(a::T, b::T)
  hi = a + b
  t = hi - a
  lo = (a - (hi - t)) + (b - t)
  hi,lo
end

@inline function eftAddGTE_inline{T<:StdFloat}(a::T, b::T)
  hi = a + b
  lo = b - (hi - a)
  hi,lo
end

@inline function eftSub_inline{T<:StdFloat}(a::T, b::T)
  hi = a - b
  t = hi - a
  lo = (a - (hi - t)) - (b + t)
  hi,lo
end

@inline function eftSubGTE_inline{T<:StdFloat}(a::T, b::T)
  hi = a - b
  lo = (a - hi) - b
  hi,lo
end

@inline function eftMul_inline{T<:StdFloat}(a::T, b::T)
    hi = a * b
    lo = fma(a, b, -hi)
    hi,lo
end
