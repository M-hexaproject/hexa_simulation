function out=ChExact(omega,x)
out=0;
Tomega=omega';
dTomega=jacobian(Tomega,x);
t1=dTomega'-dTomega;
if ChZero(t1)==0
return
end
out=1;