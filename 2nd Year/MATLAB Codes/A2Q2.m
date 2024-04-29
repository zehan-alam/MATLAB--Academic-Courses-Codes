clear all;
syms x y(x);
f=@(x,y) x*y;
a=dsolve(diff(y,x)==x*y,y(0)==1);
[t1,y1]=ode23(f,[0,10],1);
[t2,y2]=ode45(f,[0,10],1);
asol=subs(a,x,t1);
hold on
plot(t1,y1,':r');  
plot(t2,y2,'--b');
plot(t1,asol,'g');
xlabel('x');ylabel('y(x)');grid on;
hold off