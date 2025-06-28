clear all;



% The input data will come from a separate routine
[a,b,eta,h,N,f,fsol,norma] = datos1();

% We open a file to store the output. If we want to display it on screen,
%  fichero = 1 by screen
fichero = fopen('salida_datosRK.txt','w');

% We call the explicit Runge-Kutta numerical method and pass the Butcher table

%A = [0 0 0 ; 2/3 0 0; -4/3 2 0];         % Elements of the Butcher table
%vc = [0 2/3 2/3];
%vb = [1/4 1/2 1/4];
A=[0 0 0 0; 1/2 0 0 0; 0 1/2 0 0 ;0 0 1 0];
vc=[0 1/2 1/2 1];
vb=[1/6 2/6 2/6 1/6];
%A=[1/4 0; 1/2 1/4];
%vc=[1/4 3/4];
%vb=[1/2 1/2];

[x,y,error,sol] = RungeKuttaExplicito(a, h, N, eta, f, norma, A, vb, vc, fsol);
HAVE YOU INCLUDED THE SOLUTION??

% Output data
disp(x);
disp(y);
disp(error);
disp(sol);

% IF YOU WANT TO PLOT THE SOLUTION, ADD IT AT THE END. OTHERWISE, DON’T ADD ANYTHING.
% WE USE sol, NOT fsol
dibuja_graficas(x,y,sol);
escribir_resultados(fichero,x,y, abs(y-sol));      % IF WE WANT TO INCLUDE THE ERROR, USE abs(y-sol)!!!!!!

% TO COMPUTE THE NORM OF y OR y' AT A SPECIFIC POINT,
p = 1+(1-a)/h;
X = sprintf('%d  %e  %e %e %e',p-1,abs(y(p,1)-sol(p,1)),abs(y(p,2)-sol(p,2)),abs(y(p,3)-sol(p,3)),abs(y(p,4)-sol(p,4)));
disp(X);

% We close the file
fclose(fichero);

% The error vector at each index i gives the norm of the vector formed by the
% differences (yi - soli), that is, the norm of the exact solution minus
% the approximate solution at a point. If the solution is scalar, it's the
% value of the difference; if the solution is vectorial, it’s the norm of that vector.
