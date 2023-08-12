% Given values
wo = 1;
K = 1;
Q_values = [0.25, 1, 10];

% Frequency range from 0.1 to 10 with 1000 points
frequency = logspace(-2, 2, 1000);

% Initialize arrays to store magnitude-squared response and phase response for each Q value
mag_squared_dB_all = zeros(length(frequency), length(Q_values));
phase_deg_all = zeros(length(frequency), length(Q_values));

% Calculate and plot for each Q value
for i = 1:length(Q_values)
    Q = Q_values(i);
    epsilon = wo / Q;
    alpha = wo^2;

    % Transfer function H(s)
    s = 1j * frequency;
    H = K ./ (s.^2 + epsilon * s + alpha);

    % Magnitude-squared response in dB
    mag_squared_dB = 20 * log10(abs(H).^2);
    mag_squared_dB_all(:, i) = mag_squared_dB;

    % Phase response in degrees
    phase_deg = angle(H) * 180 / pi;
    phase_deg_all(:, i) = phase_deg;
end

% Plot the magnitude-squared response
figure;
semilogx(frequency, mag_squared_dB_all, 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('|H(jω)|^2 (dB)');
title('Magnitude-squared Response for Different Q Values of second order filter with k = omega_not = 1');
legend('Q = 0.25', 'Q = 1', 'Q = 10');
grid on;
ylim([-100,45]);

% Plot the phase response
figure;
semilogx(frequency, phase_deg_all, 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('Phase (degrees)');
title('Phase Response for Different Q Values of a second order filter with k = omega_not = 1');
legend('Q = 0.25', 'Q = 1', 'Q = 10');
grid on;
ylim([-180,0]);
