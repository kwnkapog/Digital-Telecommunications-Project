N_values = 1:3;
p_values = 5:10;

subset_size = 5000;

num_subsets = length(input_signal) / subset_size;

mse_results = zeros(length(p_values), length(N_values), num_subsets);
prediction_coefficients = cell(length(p_values), length(N_values), num_subsets);

for subset = 1:num_subsets
    current_subset = input_signal((subset-1)*subset_size + 1 : subset*subset_size);

    for i = 1:length(p_values)
        p = p_values(i);
        for j = 1:length(N_values)
            N = N_values(j);

            [~, ~, ~, predicted_signal, a] = DPCM_encoder(current_subset, p, N, -3.5, 3.5);

            % MSE
            mse_results(i, j, subset) = immse(current_subset, predicted_signal);
            prediction_coefficients{i, j, subset} = a;
        end
    end

    figure;
    plot(N_values, squeeze(mse_results(:, :, subset))', '-o');
    title(['MSE ως προς το N για διάφορες τιμές του p, Υποσύνολο ', num2str(subset)]);
    xlabel('N (bits κβαντισμού)');
    ylabel('MSE');
    legend(arrayfun(@(p) sprintf('p = %d', p), p_values, 'UniformOutput', false));
    grid on;
end