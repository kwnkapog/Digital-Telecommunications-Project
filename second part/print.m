for i = 1:length(p_values)
    for j = 1:length(N_values)
        fprintf('p = %d, N = %d, Coefficients: \n', p_values(i), N_values(j));
        disp(prediction_coefficients{i, j});
    end
end