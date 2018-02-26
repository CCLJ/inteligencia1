%% Recocido simulado
% Este script muestra el uso del programa recocido y plotRecocido.


%% Optimizaci�n de f1

% Se deben cargar los par�metros en una estuctura que debe tener 
% exactamente los siguiente par�metros.
f1 = @(x) x(1)^2 + x(2)^2;
% imprime2 = @(u,m) ...
%    fprintf('f(%5.2f,%5.2f)=%8.4f f(%5.2f,%5.2f)=%8.4f',...
%            u.x(1),u.x(2),u.f,m.x(1),m.x(2),u.f);
p.cadIntAcep = 40;
p.cadInt = 80;
p.maxCad = 1;
p.frecImp = 5;
p.alfa = 0.80;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = [10 -10]';
p.FcnObj = f1;         % funci�n objetivo
p.FcnVec = @vecino;    % funci�n de vecindad
p.Imp = @imprime;      % funci�n de impresi�n
p.min = 1;
c0 = 1;               % temperatura inicial

% Inicializar funci�n de vecindad
vecino([-10 10;-10 10],[0.2 0.2]');

res = recocido(p,c0);
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


%% Optimizaci�n de f1 usando variaci�n de la temperatura

% Se deben cargar los par�metros en una estuctura que debe tener 
% exactamente los siguiente par�metros.
f1 = @(x) x(1)^2 + x(2)^2;
% imprime2 = @(u,m) ...
%    fprintf('f(%5.2f,%5.2f)=%8.4f f(%5.2f,%5.2f)=%8.4f',...
%            u.x(1),u.x(2),u.f,m.x(1),m.x(2),u.f);
p.cadIntAcep = 40;
p.cadInt = 80;
p.maxCad = 1;
p.frecImp = 5;
p.alfa = 0.80;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 1;
p.x0 = [10 -10]';
p.FcnObj = f1;         % funci�n objetivo
p.FcnVec = @vecino;    % funci�n de vecindad
p.Imp = @imprime;      % funci�n de impresi�n
p.min = 1;
c0 = 1;                % temperatura inicial

% Inicializar funci�n de vecindad
vecino([-10 10;-10 10],[0.2 0.2]');

res = recocido(p,c0);
% Ahora hacemos animaci�n de los resultados
for i=1:length(res.intentos)
   clf
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


%% Optimizaci�n de f2

f2 = @(x) cos(sqrt(80*x)).*exp(-x/12.5);

p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = 8;
p.cadIntAcep = 100;
p.cadInt = 200;
p.frecImp = 5;
p.FcnObj = f2;          % funci�n objetivo
p.FcnVec = @vecino;     % funci�n de vecindad
p.Imp = @imprime;       % funci�n de impresi�n
p.maxCad = 2;
p.min = 1;
c0 = 1;                % temperatura inicial

% Inicializar funci�n de vecindad
vecino([0 10],1.5);


res = recocido(p,c0);
% Ahora hacemos animaci�n de los resultados
V = [48 146 72] ./ 255;
t = linspace(-0.1,10,200);
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) -1 0.25])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(t,f2(t),'-','Color',V)
   hold on
   plot(res.x(i),f2(res.x(i)),'or','MarkerFaceColor','r')
   plot(res.ux(i),f2(res.ux(i)),'d','Color',V,'MarkerFaceColor',V)
   axis([-0.1 10 -1.1 1.1])
   xlabel('x')
   ylabel('f(x)')
   hold off
   pause(0.01)
end

%% Optimizaci�n de f2 variando temperatura

f2 = @(x) cos(sqrt(80*x)).*exp(-x/12.5) + 1;

p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 1;
p.x0 = 8;
p.cadIntAcep = 100;
p.cadInt = 200;
p.frecImp = 5;
p.FcnObj = f2;          % funci�n objetivo
p.FcnVec = @vecino;     % funci�n de vecindad
p.Imp = @imprime;       % funci�n de impresi�n
p.maxCad = 2;
p.min = 1;
c0 = 1;                % temperatura inicial

% Inicializar funci�n de vecindad
vecino([0 10],1.5);


res = recocido(p,c0);
% Ahora hacemos animaci�n de los resultados
V = [48 146 72] ./ 255;
t = linspace(-0.1,10,200);
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) 0 1.25])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(t,f2(t),'-','Color',V)
   hold on
   plot(res.x(i),f2(res.x(i)),'or','MarkerFaceColor','r')
   plot(res.ux(i),f2(res.ux(i)),'d','Color',V,'MarkerFaceColor',V)
   %   axis([-0.1 10 -1.1 1.1])
   axis([-0.1 10 -0.1 2.1])
   xlabel('x')
   ylabel('f(x)')
   hold off
   pause(0.01)
end


%% Curva de mejor encontrado para f2
% Obtenemos la curva de mejor encontrado para f2.
clf
p.frecImp = 50;
[x,prom,desv] = plotRecocido(p,20,c0);


%% Maximizaci�n de f2

f2 = @(x) cos(sqrt(80*x)).*exp(-x/12.5);

p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = 8;
p.cadIntAcep = 100;
p.cadInt = 200;
p.frecImp = 5;
p.FcnObj = f2;          % funci�n objetivo
p.FcnVec = @vecino;     % funci�n de vecindad
p.Imp = @imprime;       % funci�n de impresi�n
p.maxCad = 2;
p.min = 0;
c0 = 1;                 % temperatura inicial

% Inicializar funci�n de vecindad
vecino([0 10],1.5);


res = recocido(p,c0);
% Ahora hacemos animaci�n de los resultados
t = linspace(-0.1,10,200);
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) 0 1.25])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(t,f2(t),'-','Color',V)
   hold on
   plot(res.x(i),f2(res.x(i)),'or','MarkerFaceColor','r')
   plot(res.ux(i),f2(res.ux(i)),'d','Color',V,'MarkerFaceColor',V)
   axis([-0.1 10 -1.1 1.1])
   xlabel('x')
   ylabel('f(x)')
   hold off
   pause(0.01)
end


%% Vendedor viajero
% Ahora mostramos la aplicaci�n de recocido simulado al problema del
% vendedor viajero (TSP por sus siglas en ingl�s).
N = 70;
coordenadas = rand(N,2);             % coordenadas aleatorias de ciudades
distancias = tablaTSP(coordenadas);  % se calcula la matriz de distancias
fcnObjTSP(distancias);               % se carga la matriz de distancias
ruta0 = randperm(N)';                % se genera una ruta inicial aleatoria

%%
clf
plotTSP(ruta0,coordenadas,'b',2)
xlabel('x')
ylabel('y')
title(sprintf('TSP de %d ciudades',N))
%% Optimizaci�n de vendedor viajero

p.alfa = 0.8;
p.beta = 1.05;
p.minRazAcep = 0.95;
p.variarC = 0;
p.x0 = ruta0;
p.cadIntAcep = 50;
p.cadInt = 800;
p.frecImp = 40;
p.FcnObj = @fcnObjTSP;    % funci�n objetivo
p.FcnVec = @vecinoTSP;    % funci�n de vecindad
p.Imp = @imprimeTSP;      % funci�n de impresi�n
p.maxCad = 3;
p.min = 1;
c0 = 1;                   % temperatura inicial


imprimeTSP                % borrar coordendas
imprimeTSP(coordenadas)   % cargar coordendas

res = recocido(p,c0);
int = length(res.intentos);
plotTSP(res.x(int,:),coordenadas,'b',2)
% text(0,-0.1,sprintf('Mejor = %f',res.f(int)))
% text(0.825,-0.1,sprintf('Intentos = %d',res.intentos(int)))
fprintf('%d ',res.x(int,:))
fprintf('\n')
title(sprintf('TSP de %d ciudades, costo=%f, intentos=%d',N,res.f(int),res.intentos(int)))
xlabel('x')
ylabel('y')


%% Curva de mejor encontrado para vendedor viajero
% Obtenemos la curva de mejor encontrado para TSP.

[x,prom,desv] = plotRecocido(p,20,c0);


%% Intento de mostrar efecto de variar alfa

p.variarC = 0;
p.x0 = ruta0;
p.FcnObj = @fcnObjTSP;    % funci�n objetivo
p.FcnVec = @vecinoTSP;    % funci�n de vecindad
p.Imp = @nada;            % funci�n de impresi�n
p.min = 1;
imprimeTSP                % borrar coordendas
imprimeTSP(coordenadas)   % cargar coordendas


c0 = 1;                   % temperatura inicial
p.cadIntAcep = 18;
p.cadInt = 30;
p.maxCad = 4;
a1 = 0.1;
a2 = 0.5;
%a3 = 0.9;
corridas = 50;


p.alfa = a1;
p.frecImp = 100;
[x1,prom1,desv] = plotRecocido(p,corridas,c0);
p.alfa = a2;
[x2,prom2,desv] = plotRecocido(p,corridas,c0);
% p.alfa = a3;
% [x3,prom3,desv] = plotRecocido(p,corridas,c0);

%
xMax = max([x1;x2]);
x1(end+1) = xMax;
x2(end+1) = xMax;
% x3(end+1) = xMax;
prom1(end+1) = prom1(end);
prom2(end+1) = prom2(end);
% prom3(end+1) = prom3(end);

%%
% semilogy(x1,prom1,'.-b',x2,prom2,'.-r',x3,prom3,'.-k')
% legend(sprintf('\\alpha=%4.2f',a1),sprintf('\\alpha=%4.2f',a2),sprintf('\\alpha=%4.2f',a3))
plot(x1,prom1,'.-b',x2,prom2,'.-r')
legend(sprintf('\\alpha=%4.2f',a1),sprintf('\\alpha=%4.2f',a2))
ylabel('mejor encontrado')
xlabel('evaluaciones')
title('Efecto de variar \alpha')
ylim([10 12])
xlim([1200 2400])