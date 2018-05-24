%{
Function to compute the classifier 
Input:         x_data - set of points as training data in a form of 2d 
                        matrix where each column is a separate point and 
                        each row specifies one dimension.
               y_data - set of classes for in terms of 1 and -1 for each 
                        point in the x_data, where each column represents 
                        a class for corresponding point in x_data based on 
                        the index.
              unknown - set of point which follow the same format as x_data
                        that will be classified when function returns
       transformation - input parameter for the transformation that will be
                        to build a classifier, this parameter can take
                        values of 1, 2, 3 and 4 with each corresponding to
                        linear, polynomial, exponential and tanh
                        transformations respectively.
                gamma - input parameter that determines how strict the 
                        classifier is, default value is 1
                    a - input parameter that corresponds to d variable in 
                        polynomial transformation, sigma variable for 
                        exponential transformation and K variable in tanh 
                        transformation. Default is 1.
                    b - input parameter that is only used in tanh 
                        transformation and correspond to theta variable, 
                        default is 1
Output:        output - One dimensional vector of size equal to the number 
                        of columns in unknown and consisting of class value 
                        for corresponding point in unknown 

%}
function output = SVMLS(x_data, y_data, unknown, transformation, gamma, a, b, varargin)
    %check preconditions
    x_size = size(x_data, 2);
    if not((x_size == size(y_data, 2)))
        fprintf("error: y_data must correspond to same number of points as in x_data\n");
        return    
    end
    
    %set default values
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
       
    %determine transformation
    if (transformation == 1)
        Fi = @(x, xx) dot(x, xx);
    elseif (transformation == 2)
        Fi = @(x, xx) (dot(x, xx) + 1)^a;
    elseif (transformation == 3)
        Fi = @(x, xx) exp(-(norm(x-xx)^2)/a^2);
    elseif (transformation == 4)
        Fi = @(x, xx) tanh(a*dot(x, xx)+b);
    else
        fprintf("error: transformation is not supported\n")
    end

    %creating Omega matrix based in y_data and transformation for x_data
    Omega = zeros(x_size, x_size);
    for i = 1:x_size
        for j = 1:x_size
            Omega(i,j) = y_data(i)*y_data(j)*Fi(x_data(:,i), x_data(:,j));
        end
    end
        
    gamma_matrix = 1/gamma*eye(x_size);
    Omega = Omega + gamma_matrix;
        
    %creating A matrix and o matrices for least squares problem and solving
    %for x, where x consist of constant b and lagrangian multipliers
    A = [[0 y_data]' [-1.*y_data; Omega]];
    o = [0; ones(x_size, 1)];
    x = A\o;

    %appling classifier on unknown input data
    y = zeros(size(unknown,2), 1);
    for j = 1:size(unknown, 2)
        sum = 0;
        for i = 1:x_size
            sum = sum + sqrt((x(i+1))^2)*y_data(i)*Fi(x_data(:,i), unknown(:,j))+x(1);
        end
        y(j) = sign(sum);
    end
    output = y;
end