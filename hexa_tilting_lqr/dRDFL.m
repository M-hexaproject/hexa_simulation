function [out,dd,F,G,xe]=dRDFL(d,fx,g,x)
out=0; dd=d;
[n,m]=size(g);
sumd=sum(d);
for k=1:m
s(k)=sum(d(1:k));
end
z0=sym('z',[2*n-3,m]);
zz=x(1)-x(1);
for k=1:m
zz=[zz; z0(1:d(k),k)];
end
z=zz(2:sumd+1);
xe=[x; z];
F=xe-xe;
bz=xe-xe;
for k=1:m
G(:,k)=xe-xe;
end
bf=[fx; z-z];
for k=1:m
bg(:,k)= [g(:,k); z-z];
end
bz=x-x;
for k=1:m
if d(k) >= 1
bz=[bz; z0(2:d(k),k); x(1)-x(1)];
end
end
bz=simplify(bz);
F=bf;
for k=1:m
if d(k) ~= 0
F=F+z0(1,k)*bg(:,k);
G(:,k)=xe-xe;
G(n+s(k),k)=1;
else
F=F;
G(:,k)=bg(:,k);
end
end
F=simplify(F+bz);
G=simplify(G);
[kappaE,De]=KindexE0z(F,G,xe,x);
if sum(kappaE) < n+sumd
return
end
for k=1:max(kappaE)-1
TD=De(:,1:k*m);
if rank(TD) ~= rank(subs(TD,x,x-x))
return
end
if ChInvolutive(TD,xe)==0
return
end
end
out=1;