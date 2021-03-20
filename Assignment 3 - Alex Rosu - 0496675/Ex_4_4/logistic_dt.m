% Alex Rosu
% 20.03.2021

% A function which tries to find a suitable time step for the numerical
% solution of the logistic equation by an iteration process

% The function takes the following parameters as inputs:
% The logistic equation to be solved [f]
% Vector which includes information about the time interval and simulation
% time [tspan]
% Initial ODE value [U_0]

function logistic_dt(f, tspan, U_0)
    
    dt = tspan(1);  % Time step
    T = tspan(2);   % Simulation time
    k = 1;          % Initializing k parameter
    
    % Computing first solution
    [t_older, u_older] = ode_FE(f, tspan, U_0);

    out_of_loop = 0;

    % Computing numerical solution inside a while-loop until the prompt for
    % terminating the loop is given
    while out_of_loop == 0

        % Computing the time step for new solution
        dt_k = 2^(-k)*dt;

        % Computing new solution
        [t_new, u_new] = ode_FE(f, [dt_k, T], U_0);

        % Plotting the results
        plot(t_older, u_older, 'b');
        hold on;
        plot(t_new, u_new, 'r');

        % Formatting plots
        xlabel('t');
        ylabel('N(t)');
        grid on;
        hold off;
        legend('Earlier solution', 'The new solution', 'location', 'southeast');
        title('Comparing numerical solutions with different time steps');

        % Printing the current time step
        fprintf('The current time step is: %g', dt_k);
        fprintf('\n\n');

        % Asking from the user, if the loop will be terminated
        out_of_loop = input('Terminate the loop (1/0)?: ');

        % If yes, the program is closed
        if out_of_loop == 1
            fprintf('The program is closed. Thanks for using the program!\n\n');
            break;

        % If not, u_older, t_older and k parameters gets updated and
        % a new iteration begins
        elseif out_of_loop == 0
            fprintf('\nA new iteration begins\n');
            u_older = u_new;
            t_older = t_new;
            k = k + 1;
            continue

        % Otherwise, a suitable prompt is asked from the user
        else
            fprintf('Please, type 1 if you want to terminate the loop ');
            fprintf('or 0 if you want to move to the next iteration\n\n');
            out_of_loop = input('Terminate the loop (1/0)?: ');
        end   
    end
end