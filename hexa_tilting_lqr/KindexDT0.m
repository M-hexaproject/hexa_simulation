function kappa=KindexDT0(F,x,u)
n=size(F,1);
m=size(u,1);
xu=[x; u];
D=DeltaDT(F,x,u);
tD=subs(D,xu,xu-xu);
kappa=zeros(m,1);
N=size(D,2)/m;
DD=x-x; for
k1=1:N
for k2=1:m
t1 =[DD tD(:,m*(k1-1)+k2)];
if rank(t1)>rank(DD)
kappa(k2)=kappa(k2)+1;
DD=t1;
if rank(DD)==rank(tD)
return
end
end
end
end