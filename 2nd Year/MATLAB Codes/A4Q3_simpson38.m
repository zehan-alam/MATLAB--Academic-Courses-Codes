clear all;
syms x;
f=@(x) 2/(x^2 +4);
a=0;b=2;
sum=(f(a)+f(b));
n=100;
h=(b-a)/n;
for i=1:n-1
    if(mod(i,3)==0)
        sum=sum+ 2*f(a+ i*h);
    else
        sum=sum+ 3*f(a+ i*h);
    end
end
fprintf('Integral value = %f\n',3*h*sum/8)