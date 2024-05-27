function [flag,S1]=S1(f,g,x)
flag=0;
S1=g(1)-g(1);
[n,m]=size(g);
T(:,1)=g;
for k=2:n
T(:,k)=adfg(f,T(:,k-1),x);
end
T=simplify(T);
BD=T(:,1:n);
BD(:,n)=subs(BD(:,n),x,x-x);
iBD=inv(BD);
Eyen=jacobian(x,x);
omega=(-1)^(n-1)*Eyen(n,:)*iBD
[flagCX,CX]=CXexact(omega,x)
if flagCX==0
return
end
flag=1;
dS1=CX*omega;
S1=Codi(dS1,x);