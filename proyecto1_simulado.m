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
p.FcnVec = @intersecciones;    % funci�n de vecindad
p.Imp = @imprime;      % funci�n de impresi�n
p.min = 1;
c0 = 1;               % temperatura inicial

% Inicializar funci�n de vecindad
intersecciones([0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4],[0.2 0.2]');

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