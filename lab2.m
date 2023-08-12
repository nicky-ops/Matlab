
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


