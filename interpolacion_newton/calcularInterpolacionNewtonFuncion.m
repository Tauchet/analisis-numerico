function out = calcularInterpolacionNewtonFuncion(valores)
    
    syms x;
    valoresX = valores(1, :); %[-3, -2, 1, 3, 5];
    valoresY = valores(2, :); %[8, 3, -3, -1, 4];
    valoresB = calcularInterpolacionNewtonB(valoresX, valoresY);
    n = length(valoresX);

    out = 0;

    for i = 1:n        
        bi = valoresB(1, i);
        
        for j = 1:(i - 1)
            bi = bi * (x - valoresX(j));
        end

        out = out + bi;

    end

end

