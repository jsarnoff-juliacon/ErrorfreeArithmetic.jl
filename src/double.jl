
function eftAdd{T<:AbstractFloat}(a::T, b::T)
  x = a + b
  t = x - a
  y = (a - (x - t)) + (b - t)
  x,y
end

function eftAddGTE{T<:AbstractFloat}(a::T, b::T)
  x = a + b
  y = b - (x - a)
  x,y
end

function eftSub{T<:AbstractFloat}(a::T, b::T)
  x = a - b
  t = x - a
  y = (a - (x - t)) - (b + t)
  x,y
end

function eftSubGTE{T<:AbstractFloat}(a::T, b::T)
  x = a - b
  y = (a - x) - b
  x,y
end

function eftMul{T<:AbstractFloat}(a::T, b::T)
    x = a * b
    y = fma(a, b, -x)
    x,y
end

