function resultado = jacobiErrorNormalizado(matrizJacobi)

    % Primero rotamos la matriz para que sea más sencillo
    % el cálculo de los errores
    matrizJacobi = transpose(matrizJacobi)

    resultado = zeros(height(matrizJacobi) - 2, width(matrizJacobi));

    % Iniciamos desde la segunda fila ya que x0 no es necesario mostrarlo.
    for i = 3:height(matrizJacobi)
        for j = 1:width(matrizJacobi)
            valorActual = matrizJacobi(i, j);
            valorAnterior = matrizJacobi(i - 1, j);
            resultado(i - 2, j) = abs((valorActual - valorAnterior) / valorActual) * 100;
        end
    end

    % Rotamos la matriz resultante para que quede
    % como inicialmente se ejecuto el método
    resultado = transpose(resultado);

end

