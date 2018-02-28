function G = generaGrafo(varargin)

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

persistent indicesOriginales puntosTotales

if length(varargin) == 1
    % disp(indicesOriginales);
    % disp(puntosTotales);
    grafo = varargin{1};
    
    maxPuntos = length(puntosTotales);
    minPuntos = length(indicesOriginales);
    
    % numero de nodos random a quitar y agregar al grafo
    quitar = maxPuntos - length(grafo);
    agregar = length(grafo) - minPuntos;
    if quitar > 0
        remove = randi(quitar);
    else
        remove = quitar;
    end
    if agregar > 0
        add = randi(agregar);
    else
        add = agregar;
    end
    
    % quitar "remove" cantidad de nodos del grafo, revisando que no sean
    % los nodos originales con la ayuda de indicesOriginales
    while remove > 0
        % obtener indice aleatorio que no pase el tamaño de puntos posibles
        index = randi(maxPuntos);
        if ismember(index, grafo) && ~ismember(index, indicesOriginales)
            it = find(grafo == index);
            grafo(it) = [];
            remove = remove - 1;
        end
    end
    
    % agregar "add" cantidad de nodos al grafo, revisando que no exista ya
    % en el grafo
    while add > 0
        % obtener indice aleatorio que no pase el tamaño de puntos posibles
        index = randi(maxPuntos);
        if ~ismember(index, grafo)
            grafo = [grafo; index];
            add = add - 1;
        end
    end
    G = grafo;
    
else
    indicesOriginales = varargin{1};
    puntosTotales = varargin{2};
    % disp(indicesOriginales);
    % disp(puntosTotales);
end



