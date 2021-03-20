% Alex Rosu
% 20.03.2021

% A function which approximates potential and kinetic energy for a certain
% system

% The function takes the following parameters as inputs:
% Numerical approximation of exact solution u_exact [u]
% Numerical approximation of exact solution v_exact [v]
% Natural frequency of the system [omega]

function [PE, KE] = osc_energy (u, v, omega)

    PE = 0.5*omega^2*u.^2;    % The equation for potential energy
    KE = 0.5*v.^2;            % The equation for kinetic energy
    
end