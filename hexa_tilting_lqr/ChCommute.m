function out=ChCommute(T,x)
out=0;
s=size(T,2);
for k1=1:s
    for k2=k1:s
        cc=adfg(T(:,k1),T(:,k2),x);
        if ChZero(cc)==0
            return
        end
    end
end
out=1;