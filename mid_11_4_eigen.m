syms s
G = [2 -1 0; -1 2 -1; 0 -1 2;];
C = [2 -1 0; -1 2 0; 0 0 1;];
I = eye(3);
Is = [1 0 1]';
[Q, E] = eig(G\C);
T = I + s*E;
v = inv((Q * T) / Q) * (G \ Is);
f(s) = v(2);
Vx = ilaplace(f(s));
figure
fplot(Vx, [0, 20]);
