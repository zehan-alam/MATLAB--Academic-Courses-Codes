clear all;
u=[3,-2];
v=[4,5];
w=[-1,6];
fprintf('<u,v> = %f\n',A3_InnerProduct(u,v))

if (A3_InnerProduct(u+v,w)==A3_InnerProduct(u,w)+A3_InnerProduct(w,v))
    fprintf('Verified\n')
else
    fprintf('Not Verified\n')
end