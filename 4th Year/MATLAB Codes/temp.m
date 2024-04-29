clc 
clear all

[x, y, z]=meshgrid(-3:.5:3,-3:.5:3,-3:.5:3);
u= 2*x; 
v= -y; 
w= -z;

[verts averts] = streamslice(x,y,z,u,v,w,1,1,1);
streamline([verts averts]);
hold on; 
view(30,50);
camlight; material([.5 1 0])