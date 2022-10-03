function out = calcularInterpolacionNewtonFuncion()
    
    syms x;
    valoresX = [-3, -1, 2, 4, 7];
    valoresY = [2, 7, -2, 5, 8];
    valoresB = calcularInterpolacionNewtonB(valoresX, valoresY);
    n = length(valoresX);
    
    out = 0;

    for i = 1:n        
        bi = valoresB(1, i).resultado;
        
        for j = 1:(i - 1)
            bi = bi * (x - valoresX(j));
        end

        disp(bi);

        out = out + bi;

    end

end

