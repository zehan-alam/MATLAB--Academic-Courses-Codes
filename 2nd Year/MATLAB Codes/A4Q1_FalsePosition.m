clear all;
clc;
syms x;
f=@(x) cos(x)- x*exp(x);
a=0;
b=1;
eps=0.00001;

if(f(a)==0)
    fprintf('Root is %f',a);
    return;
elseif(f(b)==0)
    fprintf('Root is %f',b);
    return;
elseif(f(a)*f(b)>0)
    fprintf('Input new a and b');
    a=input('a= ');
    b=input('b= ');
end

step=0;
c=(a*f(b)-b*f(a))/(f(b)-f(a));
if(f(a)*f(c)<0)
    temp=b;
else
    temp=a;
end
fprintf('n\ta\t\t\t\tb\t\t\t\tc\t\t\t\t|x_n - x_n-1|\n')
while(abs(c-temp)>=eps)
    fprintf('%d\t%f\t\t%f\t\t%f\t\t%f\n',step,a,b,c,abs(temp-c))
    if(f(a)*f(c)<0)
        temp=b;
        b=c;
    else
        temp=a;
        a=c;
    end
    c= (a*f(b)-b*f(a))/(f(b)-f(a));
    step=step+1;
end
fprintf('%d\t%f\t\t%f\t\t%f\t\t%f\n',step,a,b,c,abs(temp-c))
fprintf('Root is = %f\n',c)