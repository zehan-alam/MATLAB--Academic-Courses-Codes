clc 
clear all
syms u(x,y) v(x,y) a c d psi(x,y)
u(x,y) = a*(x^2-y^2); 
v(x,y) =-2*a*x*y;
psi(x,y)=int(u,y)+int(-v-diff(int(u,y),x),x) ;
disp (psi(x,y))
% 4 (ii)
% plotting streamlines
% we have arbitrary choose a=1 
psi(x,y)=subs(psi (x,y) ,a, 1) ;
figure 
for i=-3:3
    g1=ezplot (psi (x,y) +i);
    set(g1, 'Color', 'red') 
    hold on 
end
title ('stream lines')
% Plotting Velocity field
[X,Y]=meshgrid(-3:.2:3,-3:.2:3);
% we have arbitrary choose a=1
U=X.^2-Y.^2;
V=-2.*X.*Y;
quiver (X, Y,U,V,2)
axis ( [-3 3 -3 3])
hold off
% Plotting direction of Velocity field
% I have done this part extra, not included in the question 
figure
streamslice(X,Y,U,V, 2)