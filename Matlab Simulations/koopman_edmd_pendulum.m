clear
clc
close all

%% PARAMETERS

g = 9.81;
L = 1;

dt = 0.01;
T = 20;

t = 0:dt:T;

%% INITIAL STATE

x = zeros(2,length(t));
x(:,1) = [1;0];

%% SIMULATE NONLINEAR SYSTEM

for k = 1:length(t)-1
    
    theta = x(1,k);
    omega = x(2,k);
    
    dtheta = omega;
    domega = -(g/L)*sin(theta);
    
    x(:,k+1) = x(:,k) + dt*[dtheta; domega];
    
end

theta = x(1,:);
omega = x(2,:);

%% PHASE SPACE

figure
plot(theta,omega,'LineWidth',2)
xlabel('\theta')
ylabel('\omega')
title('Nonlinear Pendulum Phase Space')
grid on

%% TIME SERIES

figure
plot(t,theta,'LineWidth',2)
xlabel('Time')
ylabel('\theta')
title('Pendulum Angle vs Time')
grid on

%% ------------------------------
%% EXTENDED DYNAMIC MODE DECOMPOSITION compared to DMD here we lift the space and then compute
%% ------------------------------

% observables (lifting)

psi = [theta;
       omega;
       sin(theta);
       cos(theta);
       theta.^2];

X = psi(:,1:end-1);
Y = psi(:,2:end);

% SVD

[U,S,V] = svd(X,'econ');

r = 5;

Ur = U(:,1:r);
Sr = S(1:r,1:r);
Vr = V(:,1:r);

% Koopman approximation

K = Ur' * Y * Vr / Sr;

% eigen decomposition

[W,D] = eig(K);

lambda = diag(D);

disp("Koopman Eigenvalues (EDMD)")
disp(lambda)

% Koopman modes

Phi = Y * Vr / Sr * W;

%% ------------------------------
%% RECONSTRUCTION USING EDMD
%% ------------------------------

b = Phi \ psi(:,1);

time_dynamics = zeros(r,length(t));

for i = 1:length(t)
    
    time_dynamics(:,i) = (lambda.^(i-1)).*b;
    
end

psi_dmd = Phi * time_dynamics;

theta_dmd = real(psi_dmd(1,:));

%% TRUE VS EDMD

figure

plot(t,theta,'k','LineWidth',2)
hold on
plot(t,theta_dmd,'r--','LineWidth',2)

legend('True','EDMD')

xlabel('Time')
ylabel('\theta')

title('True vs EDMD Reconstruction')

grid on

%% ------------------------------
%% KOOPMAN EIGENVALUE SPECTRUM
%% ------------------------------

figure

scatter(real(lambda),imag(lambda),100,'filled')

xlabel('Real')
ylabel('Imaginary')

title('Koopman Eigenvalue Spectrum')

grid on

%% ------------------------------
%% KOOPMAN EIGENFUNCTION VISUALIZATION
%% ------------------------------

theta_grid = linspace(-3,3,100);
omega_grid = linspace(-3,3,100);

[TH,OM] = meshgrid(theta_grid,omega_grid);

eigfun = sin(TH).*OM;

figure

surf(TH,OM,eigfun)

xlabel('\theta')
ylabel('\omega')
zlabel('Eigenfunction')

title('Example Koopman Eigenfunction')

shading interp
colormap jet
colorbar

%% ------------------------------
%% PENDULUM ANIMATION
%% ------------------------------

figure

for k = 1:10:length(t)
    
    th = theta(k);
    
    x_p = L*sin(th);
    y_p = -L*cos(th);
    
    plot([0 x_p],[0 y_p],'LineWidth',3)
    hold on
    plot(x_p,y_p,'ro','MarkerSize',10,'MarkerFaceColor','r')
    
    axis equal
    axis([-1.5 1.5 -1.5 0.5])
    
    title('Pendulum Animation')
    
    drawnow
    hold off
    
end