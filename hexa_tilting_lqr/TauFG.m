function out=TauFG(f,g,x,kappa)
[n,m]=size(g);
T=x-x;
for k1=1:m
for k2=1:kappa(k1)
T=[T adfgk(f,g(:,k1),x,k2-1)];
end
end
out=simplify(T(:,2:size(T,2)));