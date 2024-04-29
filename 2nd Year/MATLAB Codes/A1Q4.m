clear all;
syms x y;
f=@(x,y) 16-x^2 -2*y^2;
a=2;
b=2;
n=50;
dx=a/n;
dy=b/n;
dA=dx*dy;
area= 0;
for i=0:n-1
    for j=0:n-1
    area=area+ f((dx*i +dx*(i+1))/2,(dy*j +dy*(j+1))/2)*dA;
    end
end
fprintf('Area= %f\n',area)