%% hexa tilting pid fun
function dx = hexa_tilting_lqr_fun(~,X,Rotordeg,K,Xref,uref)

%% パラメータ
hexa_tilting_num_parameter % 各種パラメータ

%% 入力計算（lqr）
J = J_fun(X(7),X(8),X(9));
Jinv = inv(J);
dJ = dJ_fun(X(7),X(8),X(9));

deta = [X(10) X(11) X(12)]';

u = uref - K*(X-Xref); %印加入力 [uF;uM]

uF = [u(1) u(2) u(3)]';
uM = [u(4) u(5) u(6)]';

RB = rotation_fun(X(7),X(8),X(9));

F = RB'*(mn*uF + mn*gn*ezn);
M = In*J*uM + In*dJ*deta + cross(J*deta,In*J*deta);

%% 運動方程式
dx = zeros(12,1);
dx(1) = X(4);
dx(2) = X(5);
dx(3) = X(6);
dx(4) = -gn*ezn(1) + 1/mn*RB(1,:)*F;
dx(5) = -gn*ezn(2) + 1/mn*RB(2,:)*F;
dx(6) = -gn*ezn(3) + 1/mn*RB(3,:)*F;
dx(7) = X(10);
dx(8) = X(11);
dx(9) = X(12);
dx(10) = -Jinv(1,:)*dJ*deta + Jinv(1,:)*Iinv*(M - cross(J*deta,In*J*deta));
dx(11) = -Jinv(2,:)*dJ*deta + Jinv(2,:)*Iinv*(M - cross(J*deta,In*J*deta));
dx(12) = -Jinv(3,:)*dJ*deta + Jinv(3,:)*Iinv*(M - cross(J*deta,In*J*deta));