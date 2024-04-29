clc 
clear all
randn('state', 100) 

T = 1;
N = 300;
dt = T/N;
dW = sqrt (dt) *randn (1,N) ; 
W = cumsum (dW);

mu = 2;
sigma = 1;
Xzero = 1;


Xtrue = Xzero+ mu* [dt:dt:T]+ sigma*W;
figure
plot ([0:dt:T], [Xzero,Xtrue],'m-') 
hold on


% Euler Mrayama
R = 4;
Dt = R*dt; % length of subinterval for Euler Marayma
L = N/R; % number of subintervals for Euler maryama

Xem = zeros (1, L); % defining an array to save Euler Marayama Value
Xtemp = Xzero;

% f(x) = mu*x and g (x) = sigma*X
for j = 1:L
    Winc = sum (dW (R* (j-1) +1:R*j)) ; % BM increment dw (j) =W(j) -W(j-1)
    Xtemp = Xtemp+ mu*Dt+ sigma*Winc;
    Xem (j) = Xtemp;
end

plot ([0:Dt:T], [Xzero, Xem], 'r--*') % remember X (0) =1=Xzero
hold off
title ('Arithmatic Brownian Motion Path')
legend ('Exact', 'Euler Maryama')

error = abs (Xem (end) -Xtrue (end) ); % finding error at t=1
fprintf ('at t = %2.1f error is = %5.6f\n', T, error)