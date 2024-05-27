function C = nested_conbination(v,k) 

[m,n] = size(v);
elements = 1:n;

combinations = cell(0, k);
indices = ones(1, k);

while true
    combination = elements(indices);
    combinations = [combinations; {combination}];

    % Increment indices
    indices(end) = indices(end) + 1;

    % Propagate carry
    for i = k:-1:1
        if indices(i) > length(elements)
            indices(i) = 1;
            if i > 1
                indices(i - 1) = indices(i - 1) + 1;
            else
                break;
            end
        else
            break;
        end
    end

    % Check termination condition
    if all(indices == 1)
        break;
    end
end

%disp(combinations);
A = cell2mat(combinations);
B = sort(A,2);
C = unique(B,'stable','row');

