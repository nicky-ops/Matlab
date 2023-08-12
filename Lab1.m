 % Cutoff frequencies in Hz
 cutoff_freqs = [500, 1000, 2000, 4000];
 
 % Sampling frequency
 Fs = 10000;  % Set the desired sampling frequency
 
 % Time vector
 t = -0.01:1/Fs:0.01;  % Time range from -0.01 to 0.01 seconds
 
 % Part a: Plotting impulse response of ideal low pass filter
 figure(1);  % Create figure 1
 hold on;  % Enable hold on to plot all responses on the same axes
 
 % Loop through each cutoff frequency
 for i = 1:length(cutoff_freqs)
     % Create an ideal low pass filter using the cutoff frequency
     f_cutoff = cutoff_freqs(i);
     h = (2 * f_cutoff / Fs) * sinc(2 * f_cutoff * t);
 
     % Plot impulse response against time
     plot(t, h);
 end
 
 hold off;  % Disable hold on
 grid on;  % Enable grid
 xlabel('Time (s)');  % Set x-axis label
 ylabel('Impulse Response');  % Set y-axis label
 title('Impulse Response of Ideal Low Pass Filter');  % Set plot title
 
 % Add a legend showing the cutoff frequencies
 legend(cellstr(num2str(cutoff_freqs', '%-d Hz')));
 
 % Part b: Obtaining output signal of the filter with a unit step function input
 figure(2);  % Create figure 2
% Cutoff frequencies in Hz
cutoff_freqs = [500, 1000, 2000, 3000, 4000];

% Time vector
t = -0.01:1/Fs:0.01;  % Time range from -0.01 to 0.01 seconds

% Create a unit step function input signal
u = zeros(size(t));
u(t >= 0) = 1;

% Loop through each cutoff frequency
for i = 1:length(cutoff_freqs)
    % Create an ideal low pass filter using the cutoff frequency
    f_cutoff = cutoff_freqs(i);
    hLP = (f_cutoff / pi) * sinc(f_cutoff * t);
    
    % Convolve the impulse response with the unit step function
    y = conv(hLP, u, 'same');
    
    % Plot output signal against time
    hold on;
    plot(t, y);
end

grid on;  % Enable grid
xlabel('Time (s)');  % Set x-axis label
ylabel('Output Signal');  % Set y-axis label
title('Output of Ideal Low Pass Filter for Unit Step Function Input');  % Set plot title
legend(cellstr(num2str(cutoff_freqs', '%-d Hz')));

