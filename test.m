generate_data()


classes = SVMLS(x_data, y_data, unknown, 3, 1, 1);

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
