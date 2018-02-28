function imprime2(mejor,varargin)

% imprime(mejor)
% imprime(mejor, actual)
% imprime(mejor, actual, intentos)
% imprime(mejor, actual, intentos, c)
%
% Imprime el mejor encontrado (y el actual) de una corrida de recocido.
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
disp('Imprimiendo');
if length(varargin)>=1
   actual = varargin{1};
end



if length(mejor.x)>1
    fprintf('Current: ');
    for i = 1; length(mejor.x)
        fprintf('%d ',mejor.x(i))
    end
    
end
fprintf('  mejor: %7.4f\n',mejor.f);

if length(varargin)>=1
    fprintf('Actual: ');
    for i = 1; length(actual.x)
        fprintf('%d ',actual.x(i))
    end
   fprintf('  mejor actual: %7.4f\n',actual.f);
end

if length(varargin)>=2
   fprintf('intentos=%d',varargin{2})
end

if length(varargin)>=3
   fprintf(' c=%f',varargin{3});
end

fprintf('\n')