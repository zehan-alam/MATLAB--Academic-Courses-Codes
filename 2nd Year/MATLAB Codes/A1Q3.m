clear all;
syms x y;
f=@(x,y) x*y -x^3 -y^2;
fx=diff(f,x);
fy=diff(f,y);
fxx=diff(fx,x);
fyy=diff(fy,y);
fxy=diff(fx,y);
D=fxx*fyy -fxy^2;
[a,b]=solve(fx==0,fy==0);
a=a(a==real(a));
b=b(b==real(b));
L=length(a);
fprintf('|Critical Values\t\t|\tValue of f\t|\tfxx\t\t\t|\tD\t\t\t|\tConclusion\n')
fprintf('-------------------------------------------------------------------------------------------\n')
for i=1:L
    Dsolve=subs(D,[x,y],[double(a(i)),double(b(i))]);
    fxx_values=subs(fxx,[x,y],[double(a(i)),double(b(i))]);
    Fvalue(i)=f(double(a(i)),double(b(i)));
    if(Dsolve == 0)
        fprintf('|(%f,%f)\t|\t%f\t|\t%f\t|\t%f\t|\tNo conclusion\n',double(a(i)),double(b(i)),double(Fvalue(i)),double(fxx_values),double(Dsolve))
    elseif(Dsolve < 0)
        fprintf('|(%f,%f)\t|\t%f\t|\t%f\t|\t%f\t|\tSaddle\n',double(a(i)),double(b(i)),double(Fvalue(i)),double(fxx_values),double(Dsolve))
    else
        if(fxx_values>0)
            fprintf('|(%f,%f)\t|\t%f\t|\t%f\t|\t%f\t|\tMinimum\n',double(a(i)),double(b(i)),double(Fvalue(i)),double(fxx_values),double(Dsolve))
        elseif(fxx_values<0)
            fprintf('|(%f,%f)\t|\t%f\t|\t%f\t|\t%f\t|\tMaximum\n',double(a(i)),double(b(i)),double(Fvalue(i)),double(fxx_values),double(Dsolve))
        end
    end
end

hold on
[A B]=meshgrid(-1:.1:1,-1:.1:1);
C=A.*B -A.^3 -B.^2;
surf(A,B,C);
scatter3(a,b,Fvalue,'r','filled');
view(3)
hold off