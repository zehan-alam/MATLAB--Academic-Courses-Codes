clc;
clear all;

syms x y
f=@(x,y) x.^2.*y-y+1;
a1=0;
b1=6;
a2=0;
b2=6;
n=100;
h1=(b1-a1)/n;
h2=(b2-a2)/n;
%midpoint
V1=0;
for i=a1+(h1/2):h1:b1-(h1/2)
    for j=a2+(h2/2):h2:b2-(h2/2)
        V1=V1+f(i,j)*h1*h2;
        f(i,j)
    end
end
V1
%left point
V2=0;
for i=a1:h1:b1-h1
    for j=a2:h2:b2-h2
        V2=V2+f(i,j)*h1*h2;
    end
end
V2
%r8 point
V3=0;
for i=a1+h1:h1:b1
    for j=a2+h2:h2:b2
        V3=V3+f(i,j)*h1*h2;
    end
end
V3