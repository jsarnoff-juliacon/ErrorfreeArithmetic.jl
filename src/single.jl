
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

function eftRecip{T<:StdFloat}(b::T)
    hi = one(T)/b
    r = fma(-b,hi,one(T))
    lo = r/b
    r = fma(-b,lo,r)
    lo += r/b
    hi,lo
end

#=
function eftRecip{T<:StdFloat}(b::T)
    a = one(T)
    q0 = one(T)/b
    r = fma(-b,q0,a)
    q1 = r/b
    r = fma(-b,q1,r)
    q2 = r/b
    r = fma(-b,q2,r)
    q3 = r / b
    q1 += (q2 + q3)
    q0,q1
end
=#

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
