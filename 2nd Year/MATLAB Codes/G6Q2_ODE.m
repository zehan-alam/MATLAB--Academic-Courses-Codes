syms T(t) t k;
a=dsolve(diff(T)==k*(T-60),T(0)==90);
b=solve(subs(a,t,5)==80,k);
c=subs(a,k,b);
fprintf('a) At the end of 10 min is %5.2f degree\n',double(subs(c,t,10)))
d=solve(c==70,t);
fprintf('b) t= %f min\n',double(d))