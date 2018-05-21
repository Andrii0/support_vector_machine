%function to generate new set of data
function generate_data()
    x1_cord = 3*rand(1, 20);
    y1_cord = 3*rand(1, 20);
    x2_cord = 3*rand(1, 20)+2;
    y2_cord = 3*rand(1, 20)+2;
    x_data = [[x1_cord; y1_cord] [x2_cord; y2_cord]];
    y_data = [ones(1, 20) -ones(1,20)];

    %%%create grid
    unknown = [];
    for i = 0:0.2:5
        for j = 0:0.2:5
            point = [i;j];
            unknown = [unknown(:,:) point];
        end
    end
    
    assignin('base','training_data',x_data);
    assignin('base','training_values',y_data);
    assignin('base','testing_data',unknown);
    %assignin('base','trans',3);
    %assignin('base','gamma',1);
    %assignin('base','a',1);
    %assignin('base','b',1);
    
    fprintf("new data generated\n")
end