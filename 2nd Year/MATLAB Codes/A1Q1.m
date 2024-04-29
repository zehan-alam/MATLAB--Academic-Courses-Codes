clear all;clc;
syms x f(x);
f(x)= 2- x^2;
a=0;b=2;
n=100;
h= (b-a)/n;
%right end point
sum=0;
for i=1:n
    sum=sum+ f(a+ (i*h));
end
fprintf('Using right end point area is = %3.2f\n',double(sum)*h)
%left end point
sum=0;
for i=0:n-1
    sum=sum+ f(a+ i*h);
end
fprintf('Using left end point area is = %3.2f\n',double(sum)*h)
%mid point
sum=0;
for i=0:n-1
    sum=sum+ f((a+ i*h +a+ (i+1)*h)/2);
end
fprintf('Using mid point area is = %3.2f\n',double(sum)*h)