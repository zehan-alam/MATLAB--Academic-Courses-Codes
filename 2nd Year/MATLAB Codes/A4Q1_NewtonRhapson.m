clear all;
clc;
syms x;
f=@(x) cos(x)- x*exp(x);
a=0;
N=100;
eps=0.00001;

if(f(a)==0)
    fprintf('Root is %f',a);
    return;
end

g=matlabFunction(diff(f,x));
if(g(a)==0)
    fprintf('Divided by zero');
    return;
end  

step=0;
temp=0;
b=a- (f(a)/g(a));
fprintf('n\ta\t\t\t\tb\t\t\t\t|x_n - x_n-1|\n')
while(abs(b-temp)>=eps)
    fprintf('%d\t%f\t\t%f\t\t%f\n',step,a,b,abs(temp-b))
    temp=b;
    a=b;
    b=a- (f(a)/g(a));
    if(step>N)
        fprintf('Not Converging');
        return;
    end
    step=step+1;
end
fprintf('%d\t%f\t\t%f\t\t%f\n',step,a,b,abs(temp-b))
fprintf('Root is = %f\n',b)