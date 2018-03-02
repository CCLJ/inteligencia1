%% Recocido simulado
% Este script muestra el uso del programa recocido y plotRecocido.


%% Optimizaci�n de f1

p.cadIntAcep = 40;
p.cadInt = 120;
p.maxCad = 10;
p.frecImp = 100;
p.alfa = 0.90;
p.beta = 1.2;
p.minRazAcep = 0.95;
p.variarC = 0;

% Coordenadas de los datos originales
%C = [0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4];
C = [2 2; 11 7; 0 1; 3 0; 5 2; 11 1; 7 9; 6 2; 6 1; 1 8];

% Inicializa Steiner obtiene los datos de todos los nodos y aristas
% posibles.
[xC,yC,P,ind,A,T] = inicializaSteiner(C);

% obtengo grafo inicial que contiene el doble del numero de nodos
% origianles
len = length(ind);
x0 = ind;
for i = 1: len
    nodo = randi(length(P));
    while ismember(nodo, ind) && ismember(nodo, x0)
        nodo = randi(length(P));
    end
    x0 = [x0 nodo];
end
p.x0 = x0'; % estado inicial con nodos al azar y nodos originales 

% inicializa vecino y costoSteienr con los indices de los nodos originales
% y las coordenadas de todos los puntos posibles
vecino(ind, P, length(P));
costoSteiner(A,P,ind);

p.FcnObj = @objetivo;  % funci�n objetivo
p.FcnVec = @vecino;    % funci�n de vecindad
p.Imp = @imprime2;      % funci�n de impresi�n
p.min = 1;
c0 = 20;               % temperatura inicial

res = recocido(p,c0);

%% Curva de mejor encontrado para f1
% Obtenemos la curva de mejor encontrado para f1.
clf
p.frecImp = 100;
[x,prom,desv] = plotRecocido(p,10,c0);
