% Constants
R1 = 1; R2 = 1; R3 = 1; R4 = 1;
C1 = 1; C2 = 1; C3 = 1;
V_source = 1;
h = 0.1; % time step
t_end = 20;
t = 0:h:t_end;

% System Matrices
A = [1/R1 + 1/R2, -1/R2; -1/R2, 1/R2 + 1/R3 + 1/R4];
B = [-V_source/R1; 0];

V = zeros(2, length(t)); % Matrix to store [V1; V2] at each time step

%% (b) Eigenvector method
% Not typically used for transient analysis, but assuming a solution for illustration

[V_eig, D] = eig(A);
V(:,1) = inv(V_eig)*B; % Initial condition

for k = 1:length(t)-1
    V(:,k+1) = V_eig * expm(D*t(k)) * inv(V_eig) * B;
end
figure; plot(t, V(2,:)); hold on;

%% (c) Forward Euler method

for k = 1:length(t)-1
    dVdt = A*V(:,k) + B;
    V(:,k+1) = V(:,k) + h*dVdt;
end
plot(t, V(2,:));

%% (d) Backward Euler method

for k = 1:length(t)-1
    V(:,k+1) = inv(eye(2)-h*A)*(V(:,k) + h*B);
end
plot(t, V(2,:));

%% (e) Trapezoidal method

for k = 1:length(t)-1
    dVdt_current = A*V(:,k) + B;
    V_next = V(:,k) + h*dVdt_current;
    dVdt_next = A*V_next + B;
    V(:,k+1) = V(:,k) + 0.5*h*(dVdt_current + dVdt_next);
end
plot(t, V(2,:));

title('Transient Simulation at Vx');
xlabel('Time (s)');
ylabel('Vx (V)');
legend('Eigenvector', 'Forward Euler', 'Backward Euler', 'Trapezoidal');
grid on;

