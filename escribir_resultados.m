
function escribir_resultados(fichero,x,y,error)

    n = length(y(:,1));

    if(nargin == 4)         %Hay error
        escribe_cabecera(fichero,x,y(1,:),error(1,:));
        for k = 1:n
            escribe_paso(fichero,k,x(k),y(k,:),error(k,:));
        end    
    else                    %No hay error
        escribe_cabecera(fichero,x,y(1,:));
        for k = 1:n
            escribe_paso(fichero,k,x(k),y(k,:));
        end
    end
    
end








