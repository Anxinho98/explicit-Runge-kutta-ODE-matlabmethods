function [a,b,eta,h,N,f,fsol,norma]=datos1()

f =@funf1;              %ODE´s function
fsol=@funsol1;           %ODE´s solution


a = 2;                      %X0
b = 3;                      %b
h = 0.1;                   %step
N = floor((b-a)/h);         %number of steps
eta = 1;                %y(x0)

norma = inf;                %typo of norm
