function [L, D] = mid_11_2_LDLT(x)
    n = length(x);
    L = eye(n);
    D = eye(n);
    U = x;
    for i = 1:1:n
        for j = i+1:1:n
            alpha = U(j, i) / U(i, i);
            L(j, i) = L(j, i) + alpha * L(i, i);
            for k = 1:1:n
                U(j, k) = U(j, k) - alpha * U(i, k);
            end
        end
    end
    for i = 1:1:n
        D(i, i) = U(i, i);
    end
end

