function R = objetivo(grafo)

% Obtiene la evaluacion del grafo dado.
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
if conectividad < 1
    % castigar al costo con una conectividad 1 + lo que le falto a la
    % conectivdad original de alcanzar el valor de 1 y por el el valor de
    % la cantidad de nodos usados en este grafo
    factor = 1 + (1 - conectividad);
    R = costo * factor * length(grafo);
else
    R = costo;
end




