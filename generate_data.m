%function to generate new set of data
function generate_data()
    red_x = 4*rand(1, 20);
    red_y = 4*rand(1, 20);
    blue_x = 4*rand(1, 20)+3;
    blue_y = 4*rand(1, 20)+3;
    red = [red_x; red_y];
    blue = [blue_x; blue_y];
    data = [];

    assignin('base','red',red);
    assignin('base','blue',blue);
    assignin('base','data',data);
    %assignin('base','trans',3);
    %assignin('base','gamma',1);
    %assignin('base','a',1);
    %assignin('base','b',1);
    
    
end