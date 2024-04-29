clear all;
syms X;
x=[0 0.2 0.4 0.6 0.8];
y=[1.00000 1.22140 1.49182 1.82212 2.22554];
n=length(x);

TDD(:,1)=y';
for j=2:n
    for i=1:n-j+1
        TDD(i,j)=(TDD(i+1,j-1)-TDD(i,j-1))/(x(i+j-1)-x(i));
    end
end
a0=TDD(1,:);
for i=1:n
    fprintf('\n  %f',x(i))
    for j=1:n-i+1
        fprintf('\t  %f',TDD(i,j))
    end
end
fprintf('\n')

f=a0(1);
for i=0:n-2
    f1=1;
    for j=0:i
        f1=f1 *(X-x(j+1));
    end
    f=f+ f1*a0(i+2);
end
simplify(f)
fprintf('f(.65)= %f\n',double(subs(f,X,.65)))