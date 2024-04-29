clear all;
u=[1,0,-1];
v=[2,0,2];
w=[0,5,0];

if(A3_InnerProduct(u,v)==0 && A3_InnerProduct(v,w)==0 && A3_InnerProduct(w,u)==0)
    fprintf('They are orthogonal\n')
else
    fprintf('They are not orthogonal\n')
end

u1=A3_Orthonormalize(u);
fprintf('|V1|= %f\n',A3_InnerProduct(u1,u1))

v1=A3_Orthonormalize(v);
fprintf('|V2|= %f\n',A3_InnerProduct(v1,v1))

w1=A3_Orthonormalize(w);
fprintf('|V3|= %f\n',A3_InnerProduct(w1,w1))