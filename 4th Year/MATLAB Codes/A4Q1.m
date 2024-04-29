clc 
clear all
randn('state', 100) 

T = 1;
N = 500;
dt = T/N;
dw = sqrt (dt) *randn (1,N) ; 
W = cumsum (dw);

figure()
plot ([0:dt:T], [0,W],'r-')
title ('Brownian Motion Path')