clear all;      %Borramos todo

%AO N QUE APARECE NOS RESULTADOS TEMOS QUE RESTARLLE , POR EXEMPLO, SE
%APARECE N=11 É N=10

%La entrada de datos vendrá a través de una rutina
[a,b,eta,h,N,f,fsol,norma] = datos1();

%Abrimos un archivo para almacenar la salida Si queremos por pantalla
%fichero = 1 es por pantalla
fichero = fopen('salida_datosRK.txt','w');

%Llamamos al metodo numerico Runge Kutta Explicito y le pasamos el tablero
%de Butcher

%A = [0 0 0 ; 2/3 0 0; -4/3 2 0];         %Elementos del tablero de Butcher
%vc = [0 2/3 2/3];
%vb = [1/4 1/2 1/4];
A=[0 0 0 0; 1/2 0 0 0; 0 1/2 0 0 ;0 0 1 0];
vc=[0 1/2 1/2 1];
vb=[1/6 2/6 2/6 1/6];
%A=[1/4 0; 1/2 1/4];
%vc=[1/4 3/4];
%vb=[1/2 1/2];




[x,y,error,sol] = RungeKuttaExplicito(a, h, N, eta, f, norma, A, vb, vc, fsol);
%HAS AÑADIDO LA SOLUCION??


%Salida de datos
disp(x);
disp(y);
disp(error);
disp(sol);


%SI QUIERES PINTAR LA SOLUCION AÑADELA AL FINAL, SINO NO METAS NADA
%METEMOS SOL, NO FSOL
dibuja_graficas(x,y,sol);
escribir_resultados(fichero,x,y, abs(y-sol));      %SI QUEREMOS METER EL ERROR SERÁ abs(y-sol)!!!!!!


%PARA HACER LA DE LA NORMA DE Y O DE Y' EN UN PUNTO CONCRETO: EJ 2.4
%p = 1+(1-a)/h;
%X = sprintf('%d  %e  %e %e %e',p-1,abs(y(p,1)-sol(p,1)),abs(y(p,2)-sol(p,2)),abs(y(p,3)-sol(p,3)),abs(y(p,4)-sol(p,4)));
%disp(X);

%Cerramos el archivo
fclose(fichero);

%El vector error en cada lugar i, me da la norma del vector formado por las distintas
%dimensiones de (yi - soli), es decir me da la norma de la solucion menos
%la solucion aproximada, en un punto. Si la solucion es escalar sera el
%valor de la resta y si la solucion es vectorial será la norma de dicho
%vector