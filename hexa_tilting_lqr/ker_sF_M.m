function out=ker_sF_M(sF,w,tW,ka,n,m)
bW=transp(w(1,1:ka(1)));
for k1=2:m
bW=[bW; transp(w(k1,1:ka(k1)))];
end
for k1=1:m
bW=[bW; w(k1,ka(k1)+1)];
end
Y=jacobian(sF,bW);
t1=Y(:,1:n);
t2=Y(:,(n+1):(n+m));
t3=simplify(-inv(t1)*t2);
bkersF=[t3; eye(m)];
iP=jacobian(tW,bW);
out=iP*bkersF;