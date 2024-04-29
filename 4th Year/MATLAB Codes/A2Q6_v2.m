clear all 
tspan = [0 20];
y0=[-8,8,27];
sigma=10; rho=28; beta=8/3; 
% x=y(1), y=y(2), z=y(3)
odefun=@(t,y) [sigma.*(-y(1)+y(2));
    rho.*y(1)-y(2)-y(1).*y(3);
    y(1).*y(2)-beta.*y(3)];

%trajectory 
figure() 
[t ,sol]=ode45(odefun,tspan,y0); 
for j=1:3 
    subplot(1,3,j),plot(t,sol(:,j)) 
end 

%Phase plane 
figure()
plot3(sol(:,1),sol(:,2),sol(:,3)) 

%% stability 
clear y 
syms x y lemda z 
f=@(x,y,z) sigma.*(-x+y);
g=@(x,y,z) rho.*x-y-x.*z;
h=@(x,y,z) x.*y-beta.*z;
[u,v,w]= solve(f(x,y,z)==0,g(x,y,z)==0,h(x,y,z)==0);
jac(x,y,z) = jacobian([f(x,y,z),g(x,y,z),h(x,y,z)],[x,y,z]);

%Third critical point is negative.So we will check upto 2nd point.Loop(1-2) 
for i=1:length(u) % Need to fix
    z=eig(jac(u(i),v(i),w(i))); 
    %double is used to express the number as floating point 
    eval=double(z) 
    if real(eval)==0 & imag(eval)~=0 
        z=double([u(i) v(i) w(i)]) 
        fprintf('Stable Centre\n') 
    elseif real(eval)<0 
        z=double([u(i) v(i) w(i)]) 
        fprintf('Asym stable.\n') 
    elseif real(eval)>0
        z=double([u(i) v(i) w(i)]) 
        fprintf('Unstable.\n') 
    elseif real(eval(1))|real(eval(2))|real(eval(3))<0 & real(eval(1))|real(eval(2))|real(eval(3))>0 
        z=double([u(i) v(i) w(i)]) 
        fprintf('saddle\n') 
    end 
end