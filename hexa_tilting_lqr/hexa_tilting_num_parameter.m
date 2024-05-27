%% hexa tilting parameter

Rotordeg = 30;

mn = 3.0; % 機体の質量[kg]

Ixxn = 2.26;
Iyyn = Ixxn;
Izzn = 4.51;
In = 1e-2*diag([Ixxn Iyyn Izzn]); % 慣性テンソル[kg m^2]
Iinv = inv(In);

gn = 9.8; % 重力加速度[m/s^2]

Ln = 0.3; % 重心からロータまでの長さ[m]

bn = 3.1864; % ロータの推力係数

cn = 0.03; % [m]
c = zeros(1,6);
c(1) = cn;
c(2) = cn;
c(3) = cn;
c(4) = -cn;
c(5) = -cn;
c(6) = -cn;

xi = zeros(3,6); % 機体座標系から見たロータの位置[m]
xi(:,1) = [0 -Ln 0]';
xi(:,2) = [Ln*sqrt(3)/2 Ln/2 0]';
xi(:,3) = [-Ln*sqrt(3)/2 Ln/2 0]';
xi(:,4) = -xi(:,1);
xi(:,5) = -xi(:,2);
xi(:,6) = -xi(:,3);

Rotorrad = deg2rad(Rotordeg); % 度からラジアンへの変換
rotz = 2*pi/3; % ロータの配置角度[rad]
Rz = rotationrz_fun(rotz);
s = zeros(3,6); % 機体座標系から見たロータの推力単位ベクトル
s(:,1) = [sin(Rotorrad) 0 cos(Rotorrad)]';
s(:,2) = Rz*s(:,1);
s(:,3) = Rz*s(:,2);
s(:,4) = s(:,1);
s(:,5) = s(:,2);
s(:,6) = s(:,3);

sxi_tmp = zeros(3,6);
for i = 1:6
    sxi_tmp(:,i) = cross(xi(:,i),s(:,i)) + c(i)*s(:,i);
end
SXi = [s;sxi_tmp]; % 力とモーメントからロータの推力への変換行列

ezn = [0 0 1]';