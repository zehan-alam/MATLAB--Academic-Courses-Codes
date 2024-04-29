syms P(t) t;
a=5;
b=2;
h=4;
Po=1.1;
a=dsolve(diff(P)==P*(a- b*P) -h,P(0)==Po);
X=(0:.05:2);
Y=subs(a,t,X);
hold on
plot(X,Y)
hold off