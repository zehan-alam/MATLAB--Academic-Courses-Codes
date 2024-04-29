function [c,f,s] = pdefun(x,t,u,dudx) % Equation to solve
    c = [1; 1];
    f = [1; 1] .* dudx;
    % u =u(1), v=u(2)
    s = [u(1)*(1-u(1)-u(2)); u(2)*(1-u(1)-u(2))];
end