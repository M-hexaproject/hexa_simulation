function S = S_cal(n2,n4,kk,fx,gx,nabf,v)
sumkk = 0;
for i = 1:n2
    kkk = kk(:,i+1);
    sumkk = sumkk + kk(:,i);
    if kkk>1
        S(:,sumkk+1) = gx(:,i);
        for j = 1:kkk-1
            S(:,sumkk+j+1) = nabura_cal(S(:,sumkk+j),v,n4)*fx-nabf*S(:,sumkk+j);
        end
    else
        S(:,sumkk+1) = gx(:,i);
    end
end