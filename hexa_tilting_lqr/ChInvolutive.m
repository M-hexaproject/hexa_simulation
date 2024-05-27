%インボリューティブなら1,,そうでないなら0
function out=ChInvolutive(D,x)

out=0;
s=size(D,2);
r=rank(D);
for k1=1:s
    for k2=k1+1:s
        t1=adfg(D(:,k1),D(:,k2),x);
        t2=[D t1];
        if rank(t2)>r
            return
        end
    end
end
out=1;