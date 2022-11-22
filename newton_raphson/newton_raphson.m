function resultado = newton_raphson(f, x, parIteraciones, parErrorNormalizado)
    
    df = diff(f);

    % Variables temporales
    numIteracion = 0;
    valorAnterior = 0;

    while true

        % Creamos los valores necesarios para la iteración
        numIteracion = numIteracion + 1;

        % Validamos que exista un cambio de signo
        fx = eval(subs(f, x));
        dfx = eval(subs(df, x));
        xNext = x - (fx / dfx);
            errorNormalizado = 0;

            % Guardamos el registro en la tabla
            if numIteracion == 1
                resultado = [x, fx, dfx, xNext, 0];
            else

                % Cálculamos el error normalizado
                errorNormalizado = abs((xNext - valorAnterior) / xNext) * 100;

                resultado(end + 1, :) = [x, fx, dfx, xNext, errorNormalizado];
            end

            % Guardamos el valor actual para que se calcule el error
            % normalizado en la siguiente iteración
            valorAnterior = xNext;
    
            % Asignamos siempre el valor encontrado a Xi
            x = xNext;

        % Método de parada por iteraciones
        if parIteraciones > 0 && numIteracion >= parIteraciones
            disp("stop.")
            break;
        end

        % Método de parada por error normalizado
        if numIteracion > 1 && parErrorNormalizado >= 0 && errorNormalizado < parErrorNormalizado
            break;
        end

    end

end