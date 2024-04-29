
function [p1,q1,pr,qr] = pdebc(x1,uL,xr,ur,t) % Boundary Conditions
    p1 = [0; uL(2)];
    q1 = [1; 0];
    pr = [ur(1)-1; 0];
    qr = [0; 1];
end
