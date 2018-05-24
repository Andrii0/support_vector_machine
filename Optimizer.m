%{
function to optimize gamma for any transformation but minimizing the
number of incorrect classifications for training data. This function uses
fminbnd matlab function to minimize number of incorrect classifications
for gamma on the gamma interval from 0 to 10. fminbnd uses parabolic
interpolation and golden section search to find the minimum.
%}
function Optimizer()
    gammas = zeros(1,5);
    values = zeros(1,5);
    for i = 1:5
        [gammas(i), values(i)] = fminbnd(@Correctness,2*(i-1),2*i);
    end
    [Y, I] = min(values);
    gamma = gammas(I);
    assignin('base', 'gamma', gamma);
    return;
end