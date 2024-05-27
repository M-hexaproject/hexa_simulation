function [flag,kf,GAMMA,bargammak]=StructureA(f,g,h,x)
flag=1; bargammak=x(1)-x(1);
n=size(g,1); q=length(h);
rho=CharacterNum(f,g,h,x);
T1=Lfhk(f,h,x,rho-1);
E=Lfh(g,T1,x);
E0=subs(E,x,x-x);
[s1,V]=RowOperation(E0);
VT1=V*T1;
VE=V*E;
GAMMA=VT1(1:s1);
kf=1;
if s1==q
    return
end
bargamma(1:q-s1)=VT1((s1+1):q);
hatSi=VE((s1+1):q,:)
if ChZero(hatSi) == 0
    flag=0;
    return
end
if s1>0
    oldbargammak=bargamma(1:q-s1);
end
s=s1;
for k1=2:n
    T1=[GAMMA; Lfh(f,bargamma(1:q-s1),x)];
    E=Lfh(g,T1,x);
    E0=subs(E,x,x-x);
    [s1,V]=RowOperation(E0);
    VT1=V*T1;
    VE=V*E;
    GAMMA=VT1(1:s1);
    kf=k1;
    olds=max(s);
    s=[s; s1];
    if s1==q
        return
    end
    bargamma(1:q-s1)=VT1((s1+1):q);
    hatSi=VE((s1+1):q,:);
    if ChZero(hatSi) == 0
        flag=0;
        return
    end
    if s1>max(s)
        oldbargammak=bargamma(1:q-s1);
    end
    s=[s; s1];
end
for k2=1:n
    if s(k2)==s(n)
        kf=k2;
        bargammak=oldbargammak;
        return
    end
end