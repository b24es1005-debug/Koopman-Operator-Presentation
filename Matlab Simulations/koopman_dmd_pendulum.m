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
    
    x1 = x(1,k);
    x2 = x(2,k);
    
    dx1 = x2;
    dx2 = -(g/L)*sin(x1);
    
    x(:,k+1) = x(:,k) + dt*[dx1;dx2];
    
end

%% PHASE SPACE PLOT

figure

plot(x(1,:),x(2,:),'LineWidth',2)

xlabel('\theta')
ylabel('\omega')

title('Nonlinear Pendulum Phase Space')

grid on

%% TIME EVOLUTION

figure

plot(t,x(1,:),'LineWidth',2)

xlabel('Time')
ylabel('\theta')

title('Pendulum Angle vs Time')

grid on

%% DYNAMIC MODE DECOMPOSITION

X = x(:,1:end-1);
Y = x(:,2:end);

%% SVD

[U,S,V] = svd(X,'econ');

r = 2;

Ur = U(:,1:r);
Sr = S(1:r,1:r);
Vr = V(:,1:r);

%% APPROXIMATE KOOPMAN MATRIX

Atilde = Ur' * Y * Vr / Sr;

%% EIGEN DECOMPOSITION

[W,D] = eig(Atilde);

lambda = diag(D);

disp("Koopman Eigenvalues")
disp(lambda)

%% KOOPMAN MODES

Phi = Y * Vr / Sr * W;

%% RECONSTRUCTION USING DMD

b = Phi \ x(:,1);

time_dynamics = zeros(r,length(t));

for i = 1:length(t)
    
    time_dynamics(:,i) = (lambda.^(i-1)).*b;
    
end

x_dmd = Phi * time_dynamics;

%% TRUE VS DMD COMPARISON

figure

plot(t,x(1,:),'k','LineWidth',2)
hold on

plot(t,real(x_dmd(1,:)),'r--','LineWidth',2)

legend('True','DMD')

xlabel('Time')
ylabel('\theta')

title('True vs DMD Reconstruction')

grid on

%% KOOPMAN EIGENVALUE SPECTRUM

figure

scatter(real(lambda),imag(lambda),100,'filled')

xlabel('Real')
ylabel('Imaginary')

title('Koopman Eigenvalue Spectrum')

grid on