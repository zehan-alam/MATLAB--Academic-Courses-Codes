clear all 
a=10; b=1; 

%S=y(1), I=y(2), R=y(3)
f=@(t,y) [-a.*y(1).*y(2); 
    a.*y(1).*y(2)-b.*y(2); 
    b.*y(2)];
s0=0.9; i0=0.1; r0=0; 
y0= [s0 i0 r0]; 
[t ,sol]=ode45(f,[0 10],y0); 


figure() 
p=plot(t,sol); 
set(p,'linewidth',3) 
legend('Susceptible','Infected','Recovered') 
hold on 

% Increasing infectious coefficient 
for a=[15 20 25 30] 
    f=@(t,y) [-a.*y(1).*y(2); 
        a.*y(1).*y(2)-b.*y(2); 
        b.*y(2)];
    [t ,sol]=ode45(f,[0 10],y0); 
    plot(t,sol); 
    legend('Susceptible','Infected','Recovered') 
end