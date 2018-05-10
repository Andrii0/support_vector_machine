x1_cord = 1.5*rand(1, 20)+1;
y1_cord = 1.5*rand(1, 20)+1;
x2_cord = 1.5*rand(1, 20)+2;
y2_cord = 1.5*rand(1, 20)+2;
x_data = [[x1_cord; y1_cord] [x2_cord; y2_cord]];
y_data = [ones(1, 20) -ones(1,20)];



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


classes = SVMLS(x_data, y_data, unknown, 3, 1, 0.8)

%%%plot points and classifier 
figure
hold on
plot(x_data(1,1:20), x_data(2, 1:20), 'r *')
plot(x_data(1,21:40), x_data(2, 21:40), 'b *')

 
for i = 1:961
    if (classes(i) == 1)
        plot(unknown(1,i), unknown(2, i), 'black +')
    end
end
