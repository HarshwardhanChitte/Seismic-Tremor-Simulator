clear; clc; close all

%% 1. Parameters and Synthetic Earthquake
fs   = 1000;                % sampling frequency (Hz)
t    = 0:1/fs:30;           % 30-second event
quake = 0.8*sin(2*pi*1.5*t).*exp(-0.1*t) + ...
        0.4*sin(2*pi*3*t).*exp(-0.08*t) + ...
        0.3*randn(size(t)); % synthetic tremor

figure
plot(t,quake), grid on
title('Synthetic Earthquake Ground Motion')
xlabel('Time (s)'), ylabel('Displacement (arbritary units)')

%% 2. Building Models using a and b
% Transfer function: H(s) = 1 / (s^2 + a*s + b)

% Building A (stiff + low damping)
a1 = 0.5;   % damping parameter
b1 = 20;    % stiffness parameter
numA = 1;
denA = [1 a1 b1];
sysA = tf(numA, denA);

% Building B (flexible + more damping)
a2 = 2;     
b2 = 5;
numB = 1;
denB = [1 a2 b2];
sysB = tf(numB, denB);

%% 3. Discretize for Simulation
sysA_d = c2d(sysA,1/fs,'tustin');
sysB_d = c2d(sysB,1/fs,'tustin');

%% 4. Applying the earthquake signal to the buildings
respA = lsim(sysA_d, quake, t);
respB = lsim(sysB_d, quake, t);

%% 5. Plotting the responses

% Building A Response
figure
plot(t, respA, 'b'), grid on
title('Building A Displacement Response')
xlabel('Time (s)'), ylabel('Displacement (arbritary units)')

% Building B Response
figure
plot(t, respB, 'r'), grid on
title('Building B Displacement Response')
xlabel('Time (s)'), ylabel('Displacement (arbritary units)')

%% 6. Frequency Spectra
N = length(quake);
halfN = floor(N/2);  % ensure integer indexing

f = (0:N-1)*(fs/N);
Q_fft = abs(fft(quake));
A_fft = abs(fft(respA));
B_fft = abs(fft(respB));

figure
plot(f(1:halfN), Q_fft(1:halfN), 'k', ...
     f(1:halfN), A_fft(1:halfN), 'b', ...
     f(1:halfN), B_fft(1:halfN), 'r')
grid on
xlim([0 10])
legend('Input quake','Building A','Building B')
xlabel('Frequency (Hz)'), ylabel('Magnitude')
title('Frequency Spectra')

