%% hexa tilting lqr

%% clear
clear
figure_num = 8;
figure_clear
close all
% clc

%% パラメータ
Rotordeg = 30; % ロータの傾き角度[°]
hexa_tilting_num_parameter % 各種パラメータ
%hexarotor_dynamics_input_state % 線形化ダイナミクス
%[Ac,Bc,alpha,beta] = hexarotor_dynamics_input_output(Rotordeg); %入出力線形化
load("1")%線形化後
% controlable % 可制御性

%% LQR
Q = diag([1e0 1e0 1e0,1e0 1e0 1e0,1e0 1e0 1e0,1e0 1e0 1e0]);
R = diag([4e1 4e1 1e0 1e-1 1e-1 1e0]);
[K,P,polesopt] = lqr(Ac,Bc,Q,R,0); %フィードバックゲイン

%% 初期値，参照値
% X0:初期値，Xref:参照値，uref:平衡点での入力
X0 = [0 0 1 0 0 0 0.3 0.2 0 0 0 0]';
Xref = [0 1 1 0 0 0 0.3 0 0 0 0 0]';

uref = uref_fun(Ac,Bc,Xref);

%% 数値解
span = 0.01;
time = 10;
t = 0:span:time;
tlen = length(t);
[t,xf] = ode45(@hexa_tilting_lqr_fun,t,X0,[],Rotordeg,K,Xref,uref);

ucal = ucal_fun(tlen,uref,K,xf,Xref,In,mn,gn,ezn,SXi); % 入力の再計算
rotor_rad = rotor_rad_fun(tlen,ucal,bn); % ロータの回転数

%% plot
x_lim = [-0.1 0.1]; y_lim = [-0.1 1.1]; z_lim = [0.9 1.1];
dx_lim = [-0.1 1.0]; dy_lim = [-0.1 1]; dz_lim = [-0.1 0.1];
phi_lim = [0.2 0.4]; theta_lim = [-0.1 0.3]; psi_lim = [-0.1 0.1];
dphi_lim = [-0.1 0.1]; dtheta_lim = [-0.1 0.1]; dpsi_lim = [-0.1 0.1]; % グラフの上限下限の設定
% figure_lim_inf % 範囲の制限なし
% scale_3d = 3;
figure_plot

%% EOF