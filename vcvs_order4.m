%LP VCVS filter N=4
clc
close all
clear
format long

wc=6800*pi; %speech signal filter fc=3400Hz
f=linspace(1,16000,4000); % range from 0 to 16kHz
w=2*pi*f;

%stage I components (calculated vs actual component values used)
r11=7674; %15k//15k = 7k5
r21=26242; % 27k
r31=45221; %3*15k = 45k
r41=135664; % 120k+15k = 135k

%stage II components
r12=5432; % 5k6
r22=37065; % 3*10k + 6k8 = 36k8
r32=56598; % 56k
r42=169795; % 330k//330k + 4k7 = 169k7

c=3.3e-9; % 3.3nF

k1=1+(r41/r31);
k2=1+(r42/r32);
K=k1*k2; % passband gain


%computed response
%TF coefficients
b0 = 1/(r11*r21*c*c);
b1 = 1/(r11*c) + (2-k1)/(r21*c);

H1 = k1*b0./((1i*w).^2 + 1i*w*b1 + b0);

b0 = 1/(r12*r22*c*c);
b1 = 1/(r12*c) + (2-k2)/(r22*c);

H2 = k2*b0./((1i*w).^2 + 1i*w*b1 + b0);

H = H1.*H2; %Frequency response (complex)

mag_response = abs(H); %magnitude frequency response

phase_response = rad2deg(unwrap(angle(H))); %phase response

%Import actual/eperimental response from excel sheet Vin=1.0 Vpp throughout
exp_results = readmatrix('vcvs_order4.xlsx');
f_actual = exp_results(:,1); %frequency in Hz
H_actual = exp_results(:,2); %Vout pk-pk


%plot and compare results
figure(1)
plot(w/(2*pi),mag_response, 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(f_actual, H_actual, 'linewidth', 2,'Color','b')
xlabel('Freguency (Hz) - linear scale')
ylabel('Magnitude response - |Vo/Vi|')
legend({'calculated','experimental'})


figure(2)
semilogx(w/(2*pi),mag_response, 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(f_actual, H_actual, 'linewidth', 2,'Color','b')
xlabel('Freguency (Hz) - log scale')
ylabel('Magnitude response - |Vo/Vi|')
legend({'calculated','experimental'})


figure(3)
semilogx(w,mag_response, 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(2*pi*f_actual, H_actual, 'linewidth', 2,'Color','b')
xlabel('Freguency (rad/s) - log scale')
ylabel('Magnitude response - |Vo/Vi|')
legend({'calculated','experimental'})

figure(4)
semilogx(w,mag_response.^2, 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(2*pi*f_actual, H_actual.^2, 'linewidth', 2,'Color','b')
xlabel('Freguency (rad/s) - log scale')
ylabel('Magnitude-squared response - |Vo/Vi|^2')
legend({'calculated','experimental'})

figure(5)
semilogx(w,10*log10(mag_response.^2), 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(2*pi*f_actual, 10*log10(H_actual.^2), 'linewidth', 2,'Color','b')
xlabel('Freguency (rad/s) - log scale')
ylabel('Magnitude-squared response (dB)')
legend({'calculated','experimental'})

figure(6)
semilogx(w,10*log10((mag_response/max(mag_response)).^2), 'linewidth', 2,'Color','r'), grid on, zoom xon, hold on
plot(2*pi*f_actual, 10*log10((H_actual/max(H_actual)).^2), 'linewidth', 2,'Color','b')
xlabel('Freguency (rad/s) - log scale')
ylabel('Normalized Magnitude-squared response (dB)')
legend({'calculated','experimental'})


figure(7)
plot(w/(2*pi),phase_response, 'linewidth', 2,'Color','r'), grid on, zoom xon
xlabel('Freguency (Hz) - linear scale')
ylabel('Phase response (degrees)')


