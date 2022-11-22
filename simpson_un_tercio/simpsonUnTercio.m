function resultado = simpsonUnTercio(f, a, b, n)

    h = (b - a) / n;

    % Iniciamos el valor de f(0)
    resultado = eval(subs(f, a));

    
    % Sumatoria de 4(f(Xi)) de 1, 3, 5
    i = 1;
    while i < n
        
        xi = a + (i * h);
        
        resultado = resultado + (4 * eval(subs(f, xi)));
        

        i = i + 2;
    end

    % Sumatoria de 2(f(Xi)) de 2, 4, 6
    i = 2;
    while i < n
        
        xi = a + (i * h);
        resultado = resultado + (2 * eval(subs(f, xi)));

        i = i + 2;
    end

    % Sumamos el valor por el f(Xn)
    resultado = resultado + eval(subs(f, b));

    % Múltiplicamos toda la sumatoria por lo de por fuera 
    % (h / 3) * sumatoria
    resultado = (1 / 3) * h * resultado;

end

