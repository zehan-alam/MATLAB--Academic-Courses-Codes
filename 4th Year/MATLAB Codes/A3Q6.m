clc 
clear all
syms phi(x,y) u(x,y) v(x,y) psi(x, y)
phi(x,y) =x^2-y^2;
u(x,y) =diff(phi(x,y) , x) ; v(x,y)=diff(phi(x, y) , y);
[X,Y]=meshgrid(-3:.2:3,-3:.2:3);
figure
quiver (X, Y, subs(u, {x, y}, {X, Y}) , subs(v, {x, y}, {X, Y}) , 1)
axis ([-3 3 -3 3])
% 6 (ii)
psi(x,y) =int(u,y)+int(-v-diff(int(u,y),x),x);% stream function
c1=strcat ('stream function is : psi (x,y) = ' ,char (psi (x,y) ));
disp (c1)
flowrate=psi(2,2)-psi(2, 0);
fprintf('flowrate between streamline at (2,0) and (2,2) is = %f\n', flowrate)
% 6(iii)
figure 
for i=-3:3
    g1=ezplot(psi (x,y) +i);
    set(g1, {'Color', 'LineStyle'},{'red', '--'}) 
    hold on
end
title ('stream lines')