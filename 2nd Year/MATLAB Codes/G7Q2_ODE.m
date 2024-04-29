clear all;
syms P(t) t q;
a=dsolve(diff(P)==P*(0.1- P/10^7),P(0)==5000);
LimitingValue=subs(a,t,inf)
b=solve(a==LimitingValue/2,t);
fprintf('t= %f month\n',double(b))
growth_rate=q*(0.1- q/10^7);
dc=diff(growth_rate,q);
d=solve(dc==0,q); %can't solve
highest_rate= double(solve(a==d,t))

t1=(0:500);
asolve=subs(a,t,t1);
plot(t1,asolve)