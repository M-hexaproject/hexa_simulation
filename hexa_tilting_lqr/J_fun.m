%% J fun
function J = J_fun(x7,x8,x9)

J = [cos(x8)*cos(x9) sin(x9) 0;
    -cos(x8)*sin(x9) cos(x9) 0;
    sin(x8) 0 1];