clear all 
tspan = [0 200];
y0 = [0.9 0.9];
r=2/3; a=4/3; b=1 ; m=0.1;

% x= y(1), y=y(2)
odefun= @(t,y) [r.*y(1)-a.*y(1).*y(2); b.*y(1).*y(2)-m.*y(2)];
[t ,sol]= ode45(odefun,tspan,y0); 
plot(t,sol);
legend('prey','predator'); 


%% stability 
syms x y
f(x,y) = r.*x-a.*x.*y;
g(x,y)= b.*x.*y-m.*y;
[u,v]= solve(f(x,y)==0,g(x,y)==0);
jac = jacobian([f,g],[x,y]);

for i=1:2 
    eval=double(eig(jac(u(i),v(i))));
    if real(eval(1))<0 && real(eval(2))<0 
        fprintf('(%5.2f , %5.2f ) are stable\n',u(i),v(i))
    elseif real(eval(1))>0 || real(eval(2))>0 
        fprintf('(%5.2f , %5.2f ) are unstable\n',u(i),v(i))
    else
        fprintf('(%5.2f , %5.2f ) are saddle\n',u(i),v(i))
    end
end

%% Phase plane 
figure() 
for a=0.9:0.4:1.8
    for b=0.9:0.4:1.8
        y0=[a b]; 
        hold on 
        [t ,sol]= ode45(odefun,tspan,y0); 
        plot(sol(:,1),sol(:,2)); 
    end 
end