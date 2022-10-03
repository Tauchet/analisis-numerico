classdef InterpolacionNewtonInfo

    properties
        xMin,
        xMax,
        resultado,
        esVacio
    end
    
    methods
        function obj = InterpolacionNewtonInfo(xMin, xMax, resultado)
            if nargin > 0
                obj.xMin = xMin;
                obj.xMax = xMax;
                obj.resultado = resultado;
                obj.esVacio = false;
            else
                obj.resultado = 0;
                obj.esVacio = true;
            end
        end
        
    end
end

