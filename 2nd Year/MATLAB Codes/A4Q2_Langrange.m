clear all;
syms X;
x=[0 0.2 0.4 0.6 0.8];
y=[1.00000 1.22140 1.49182 1.82212 2.22554];
n=length(x);


f=0;
for i=1:n
    l=1;
    for j=1:n
        if(i==j)
            continue;
        end
        l=l* ((X-x(j))/(x(i)-x(j)));
    end
    f=f+ l*y(i);
end
simplify(f)
fprintf('f(.65)= %f\n',double(subs(f,X,.65)))