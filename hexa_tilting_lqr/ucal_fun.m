%% ucal_fun

function ucal = ucal_fun(tlen,uref,K,xf,xref,I,m,g,ez,SXi)

% uF,uMの計算
uFM = zeros(6,tlen);
xf_tmp = xf';
for i = 1:tlen
    uFM(:,i) = uref - K*(xf_tmp(:,i) - xref); % [uF;uM]
end
uF = uFM(1:3,:);
uM = uFM(4:6,:);

% F,Mの計算
F = zeros(3,tlen);
M = zeros(3,tlen);
for i = 1:tlen
    RB = rotation_fun(xf_tmp(7,i),xf_tmp(8,i),xf_tmp(9,i));
    F(:,i) = RB'*(m*uF(:,i) + m*g*ez);
    J = J_fun(xf_tmp(7,i),xf_tmp(8,i),xf_tmp(9,i));
    dJ = dJ_fun(xf_tmp(7,i),xf_tmp(8,i),xf_tmp(9,i));
    deta = [xf_tmp(10,i) xf_tmp(11,i) xf_tmp(12,i)]';
    M(:,i) = I*J*uM(:,i) + I*dJ*deta + cross(J*deta,I*J*deta);
end

% ucalの計算
ucal_tmp = zeros(6,tlen);
for i = 1:tlen
    ucal_tmp(:,i) = SXi\[F(:,i);M(:,i)];
end
% ucal = ucal_tmp + m*g;
ucal = ucal_tmp;

%% EOF