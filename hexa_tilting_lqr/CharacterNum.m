function rho=CharacterNum(f,g,h,x)
[n,m]=size(g);
for k=1:n
t1=simplify(Lfh(g,Lfhk(f,h,x,k-1),x));
if ChZero(t1)==0
rho=k;
return
end
end
rho=n+1;