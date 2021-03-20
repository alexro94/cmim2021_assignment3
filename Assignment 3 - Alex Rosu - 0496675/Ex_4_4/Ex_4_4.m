%% Exercise 4.4 - Main Program
% Alex Rosu
% 20.03.2021

clc; clear;

f = @(t, u) 0.1*(1 - u/500)*u;      % The logistic equation to be solved
U_0 = 100;                          % Initial value
dt = 20; T = 100;                   % Time step and simulation time
tspan = [dt, T];                    % Collecting dt and T into a vector

% Calling a function to begin the searching algorithm
logistic_dt(f, tspan, U_0);