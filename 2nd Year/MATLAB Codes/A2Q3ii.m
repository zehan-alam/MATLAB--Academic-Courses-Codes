clear all;
syms Q(t) Qo r;
a=dsolve(diff(Q)==r*Q,Q(0)==Qo);
b=solve(subs(a,t,1500)==Qo/2,r);
c=subs(a,[t,r],[4500,b]);
d=c/Qo *100
e=solve(subs(a,r,b)==Qo/10,t)