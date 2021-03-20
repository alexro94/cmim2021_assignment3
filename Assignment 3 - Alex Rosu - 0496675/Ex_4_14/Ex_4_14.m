%% Exercise 4.14 - Main Program
% Alex Rosu
% 20.03.2021

clc; clear;

omega = 2;                          % Natural frequency of the system
P = 2*pi/omega;                     % Time period of the system
dt1 = P/20;                         % Interval of 20 time steps per period
dt2 = P/2000;                       % Interval of 2000 time steps per period
T = 3*P;                            % Simulation time (3 periods)
X_0 = 2;                            % Initial displacement
V_0 = 0;                            % Initial velocity

u_exact = @(t) X_0*cos(omega*t);    % Exact solution function
t_exact = 0:.1:T;                   % Exact time vector

% Calling a function to approximate exact solution by using BE-method
[t_BE1, u_BE1] = osc_BE([dt1, T], omega, X_0, V_0);
[t_BE2, u_BE2] = osc_BE([dt2, T], omega, X_0, V_0);

% Plotting comparison of exact and Backward Euler solutions
plot(t_BE1, u_BE1, 'r');
hold on;
plot(t_BE2, u_BE2, 'r--');
plot(t_exact, u_exact(t_exact), 'b');
hold off;

% Formatting the plot
grid on;
xlabel('t [s]');
ylabel('Displacement');
legend('BE (20 steps)', 'BE (2000 steps)',...
    'Exact', 'location', 'southeast');
title('Backward Euler vs. Exact Solution');
axis tight;