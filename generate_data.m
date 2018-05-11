function generate_data()
    x1_cord = 1.5*rand(1, 20)+1;
    y1_cord = 1.5*rand(1, 20)+1;
    x2_cord = 1.5*rand(1, 20)+2;
    y2_cord = 1.5*rand(1, 20)+2;
    x_data = [[x1_cord; y1_cord] [x2_cord; y2_cord]];
    y_data = [ones(1, 20) -ones(1,20)];
    assignin('base', 'x_data', x_data)
    assignin('base', 'y_data', y_data)

    x = 1:0.1:4;
    y = 1:0.1:4;

    %%%create grid
    unknown = zeros(2, 961);
    for i = 1:31
        for j = 1:31
            unknown(1, 31*(i-1)+(j)) = x(i);
            unknown(2, 31*(i-1)+(j)) = y(j);
        end
    end
    assignin('base', 'unknown', unknown)
    
    assignin('base', 'gammaValue', 1)
    assignin('base', 'aValue', 1)
    
end