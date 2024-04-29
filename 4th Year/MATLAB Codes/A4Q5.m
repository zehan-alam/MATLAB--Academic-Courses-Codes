clc 
clear all
randn('state', 100) 

T = 1;
N = 2^8;
dt = T/N;
dW = sqrt (dt) *randn (1,N) ; 
W = cumsum (dW);

mu = 2;
sigma = 1;
Xzero = 1;


Xtrue = Xzero*exp((mu -.5*sigma^2)*([dt:dt:T])+ sigma*W);
figure
plot ([0:dt:T], [Xzero,Xtrue],'m-') 
hold on


% Euler Mrayama
R = 4;
Dt = R*dt; % length of subinterval for Euler Marayma
L = N/R; % number of subintervals for Euler maryama

XMM = zeros (1, L); % defining an array to save Euler Marayama Value
Xtemp = Xzero;

% f(x) = mu*x and g (x) = sigma*X and g'(x) = sigma
for j = 1:L
    Winc = sum (dW (R* (j-1) +1:R*j)) ; % BM increment dw (j) =W(j) -W(j-1)
    Xtemp = Xtemp+ mu*Dt*Xtemp + sigma*Xtemp*Winc + .5*sigma^2*Xtemp*(Winc^2 - Dt);
    XMM (j) = Xtemp;
end

plot ([0:Dt:T], [Xzero, XMM], 'r--*') % remember X (0) =1=Xzero
hold on

Xem = zeros (1, L); % defining an array to save Euler Marayama Value
Xtemp = Xzero;

% f(x) = mu*x and g (x) = sigma*X
for j = 1:L
    Winc = sum (dW (R* (j-1) +1:R*j)) ; % BM increment dw (j) =W(j) -W(j-1)
    Xtemp = Xtemp+ mu*Xtemp*Dt+ sigma*Xtemp*Winc;
    Xem (j) = Xtemp;
end

plot ([0:Dt:T], [Xzero, Xem], 'k--') % remember X (0) =1=Xzero
hold off

title ('Geometric Brownian Motion Path')
legend ('Exact', 'Mlstein''s higher order','Euler Maryama')

error1 = abs (XMM (end) -Xtrue (end) );
error2 = abs (Xem (end) -Xtrue (end) );

if error1<error2
    disp('Mlstein''s higher order gives more accurate result')
else
    disp('Euler Maryma gives more accurate result')
end