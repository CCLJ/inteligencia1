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
    % castigar al valor con una conectividad 1 + lo que le falto a la
    % conectivdad original de alcanzar el valor de 1
    factor = 1 + (1 - conectividad);
    R = costo * factor;    
else
    % de lo contrario solo se devuelve el costo, ya que se asume que la
    % conectividad es de 1
    R = costo;
end




