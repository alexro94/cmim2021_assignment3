% Alex Rosu
% 20.03.2021

% A function which approximates the exact solution u = X0cos(omega*t) by
% using Backward Euler method

% The function takes the following parameters as inputs:
% Vector which includes information about the time interval and simulation
% time [tspan]
% Natural frequency of the system [omega]
% Initial displacement [X_0]
% Initial velocity [V_0]

function [t, u] = osc_BE(tspan, omega, X_0, V_0)

    dt = tspan(1);                      % The interval of time step
    T = tspan (2);                      % Simulation time
    N_t = floor(T/dt);                  % Total number of intervals
    t = linspace(0, N_t*dt, N_t+1);     % Used time vector

    u = zeros(N_t+1, 1);                % Initializing displacement vector
    v = zeros(N_t+1, 1);                % Initializing velocity vector
    
    u(1) = X_0;                         % First element of u vector
    v(1) = V_0;                         % First element of v vector
    
    % Step equations of Backward Euler
    for n = 2:N_t+1
        u(n) = (dt*v(n-1) + u(n-1))/(1 + (dt*omega)^2);
        v(n) = 1/(1 + (dt*omega)^2) * (-dt*omega^2*u(n-1) + v(n-1));
    end
    