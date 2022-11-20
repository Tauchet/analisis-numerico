function resultado = simpsonTresOctavos()
    
    syms x;

    f = sqrt(tan(x));
    a = 0;
    b = 1.5;
    n = 8;

    h = (b - a) / n;

    % Iniciamos el valor de f(0)
    resultado = eval(subs(f, a));

    % Sumatoria de 3(f(Xi)) de 1, 4, 7
    i = 1;
    while i < n
        
        xi = a + (i * h);
        resultado = resultado + (3 * eval(subs(f, xi)));

        i = i + 3;
    end

    % Sumatoria de 3(f(Xi)) de 2, 5, 8
    i = 2;
    while i < n
        
        xi = a + (i * h);
        resultado = resultado + (3 * eval(subs(f, xi)));

        i = i + 3;
    end

    % Sumatoria de 2(f(Xi)) de 3, 6, 9
    i = 3;
    while i < n
        
        xi = a + (i * h);
        resultado = resultado + (2 * eval(subs(f, xi)));

        i = i + 3;
    end

    % Sumamos el valor por el f(Xn)
    resultado = resultado + eval(subs(f, b));

    % Múltiplicamos toda la sumatoria por lo de por fuera 
    % (3h / 8) * sumatoria
    resultado = (3 / 8) * h * resultado;

end

