m = 0;
x = linspace(0,pi,20);
t = linspace(0,2,5);

sol = pdepe(m, @pde_eqn, @pde_ic, @pde_bc,x,t);
surf(x,t,sol)
figure()
plot(x,sol(end,:))

function [c,f,s] = pde_eqn(x, t, u, DuDx)
    c = 1;
    f = DuDx;
    s = 0;
end


function u0 = pde_ic(x)
    u0 = 100;
end


function [pL,qL,pR,qR] = pde_bc(xL, uL, xR, uR, t)
    pL = uL;
    qL = 0;
    pR = uR;
    qR = 0;
end