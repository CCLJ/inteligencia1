function v = vecino(varargin)

% v = vecino(x)
% vecino(lim,tamVecindad)
%
% Regresa el v el vecino del vector x de longitud n, donde lim es una 
% matriz nx2 de los valores m�nimos y m�ximos que puede tomar v, y 
% tamVecindad es un vector nx1 de los tama�os de vecindad.
%
% Ejemplo:
% vecino([0 10;-1 1],[3;0.1])
% vecino([0;0])
%
% See also: recocido

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

persistent lim tamVecindad

if length(varargin)==1
   xMin = lim(:,1);
   xMax = lim(:,2);
   x = varargin{1};
   x = x+tamVecindad*2.*(rand(size(x))-0.5);
   x = x.*~(x>xMax) + xMax.*(x>xMax);
   v = x.*~(x<xMin) + xMin.*(x<xMin);
elseif length(varargin)>=2
   fprintf('Fijando l�mites y tama�o de vecindad en vecino\n')
   lim = varargin{1};
   tamVecindad = varargin{2};
end

