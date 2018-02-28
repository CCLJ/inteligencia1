%% �rboles rectil�neos de Steiner
%
% Este script muestra el uso de las funciones inicializaSteiner,
% graficaSteiner, y costoSteiner.
%
% Manuel Valenzuela
% 29 octubre 2014

%% Datos
% Coordenadas de los datos originales
C = [0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4];

% Inicializa Steiner obtiene los datos de todos los nodos y aristas
% posibles.
[xC,yC,P,ind,A,T] = inicializaSteiner(C);

%% Gr�fica de un �rbol de Steiner

clf
% Grafo que se desea graficar
G = [4 8 10 17 20 22 27 37 41 42 43 44 45 47 48 55 56];
% Se inicializan datos para calcular el costo
costoSteiner(A,P,ind)
% Se calculan los costos del grafo G
[costoTotal,conectividad] = costoSteiner(G)



