function out = prueba(fx, n)
    functions = fx;
    dfx = fx;
    for i = 1:n
        dfx = diff(dfx);
        functions(length(functions) + 1) = dfx;
    end
    out = functions;
end