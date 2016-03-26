
function eftAdd{T<:StdFloat}(a::T,b::T,c::T)
    s,t = eftAdd(b, c)
    x,u = eftAdd(a, s)
    y,z = eftAdd(u, t)
    x,y = eftAddGTE(x, y)
    x,y,z
end

eftAdd3{T<:StdFloat}(a::T,b::T,c::T) = eftAdd(a,b,c)

function eftAdd3to2{T<:StdFloat}(a::T,b::T,c::T)
    s,t = eftAdd(b, c)
    x,u = eftAdd(a, s)
    y   = u+t
    x,y = eftAddGTE(x, y)
    x,y
end

function eftMul3to4{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z,t = eftMul(e,c)
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    eftAddGTE(x,y,z,t)
end

function eftMul{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z   = e*c
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    x,y,z
end

eftMul3{T<:StdFloat}(a::T, b::T, c::T) = eftMul{T}(a,b,c)

function eftMul3to2{T<:StdFloat}(a::T, b::T, c::T)
    p,e = eftMul(a,b)
    x,y = eftMul(p,c)
    z   = e*c
    y,z = eftAdd(y,z)
    x,y = eftAdd(x,y)
    x,y
end


function eftFMA{T<:StdFloat}(a::T, b::T, c::T)
    x = fma(a,b,c)
    u1,u2 = eftMul(a,b)
    a1,a2 = eftAdd(u2,c)
    b1,b2 = eftAdd(u1,a1)
    g = (b1-x)+b2
    y,z = eftAddGTE(g,a2)
    x,y,z
end

function eftFMS{T<:StdFloat}(a::T, b::T, c::T)
    x = fma(a,b,-c)
    u1,u2 = eftMul(a,b)
    a1,a2 = eftSub(u2,c)
    b1,b2 = eftAdd(u1,a1)
    g = (b1-x)+b2
    y,z = eftAddGTE(g,a2)
    x,y,z
end


function eftFMAto2{T<:StdFloat}(a::T, b::T, c::T)
    x = fma(a,b,c)
    u1,u2 = eftMul(a,b)
    a1,a2 = eftAdd(u2,c)
    b1,b2 = eftAdd(u1,a1)
    g = (b1-x)+b2
    y = g+a2
    x,y
end

function eftFMSto2{T<:StdFloat}(a::T, b::T, c::T)
    x = fma(a,b,-c)
    u1,u2 = eftMul(a,b)
    a1,a2 = eftSub(u2,c)
    b1,b2 = eftAdd(u1,a1)
    g = (b1-x)+b2
    y = g+a2
    x,y
end


