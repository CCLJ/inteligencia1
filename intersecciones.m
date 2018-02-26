function v = intersecciones(puntosOrig, modo)

% v = intersecciones(puntosOrig, modo)
%
% Regresa la matriz de todos los puntos validos (puntos originales y de 
% steiner)
% puntosOrig = coordenadas originales
% modo == 'v' -> calcula vecino de punto dado
% modo ~= 'v' -> calcula todos los vecinos validos
%
% Ejemplo:
% intersecciones([0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4])
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

persistent validos steiner anterior

if modo == 'v'
    % obten vecino de punto dado - obtener un nuevo grafo
    % devolver v
else
    validos = [validos; puntosOrig];
    steiner = [];
    anterior = puntosOrig;
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
end





                    








