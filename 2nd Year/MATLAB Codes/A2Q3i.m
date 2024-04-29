clear all;
syms A(t) r Ao;
a=dsolve(diff(A)+ r*A/100 ==41*r,A(0)==Ao)
b=solve(subs(a,t,0)==Ao,r)