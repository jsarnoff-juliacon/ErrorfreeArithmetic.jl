
function eftAdd3{T<:Float64}(a::T,b::T,c::T)
    s,t = eftAdd(b, c)
    x,u = eftAdd(a, s)
    y,z = eftAdd(u, t)
    x,y = eftAddGTE(x, y)
    x,y,z
end

function eftMul3to4{T<:AbstractFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z,t = eftMul(e,c)
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    x,y,z,t
end

function eftMul3{T<:AbstractFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z   = e*c
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    x,y,z
end

function eftMul3to2{T<:AbstractFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z   = e*c
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    x,y
end



