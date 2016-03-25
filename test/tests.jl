function test_eftRecip{T<:AbstractFloat}(x::T)
    hi,lo = eftRecip(x)
    b = big(1)/big(x)
    tst = Float64(b - (big(hi)+big(lo)))
    eps(abs(lo))/2 >= abs(tst)
end

