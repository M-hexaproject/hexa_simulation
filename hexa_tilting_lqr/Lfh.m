%out = L_{f}h(x)
function out=Lfh(f,h,x)
dh=jacobian(h,x);
out=simplify(dh*f);