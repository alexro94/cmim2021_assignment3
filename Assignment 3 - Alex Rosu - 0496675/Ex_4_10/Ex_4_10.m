%% Exercise 4.10 - Main Program
% Alex Rosu
% 20.03.2021

clc; clear;

omega = 2;                          % Natural frequency of the system
P = 2*pi/omega;                     % Time period of the system's osc.
dt = P/50;                          % Interval of 50 time steps per period
T = 3*P;                            % Simulation time (3 time periods)
tspan = [dt, T];                    % Collecting dt and T into a vector
X_0 = 2;                            % Initial displacement
V_0 = 0;                            % Initial velocity


% Calling osc_FE and osc_EC to approximate solution
[t_FE, u_FE, v_FE] = osc_FE(tspan, omega, X_0, V_0);
[t_EC, u_EC, v_EC] = osc_EC(tspan, omega, X_0, V_0);

% Calling osc_energy function to approximate potential and kinetic energy
% for each method
[PE_FE, KE_FE] = osc_energy(u_FE, v_FE, omega);
[PE_EC, KE_EC] = osc_energy(u_EC, v_EC, omega);

% The total energy by each method:
E_FE = PE_FE + KE_FE;
E_EC = PE_EC + KE_EC;

% Plotting the results into their own figures
plot(t_FE, E_FE, 'b');
grid on;
xlabel('Time [s]');
ylabel('Total Energy');
title('Solution given by Forward Euler method');
axis tight;

figure(2)
plot(t_EC, E_EC, 'b');
grid on;
xlabel('Time [s]');
ylabel('Total Energy');
title('Solution given by Euler-Cromer method');
axis tight;
