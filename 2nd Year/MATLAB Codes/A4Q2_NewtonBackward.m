clear all;
syms X;
x=[1974 1976 1978 1980 1982];
y=[40 43 48 52 57];
h=2;
n=length(x);

A(:,1)=y';
for j=2:n
    for i=1:n-j+1
        A(i,j)=A(i+1,j-1)-A(i,j-1);
    end
end
for i=1:n
    fprintf('\n  %f',x(i))
    for j=1:n-i+1
        fprintf('\t  %f',A(i,j))
    end
end

for i=1:n
    y0(i)=A(n-i+1,i);
end
f=y0(1);
P=(X-x(n))/h;
for i=0:n-2
    f1=1;
    for j=0:i
        f1=f1*(P+j);
    end
    f1= f1/factorial(i+1);
    f=f+ f1*y0(i+2);
end
simplify(f)
fprintf('1979: %f\n',double(subs(f,X,1979)))