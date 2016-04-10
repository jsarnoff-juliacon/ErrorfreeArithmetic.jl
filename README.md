## ErrorfreeArithmetic
errorfree transformations and other arithmetic mappings of like accuracy
```ruby
                                                       Jeffrey Sarnoff © 2016-Mar-22 at New York
```

#### Use
```julia
using ErrorfreeArithmetic

show(hi,lo) = println(hi," ",lo)

hiPart, loPart = eftAdd(12345.0f0, 0.12345f0) 
shw(hiPart,loPart) # 12345.123f0, 0.00040312856f0

```
