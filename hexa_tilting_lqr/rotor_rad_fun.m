%% rotor_rad_fun

function rotor_rad = rotor_rad_fun(tlen,ucal,b)

rotor_rad = zeros(6,tlen);
for i = 1:tlen
    rotor_rad(:,i) = sqrt(max(0,(ucal(:,i) / b)));
end
%% EOF