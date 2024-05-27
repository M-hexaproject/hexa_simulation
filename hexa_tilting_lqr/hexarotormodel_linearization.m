% ティルト型ヘキサロ―タ状態空間表現
% clear %all
% close all

% パラメータ
hexa_tilting_num_parameter
Rotordeg = 30;
Rotordeg = deg2rad(Rotordeg);
cs = [cn cn cn -cn -cn -cn]';

% 状態変数
syms x(t) y(t) z(t) phi(t) theta(t) psii(t)
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12
dx(t) = diff(x(t),t);
dy(t) = diff(y(t),t); 
dz(t) = diff(z(t),t); 
dphi(t) = diff(phi(t),t); 
dtheta(t) = diff(theta(t),t); 
dpsi(t) = diff(psii(t),t); 

zeta = conj([x(t) y(t) z(t)]');
dzeta = conj([dx(t) dy(t) dz(t)]');
eta = conj([phi(t) theta(t) psii(t)]');
deta = conj([dphi(t) dtheta(t) dpsi(t)]');
vx = [zeta' dzeta' eta' deta']';

% ロータ座標
xi = sym('xi%d%d',[3,6]);
xi(:,1) = [0 -Ln 0]';
xi(:,2) = [Ln*sqrt(3)/2 Ln/2 0]';
xi(:,3) = [-Ln*sqrt(3)/2 Ln/2 0]';
xi(:,4) = -xi(:,1);
xi(:,5) = -xi(:,2);
xi(:,6) = -xi(:,3);
xi = conj(xi);

% 連動型にティルト
rotz = 2*pi/3;
Rz = [cos(rotz) -sin(rotz) 0;sin(rotz) cos(rotz) 0;0 0 1];
s = sym('s%d%d',[3,6]);
s(:,1) = [sin(Rotordeg) 0 cos(Rotordeg)]';
s(:,2) = Rz*s(:,1);
s(:,3) = Rz*s(:,2);
s(:,4) = s(:,1);
s(:,5) = s(:,2);
s(:,6) = s(:,3);
s = conj(s);

% [F M]'=[S]T
sxi_tmp = sym('sxi%d%d',[3,6]);
for i = 1:6
    sxi_tmp(:,i) = cross(xi(:,i),s(:,i)) + cs(i)*s(:,i);
end
S = [s;sxi_tmp];
S1 = S(1:3,:);
S2 = S(4:6,:);

% 回転行列
E = eye(3);
ez = E(:,3);
Rx = [1 0 0; 0 cos(eta(1)) -sin(eta(1)); 0 sin(eta(1)) cos(eta(1))];
Ry = [cos(eta(2)) 0 sin(eta(2)); 0 1 0; -sin(eta(2)) 0 cos(eta(2))];
Rz = [cos(eta(3)) -sin(eta(3)) 0; sin(eta(3)) cos(eta(3)) 0; 0 0 1];

RB = Rx*Ry*Rz;

% 角速度変換
J = conj([(Ry*Rz)'*E(:,1) Rz'*E(:,2) E(:,3)]);
dJ = diff(J,t);
I = diag([Ixxn Iyyn Izzn]);

%% 状態空間表現導出
% dzeta
fdzeta = dzeta;
gdzeta = zeros(3,6);

% ddzeta
fddzeta = -gn*ez;
gddzeta = 1/mn*RB*S(1:3,:);

% deta
fdeta = deta;
gdeta = zeros(3,6);

% ddeta
fddeta = -inv(J)*dJ*deta-inv(J)*inv(I)*cross((J*deta),(I*J*deta));
gddeta = inv(J)*inv(I)*S(4:6,:);

fx = simplify([fdzeta' fddzeta' fdeta' fddeta']');
gx = simplify([gdzeta' gddzeta' gdeta' gddeta']');
hx = vx;

% x,y,z→x1,x2,x3に変換
a = [diff(x(t),t) diff(y(t),t) diff(z(t),t) diff(phi(t),t) diff(theta(t),t) diff(psii(t),t) x(t) y(t) z(t) phi(t) theta(t) psii(t)];
c = [x4 x5 x6 x10 x11 x12 x1 x2 x3 x7 x8 x9];

fx = subs(fx,a,c);
gx = subs(gx,a,c);
hx = subs(hx,a,c);

fx = simplify(fx);
gx = simplify(gx);
save("linearization_model1.mat","fx","gx","hx")