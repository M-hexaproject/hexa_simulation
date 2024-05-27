%out = [ad_(f)g1(x) ・・・ ad_(f)gm(x)]
function out=adfgM(f,G,x)

out=G-G;
for k1=1:size(G,2)
    out(:,k1)=adfg(f,G(:,k1),x);
end
out=simplify(out);