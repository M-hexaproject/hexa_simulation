%out = S = [g1(x) ・・・ gm(x) ・・・ ad^(n-1)_(f)g1(x) ・・・ ad^(n-1)_(f)gm(x)]
function D=Delta(f,g,x)

[n,m]=size(g);
D=g;
for k=1:n-1
    D=[D adfgM(f,D(:,(k-1)*m+1:k*m),x)];
end