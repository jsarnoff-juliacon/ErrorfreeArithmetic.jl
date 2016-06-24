## ErrorfreeArithmetic
errorfree transformations and other arithmetic mappings of like accuracy
```ruby
                                                       Jeffrey Sarnoff © 2016-Mar-22 in New York City
```
#### Nomenclature

The name of each exported function begins with a thrice lettered acronym.  This prefix classifies the accuracy of the evaluand into one of two sorts:  
    
    sortal | prefix | acronym
    ------------------------------------|-----|-------------------------------
    this function evaluates errorfree   | eft | `e`rror`f`ree `t`ransformation 
    this function evaluates faithfully  | far | `fa`ithful `r`ounding
    

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

Most of tese functions will accept variables _v_ that are a subtype of Real for which `convert`(`Float64`, _v_ ) is defined  
(The functions of four arguments presuppose uniformly typed built-in AbstractFloats).
