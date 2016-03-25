
function eftSqr{T<:StdFloat}(a::T)
    x = a * a
    y = fma(a, a, -x)
    x,y
end

function eftIncr{T<:StdFloat}(a::T)
  b = one(T)
  x = a + b
  t = x - a
  y = (a - (x - t)) + (b - t)
  x,y
end

function eftDecr{T<:StdFloat}(a::T)
  b = one(T)
  x = a - b
  t = x - a
  y = (a - (x - t)) - (b + t)
  x,y
end

function eftRecip{T<:StdFloat}(b::T)
    a = one(T)
    q0 = one(T)/b
    r = fma(-b,q0,a)
    q1 = r/b
    r = fma(-b,q1,r)
    q2 = r/b
    r = fma(-b,q2,r)
    q3 = r / b
    q2 += q3
    q1 += q2
    q0,q1
end
