function output = SVMLS(x_data, y_data, unknown, transformation, gamma, a, b, varargin)
    if not((size(x_data, 2) == size(y_data, 2)))
        return    
    end
    if nargin < 4
        transformation = 3; 
        gamma = 1;
        a = 1;
        b = 1;
    elseif nargin < 5
        gamma = 1;
        a = 1;
        b = 1;
    elseif nargin < 6
        a = 1;
        b = 1;
    elseif nargin < 7 
        b = 1;
    end
       

    if (transformation == 1)
        Fi = @(x, xx) dot(x, xx);
    elseif (transformation == 2)
        Fi = @(x, xx) (dot(x, xx) + 1)^a;
    elseif (transformation == 3)
        Fi = @(x, xx) exp(-(norm(x-xx)^2)/a^2);
    elseif (transformation == 4)
        Fi = @(x, xx) tanh(a*dot(x, xx)+b);
    else
        fprintf('error')
    end

    Omega = zeros(size(x_data, 2), size(x_data, 2));
    for i = 1:size(x_data, 2)
        for j = 1:size(x_data, 2)
            Omega(i,j) = y_data(i)*y_data(j)*Fi(x_data(:,i), x_data(:,j));
        end
    end
        
    gamma_matrix = 1/gamma*eye(size(x_data, 2));
    Omega = Omega + gamma_matrix;

    A = [[0 y_data]' [-1.*y_data; Omega]];
    o = [0; ones(size(x_data, 2), 1)];

    x = A\o;
    
    y = zeros(size(unknown,2), 1);
    for j = 1:size(unknown, 2)
        sum = 0;
        for i = 1:size(x_data, 2)
            sum = sum + x(i+1)*y_data(i)*Fi(x_data(:,i), unknown(:,j))+x(1);
        end
        
        y(j) = sign(sum);
    end
    
    
    
    output = y;
end
