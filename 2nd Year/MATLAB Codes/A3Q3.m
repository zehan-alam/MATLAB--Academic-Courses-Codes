clear all;
syms x y a b;
f=@(x,y) 2*x^2 + 6*x*y -5*y^2;

A=hessian(f,[x,y])/2;
Q=matlabFunction(transpose([x;y])*A*[x;y]);

if(simplify(f(a,b)))==simplify(Q(a,b))
    fprintf('Its a Quadratic\n')
else
    fprintf('Its not a Quadratic\n')
end

Q(2,1)