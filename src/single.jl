
function eftSqr{T<:StdFloat}(a::T)
    hi = a * a
    lo = fma(a, a, -hi)
    hi,lo
end

function eftIncr{T<:StdFloat}(a::T)
    b = one(T)
    hi = a + b
    t = hi - a
    lo = (a - (hi - t)) + (b - t)
    hi,lo
end

function eftDecr{T<:StdFloat}(a::T)
    b = one(T)
    hi = a - b
    t = hi - a
    lo = (a - (hi - t)) - (b + t)
    hi,lo
end

function eftInv{T<:StdFloat}(b::T)
    hi = one(T)/b
    r = fma(-b,hi,one(T))
    lo = r/b
    r = fma(-b,lo,r)
    lo += r/b
    hi,lo
end


function accSqrt{T<:AbstractFloat}(a::T)
    hi = sqrt(a)
    lo = fma(-hi,hi,a)
    lo = lo / (2*hi)
    hi, lo
end

# for use when the sign of the part is all that is needed of the lo part
function accSqrtForSign(a::AbstractFloat)
     hi = sqrt(a)
     loApprox = fma(-hi,hi,a)
     hi,loApprox
end 
