function Ski2 = Ski2_cal(n2,n4,sk,Ski2,fx,gx,nabf,v)
for h = 1:n2
    sumkk = 0;
    for i = 1:n2
        mm = min(min(sk(:,i))-1,min(sk(:,h))-2);
        if mm>0
            sumkk = sumkk + 1;
            Ski2{h}(:,sumkk) = gx(:,i);
            for j = 1:mm
                Ski2{h}(:,sumkk+j) = nabura_cal(Ski2{h}(:,sumkk+j-1),v,n4)*fx - nabf*Ski2{h}(:,sumkk+j-1);
            end 
            sumkk = sumkk + mm;
        else
            sumkk = sumkk + 1;
            Ski2{h}(:,sumkk) = gx(:,i);
        end
    end
end