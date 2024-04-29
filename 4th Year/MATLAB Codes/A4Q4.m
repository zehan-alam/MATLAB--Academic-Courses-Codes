clc 
clear all
randn('state', 100) 

T = 1;
N = 2^8;
dt = T/N;
dW = sqrt (dt) *randn (1,N) ; 

lamda = 2;
sigma = 1;
Xzero = 1;

% Euler Mrayama
R = 4;
Dt = R*dt; % length of subinterval for Euler Marayma
L = N/R; % number of subintervals for Euler maryama

Xem = zeros (1, L); % defining an array to save Euler Marayama Value
Xtemp = Xzero;

% f(x) = mu*x and g (x) = sigma*X
for j = 1:L
    Winc = sum (dW (R* (j-1) +1:R*j)) ; % BM increment dw (j) =W(j) -W(j-1)
    Xtemp = Xtemp- lamda*Xtemp*Dt + sigma*Winc;
    Xem (j) = Xtemp;
end

plot ([0:Dt:T], [Xzero, Xem], 'r--*') % remember X (0) =1=Xzero
hold off
title ('Ornstein-Uhlenbeck SDE Path')
legend ('Euler Maryama')