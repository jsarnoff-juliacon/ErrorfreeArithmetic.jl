
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
