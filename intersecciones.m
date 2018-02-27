function v = intersecciones(puntosOrig, modo)

% v = intersecciones(puntosOrig, 'i')
% v = intersecciones(puntosOrig, 'g')
%
% Regresa la matriz de todos los puntos validos (puntos originales y de 
% steiner)
% puntosOrig = coordenadas originales
% modo == 'g' -> calcula nueva grafo
% modo == 'i' -> inicializa todos los puntos steiner posibles
%
% Ejemplo:
% intersecciones([0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4], 'i')
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

persistent validos steiner originales

if isequal(modo, 'g')
    % obten vecino de punto(grafo) dado - obtener un nuevo grafo
    % devolver v
    % obtener numero de puntos steiner que se puede agregar a un grafo
    max = length(steiner);
    
    % obtener numero aleatorio de puntos a agregar al grafo
    n = randi(max, 1, 1);
    
    % escoger si se hara un tronco horizontal o vertical de forma aleatoria
    % 1 = horizontal
    % 2 = vertical
    % tronco = randi(2,1,1);
    % arreglo de puntos
    puntos = originales;
    
    % obtener n cantidad de puntos steiner a agregar del arreglo de
    % puntos originales
    for i = 0: n
        % indice aleatorio de punto a agregar (del arreglo steiner)
        index = randi(max, 1, 1);
        % punto a agregar
        coord = steiner(index);
        % reviso que no este ya agregado
        while ismember(coord, puntos)
           index = randi(max, 1, 1);
           coord = steiner(index);
        end
        % se agrega la coordenada
        puntos = [puntos; coord];
    end
    
    % genero un minimum spanning tree con los puntos y dependiendo de
    % orientancion del tronco
    %if tronco == 1 
        %
    %else
        %
    %end
    
elseif isequal(modo, 'i')
    originales = [originales; puntosOrig];
    validos = [validos; puntosOrig];
    steiner = [];
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
    validos = unique(validos, 'rows');
    %disp("Nodos Originales");
    %disp(originales);
    %disp("Nodos Steiner");
    %disp(steiner);
    %disp("Steiner U Originales");
    %disp(validos);
    %v = validos;
end





                    








