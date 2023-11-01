function [L, U] = mid_11_1_LU(x)
    n = length(x);
    L = eye(n);
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
end

