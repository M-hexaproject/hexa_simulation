function [flag,CX]=CXexact(omega,x)
flag=0;
CX=x(1)-x(1)+1;
n=size(x,1);
if ChExact(omega,x)==1
flag=1;
return
end
domega=jacobian(omega',x);
bQ=domega-domega';
omega0=subs(omega,x,x-x);
for k1=1:n
if ChZero(omega0(k1))==0
K=k1;
break
end
end
dLCX=(1/omega(K))*bQ(:,K)';
if ChExact(dLCX,x)==0
return
end
LCX=Codi(dLCX,x);
CX=exp(LCX);
if ChExact(CX*omega,x)==0
return
end
flag=1;