function [Psi,sF,W,tW,U]=Psi_sF_M(F,x,u,w,m,ka)
kamax=max(ka);
FF(:,1)=subs(F,[x;u],[x-x;w(:,kamax+1)]);
for k=1:kamax
FF(:,k+1)=subs(F,[x;u],[FF(:,k);w(:,kamax+1-k)]);
end
BW=w-w;
BtW=w-w;
for k1=1:m
BW(k1,1:ka(k1))=w(k1,1:ka(k1));
BtW(k1,1:ka(k1)+1)=w(k1,1:ka(k1)+1);
end
sF=simplify(subs(FF(:,kamax+1),w,BtW));
Psi=simplify(subs(FF(:,kamax+1),w,BW));
W=w(1,1)-w(1,1);
tW=w(1,1)-w(1,1);
for k1=1:kamax+1
for k2=1:m
if ChZero(BW(k2,k1))==0
W=[W; BW(k2,k1)];
end
if ChZero(BtW(k2,k1))==0
tW=[tW; BtW(k2,k1)];
end
end
end
W=simplify(W(2:length(W)));
tW=simplify(tW(2:length(tW)));
U=simplify(BtW(:,1:kamax+1));