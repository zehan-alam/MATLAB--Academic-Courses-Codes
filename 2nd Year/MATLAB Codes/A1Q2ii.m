% clear all;
% syms x y;
% f=@(x,y) x^2 -2*x*y +4*y^2 -4*x -2*y +24;
% Minimum=inf;
% Maximum=-inf;
% for i=0:0.01:4
%     for j=0:0.01:2
%         Fvalue= f(i,j);
%         Minimum=min(Minimum,double(Fvalue));
%         if(Minimum==double(Fvalue))
%             x_min=i;
%             y_min=j;
%         end
%         Maximum=max(Maximum,double(Fvalue));
%         if(Maximum==double(Fvalue))
%             x_max=i;
%             y_max=j;
%         end
%     end
% end
% fprintf('Minimum : %f at (%1.2f,%1.2f)\n',Minimum,x_min,y_min)
% fprintf('Maximum : %f at (%1.2f,%1.2f)\n',Maximum,x_max,y_max)




syms x y
f=@(x,y) x.^2-2.*x.*y+4.*y.^2-4.*x-2.*y+24;
fx=diff(f,x);
fy=diff(f,y);
[a b]=solve(fx==0,fy==0);
% line segment between (0,0) and (4,0) .
%we have y = 0, equation (1) becomes
fx1=diff(f(x,0));
x1=solve(fx1==0);
y1=0;
% line segment between (0,0) and (0,2)
%we have x =0,, equation (1) becomes
fy2=diff(f(0,y));
y2=solve(fy2==0);
x2=0;
% line segment between (0,2) and (4,2) 
%we have y = 2, equation (1) becomes
fx3=diff(f(x,2));
x3=solve(fx3==0);
y3=2;
% line segment between (4,2) and (4,0)
%we have x = 4, equation (1) becomes
fy4=diff(f(4,y));
y4=solve(fy4==0);
x4=0;
%Boundary Points
%(0,0) (4,0) (4,2) (0,2)
x=[x1 x2 x3 x4 0 4 4 0 a];
y=[y1 y2 y3 y4 0 0 2 2 b];
minimum=inf;
maximum=-inf;
for i=1:length(x)
    for j=i:i
        if f(x(i),y(j))<minimum
            minimum=f(x(i),y(j));
        end
        if f(x(i),y(j))>maximum
            maximum=f(x(i),y(j));
        end
    end
end
maximum
minimum