function out=ChConst(M,x)
out=0;
s=size(M);
for k1=1:s(1)
for k2=1:s(2)
t1=jacobian(M(k1,k2),x);
if ChZero(t1) == 0
return
end
end
end
out=1;