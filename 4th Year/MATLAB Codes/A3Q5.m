clc 
clear all
syms u(x,y,z) v(x,y,z) w(x,y,z) psi(x,y,z) c1 c2 
u(x,y,z) = 2*x; 
v(x,y,z) = -y; 
w(x,y,z) = -z;
s1=simplify(int(1/u,x)-int(1/v,y)==c1); 
s2=simplify(int (1/u,x) -int (1/w, z) ==c2) ;
[c11 c22]=solve(subs(s1, {x, y, z}, {1,1,1}),subs(s2,{x,y,z},{1,1,1}), [c1,c2]);
s1=subs(s1,c1, c11);
s2=subs(s2, c2, c22);
disp(s1)
disp(s2)
% 5 (II) not sure
[X, Y, Z]=meshgrid(-3:.5:3,-3:.5:3,-3:.5:3);
figure
streamslice(X, Y, Z, subs(u, {x, y, z}, {X, Y, Z}), subs(v, {x,y, z}, {X, Y, Z}) , subs (w, {x, y, z}, {X, Y, Z}) , 1, 1,1)
axis tight