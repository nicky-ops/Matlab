% Second Order Transfer Functions
alpha = 1;
epsilon = 1;
beta = 100;
Q = [0.25, 1, 10];

w = logspace(-1, 3, 1000);

% Transfer Function 3
H3 = @(w, Q) abs(alpha ./ (1j*w).^2 + epsilon ./ (1j*w) + alpha).^2 ./ ...
            (abs(beta ./ (1j*w).^2 + epsilon ./ (1j*w) + alpha).^2 + abs(alpha ./ (1j*w).^2 + epsilon ./ (1j*w) + alpha).^2);
phase3 = @(w, Q) angle(alpha ./ (1j*w).^2 + epsilon ./ (1j*w) + alpha);

% Transfer Function 4
H4 = @(w) abs((alpha*(1j*w + beta)) ./ ((1j*w).^2 + epsilon*(1j*w) + alpha).^2).^2;
phase4 = @(w) angle((alpha*(1j*w + beta)) ./ ((1j*w).^2 + epsilon*(1j*w) + alpha).^2);

% Plotting Magnitude-squared Response and Phase Response for Second Order Transfer Functions
figure;
subplot(2, 1, 1);
for q = Q
    semilogx(w, 10*log10(H3(w, q)), 'LineWidth', 2);
    hold on;
end
semilogx(w, 10*log10(H4(w)), 'LineWidth', 2);
grid on;
xlabel('\omega');
ylabel('|H(j\omega)|^2 (dB)');
title('Magnitude-squared Response for Second Order Transfer Functions');
legend('Q = 0.25', 'Q = 1', 'Q = 10', 'Transfer Function 4');

subplot(2, 1, 2);
for q = Q
    semilogx(w, phase3(w, q)*(180/pi), 'LineWidth', 2);
    hold on;
end
semilogx(w, phase4(w)*(180/pi), 'LineWidth', 2);
grid on;
xlabel('\omega');
ylabel('Phase (degrees)');
title('Phase Response for Second Order Transfer Functions');
legend('Q = 0.25', 'Q = 1', 'Q = 10', 'Transfer Function 4');