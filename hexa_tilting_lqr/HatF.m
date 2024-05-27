function out=HatF(F,x,u,k)
out = x;
for n=1:k
out=simplify(subs(out,u,u-u));
out=simplify(subs(out,x,F));
end
out = simplify(out);