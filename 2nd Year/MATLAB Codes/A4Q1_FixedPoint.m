clear all;
clc;
syms x;
f=@(x) cos(x)- x*exp(x);
a=0;
eps=0.00001;
check=true;

while(check)
    p=input('Input your function form= ');
    phi=matlabFunction(p);
    dphi=matlabFunction(diff(phi,x));
    if(dphi(a)>=1)
        p=input('Input your function form= ');
    else
        check=false;
    end
end

step=0;
temp=inf;
fprintf('n\ta\t\t\t\t|x_n - x_n-1|\n')
while(abs(temp-a)>=eps)
    temp=a;
    a=phi(a);
    fprintf('%d\t%f\t\t%f\n',step,a,abs(temp-a))
    step=step+1;
end
fprintf('Root is %f\n',a)