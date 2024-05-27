function [flag,out]=SpanCx(X,Y)
flag=0;
[n,K]=size(Y)
out=(Y(1,1:K)-Y(1,1:K))’
Z=[X Y] if rank(Y) <
K
return
end
if rank([X Y]) > rank(Y)
return
end
Z0=Z(1,:)-Z(1,:);
for k1=1:n
if rank([Z0; Z(k1,:)]) > rank(Z0)
Z0=[Z0; Z(k1,:)];
end
end
Z0=Z0(2:size(Z0,1),:)
out=simplify(inv(Z0(:,2:K+1))*Z0(:,1))
flag=1;