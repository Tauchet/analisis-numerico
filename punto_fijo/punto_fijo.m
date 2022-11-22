function resultado = punto_fijo(f, g, x, parIteraciones, parErrorNormalizado)
    
    dg = diff(g);
    
    % Validamos que la función g(x) converge 
    if abs(eval(subs(dg, x))) >= 1
        error("La función ingresada para g(x) no converge.");
    end

    % Variables temporales
    numIteracion = 0;
    valorAnterior = 0;

    while true

        % Creamos los valores necesarios para la iteración
        numIteracion = numIteracion + 1;

        % Validamos que exista un cambio de signo
        gx = eval(subs(g, x));
        fx = eval(subs(f, x));
            errorNormalizado = 0;

            % Guardamos el registro en la tabla
            if numIteracion == 1
                resultado = [x, gx, fx, 0];
            else

                % Cálculamos el error normalizado
                errorNormalizado = abs((x - valorAnterior) / x) * 100;

                resultado(end + 1, :) = [x, gx, fx, errorNormalizado];
            end

            % Guardamos el valor actual para que se calcule el error
            % normalizado en la siguiente iteración
            valorAnterior = x;
    
            % Asignamos siempre el valor encontrado a Xi
            x = gx;

        % Método de parada por iteraciones
        if parIteraciones > 0 && numIteracion >= parIteraciones
            break;
        end

        % Método de parada por error normalizado
        if numIteracion > 1 && parErrorNormalizado >= 0 && errorNormalizado < parErrorNormalizado
            break;
        end

    end

end