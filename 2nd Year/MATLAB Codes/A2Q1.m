clear all;
syms x f(x);
f(x)= x^2 *exp(x) -5*x^3;
int(f,x)
diff(f,x,1)
diff(f,x,2)

clear all;
syms x y z f(x,y,z);
f(x,y,z)= x^2 *exp(y) -5*z^2;
int(f,x)
diff(f,z,2)