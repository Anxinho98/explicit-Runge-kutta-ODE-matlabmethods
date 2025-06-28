function [a,b,eta,h,N,f,fsol,norma]=datosRK()



f =@funcion;              %ODE´s function
fsol=@solucion;           %ODE´s solution


a = 0;                      %X0
b = 1;                      %b
h = 0.1;                   %step
N = floor((b-a)/h);         %number of steps 
eta = [1 1 1 1];                % y(x0)

norma = inf;                %Type of norm
