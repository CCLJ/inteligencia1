function R = objetivo(grafo)

% 
%
% See also: recocido, costoSteiner, inicializaSteiner

%*****************************************************************
%*                                                               *
%*   Recocido: Una implemetaci�n de recocido simulado en MATLAB  *
%*                                                               *
%*   Copyright (c) Derechos Reservados                           *
%*   Manuel Valenzuela Rend�n                                    *
%*   valenzuela@itesm.mx                                         *
%*   http://homepages.mty.itesm.mx/valenzuela                    *
%*                                                               *
%*   Tecnol�gico de Monterrey, Campus Monterrey                  *
%*   Monterrey, N.L., M�xico                                     *
%*                                                               *
%*****************************************************************

[costo, conectividad] = costoSteiner(grafo);

if conectividad == 0
    % castigar al valor de retorno aumentando el costo * el valor más
    % grande del arreglo grafo.
    R = costo * max(grafo);
else
    % dividir el costo entre el grado de conectividad del grafo dado.
    R = costo/conectividad;
end




