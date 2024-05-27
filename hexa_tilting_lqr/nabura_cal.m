%% ナブラ計算
function nabura = nabura_cal(g,v,n)

nabura = sym('c',[1 n])';
for i = 1:n
nabura(:,i) = diff(g,v(:,i),1);
end