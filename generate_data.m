%function to generate new set of training data for two classes
function generate_data()
    red_x = 4*rand(1, 20);
    red_y = 4*rand(1, 20);
    blue_x = 4*rand(1, 20)+3;
    blue_y = 4*rand(1, 20)+3;
    
    red = [red_x; red_y];
    blue = [blue_x; blue_y];
    
    assignin('base','red',red);
    assignin('base','blue',blue);   
end