function out=ker_sF(sF,w,n)
Y=jacobian(sF,w);
t1=Y(:,1:n);
t2=Y(:,n+1);
t3=simplify(inv(t1)*t2);
out=[-t3; 1];