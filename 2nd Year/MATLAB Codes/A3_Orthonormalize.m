function orthonormalize= A3_Orthonormalize(u)
u_value=0;
for i=1:length(u)
    u_value=u_value+ u(i)^2;
end
orthonormalize= u/sqrt(u_value);
end