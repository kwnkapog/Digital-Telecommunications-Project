plot(input_signal(1:200), 'b');
hold on;
plot(output_received_signal(1:200), 'r');

title('input signal(blue) and decoded signal(red)');
    xlabel('signal index');
    ylabel('signal value');
    legend('Signals');