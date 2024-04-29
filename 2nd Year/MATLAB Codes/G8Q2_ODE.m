syms y(x) x;
f=@(x,y)2*y*x +1;
a=dsolve(diff(y)==2*y*x +1,y(0)==3)
X=(0:.01:2);
y1=subs(a,x,X);
[X,y2]=ode23(f,X,3);
[X,y3]=ode45(f,X,3);
plot(X,y1,'--b',X,y2,':g',X,y3,'r')
