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

%fprintf('costo: %7.3f\n', costo);

if conectividad < 1
    % castigar al valor dividiendolo por una conectividad del doble de
    % pequña
    R = costo / (2 * conectividad);
else
    % de lo contrario solo se devuelve el costo, y que se asume que la
    % conectividad es de 1
    R = costo*conectividad;
end




