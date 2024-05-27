%[f(x),g(x)]
function out=adfg(f,g,x)

dg=jacobian(g,x);
df=jacobian(f,x);
out=simplify(dg*f-df*g);