
G = [2 -1 0; -1 2 -1; 0 -1 2;];
C = [2 -1 0; -1 2 0; 0 0 1;];
I = eye(3);
v0 = [0 0 0]';
Is = [1 0 1]';
dt = 0.1;
idx = 0;

for i = 0:dt:20
    idx = idx + 1;
    v0 = dt * (C \ Is) + (I-dt*inv(C)*G)*v0;
    Vx(idx) = v0(2, 1);
end

figure
plot(0:dt:20, Vx);