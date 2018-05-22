function count = Correctness(input)
    red = evalin('base','red');
    blue = evalin('base','blue');
    val_r = ones(1,size(red,2));
    val_b = -ones(1,size(blue,2));    
    
    
    trans = evalin('base','trans');
    b = evalin('base','b');
    gamma = input(1);
    if (size(input,2) == 1)
        a = evalin('base','a');
    else
        a = input(2);
    end
    
    prediction = SVMLS([red blue],[val_r val_b], [red blue], trans, gamma, a, b);
    result = [val_r val_b] + prediction';
    count = nnz(~result);
end

