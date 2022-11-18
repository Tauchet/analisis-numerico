
% Método para el pedido y control de la conversión de un texto a una
% función
function funcion = entradaFuncion(str)

    syms x;

    % Validar que el texto no se encuentra vacío
    if (regexprep(str, ' +', '') == "")
        error("¡La función ingresada no puede estar vacía!");
    end

    try
        funcion = str2sym(str);
    catch ex
        error("¡La función ingresada no tiene el formato correcto!");
    end

end

