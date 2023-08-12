K = 100; % K = μ in your notation
mu = 100;
% Frequency range in logarithmic scale from 0.1 to 10000 rad/s
omega = logspace(-1, 5, 1000);
% First order low pass filter transfer function H(jω)
H = K ./ (1j * omega + mu);
% Magnitude-squared response in dB
magnitude_squared_dB = 20 * log10(abs(H).^2);
% Phase response in degrees
phase_deg = angle(H) * 180 / pi;
% Plot the magnitude-squared response
figure;
semilogx(omega, magnitude_squared_dB, 'b', 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('|H(jω)|^2 (dB)');
title('Magnitude-squared Response');
grid on;
ylim([-100,0]);
% Plot the phase response
figure;
semilogx(omega, phase_deg, 'b', 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('Phase (degrees)');
title('Phase Response');
grid on;
ylim([-100,0]);
% Define the given transfer function
mu = 100;
gamma = 10000;
K = mu / gamma;
% Frequency range in logarithmic scale from 0.1 to 10000 rad/s
omega = logspace(-1, 6, 1000);
% Second order low pass filter transfer function H(jω)
H = K * (1j * omega + gamma) ./ (1j * omega + mu);
% Magnitude-squared response in dB
magnitude_squared_dB = 20 * log10(abs(H).^2);
% Phase response in degrees
phase_deg = angle(H) * 180 / pi;
% Plot the magnitude-squared response
figure;
semilogx(omega, magnitude_squared_dB, 'r', 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('|H(jω)|^2 (dB)');
title('Magnitude-squared Response');
grid on;
ylim([-40,0]);
% Plot the phase response
figure;
semilogx(omega, phase_deg, 'r', 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('Phase (degrees)');
title('Phase Response');
grid on;
ylim([-80,0]);

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

% Part (b)
% Given values
wo = 0.01;
K = 0.01;
beta = 100;
% Values of Q
Q_values = [0.25, 1, 10];
% Initialize arrays to store magnitude-squared response and phase response for each Q value
mag_squared_dB_all = zeros(length(frequency), length(Q_values));
phase_deg_all = zeros(length(frequency), length(Q_values));
% Frequency range from 0.0001 to 10 with 1000 points
frequency = logspace(-5, 4, 1000);
for q = 1:length(Q_values)
    Q = Q_values(q);
    
    % Calculate alpha and epsilon using Q
    epsilon = wo / Q;
    alpha = wo^2;
    % Calculate transfer function H(s)
    s = 1j * frequency;
    H = (K * (s + beta)) ./ (s.^2 + epsilon * s + alpha);
    % Magnitude-squared response in dB
    mag_squared_dB_all(:, q) = 20 * log10(abs(H).^2);
    % Phase response in degrees
    phase_deg_all(:, q) = angle(H) * 180 / pi;
end
% Plot the magnitude-squared response for different Q values
figure;
semilogx(frequency, mag_squared_dB_all, 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('Magnitude-Squared (dB)');
title('Magnitude-Squared Response for Different Q Values');
legend('Q = 0.25', 'Q = 1', 'Q = 10');
grid on;
ylim([-250,250])
% Plot the phase response for different Q values
figure;
semilogx(frequency, phase_deg_all, 'LineWidth', 2);
xlabel('Frequency (rad/s, log scale)');
ylabel('Phase (degrees)');
title('Phase Response for Different Q Values');
legend('Q = 0.25', 'Q = 1', 'Q = 10');
grid on;
