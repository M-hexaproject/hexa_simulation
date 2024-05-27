function X = variable_determination(v,d)

X = [];
for k = 1:d
C = nested_conbination(v,k);
[m,n] = size(C);
    for i = 1:m
        Y = 1;
        for j = 1:n
            Y = Y*v(:,C(i,j));
        end
        X = [X Y];
    end
end


