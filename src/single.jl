
function eftSqr(a::AbstractFloat)
    x = a * a
    y = fma(a, a, -x)
    x,y
end

function eftCub(a::AbstractFloat)
    p = a*a; e = fma(a, a, -p)
    x = p*a; p = fma(p, a, -x)
    y = e*a
    x,y
end

