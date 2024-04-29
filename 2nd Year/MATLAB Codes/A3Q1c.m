clear all;
format rational;
v1=[1 1 1];
v2=[0 1 1];
v3=[0 0 1];
v=[v1;v2;v3]
u(1,:)=v(1,:);
for i=1:length(u)-1
    proj=[0 0 0];
    L=size(u);
    for j=1:L
        proj=proj+ (A3_InnerProduct(v(i+1,:),u(j,:))/A3_InnerProduct(u(j,:),u(j,:)))*u(j,:);
    end
    u(i+1,:)=v(i+1,:)-proj;
end
u
w1=A3_Orthonormalize(u(1,:))
w2=A3_Orthonormalize(u(2,:))
w3=A3_Orthonormalize(u(3,:))