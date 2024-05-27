%% 目標値での入力計算

function uref = uref_fun(A,B,Xref)
uref = pinv(B) * A * Xref;

%% %EOF