function resultado = diferenciaNumericaAdelante(f, xi, h, precisa, n)

    % Derivadas por método simple hacía adelante
    funciones_simples = [
        "(fs1 - f0) / h"
        "(fa2 - (2 * fs1) + f0) / (h ^ 2)"
        "(fs3 - (3 * fs2) + (3 * fs1) - f0) / (h ^ 3)"
        "(fs4 - (4 * fs3) + (6 * fs2) - (4 * fs1) + f0) / (h ^ 4)"
    ];

    % Derivadas por método preciso hacía adelante
    funciones_precisas = [
        "(-fs2 + (4 * fs1) - (3 * f0)) / (2 * h)"
        "(-fs3 + (4 * fs2) - (5 * fs1) + (2 * f0)) / (h ^ 2)"
        "((-3 * fs4) + (14 * fs3) - (24 * fs2) + (18 * fs1) - (5 * f0)) / (2 * h ^ 3)"
        "((-2 * fs5) + (11 * fs4) - (24 * fs3) + (26 * fs2) - (14 * fs1) + (3 * f0)) / (h ^ 4)"
    ];

    % Seleccionamos la ecuación dependiendo de las variables ingresadas
    if precisa
        ecuacion = subs(str2sym(funciones_precisas(n, 1)), "h", h);
    else
        ecuacion = subs(str2sym(funciones_simples(n, 1)), "h", h);
    end
    disp(ecuacion);

    % Recorremos las variables que seguramente deberemos usar
    % por regla general si se saca la derivada de primer nivel hacía
    % adelante es necesario el uso de xi va a estar entre xi, xi+1, xi+2
    % por eso el rango inicia desde 0 a n + 1
    % esto daría como:
    %  
    % n = 1
    % 0, 1, 2
    for i = 0:(n + 1)

        % Si la variable
        variable = "f" + i;
        
        if (i < 0)
            % Si la variable es la anterior, entonces sería fa1 que es: f(xi - 1)
            variable = "fa" + abs(i);
        elseif (i > 0)
            % Si la variable es la siguiente, entonces sería fs1 que es: f(xi + 1)
            variable = "fs" + abs(i);
        end

        % Obtenemos el valor al evaluar la función con el valor encontrado
        valor = eval(subs(f, xi + (i * h)));

        % Sustitumos en la ecuación y continuamos
        ecuacion = subs(ecuacion, variable, valor);
        disp(ecuacion);

    end
    
    resultado = eval(ecuacion);
    disp(resultado)

end

