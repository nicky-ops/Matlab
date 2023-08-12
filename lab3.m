% Chebyshev Type I filter design
[z, p, k] = cheb1ap(6, 3);     % Design analog prototype filter
[num, den] = zp2tf(z, p, k);   % Convert zeros, poles, and gain to transfer function form
[H_cheby1, w_cheby1] = freqs(num, den);      % Compute frequency response

% Butterworth filter design
Fs = 1000;                     % Sampling frequency
Fc = 300;                      % Cutoff frequency
Wn = Fc / (Fs / 2);            % Normalized cutoff frequency
[num1, den1] = butter(6, Wn, 'low', 's'); % Design analog Butterworth filter
[H_butter, w_butter] = freqs(num1, den1);   % Compute frequency response

% Bessel filter design
[num2, den2] = besself(6, Wn, "low"); % Design analog Bessel filter
[H_bessel, w_bessel] = freqs(num2, den2);   % Compute frequency response

% Plot magnitude-squared response on a log scale
figure(1);
semilogx(w_cheby1, 40 * log10(abs(H_cheby1).^2), 'r', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Chebyshev magnitude-squared response
hold on;
semilogx(w_butter, 20 * log10(abs(H_butter).^2), 'g', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Butterworth magnitude-squared response
semilogx(w_bessel, 20 * log10(abs(H_bessel).^2), 'b', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Bessel magnitude-squared response
grid on;
xlabel('Frequency [rad/s] (log scale)');
ylabel('|H(j\omega)|^2 (dB)');
title('Magnitude-Squared Response for Order N=6');
legend('Chebyshev Type I', 'Butterworth', 'Bessel');
ylim([-160, 20]);

% Plot phase response
figure(2);
plot(w_cheby1, unwrap(angle(H_cheby1)), 'r', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Chebyshev phase response
hold on;
plot(w_butter, unwrap(angle(H_butter)), 'g', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Butterworth phase response
plot(w_bessel, unwrap(angle(H_bessel)), 'b', 'LineWidth', 1.5, 'LineStyle', '--'); % Plot Bessel phase response
grid on;
xlabel('Frequency [rad^-1.5]');
ylabel('Phase (radians)');
title('Phase Response for Order N=6');
legend('Chebyshev Type I', 'Butterworth', 'Bessel');
xlim([0, 2]);
