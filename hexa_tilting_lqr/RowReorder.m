function R=RowReorder(D)
q=size(D,1); r=rank(D); R=eye(q);
id=0;
for k1=1:q
if rank(D(1:k1,:))>rank(D(1:k1-1,:))
id=[id k1];
end
end
id=id(2:r+1);
t1=R(1,:)-R(1,:);
t2=t1;
for k=1:q
if k==id(1)
t1=[t1; R(k,:)];
id=[id(2:r) 0];
else
t2=[t2; R(k,:)];
end
end
R=[t1(2:r+1,:); t2(2:q-r+1,:)];