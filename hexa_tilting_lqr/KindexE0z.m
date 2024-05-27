function [kappa,D]=KindexE0z(fe,ge,xe,x)
[N,m]=size(ge);
D1=Delta(fe,ge,xe);
D0=subs(D1,x,x-x);
kappa=zeros(m,1); DD=xe-xe;
for k1=1:N
for k2=1:m
t1=[DD D0(:,m*(k1-1)+k2)];
if rank(t1)>rank(DD)
kappa(k2)=kappa(k2)+1;
DD=t1;
if rank(DD)==rank(D0)
D=D1(:,1:m*max(kappa));
return
end
end
end
end