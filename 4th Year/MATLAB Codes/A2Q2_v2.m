clear all;
syms P jac(P)
r=1;k=5;

% Stability analysis 
fp = solve(P+ r.*P.*(1-(P./k))==P,P)
jac(P) = jacobian(P+ r.*P.*(1-(P./k)),P)
for i=1:length(fp)
    eval = eig(jac(fp(i)));
    if eval>0 
        fprintf('%i is an unstable fixed point\n',fp(i)) 
    elseif eval<0
        fprintf('%i is a stable fixed point\n',fp(i))
    else
        fprintf('%i is a stable point\n',fp(i))
    end 
end 

%% plot trajectory 
figure()
p(1)=.5;
n=100;
time=1:n;
for i=1:n-1 
    p(i+1)= p(i)+ r.*p(i).*(1- (p(i)./k));
end
plot(time,p)

%% plot varying r 
figure()
j=1; 
for r=1:4
    p(1)=.5; 
    for i=1:n-1 
        p(i+1)=p(i)+r.*p(i).*(1-(p(i)./k)); 
    end 

    subplot(4,1,j);
    j=j+1; 
    plot(time,p)
    title(sprintf('r= %4.2f',r))
    xlim([0 n])
end