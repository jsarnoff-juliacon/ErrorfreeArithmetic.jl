renormalize{T<:StdFloat}(a::T,b::T,c::T,d::T)

   w=x=y=z=zero(T)
   
   w,d = eftAdd(c,d)
   w,c = eftAdd(b,w)
   a,b = eftAdd(a,w)
   
   w,x = a,b
   if x != zero(T)
       x,y = eftAddGTE(x,c)
       if y != zero(T)
           y,z = eftAddGTE(y,d)
       else
           x,y = eftAddGTE(x,d)
       end
   else
       w,x = eftAddGTE(w,c)
       if x != zero(T)
           x,y = eftAddGTE(x,d)
       else
           w,x = eftAddGTE(w,d)
       end
   end
   
   w,x,y,z
end
