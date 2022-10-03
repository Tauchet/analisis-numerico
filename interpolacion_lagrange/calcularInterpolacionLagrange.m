function out = calcularInterpolacionLagrange()

    syms x;
    valoresX = [-3, -1, 2, 4, 7];
    valoresY = [2, 7, -2, 5, 8];
    n = length(valoresX);

    out = 0;
    
    for i = 1:n
        
        a = 1;
        b = 1;
        
        for j = 1:n
            if j ~= i
                a = a * (x - valoresX(j));
                b = b * (valoresX(i) - valoresX(j));
            end
        end

        out = out + ((a / b) * valoresY(i));

    end
    
end

