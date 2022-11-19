function resultado = gaussErrorNormalizado(matrizGauss)

    % Primero rotamos la matriz para que sea más sencillo
    % el cálculo de los errores
    matrizGauss = transpose(matrizGauss)

    resultado = zeros(height(matrizGauss) - 2, width(matrizGauss));

    % Iniciamos desde la segunda fila ya que x0 no es necesario mostrarlo.
    for i = 3:height(matrizGauss)
        for j = 1:width(matrizGauss)
            valorActual = matrizGauss(i, j);
            valorAnterior = matrizGauss(i - 1, j);
            resultado(i - 2, j) = abs((valorActual - valorAnterior) / valorActual) * 100;
        end
    end

    % Rotamos la matriz resultante para que quede
    % como inicialmente se ejecuto el método
    resultado = transpose(resultado);

end

