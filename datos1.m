function [a,b,eta,h,N,f,fsol,norma]=datos1()
%DECLARACION DE VARIABLES

%Funciones De La EDO (Solución y f):
f =@funf1;              %funcion de la EDO
fsol=@funsol1;           %solucion de la EDO (PONER NULL SI NO TENEMOS LA SOLUCION EXACTA)

%Variables De Entrada:

a = 2;                      %X0
b = 3;                      %b
h = 0.1;                   %Paso
N = floor((b-a)/h);         %Numero de pasos
eta = 1;                %Valor de y(x0)

norma = inf;                %Tipo de norma
