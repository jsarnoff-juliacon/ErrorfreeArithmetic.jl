### ErrorfreeArithmetic: the source files

| file | purpose |
|------|---------|
| ErrorfreeArithmetic.jl | the module realization, includes the others |
| single.jl | provide arithmetic functions of 1 argument |
| double.jl | provide arithmetic functions of 2 argument |
| triple.jl | provide arithmetic functions of 3 argument |
| quadruple.jl | provide arithmetic functions of 4 argument |

#### Notes

Functions that are errorfree tranformations per se are named using the prefix __eft__:  

      eftAdd{T<:Float64}(a::T, b::T)  
          an errorfree transformation for the addition of two Float64 values
          s0,s1 = eftAdd(a,b) ST  abs(s0) > abs(s1)  ∧   ulp(s0) > ufp(s1)
              s0 ⊕ s1  == a + b      and     x == x + y
      eftMul{T<:Float64}(a::T, b::T, c::T)
          an errorfree transformation for the multiplication of three Float64s
          
  
  
#### Term and Symbol Mneumonics


  __∧__  is conjunction:&nbsp;&nbsp;&nbsp;&nbsp;  _a_ __∧__ _b_ &nbsp; __⇛__ &nbsp; both _a_ and _b_ hold true  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  without implying another connection amoung _a_ and _b_  

  __ST__ is such_that:&nbsp;&nbsp;&nbsp;&nbsp;    _a_ __ST__ _A_  &nbsp; __⇛__ &nbsp; _a_ is given and here, _a_ is _A_


      ulp( value::FloatingPoint ) ≜ unit_last_place( value )   
        _the significance of the significand's least significant bit_  
        this is a positive or negative power of two, as it values a single bit [ ulp(0) is 0]  
             ulp(0b1000) == ulp(0b0001) == 2^(0)       ulp(0b10.0000) == ulp(0b00.1111) == 2^(-4)  
                   4210           4210                          1234              1234  

      ufp( value::FloatingPoint)  ≜ unit_first_place( value )   
        _the significance of the significand's most significant bit_  
             this is a positive or negative power of two, as it values a single bit [ ulp(0) is 0]  
             ufp(0b1000) == ufp(0b0001) == 2^(4)       ufp(0b0010.00) == ulp(0b0000.11) == 2^(4)  
                   4210           4210                       4210 12           4210 12  
