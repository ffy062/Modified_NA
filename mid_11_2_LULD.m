C = [2 4 6; 4 11 15; 6 15 23;];
n = length(C);
L = eye(n);
D = eye(n);
U = C;
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
A = L * D * L';
disp(A)
