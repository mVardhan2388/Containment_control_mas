clc;
clear;
close all;

% stop time
T = 1000;

n = 4;
[B,W,theta,n_cap] = Rand_generator(n);
P = randi([1,4]);
[G,alpha_bar] = G_generator(W,B,theta,n);
%[G,alpha_bar,B,P] = G_generator_1(W,theta,n,P);

% Degree matrix 
D = diag(sum(W,2));

% laplacian matrix of W
Lap = D - W; 

W_cap = diag(diag(W));

W_bar = W - W_cap;

% Design matrix
I_q = W - diag(theta)*W_bar;

% followers selection factor
S = diag(rand(1,n));

r = zeros(n,1);
for k = 1 : n
    r(k,1) = r_cap_generator(0,S,theta,W,G,k);
end

% Noise selection parameter
%omega = laplacian(B);
zeta = max(eig(G)) + (1 - max(eig(G))) * rand;
p0 = rand;
c = rand(n,1);
q = q_selector(r,zeta,n);
h = zeros(n,T+1);
h(:,1) = c .* q;
omega = zeros(n,T+1);
omega(:,1) = laplace_noise(0,h(:,1));
omega_1 = omega;

% Initial follower states
%x = zeros(n, 1);  
%x = [-1; -2; -3; -4; 18; 19; -5; -7; 20; 21];
% let say reference states be stationary
%x_l = [1; 2; 3; 4; 12; 13; 14; 15; 16; 17];  
%x_l = [1; 1; 1; 1; 1; 3; 3; 3; 3; 3];
[x,x_l] = positions(n);

x1 = x;
x1_l = x_l;

index_dp;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Iterate the update equation
% Store all time steps
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
phi_all = zeros(n,T+1);
p_all = zeros(n,T+1);

p = zeros(1, T+1);
p = scale_gen(p0, zeta, p);

delta_all = zeros(n, T+1);                                           % Quantisation error calculation
delta_all(:,1) = x_all_bar(:,1) - x_cap_all(:,1);




index_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x1;
x_l = x1_l;                  % retriving intial positions
omega = omega_1;             % retriving omega

% Iterate the update equation
% Store all time steps
x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                  % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
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


index_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x1;
x_l = x1_l;                  % retriving intial positions
omega = omega_1;             %retriving omega

% Iterate the update equation
% Store all time steps
x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                   % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
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


index_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x1;
x_l = x1_l;                  % retriving intial positions
omega = omega_1;             %retriving omega

% Iterate the update equation
% Store all time steps
x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                 % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
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


index_4;

phi_all_4 = phi_all; 
x_cap_all_4 = x_cap_all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x1;
x_l = x1_l;                  % retriving intial positions
omega = omega_1;             %retriving omega

delt = randi([1, 10]);
x(P) = x(P) + delt;
x_l(P) = x_l(P) + delt;

% Iterate the update equation
% Store all time steps
x_all = zeros(n, T+1);
x_all(:,1) = x;
x_all_bar(:,1) = x_all(:,1) + omega(:,1);                       % Masking
x_l_all = zeros(n, T+1);
x_l_all(:,1) = x_l;
x_l_all_bar(:,1) = x_l_all(:,1) + omega(:,1);                    % Masking


% Encoding Procedures
%xi = zeros(n,1);
xi_all = zeros(n,T+1);
x_cap_all = zeros(n,T+1);
x_cap_all(:,1) = x;
phi_all = zeros(n,T+1);
p_all = zeros(n,T+1);

p = zeros(1, T+1);
p = scale_gen(p0, zeta, p);

delta_all = zeros(n, T+1);                                           % Quantisation error calculation
delta_all(:,1) = x_all_bar(:,1) - x_cap_all(:,1);

index_5;

phi_all_3 = phi_all;
x_cap_all_3 = x_cap_all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

% Sample every 5th point from phi_all and phi_all_4
phi4_samples = phi_all_4(:,1:3:end);
phi3_samples = phi_all_3(:,1:3:end);

% Create corresponding x-axis values
x_vals = 0:(length(phi4_samples(1,:))-1);

figure;
h5 = plot(x_vals, phi4_samples(1,:), 'o', 'Color', 'g');
hold on;
h6 = plot(x_vals, phi4_samples(2,:), 'o', 'Color', 'r');
h7 = plot(x_vals, phi4_samples(3,:), 'o', 'Color', 'b');
h8 = plot(x_vals, phi4_samples(4,:), 'o', 'Color', 'k');
h4 = plot(x_vals, phi3_samples(1,:), 'x', 'Color', 'g');
h9 = plot(x_vals, phi3_samples(2,:), 'X', 'Color', 'r');
h10 = plot(x_vals, phi3_samples(3,:), 'X', 'Color', 'b');
h11 = plot(x_vals, phi3_samples(4,:), 'X', 'Color', 'k');
hold off;

legend([h5 h6 h7 h8 h4 h9 h10 h11]);
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
xlim([0 length(x_vals)]);
title('Sampled Plot of phi\_all and phi\_all\_4');

x_cap4_samples = x_cap_all_4;
x_cap3_samples = x_cap_all_3;
x_l_all_sample = x_l_all; 

% Create corresponding x-axis values
x_vals = 0:(length(x_cap4_samples(1,:))-1);
x_l_vals = 0:(length(x_l_all_sample(1,:))-1);

figure;
h12 = plot(x_vals, x_cap4_samples(1,:), 'o', 'Color', 'g');
hold on;
h13 = plot(x_vals, x_cap4_samples(2,:), 'o', 'Color', 'r');
h14 = plot(x_vals, x_cap4_samples(3,:), 'o', 'Color', 'b');
h15 = plot(x_vals, x_cap4_samples(4,:), 'o', 'Color', 'k');
h16 = plot(x_vals, x_cap3_samples(1,:), 'x', 'Color', 'g');
h17 = plot(x_vals, x_cap3_samples(2,:), 'X', 'Color', 'r');
h18 = plot(x_vals, x_cap3_samples(3,:), 'X', 'Color', 'b');
h19 = plot(x_vals, x_cap3_samples(4,:), 'X', 'Color', 'k');
h2 = plot(x_l_vals, x_l_all_sample', Color="m");

hold off;

legend([h12, h13, h14, h15, h16, h17, h18, h19, h2(1)], {'follower_A1', 'follower_A2', 'follower_A3', 'follower_A4', 'follower_B1', 'follower_B2', 'follower_B3', 'follower_B4', 'Leaders'});
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
xlim([0 length(x_vals)]);
title('Sampled Plot of xcap\_all\_4 and xcap\_all\_3');
