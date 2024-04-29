%% i
syms y(x)
sol = dsolve(diff(y,x)==x^2 - 2*y, y(-3)==2);
figure()
fplot(sol, 'LineWidth',2)

%% ii
figure()
[x,y]= meshgrid(-4:0.2:4,-4:0.2:4);
m = x^2 - 2*y;
U = 1./sqrt (1+m.^2);
V = m./sqrt (1+m.^2);
quiver(x,y,U,V)
line([0,0],ylim, 'color', 'k')
line(xlim, [0,0], 'color','k')
hold on
f = @(x,y) x^2 - 2*y;
[x,y]= ode45(f,[0,4],-2:2:6);
plot (x,y, 'Linewidth',2)
hold off
xlim([-4,4])
ylim([-4,4])
%% iii
f = @(u,v) u^2 -2*v;
[u,v]= ode45(f, [0,4],2) ; 
plot (u,v, 'Linewidth' ,2) 
axis on

%% iv
f = @(x,y) x^2 -2*y;
u(1) = -3;
v(1) = 2;
h=.1;
for i=1:100-1
    v(i+1) = v(i)+ h*f(u(i),v(i));
    u(i+1) = u(i)+h;
end
figure()
plot(u,v)