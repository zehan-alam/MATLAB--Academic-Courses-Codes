function [d]=D(f)
syms x y;
fxx=diff(f,x,2);
fyy=diff(f,y,2);
fx=diff(f,x);
fxy=diff(fx,y);
d=fxx*fyy - fxy^2;
end