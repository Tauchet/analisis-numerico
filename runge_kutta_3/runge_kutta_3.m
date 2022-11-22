function resultado = runge_kutta_3(f, h, xi, yi, iteraciones)

    syms x;
    syms y;

    resultado = zeros(iteraciones, 10);

    for i = 1:iteraciones
        
      k1 = eval(subs(subs(f, x, xi), y, yi));
      
      xk2 = xi + ((1 / 2) * h);
      yk2 = yi + ((1 / 2) * h * k1);
      k2 = eval(subs(subs(f, x, xk2), y, yk2));

      xk3 = xi + h;
      yk3 = yi - k1 * h + 2 * k2 * h;
      k3 = eval(subs(subs(f, x, xk3), y, yk3));
        
      siguiente_y = yi + (h / 6) * (k1 + 4 * k2 + k3);
        
      resultado(i, :) = [xi, yi, k1, xk2, yk2, k2, xk3, yk3, k3, siguiente_y];
      
      xi = xi + h;
      yi = siguiente_y; 

    end

end

