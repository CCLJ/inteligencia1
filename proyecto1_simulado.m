%% Recocido simulado
% Este script muestra el uso del programa recocido y plotRecocido.


%% Optimizaci�n de f1

p.cadIntAcep = 45;
p.cadInt = 140;
p.maxCad = 10;
p.frecImp = 20;
p.alfa = 0.90;
p.beta = 1.2;
p.minRazAcep = 0.95;
p.variarC = 0;

% Coordenadas de los datos originales
C = [0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4];

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
vecino(ind, P, length(p.x0));
costoSteiner(A,P,ind);

p.FcnObj = @objetivo;  % funci�n objetivo
p.FcnVec = @vecino;    % funci�n de vecindad
p.Imp = @imprime2;      % funci�n de impresi�n
p.min = 1;
c0 = 10;               % temperatura inicial

res = recocido(p,c0);
%%
disp(res.ux)
%%
disp(res.ux(1:3,1));
disp(res.ux(1:3,2));
%%
% Ahora hacemos animaci�n de los resultados
for i=1:length(res.intentos)
   subplot(3,1,1)
   plot(res.intentos(1:i),res.uf(1:i),'.g',...
      res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) 0 200])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(res.ux(1:i,1),res.ux(1:i,2),'.g',...
      res.x(1:i,1),res.x(1:i,2),'.-b')
   grid on
   axis([-10 10 -10 10])
   xlabel('x')
   ylabel('y')
   pause(0.01)
end


%% Curva de mejor encontrado para f1
% Obtenemos la curva de mejor encontrado para f1.
clf
p.frecImp = 10;
[x,prom,desv] = plotRecocido(p,20,c0);


