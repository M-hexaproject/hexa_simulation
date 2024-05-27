function d=dec2N(a,N,m)
d=zeros(1,m);
for k=1:m-1
d(k)=fix(a/power(N,m-k));
a=rem(a,power(N,m-k));
end
d(m)=a;