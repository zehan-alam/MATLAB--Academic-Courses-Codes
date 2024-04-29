clear all;
tspan = [0 40];

disp('--------------- a ---------------')
% z= m(1)
f= @(t,m) 2*m(1) - m(1)^2;
[t, Y] = ode45(f,tspan,0.1);
grass_a = Y(end)

% plot a
figure()
plot(t, Y);
xlabel('Time');ylabel('Population');title('Q-A');
legend('Grass');



%% 
disp('--------------- b ---------------')
% y = m(1), z=m(2)
f= @(t,m) [-m(1) + 2*m(1)*m(2); 2*m(2) - m(2)^2 - m(1)*m(2)];
y0 = [0.1 0.1];
[t, Y] = ode45(f, tspan,y0);
sheep_b = Y(end,1)
grass_b = Y(end,2)

% lineplot b
figure()
plot(t, Y);
xlabel('Time');ylabel('Population');title('Q-B (Line Graph)');
legend('Sheep', 'Grass');
% phase graph b
figure() 
for a=0.5:0.5:2.5
    for b=0.5:0.5:2.5
        y0=[a b]; 
        hold on 
        [t ,sol]= ode45(f,tspan,y0); 
        plot(sol(:,1),sol(:,2));
        xlabel('Sheep');ylabel('Grass');title('Q-B (Phase Graph)');
    end 
end
hold off

%%
disp('--------------- c ---------------')
%x= m(1), y=m(2), z=m(3)
f = @(t, m) [-m(1) + m(1)*m(2); -m(2) + 2*m(2)*m(3) - m(1)*m(2); 2*m(3) - m(3)^2 - m(2)*m(3)];
y0 = [0.1 0.1 0.1];
[t, Y] = ode45(f, tspan, y0);
wolf_c = Y(end,1)
sheep_c = Y(end,2)
grass_c = Y(end,3)

% plot c
plot(t, Y)
xlabel('Time');ylabel('Population');title('Q-C (Line Graph)');
legend('Wolf', 'Sheep','Grass');
% phase graph c
figure() 
for a=0.5:0.5:2.5
    for b=0.5:0.5:2.5
        for c=0.5:0.5:2.5
            y0=[a b c]; 
            hold on 
            [t ,sol]= ode45(f,tspan,y0); 
            plot3(sol(:,1),sol(:,2),sol(:,3));
            xlabel('Wolf');ylabel('Sheep');zlabel('Grass');title('Q-C (Phase Graph)');
        end
    end 
end
hold off


%%
disp('--------------- d ---------------')
if grass_b < grass_c
    benefit_to_grass = 'Yes, introduction of wolves benefits the grass.';
else
    benefit_to_grass = 'No, introduction of wolves does not benefit the grass.';
end
disp(benefit_to_grass)