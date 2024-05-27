%% Rz
function Rz = rotationrz_fun(rotz)

Rz = [cos(rotz) -sin(rotz) 0;
    sin(rotz) cos(rotz) 0;
    0 0 1];