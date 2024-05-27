%ad^(k)_fg = [f,ad^(k-1)_fg]
function out=adfgk(f,g,x,k)

out=g;
for k1=1:k
    out=simplify(adfg(f,out,x));
end