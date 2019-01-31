% Matt McDade
% ANM 2 
% HW 1

function hw_1

    f = @(x) x^4 * exp(-0.1*x);
    x = 3.2;

    for h = 1./10.^[1:8]
        approx = fd1(f, x, h)
    end

    function a = fd1(f, x, h)
            a = (f(x+h)-f(x))/h;
    end

end