% clc;
% clear;
% close all;
% 
% % stop time
% T = 500;
% 
% n = 4;
% [B,W,theta,n_cap] = Rand_generator(n);
% P = randi([1, 4],1);
% %[G,alpha_bar,B] = G_generator_1(W,theta,n,P);
% [G,alpha_bar] = G_generator(W, B, theta,n);
% 
% % Degree matrix 
% D = diag(sum(W,2));
% 
% % laplacian matrix of W
% Lap = D - W; 
% 
% W_cap = diag(diag(W));
% 
% W_bar = W - W_cap;
% 
% % Design matrix
% I_q = W - diag(theta)*W_bar;
% 
% % Noise selection parameter
% %omega = laplacian(B);
% zeta = max(eig(G)) + (1 - max(eig(G))) * rand;
% p0 = rand;
% c = rand(n,1);
% q =  zeta * rand(n,1) + 0;
% h = zeros(n,T+1);
% h(:,1) = c .* q;
% omega = zeros(n,T+1);
% omega(:,1) = laplace_noise(0,h(:,1));
% 
% 
% omega_1 = omega;
% 
% % followers selection factor
% S = diag(rand(1,n));
% 
% % Initial follower states
% %x = zeros(n, 1);  
% %x = [-1; -2; -3; -4; 18; 19; -5; -7; 20; 21];
% % let say reference states be stationary
% %x_l = [1; 2; 3; 4; 12; 13; 14; 15; 16; 17];  
% %x_l = [1; 1; 1; 1; 1; 3; 3; 3; 3; 3];
% [x,x_l] = positions(n);
% 
% x1 = x;
% x1_l = x_l;
% 
% 
% 
% 
% 
% 
% Iterate the update equation
% Store all time steps
tester;

x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                   % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
x_l_all_bar(:,1) = x_l_all(:,1) + omega(:,1);                   % Masking


% Encoding Procedures
%xi = zeros(n,1);
xi_all = zeros(n,T+1);
x_cap_all = zeros(n,T+1);
phi_all_4 = zeros(n,T+1);
p_all = zeros(n,T+1);

p = zeros(1, T+1);
p = scale_gen(p0, zeta, p);

delta_all = zeros(n, T+1);                                           % Quantisation error calculation
delta_all(:,1) = x_all_bar(:,1) - x_cap_all(:,1);




index_4;

index_dp;



x = x1;
x_l = x1_l;                  % retriving intial positions
omega = omega_1;             %retriving omega
delt = rand;
%r_cap_P = r_cap_generator(0, S, theta, W, G, P);
omega(P,1) = omega(P,1) + delt * (1 - r(P,1));


% Iterate the update equation
% Store all time steps
x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all(P,1) = x(P,1) + delt;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                 % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
x_l_all(P,1) = x_l(P,1) + delt;
x_l_all_bar(:,1) = x_l_all(:,1) + omega(:,1);                    % Masking


% Encoding Procedures
%xi = zeros(n,1);
xi_all = zeros(n,T+1);
x_cap_all = zeros(n,T+1);
phi_all = zeros(n,T+1);
p_all = zeros(n,T+1);

p = zeros(1, T+1);
p = scale_gen(p0, zeta, p);

delta_all = zeros(n, T+1);                                           % Quantisation error calculation
delta_all(:,1) = x_all_bar(:,1) - x_cap_all(:,1);



index_5;


phi_samples = phi_all(1:5:end);
phi4_samples = phi_all_4(1:5:end);

% Create corresponding x-axis values
x_vals = 0:length(phi_samples)-1;

figure;
h5 = plot(x_vals, phi_samples, 'o', 'Color', 'r');
hold on;
h4 = plot(x_vals, phi4_samples, 'x', 'Color', 'g');
hold off;

legend({'phi\_all', 'phi\_all\_4'});
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
title('Sampled Plot of phi\_all and phi\_all\_4');
