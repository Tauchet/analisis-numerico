function resultado = diferenciaNumericaAtras(f, xi, h, precisa, n)

    % Derivadas por método simple hacía adelante
    funciones_simples = [
        "(f0 - fa1) / h"
        "(f0 - (2 * fa1) + fa2) / (h ^ 2)"
        "(f0 - (3 * fa1) + (3 * fa2) - fa3) / (h ^ 3)"
        "(f0 - (4 * fa1) + (6 * fa2) - (4 * fa3) + fa4) / (h ^ 4)"
    ];

    % Derivadas por método preciso hacía adelante
    funciones_precisas = [
        "(fa2 - (4 * fa1) + (3 * f0)) / (2 * h)"
        "((2 * f0) - (5 * fa1) + (4 * fa2) - fa3) / (h ^ 2)"
        "((5 * f0) - (18 * fa1) + (24 * fa2) - (14 * fa3) + (3 * fa4)) / (2 * h ^ 3)"
        "((3 * f0) - (14 * fa1) + (26 * fa2) - (24 * fa3) + (11 * fa4) - (2 * fa5)) / (h ^ 4)"
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
    % atrás es necesario el uso de xi va a estar entre xi - 2, xi - 1, xi
    % por eso el rango inicia desde n - 1, 0
    % esto daría como:
    %  
    % n = 1
    % -2, -1, 0
    for i = -(n + 1):0

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

