clc 
clear all
% plotting velocity field 
[x,y]=meshgrid(-3:.3:3 -3:.3:3);
u=x-4.*y; 
v=-y-4.*x;
figure
quiver (x, y, u, v, 1.5) 
axis ([-3 3 -3 3])
%Plotting direction of Velocity field 
% I have done this part extra, not included in the question
figure
streamslice(x, y, u, v, 2) 
axis tight
clear x y
% nature of the field 
syms x y z
d = diff (u,x) +diff (v,y); % continuity equation
c=curl ([x-4*y,-y-4*x,0], [x,y,z]); % curl of the velocity field 
if d==0
    disp ('fluid is incompressible')
else 
    disp ('fluid is not incompressible')
end
if c==[0;0;0]
disp('fluid is irrotational')
else 
    disp ('fluid is rotational')
end