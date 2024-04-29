clc 
clear all
syms phi(x,y) u(x,y) v(x,y) psi(x, y) z 
psi(x,y)=x^3-3*x*y^2;
u(x,y) =diff (psi (x,y),y); % velocity components 
v (x,y)=-diff (psi (x,y),x); % velocity components 
c(x,y,z)= curl([u,v,0], [x,y, z]) ;
if c== [0;0;0]
    disp ('fluid is irrotational')
% 7 (ii)
phi (x,y) =int(u,x)+ int(v-diff(int(u,x),y),y);
s2 =['velocity potential is : ',char(phi(x,y))];
disp(s2)
else 
    disp('fluid is rotational')
end
% I have done this part extra, not included in the question figure
% plotting streamlines 
for i=-3:3
    g1=ezplot(psi (x,y) +i);
    set (g1, 'Color', 'red') 
    hold on 
end
% plotting equipotential lines 
for i=-3:3
    g1=ezplot(phi(x, y)+i);
    set (g1, {'Color', 'LineStyle'}, {'Black', '--'}) 
    hold on 
end
axis ([-3 3 -3 3]) 
% using axis to show graph nicely 
hold off
title('stream line and velocity potential')