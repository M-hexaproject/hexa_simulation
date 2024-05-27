function out=Codi(dS,x)
s1=size(dS,1);
out=dS(:,1)-dS(:,1);
for m=1:s1
out(m)=dS(1,1)-dS(1,1);
for k=1:length(x)
dbeta(m,k)=simplify(dS(m,k)-diff(out(m),x(k)));
beta(m,k)= simplify(int(dbeta(m,k),x(k)));
out(m)=simplify(out(m)+beta(m,k));
end
end
out=simplify(out-subs(out,x,x-x));