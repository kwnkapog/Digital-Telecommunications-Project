% We calculate the Mean Square Error for every value of p, N, and putting
% the values of a(prediction coefficients) in a cell to plot them easier.
N_values = 1:3;
p_values = 5:10;
mse_results = zeros(length(p_values), length(N_values));
prediction_coefficients = cell(length(p_values), length(N_values));


for i = 1:length(p_values)
    p = p_values(i);
    for j = 1:length(N_values)
        N = N_values(j);

        [~,~,~,predicted_signal,a] = DPCM_encoder(input_signal,p,N,-3.5,3.5);

        %MSE
        mse_results(i, j) = immse(input_signal, predicted_signal);
        prediction_coefficients{i, j} = a;
    end
end

% graph
figure;
plot(N_values, mse_results', '-o');
title('MSE ως προς το N για διάφορες τιμές του p');
xlabel('N (bits κβαντισμού)');
ylabel('MSE');
legend(arrayfun(@(p) sprintf('p = %d', p), p_values, 'UniformOutput', false));
grid on;