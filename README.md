## ErrorfreeArithmetic
errorfree transformations and other arithmetic mappings of like accuracy
```ruby
                                                       Jeffrey Sarnoff © 2016-Mar-22 at New York
```
#### Exports
  eftIncr, eftDecr, eftSqr, eftRecip,   # 1 arg  
  accSqrt, accSqrtForSign,  
  eftAdd, eftSub, eftMul, eftDiv,       # 2 args  
  eftAddGTE, eftSubGTE, eftDivApprox,
  eftAddAs2, eftMulAs4, eftMulAs2,      # 3 args (also eftAdd, eftAddGTE, eftMul)  
  eftFMA, eftFMA, eftFMAas2, eftFMSas2,  
  eftAddAs3, eftAddGTEas3               # 4 args (also eftAdd, eftAddGTE)

#### Use
```julia
using ErrorfreeArithmetic

hiPart, loPart  =  eftAdd(   12345.0f0  , 0.12345f0       ) 
showall( (hiPart,loPart) ) # 12345.123f0, 0.00040312856f0

hiPart, loPart  =  eftAdd(   12345.0    , 0.12345         ) 
showall( (hiPart,loPart) ) # 12345.12345, 8.614775559578902e-13

loPart == Float64((big(12345.0)+big(0.12345)) - big(hiPart)) # true


```
###Notes

These functions will accept variables _v_ that are a subtype of Real for which `convert`(Float64, _v_ ) is defined.
They accept variables _v_ that are a subtype of Number for which `convert`(Float64, _v_ ) is defined, using the Float64 information.  
