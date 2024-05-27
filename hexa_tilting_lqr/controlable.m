%% 可制御性

Co = ctrb(A,B);
rank(Co);
unco = length(A) - rank(Co);

if unco == 0
    disp('controlable')
else
    disp('uncontrolable')
end