# one argument

@inline function eftSqr_inline{T<:StdFloat}(a::T)
    hi = a * a
    hi, fma(a, a, -hi)
end

@inline function eftIncr_inline{T<:StdFloat}(a::T)
    b = one(T)
    hi = a + b
    t = hi - a
    hi, ((a - (hi - t)) + (b - t))
end

@inline function eftDecr_inline{T<:StdFloat}(a::T)
    b = one(T)
    hi = a - b
    t = hi - a
    hi, ((a - (hi - t)) - (b + t))
end

# two arguments

@inline function eftAdd_inline{T<:StdFloat}(a::T, b::T)
  hi = a + b
  t = hi - a
  hi, ((a - (hi - t)) + (b - t))
end

@inline function eftAddGTE_inline{T<:StdFloat}(a::T, b::T)
  hi = a + b
  hi, (b - (hi - a))
end

@inline function eftSub_inline{T<:StdFloat}(a::T, b::T)
  hi = a - b
  t = hi - a
  hi, ((a - (hi - t)) - (b + t))
end

@inline function eftSubGTE_inline{T<:StdFloat}(a::T, b::T)
  hi = a - b
  hi, ((a - hi) - b)
end

@inline function eftMul_inline{T<:StdFloat}(a::T, b::T)
    hi = a * b
    hi, fma(a, b, -hi)
end
