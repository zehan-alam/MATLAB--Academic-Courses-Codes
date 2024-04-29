%% i
clear all
syms y(t) s X F
F = laplace(diff(y(t),t,2) +4*diff(y(t),t,1) +4*y(t)==3*exp(-3*t),s);
F = subs(F, laplace(y(t), t, s),X)
F = subs(F, {'y(0)','D(y)(0)'}, {1, -1});
X = solve(F,X);
x = ilaplace(X);
fplot(x)

%% ii
syms y(t) s X F c x
F = laplace(diff(y(t),t,2)+y(t)==-t,s);
F = subs(F,{laplace(y(t), t, s),y(0),subs(diff(y(t), t), t, 0)},{X,0,c});
X = solve(F,X);
x = ilaplace(X);
f = x;
f = subs(f,t,1);
c1 = solve(f==0,c);
x = subs(x,c,c1);
ezplot(x)
axis([-2 2 -2 2])

%% iii
syms y(t) s X f(t)
f(t) = 2*heaviside(6-t)+t*heaviside(t-6) *heaviside(10-t)+4*heaviside(t-10)+ ...
2* (10-6)*heaviside(6-t) *heaviside(t-6) -3* (10-6)*heaviside(10-t) *heaviside(t-10);
F = laplace(diff(y,t,2)+ 3*diff(y,t,1) +2*y == f,s);
F = subs(F,{laplace(y(t), t, s),y(0),subs(diff(y(t), t), t, 0)},{X,0,-2});
X = solve(F,X);
x = ilaplace(X);
fplot(x)
xlim([0 10])

%% iv
syms y(t) s X
F = laplace(diff(y,2) +2*diff(y,1) +10*y == 1+ 5*dirac(t-5),s);
F = subs(F,{laplace(y(t), t, s),y(0),subs(diff(y(t), t), t, 0)},{X,1,2});
X = solve(F,X);
x = ilaplace(X);
fplot(x)

%% v
syms x1(t) x2(t) X1 X2
ode1 = diff(x1)==3*x1 - 3*x2 + 2;
ode2 = diff(x2)==-6*x1 -t;

F1 = laplace(ode1,s);
F2 = laplace(ode2,s);

F1 = subs(F1,{laplace(x1(t), t, s),laplace(x2(t), t, s),x1(0),x2(0)},{X1,X2,1,-1})
F2 = subs(F2,{laplace(x1(t), t, s),laplace(x2(t), t, s),x1(0),x2(0)},{X1,X2,1,-1})

[X1,X2] = solve([F1,F2],[X1,X2]);
x1 = ilaplace(X1)
x2 = ilaplace(X2)
hold on
fplot(x1)
fplot(x2)
hold off