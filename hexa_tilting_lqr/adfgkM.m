%out = [ad^(k)_(f)g1(x) ・・・ ad^(k)_(f)gm(x)]
function out=adfgkM(f,G,x,k)
out=G;
for k1=1:k
    out=simplify(adfgM(f,out,x));
end