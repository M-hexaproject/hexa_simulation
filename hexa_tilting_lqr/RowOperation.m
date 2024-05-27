function [r,V]=RowOperation(D)
q=size(D,1); r=rank(D); Iq=eye(q);
if r==q
    V=Iq;
    return
end
R0=RowReorder(D);
D1=R0*D;
t1=D1(1:r,:);
t2=D1((r+1):q,:);
K=t2*t1'*inv(t1*t1');
R1=Iq;
R1((r+1):q,1:r)=-K;
V=R1*R0;