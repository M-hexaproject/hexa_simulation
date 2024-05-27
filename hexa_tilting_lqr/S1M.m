% Sが存在すれば1,手計算で求めるなら0
function [flag,S1]=S1M(f,g,x,kappa)

flag=0;
S1=g(1,:)'-g(1,:)';
[n,m]=size(g);
for k1=1:m
    for k2=1:kappa(k1)
        T(:,k2,k1)=adfgk(f,g(:,k1),x,k2-1);
    end
end
T=simplify(T);
for k=1:m
    BD=g(:,1)-g(:,1);
    tt2=x(1)-x(1);
    for k1=1:m
        BD=[ BD T(:,1:min(kappa(k),kappa(k1)),k1) ];
        t2=x(1:min(kappa(k),kappa(k1)));
        tt2=[tt2 (t2-t2)' ];
        if kappa(k1) >= kappa(k)
            BD(:,size(BD,2))=subs(BD(:,size(BD,2)),x,x-x);
            if k1==k
                tt2(size(tt2,2))= (-1)^(kappa(k1)-1);
            end
        end
        BD=simplify(BD);
    end
    BD=simplify(BD(:,2:size(BD,2)));
    tt2=simplify(tt2(:,2:size(tt2,2)));
    ipBD=simplify(inv(BD'*BD));
    omega=simplify(tt2*ipBD*BD');
    [flagCX,CX]=CXexact(omega,x);
    if flagCX==0
        return
    end
    dS1=CX*omega;
    S1(k)=Codi(dS1,x);
end
flag=1;
S1=simplify(S1);