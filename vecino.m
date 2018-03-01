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
    [~, conect] = costoSteiner(grafo);
    maxPuntos = length(puntosTotales);
    minPuntos = length(indicesOriginales);
    
    if conect == 1
        % ya tenemos conectividad de 1, lo que hay que hacer ahora es
        % disminuir el numero de nodos usados
        n = length(grafo) - minPuntos;
        if n > 0
            % se pueden quitar 1 o mas nodos
            remove = randi(n);
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
            G = grafo;
        else
            % no se pueden quitar nodos, habrá que cambiar uno de ellos
            % para intentar reducir el costo total. La conectividad podría
            % verse reducida
            
            % nodo a quitar
            nodoQ = randi(maxPuntos);
            while ~ismember(nodoQ, grafo) || ismember(nodoQ, indicesOriginales)
                nodoQ = randi(maxPuntos);
            end
            
            % nodo a agregar
            nodoA = randi(maxPuntos);
            while ismember(nodoA, grafo)
                nodoA = randi(maxPuntos);
            end
            
            % remplazo nodo
            indice = find(grafo == nodoQ);
            grafo(indice) = nodoA;
            
            G = grafo;
            
        end
        
    else
        % es necesario generar un vecino con mejor conectividad
        newConect = 0;
        while newConect < conect && newConect ~= 1
            g = grafo;
            % numero de nodos random a quitar y agregar al grafo
            agregar = maxPuntos - length(g);
            quitar = length(g) - minPuntos;
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
                if ismember(index, g) && ~ismember(index, indicesOriginales)
                    it = find(g == index);
                    g(it) = [];
                    remove = remove - 1;
                end
            end

            % agregar "add" cantidad de nodos al grafo, revisando que no exista ya
            % en el grafo
            while add > 0
                % obtener indice aleatorio que no pase el tamaño de puntos posibles
                index = randi(maxPuntos);
                if ~ismember(index, g)
                    g = [g; index];
                    add = add - 1;
                end
            end
            [~, newConect] = costoSteiner(g);
        end  
        G = g;
    end % else del if conect == 1

else
    indicesOriginales = varargin{1};
    puntosTotales = varargin{2};
    maxNodos = varargin{3};
end



