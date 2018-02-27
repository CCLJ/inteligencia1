function arbol = mst(aristas)

% arbol = mst(vertices, aristas)
%
% Regresa el minimum spanning tree, dados unos vertices (puntos) y unas
% aristas (edges) posibles entre los puntos.
% 
% -vertices es una matriz de coordenadas [x1 y1; x2 y2; ...]
% -aristas en una matriz con 2 coordenadas por renglon (origen y destino)
% -arbol de una matriz con las aristas de los caminos usados
%
%
% See also: intersecciones

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

% si no se puede conectar con los parametros dados, regreso arbol = intmax

puntos = [];
for i = 1: length(aristas)
    coord1 = [aristas(i, 1) aristas(i, 2)];
    coord2 = [aristas(i, 3) aristas(i, 4)];
    puntos = [puntos; coord1; coord2];
end
puntos = unique(puntos,'rows');

% inicializar matriz de transiciones
transiciones = zeros(length(puntos));

for i = 1: length(puntos)
    for j = i: length(puntos)
        if i ~= j
            origen = puntos(i,:);
            destino = puntos(j,:);
            % checo que aristas tienen las coordenadas origen destino
            isValid = intersect([origen destino], aristas, 'rows');
            % si es valido, agrego la distancia entre origen y destino a la
            % matriz transiciones en i,j y j,i ya que es bidireccional
            if ~isempty(isValid)
                x1 = origen(1);
                y1 = origen(2);
                x2 = destino(1);
                y2 = destino(2);
                distancia = sqrt((x2 - x1)^2 + (y2 - y1)^2);
                transiciones(i,j) = distancia;
                transiciones(j,i) = distancia;
            end
        end
    end
end
arbol = transiciones;
disp(transiciones);



