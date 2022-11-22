function out = calcularInterpolacionNewtonB(x, y)

    n = length(x);
    matriz = InterpolacionNewtonInfo.empty(0, n);

    % Transformar
    for i = 1:n
        matriz(i) = InterpolacionNewtonInfo(i, i, y(i));
    end

    % Crear las iteraciones
    for i = 1:(n - 1)

        anteriorFila = matriz(i, :);
        nuevaFila = InterpolacionNewtonInfo.empty(0, n);
       
        for j = 1:(n - i)

            
            actual = anteriorFila(j);
            siguiente = anteriorFila(j + 1);


            xMin = actual.xMin;
            xMax = siguiente.xMax;
            resultado = (siguiente.resultado - actual.resultado) / (x(xMax) - x(xMin));

            nuevaFila(j) = InterpolacionNewtonInfo(xMin, xMax, resultado);

        end

        for j = (n - i + 1):n
            nuevaFila(j) = InterpolacionNewtonInfo();
        end

        matriz(i + 1, :) = nuevaFila;

    end

    matriz = transpose(matriz);
    
    % Cambiar a matriz de solo resultados
    out = zeros(width(matriz), length(matriz))
    for i = 1:width(matriz)
        for j = 1:length(matriz)
            out(i, j) = matriz(i, j).resultado;
        end
    end

end

