fmatime = matime = 1.0;
for i in 1:500 matime=min(matime, (@timed muladd(3.0,2.0,1.0))[2]) end;
for i in 1:500 fmatime=min(fmatime, (@timed fma(3.0,2.0,1.0))[2]) end;

const HasFMAonChip = fmatime < matime


