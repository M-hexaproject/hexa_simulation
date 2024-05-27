%% 回転行列

function RB = rotation_fun(x7,x8,x9)

Rx = [  1 0 0;
        0 cos(x7) -sin(x7);
        0 sin(x7) cos(x7)];

Ry = [  cos(x8) 0 sin(x8);
        0 1 0;
        -sin(x8) 0 cos(x8)];

Rz = [  cos(x9) -sin(x9) 0;
        sin(x9) cos(x9) 0;
        0 0 1];

RB = Rx*Ry*Rz;

%EOF