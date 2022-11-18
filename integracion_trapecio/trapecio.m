% Esta función devuelve como resultado un arreglo
% que está de la siguiente manera:
% [resultado, errorReal, errorTruncamiento]

function resultado = trapecio()

    syms x;

    f = 16 - x ^ 2;
    a = 1;
    b = 3;
    n = 4;

    h = (b - a) / n;
    

    % Esto es porqué estamos haciendo primero la suma interna
    % entonces es básicamente fX0 + fXn
    xi = a;
    xn = a + (h * n);

    resultado = eval(subs(f, xi)) + eval(subs(f, xn));

    % Creamos la sumatoria que se multiplica por 2.
    for i = 1:(n - 1)
        xi = a + (i * h);
        resultado = resultado + (2 * eval(subs(f, xi)));
    end

    % Por último debemos multiplicar por h / 2, ya que tenemos todo el
    % parentesis de la ecuación
    resultado = resultado * (h / 2);

    % Calculamos los valores
    valorReal = integral(@(x) eval(subs(f, x)), a, b);
    errorReal = abs((valorReal - resultado) / valorReal) * 100;
    errorTruncamiento = (((b - a) ^ 3) / (12 * (n ^ 3))) * (integral(@(x) eval(subs(diff(f, 2), x)), a, b) / (b - a));

    % Encontramos el resultado correspondiente
    resultado = [resultado, errorReal, errorTruncamiento];

end

