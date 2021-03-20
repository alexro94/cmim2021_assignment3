% Alex Rosu
% 20.03.2021

% A function which approximates the exact solutions of u and v by
% using Forward Euler method

% The function takes the following parameters as inputs:
% Vector which includes information about the time interval and simulation
% time [tspan]
% Natural frequency of the system [omega]
% Initial displacement [X_0]
% Initial velocity [V_0]

function [t, u, v] = osc_FE(tspan, omega, X_0, V_0)

    dt = tspan(1);                      % The interval of time step
    T = tspan (2);                      % Simulation time
    N_t = floor(T/dt);                  % Total number of intervals
    t = linspace(0, N_t*dt, N_t+1);     % Used time vector

    u = zeros(N_t+1, 1);                % Initializing displacement vector
    v = zeros(N_t+1, 1);                % Initializing velocity vector
    
    u(1) = X_0;                         % First element of u vector
    v(1) = V_0;                         % First element of v vector
    
    % Step equations of Forward Euler
    for n = 1:N_t
        u(n+1) = u(n) + dt*v(n);
        v(n+1) = v(n) - dt*omega^2*u(n);
    end