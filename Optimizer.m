function Optimizer()
    trans = evalin('base','trans');
    
    gammas = zeros(1,5);
    values = zeros(1,5);
    for i = 1:5
        [gammas(i), values(i)] = fminbnd(@Correctness,2*(i-1),2*i);
    end
    [Y, I] = min(values);
    gamma = gammas(I);
    assignin('base', 'gamma', gamma);
    return;
    
    
    %{
    if (trans == 1)
        gammas = zeros(1,5);
        values = zeros(1,5);
        for i = 1:5
            [gammas(i), values(i)] = fminbnd(@Correctness,2*(i-1),2*i);
        end
        [Y, I] = min(values);
        gamma = gammas(I);
        assignin('base', 'gamma', gamma);
        return;
    elseif (trans == 2 || trans == 3)
        output = fminsearch(@Correctness, [1, 1]);
        gamma = output(1);
        a = output(2);
        assignin('base', 'gamma', gamma);
        assignin('base', 'a', a);
        return;
    end 
    %}
end