function nu=ObvIndex0(F0,H,x,n,p)
TM=H;
for k=1:n-1
TM=[TM; Lfh(F0,TM((k-1)*p+1:k*p),x)];
end
dTM=simplify(jacobian(TM,x));
dTM0=subs(dTM,x,x-x);
nu=zeros(p,1);
DD=dTM0(1,:)-dTM0(1,:);
for k1=1:n
for k2=1:p
t1 =[DD; dTM0(p*(k1-1)+k2,:)];
if rank(t1)>rank(DD)
nu(k2)=nu(k2)+1;
DD=t1;
if rank(DD)==rank(dTM0)
return
end
end
end
end