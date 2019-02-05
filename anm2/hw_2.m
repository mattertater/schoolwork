% Matt McDade
% ANM 2 
% HW 2 Problem #2

function hw_2
    f = @(x) log(x^2 + 1);
    
    fprintf('x = 1.3   h = 0.01:\n')
    fprintf('\tCD2: %.8f \tFD2: %.8f\n', CD2(f, 1.3, 0.01), FD2(f, 1.3, 0.01))
    fprintf('x = 1.3   h = 0.001:\n')
    fprintf('\tCD2: %.8f \tFD2: %.8f\n', CD2(f, 1.3, 0.001), FD2(f, 1.3, 0.001))

    function a = CD2(f, x, h)
        a = (f(x-h) - f(x+h)) ./ 2*h;
    end

    function a = FD2(f, x, h)
        a = (3*f(x-h) - 4*f(x) + f(x+h)) ./ 2*h;
    end
end