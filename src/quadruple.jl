renormalize{T<:StdFloat}(c0::T,c1::T,c2::T,c3::T)

   s0=s1=s2=s3=zero(T)
   
   s0,c3 = eftAdd(c2,c3)
   s0,c2 = eftAdd(c1,s0)
   c0,c1 = eftAdd(c0,s0)
   
   s0 = c0
   s1 = c1
   if s1 != zero(T)
       s1,s2 = eftAddGTE(s1,c2)
       if s2 != zero(T)
           s2,s3 = eftAddGTE(s2,c3)
       else
           s1,s2 = eftAddGTE(s1,c3)
       end
   else
       s0,s1 = eftAddGTE(s0,c2)
       if s1 != zero(T)
           s1,s2 = eftAddGTE(s1,c3)
       else
           s0,s1 = eftAddGTE(s0,c3)
       end
   end
   
   s0,s1,s2,s3
end
