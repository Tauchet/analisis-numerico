function resultado = biseccion(f, Xi, Xs, parIteraciones, parErrorNormalizado)

    % Variables temporales
    numIteracion = 0;
    valorAnterior = 0;

    while true

        % Creamos los valores necesarios para la iteración
        numIteracion = numIteracion + 1;
        fXi = eval(subs(f, Xi));
        fXs = eval(subs(f, Xs));

        % Validamos que exista un cambio de signo
        if (fXi * fXs) < 0

            Xr = (Xi + Xs) / 2;
            fXr = eval(subs(f, Xr));
            errorNormalizado = 0;

            % Guardamos el registro en la tabla
            if numIteracion == 1
                resultado = [Xi, Xr, Xs, fXi, fXr, fXs, 0];
            else

                % Cálculamos el error normalizado
                errorNormalizado = abs((Xr - valorAnterior) / Xr) * 100;

                resultado(end + 1, :) = [Xi, Xr, Xs, fXi, fXr, fXs, errorNormalizado];
            end
    
            % Encontramos la variable que tiene el cambio del signo
            if (fXi * fXr) < 0
                Xs = Xr;
            elseif (fXr * fXs) < 0
                Xi = Xr;
            elseif fXr == 0
                break;
            end
        
        else
            error("¡No se ha encontrado un cambio de signo!");
        end

        % Método de parada por iteraciones
        if parIteraciones > 0 && numIteracion >= parIteraciones
            break;
        end

        % Método de parada por error normalizado
        if numIteracion > 1 && parErrorNormalizado >= 0 && errorNormalizado < parErrorNormalizado
            break;
        end

        % Guardamos el valor actual para que se calcule el error
        % normalizado en la siguiente iteración
        valorAnterior = Xr;

    end
end