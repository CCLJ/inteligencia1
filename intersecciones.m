function v = intersecciones(varargin)

% v = intersecciones(puntosOrig, 'i')
% v = intersecciones(puntosOrig)
%
% Regresa la matriz de las aristas de un nuevo grafo diferente del dado por
% puntosOrig cuando modo == g
% puntosOrig = coordenadas originales cuando modo == i
% puntosOrig = grafo de minimum spanning tree cuando solo se da un
% argumento
% modo == 'g' -> calcula nueva grafo
% modo == 'i' -> inicializa todos los puntos steiner posibles
%
% Ejemplo:
% intersecciones([0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4], 'i')
% intersecciones([0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4], 'g')
%
% See also: recocido, proyecto1_vecino

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

persistent validos steiner originales edges source dest

if length(varargin)==1
    % obten vecino de punto(grafo) dado - obtener un nuevo grafo
    
    % obtener cantidad de puntos steiner que hay
    max = length(steiner);

    % obtener cantidad puntos a agregar al grafo de forma aleatoria
    n = randi(max);
    
    % arreglo de puntos
    puntos = varargin{1};
    
    % obtener n cantidad de puntos steiner a agregar del arreglo de
    % puntos originales
    for i = 0: n
        % indice aleatorio de punto a agregar (del arreglo steiner)
        index = randi(max);
        % punto a agregar
        coord = steiner(index,:);
        % reviso que no este ya agregado
        while ismember(coord, puntos, "rows")
           index = randi(max);
           coord = steiner(index,:);
        end
        % se agrega la coordenada
        puntos = [puntos; coord];
    end
    
    s = [];
    d = [];
    a = [];
    % obtengo todas las aristas posibles dado los puntos actuales
    for i = 1: length(puntos)
        for j = 1: length(puntos)
            % revisar que no se este comparando el mismo punto
            if i ~= j
                %[x y]
                coord1 = [puntos(i,1) puntos(i,2)];
                coord2 = [puntos(j,1) puntos(j,2)];
                % se puede tener un arista entre dos puntos solo si estan
                % en la misma "x" o misma "y"
                if coord1(1) == coord2(1) || coord1(2) == coord2(2)
                    % aristas bidireccionales
                    s = [s; coord1; coord2]; % fuentes
                    d = [d; coord2; coord1]; % destinos
                    a = [a; coord1 coord2; coord2 coord1]; % fuente-destino
                end
            end
        end
    end
    % genero un minimum spanning tree con matrix de aristas "a"
    
    % comparo con grafo dado puntosOrig
    
    
else
    puntosOrig = varargin{1};
    originales = [originales; puntosOrig];
    validos = [validos; puntosOrig];
    steiner = [];
    edges = [];
    source = [];
    dest = [];
    for i=1: length(puntosOrig) - 1
        for j=i+1: length(puntosOrig)
            x1 = puntosOrig(i, 1);
            x2 = puntosOrig(j, 1);
            y1 = puntosOrig(i, 2);
            y2 = puntosOrig(j, 2);
            % si dos puntos no estan en misma x o misma y, saca sus
            % intersecciones
            if x1 ~= x2 && y1 ~= y2
                % siempre hay dos intersecciones
                inter1 = [x1 y2];
                inter2 = [x2 y1];
                steiner = [steiner; inter1; inter2];
                validos = [validos; inter1; inter2];
            end
        end
    end
    % quito puntos repetidos
    % validos = unique(validos, 'rows', 'stable');
    validos = unique(validos, 'rows');
    steiner = unique(steiner, 'rows');
    
     % obtener las aristas (edges) entre todos los puntos
    for i = 1: length(validos)
        for j = 1: length(validos)
            % revisar que no se este comparando el mismo punto
            if i ~= j
                coord1 = [validos(i,1) validos(i,2)];
                coord2 = [validos(j,1) validos(j,2)];
                % se puede tener un arista entre dos puntos solo si estan
                % en la misma "x" o misma "y"
                if coord1(1) == coord2(1) || coord1(2) == coord2(2)
                    % aristas bidireccionales
                    source = [source; coord1; coord2];
                    dest = [dest; coord2; coord1];
                    edges = [edges; coord1 coord2; coord2 coord1];
                end
            end
        end
    end
    edges = unique(edges, 'rows');
    
    % genero minimum spanning tree con arreglo edges
    % v = mst(validos, edges);
end
