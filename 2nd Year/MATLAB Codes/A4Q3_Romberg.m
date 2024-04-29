clear;
syms x
f=@(x) 2./(x.^2+4);
N = 10;
R = zeros(N+1,N+1);
a = 0;
b = 1;
h = b - a;
toll = 1e-6;
step=1;
R(0+1,0+1) = (h/2)*(f(a)+f(b));
fprintf('step\t\tR(n,n)\t\t|R(n-1,n-1) - R(n,n)|')
fprintf('\n%d\t\t%2.6f\t\t-----',step,R(0+1,0+1))
for i = 1:N
    h = h/2;
    step=step+1;
    % This calculates the trapezoidal rule with intervals of width h
    R( i + 1, 1 ) = (h/2)*(f(a) + 2*sum( f( (a + h):h:(b - h) ) ) + f(b));

    for j = 1:i
        R(i+1,j+1) = R(i+1,j)+((R(i+1,j)-R(i,j))/(4^(j)-1));
    end
    fprintf('\n%d\t\t%2.6f\t\t%2.10f',step,R(i+1,j+1),abs( R(i+1,j+1)-R(i,j) ))
    if abs( R(i+1,j+1)-R(i,j) ) < toll
       break;
    elseif i==N+1
       error( 'Romberg integration does not converge' );
    end
end

fprintf('\n\nRomberg Integration : %2.6f\n',R(i+1,j+1))

R(1:step,1:step)

AIntegral=double(int(f,x,a,b));
fprintf('Actual Integral : %2.6f\n',AIntegral)