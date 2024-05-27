%% dJ fun
function dJ = dJ_fun(x7,x8,x9)

dJ = [-1/2*(sin(x8+x9)+sin(x8-x9)) cos(x9) 0;
    -1/2*(cos(x8+x9)+sin(x9-x8)) -sin(x9) 0;
    cos(x8) 0 0];