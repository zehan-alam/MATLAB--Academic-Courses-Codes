clear all;
A3_T(1,3)

u1=-2;
u2=2;
v1=-2;
v2=2;

a1=A3_T(u1,v1);
a2=A3_T(u1,v2);
a3=A3_T(u2,v1);
a4=A3_T(u2,v2);

X=[a1(1) a2(1) a4(1) a3(1) a1(1)];
Y=[a1(2) a2(2) a4(2) a3(2) a1(2)];

hold on
plot(X,Y,'-x')
scatter(X,Y,'r','filled')
grid on
xlabel('x');ylabel('y');
axis([-3 3 -3 3])
hold off