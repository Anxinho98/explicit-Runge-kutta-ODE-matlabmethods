function [a,b,eta,h,N,f,fsol,norma]=datosRK()
%DECLARACION DE VARIABLES

%Funciones De La EDO (Solución y f):
f =@funcion;              %funcion de la EDO
fsol=@solucion;           %solucion de la EDO (PONER NULL SI NO TENEMOS LA SOLUCION EXACTA)

%Variables De Entrada:

a = 0;                      %X0
b = 1;                      %b
h = 0.1;                   %Paso
N = floor((b-a)/h);         %Numero de pasos
eta = [1 1 1 1];                %Valor de y(x0)

norma = inf;                %Tipo de norma
