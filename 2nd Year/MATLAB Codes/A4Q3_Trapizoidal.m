clear all;
syms x;
f=@(x) 2/(x^2 +4);
a=0;b=2;
sum=(f(a)+f(b))/2;
n=100;
h=(b-a)/n;
for i=1:n-1
   sum=sum+ f(a+ i*h);
end
fprintf('Integral value = %f\n',h*sum)