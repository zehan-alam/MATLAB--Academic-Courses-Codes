clc 
clear all
syms u(x,y) v(x,y) k z psi(x,y) phi(x, y) 
u= (k^2* (-y)) / (x^2+y^2);
v= (k^2*x)/ (x^2+y^2) ; 
d(x,y)=diff(u, x) +diff(v,y) ;
if d==0
    disp ('the motion is possible tor an incompressible fluid')
else 
    disp ('the motion is not possible for an incompressible fluid')
end
%% 3 (ii)
if d==0
    disp ('stream function exist')
    psi(x,y) = int (u,y) +int (-v-diff (int (u, y) , x) , x) ;
    disp (psi(x,y))
else 
    disp ('stream function does not exist')
end

c = curl ([u,v,0], [x,y,z]);
if simplify(c)==[0;0;0]
    disp ('velocity potential exist')
    phi(x,y) = int (u, x) +int (v-diff (int (u, x) , y) , y) ;
    disp (phi(x,y))
    % plotting equipotential lines 
    phi (x,y)= subs (phi (x,y) , k, 1) ;
    figure 
    for i=-2:2
        g1=ezplot(phi (x, y) +i) ;
        set (g1, {'Color', 'Linestyle'},{'red','--'}) 
        hold on
    end
    hold off 
    title ('equipotential line')
% 3(iv) complete 
else 
    disp ('velocity potential does not exist')
end