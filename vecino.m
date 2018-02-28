function G = generaGrafo(varargin)

% Generra un nuevo grafo si varagin == 1. De otra manera, inicializa
% ciertas variables.
% indicesOriginales = indices de los puntos originales
% puntosTotales = todos los puntos posibles en el plano
% maxNodos = tamaño que deben tener los grafos
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

persistent indicesOriginales puntosTotales maxNodos

if length(varargin) == 1
    grafo = varargin{1};
    
    maxPuntos = length(puntosTotales);
    minPuntos = length(indicesOriginales);
    
    % numero de nodos random a quitar y agregar al grafo
    %agregar = maxPuntos - length(grafo);
    %quitar = length(grafo) - minPuntos;
    %quitar = length(indicesOriginales);
    quitar = maxNodos - length(indicesOriginales);
    if quitar > 0
        remove = randi(quitar);
        add = remove;
    else
        remove = quitar;
        add = quitar;
    end
    %if agregar > 0
     %   add = randi(agregar);
    %else
     %   add = agregar;
    %end
    
    % quitar "remove" cantidad de nodos del grafo, revisando que no sean
    % los nodos originales con la ayuda de indicesOriginales
    while remove > 0
        % obtener indice aleatorio que no pase el tamaño de puntos posibles
        index = randi(maxPuntos);
        %&& ~ismember(index, indicesOriginales)
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
    maxNodos = varargin{3};
end



