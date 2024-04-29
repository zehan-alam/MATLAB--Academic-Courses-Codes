x = linspace(0,1,20);
t = linspace(0,2,5);
m = 0;
sol = pdepe(m, @pdefun, @pdeic, @pdebc, x, t);
u1 = sol(:,:,1);
u2 = sol(:,:,2);

surf(x,t,u1)
title('u 1(x,t)')
xlabel('Distance x')
ylabel('Time t')

figure
surf(x,t,u2)
title('u_2(x,t)')
xlabel('Distance x')
ylabel('Time t')

