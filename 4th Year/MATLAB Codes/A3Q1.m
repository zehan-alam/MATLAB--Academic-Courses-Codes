%% (i)
clc 
clear all
syms x y z 
d = divergence([x,y], [x,y]);
c = curl([x,y,0], [x,y,z]);
if d>0 
    disp ('fluid is divergent')
elseif d<0
    disp ('fluid is convergent')
else 
    disp ('fluid is solinoidal')
end

if simplify(c)==[0;0;0]
    disp ('fluid is irrotational')
else 
    disp ('fluid is rotational')
end

clear x y
[x,y]=meshgrid([-3:.3:3 -3:.3:3]);
u=x;
v=y;
quiver (x,y,u,v,1) 
axis tight


%% (ii)
clc 
clear all 
syms x y z
d=divergence ( [-x, -y], [x, y]);
c=curl ([-x,-y, 0], [x, y, z]);
if d>0
    disp('fluid is divergent')
elseif d<0
    disp('fluid is convergent')
else 
    disp('fluid is solinoidal')
end
if simplify(c)==[0;0;0]
    disp ('fluid is irrotational')
else 
    disp('fluid is rotational')
end

clear x y
[x,y]=meshgrid([-3:.3:3 -3:.3:3]);
u=-x;
v=-y;
quiver (x, y, u, v, 1) 
axis tight


%% (iii)
clc 
clear all
syms x y z 
d=divergence ([x, -y], [x,y]) 
c=curl ([x, -y, 0], [x, y, z]) 
if d>0
    disp ('fluid is divergent')
elseif d<0
    disp ('fluid is convergent')
else
    disp ('fluid is solinoidal')
end
if simplify(c)==[0;0;0]
    disp('fluid is irrotational')
else 
    disp('fluid is rotational')
end
clear x y 
[x,y]=meshgrid([-3:.3:3 -3:.3:3]);
u=x; 
v=-y;
quiver (x, y,u,v, 1) 
axis tight


%% (iv)
clc 
clear all 
syms x y z
d=divergence([y, 0, 0], [x, y, z]) 
c=curl([y, 0,0], [x,y,z]) 
if d>0
    disp ('fluid is divergent')
elseif d<0
    disp ('fluid is convergent')
else 
    disp ('fluid is solinoidal')
end
if simplify(c)== [0;0;0]
    disp ('fluid is irrotational')
else 
    disp ('fluid is rotational')
end
clear x y
[x,y]=meshgrid([-3:.3:3 -3:.3:3]);
u=y;
v=zeros (length (x), length (y) );
figure()
quiver (x,y, u,v,1) 
axis tight