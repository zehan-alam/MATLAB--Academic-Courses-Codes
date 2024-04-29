clear all;
syms x y;
f=@(x,y) x^2 +y^2 +4*x -6*y +18;
Minimum=inf;
for i=0:0.01:2
    for j=2:0.01:4
        Fvalue= f(i,j);
        Minimum=min(Minimum,double(Fvalue));
        if(Minimum==double(Fvalue))
            x_axis=i;
            y_axis=j;
        end
    end
end
fprintf('Minimum : %f at (%1.2f,%1.2f)\n',Minimum,x_axis,y_axis)