clear all;

i=1;j=1;
for u=-2:4:3
    for v=-2:4:3
        [X(i),Y(j)]=A3_T(u,v);
        j=j+1;
        i=i+1;
    end
end
X
Y
 
hold on
plot([X(1) X(2) X(4) X(3) X(1)],[Y(1) Y(2) Y(4) Y(3) Y(1)],'-x')
scatter(X,Y,'r','filled')
grid on
xlabel('x');ylabel('y');
axis([-3 3 -3 3])
hold off