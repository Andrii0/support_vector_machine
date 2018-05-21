function count = Correctness(gamma)
    x_data = evalin('base','training_data');
    y_data = evalin('base','training_values');
    trans = evalin('base','trans');
    a = evalin('base','a');
    b = evalin('base','b');

    prediction = SVMLS(x_data, y_data, x_data, trans, gamma, a, b);
    result = y_data + prediction';
    count = nnz(~result);
end
