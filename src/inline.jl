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

# three arguments

@inline function eftAdd_inline{T<:StdFloat}(a::T,b::T,c::T)
    s,t = eftAdd_inline(b, c)
    x,u = eftAdd_inline(a, s)
    y,z = eftAdd_inline(u, t)
    x,y = eftAddGTE_inline(x, y)
    x,y,z
end

@inline function eftAddGTE_inline{T<:StdFloat}(a::T,b::T,c::T)
    s,t = eftAddGTE_inline(b, c)
    x,u = eftAddGTE_inline(a, s)
    y,z = eftAddGTE_inline(u, t)
    x,y = eftAddGTE_inline(x, y)
    x,y,z
end


@inline function eftAddAs2_inline{T<:StdFloat}(a::T,b::T,c::T)
    s,t = eftAdd_inline(b, c)
    x,u = eftAdd_inline(a, s)
    y   = u+t
    x,y = eftAddGTE_inline(x, y)
    x,y
end

@inline function eftMul_inline{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul_inline(a,b)
    x,y = eftMul_inline(p,c)
    z,t = eftMul_inline(e,c)
    y,z = eftAdd_inline(y,z)
    x,y = eftAdd_inline(x,y)
    eftAddGTEas3(x,y,z,t)
end

@inline function eftMulAs2_inline{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul_inline(a,b)
    x,y = eftMul_inline(p,c)
    z   = e*c
    y,z = eftAdd_inline(y,z)
    eftAdd(x,y)
end

#=
@inline function eftMulAs4_inline{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul_inline(a,b)
    x,y = eftMul_inline(p,c)
    z,t = eftMul_inline(e,c)
    y,z = eftAdd_inline(y,z)
    x,y = eftAdd_inline(x,y)
    eftAddGTE(x,y,z,t)
end
=#
