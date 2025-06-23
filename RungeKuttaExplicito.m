function [r,s,t,u] = RungeKuttaExplicito(a, h, N, eta, f, norma, A, vb, vc, fsol)  %SI NO TENEMOS LA SOLUCION METEMOS NULL

    %DECLARACION DE VARIABLES
    M = length(eta);                  %Dimension de la solucion
    p = norma;                %Tipo de norma
    L = length(vb);         %Determinamos el orden del metodo


    %INICIALIZACION DE LAS VARIABLES

    x = zeros(N+1, 1);      %Vector de los pasos del algoritmo
    y = zeros(N+1, M);      %Matriz en la que cada columna (tiene M, tantas como dimensiones de la yi) es una de las componentes de la yi(), evaluada en los N+1 puntos. 
    k = zeros(L,M);             %Numero de etapas x M

    %Condiciones Iniciales

    x(1) = a;               %a pertenece a R
    y(1,:) = eta;           %eta pertenece a R_n
    flag = 0;               %Tiene dos valores: 0 = SIN SOLUCION   1 = CON SOLUCION
    
    
    %En caso de que la solucion sea distinta de NULL:

     if (nargin == 10)
        sol = zeros(N+1, M);    %Matriz en la que cada columna (tiene M, tantas como dimensiones de la solucion) es una de las componentes de la solucion, evaluada en los N+1 puntos.
        error = zeros(N+1,1);   %Vector con las normas infinito de cada una de las y_n menos sol_n
        sol(1,:) = eta;         %Será igual a eta
        error(1) = norm(y(1,:) - sol(1,:),p);     %Escribimos el error(1) porque no se puede hacer dentro del bucle (Ademas deberia ser 0)
        flag = 1;
     end
     
     
    %Codigo
    
   
     if(flag == 1)        %En caso de HABER SOLUCION Y No haber errores:

        for i = 1:N               %Vamos creando la funcion vectorial entera (con todas sus dimeniones) para cada punto
            x(i+1) = x(i) + h;                                          %Creamos el siguiente punto
           
            for j = 1:L
                k(j,:) = transpose(f( x(i) + h*vc(j), y(i,:) + h* A(j,:)*k));
            end
            
            y(i+1,:) = y(i,:) + h * (vb*k);         %Creamos la funcion y_i+1 con todas sus componentes(dimensiones) directamente
            sol(i+1,:) = transpose(fsol(x(i+1)));                       %Asignamos su valor a la solucion en el punto i+1 en las M dimensiones o componentes
            error(i+1) = norm( y(i+1,:) - sol(i+1,:), p);               %Calculamos la norma p del error entre y_i+1 e sol_i+1
            
        end
        
        r = x;          %Salida de los datos
        s = y;
        t = error;
        u = sol;
        
        
     else  %En el caso de NO HABER SOLUCION y por lo tanto sin errores
        
         for i = 1:N               %Vamos creando la funcion vectorial entera (con todas sus dimeniones) para cada punto
            x(i+1) = x(i) + h;                                          %Creamos el siguiente punto
            y(i+1,:) = y(i,:) + h* transpose(f(x(i), y(i,:)));         %Creamos la funcion y_i+1 con todas sus componentes(dimensiones) directamente
         end
        
        
        r = x;      %Salida de los datos
        s = y;
        t = 'No se introdujo solucion y por tanto no hay error';
        u = 'No se introdujo solucion';
        
    end
end
