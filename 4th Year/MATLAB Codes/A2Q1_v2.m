clear all;
r=.48;
k=15;
dB=@(t,B) r.*B.*(1-(B./k));

%% Solution 
for B0 = .1:0.5:5
    [t ,sol]= ode45(dB,[0,25],B0);
    hold on 
    plot(t,sol);
end
hold off;