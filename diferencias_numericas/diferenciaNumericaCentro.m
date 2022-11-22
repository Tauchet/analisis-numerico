function resultado = diferenciaNumericaCentro(f, xi, h, precisa)

    n = 1;

    % Derivadas por método simple hacía adelante
    funciones_simples = [
        "(fs1 - fa1) / (2 * h)"
        "(fs1 - (2 * f0) + fa1) / (h ^ 2)"
        "(fs2 - (2 * fs1) + (2 * fa1) - fa2) / (2 * (h ^ 3))"
        "(fs2 - (4 * fs1) - (6 * f0) - (4 * fa1) - (8 * fa2) + fa3) / (h ^ 4)"
    ];

    % Derivadas por método preciso hacía adelante
    funciones_precisas = [
        "(-fs2 + (8 * fs1) - (8 * fa1) + fa2) / (2 * h)"
        "(-fs2 + (16 * fs1) - (30 * f0) + (16 * fa1) - fa2) / (12 * (h ^ 2))"
        "(-fs3 + (8 * fs2) - (13 * fs1) + (13 * fa1) - (8 * fa2) + fa3) / (8 * (h ^3))"
        "(-fs3 + (12 * fs2) + (39 * fs1) + (56 * f0) - (39 * fa1) + (12 * fa2) + fa3) / (6 * (h ^ 4))"
    ];

    % Seleccionamos la ecuación dependiendo de las variables ingresadas
    if precisa
        ecuacion = subs(str2sym(funciones_precisas(n, 1)), "h", h);
    else
        ecuacion = subs(str2sym(funciones_simples(n, 1)), "h", h);
    end
    disp(ecuacion);

    % Recorremos las variables que seguramente deberemos usar
    % por regla general si se saca la derivada de primer nivel central 
    % es necesario el uso de xi va a estar entre xi - 2, xi - 1, xi, xi + 1, xi + 2
    % por eso el rango inicia desde n - 1, n + 1
    % esto daría como:
    %  
    % n = 1
    % -2, -1, 0, 1, 2
    for i = -(n + 1):(n + 1)

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

