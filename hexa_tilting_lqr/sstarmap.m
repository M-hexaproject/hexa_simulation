function out=sstarmap(s,invs,f,x)
ds=jacobian(s,x);
out2=ds*f;
out = subs(out2,x,invs);
out=simplify(out);