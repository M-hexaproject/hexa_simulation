% ?
function D=DeltaDT(F,x,u)
n=size(F,1);
m=size(u,1);
xu=[x; u];
D=simplify(jacobian(F,u));
for k=2:n
t1=HatF(F,x,u,k);
t2=simplify(jacobian(t1,u));
newD=[D t2];
if rank(subs(newD,xu,xu-xu)) == rank(subs(D,xu,xu-xu))
return
end
D=newD;
end