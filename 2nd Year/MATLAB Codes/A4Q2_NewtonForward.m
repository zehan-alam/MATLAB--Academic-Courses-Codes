clear all;
syms X;
x=[140 150 160 170 180 190];
y=[3.685 4.854 6.302 8.076 10.225 11.055];
h=x(2)-x(1);
n=length(x);

A(:,1)=y';
for j=2:n
    for i=1:n-j+1
        A(i,j)=A(i+1,j-1)-A(i,j-1);
    end
end
y0=A(1,:);
for i=1:n
    fprintf('\n  %f',x(i))
    for j=1:n-i+1
        fprintf('\t  %f',A(i,j))
    end
end

f=y0(1);
P=(X-x(1))/h;
for i=0:n-2
    f1=1;
    for j=0:i
        f1=f1* (P-j);
    end
    f1=f1/factorial(i+1);
    f=f+ f1*y0(i+2);
end
simplify(f)
fprintf('f(142)= %f\n',double(subs(f,X,142)))