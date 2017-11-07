%%% Test file for Dave Hanley's Kalman Filter. Compares two types of
%%% gyroscopes, whose parameters are specified in 'Sigmas'

n = [1 0];

Sigmas = [0.0000540000	0.0000195000;0.0000261720	0.0000023651];
sigma = zeros(n(1,1) + n(1,2),2);

% 'sigma' holds the information of the number and type of sensor used. Each
% row in 'Sigmas' corresponds to a new sensor, the columns hold the
% parameters for Angle Random Walk and Rate Random walk, respectively.
% These parameters are the same as those specified in the Kalibr IMU noise
% model.
% The first column of 'n' corresponds to the numbers of the first type of
% sensor (i.e. the first row of 'Sigmas') and the second colum corresponds
% to the second type of sensor

for j = 1:n(1,1)
    sigma(j,:) = Sigmas(1,:);
end

for k = 1:n(1,2)
    sigma(k+n(1,1),:) = Sigmas(2,:);
end

% Initialization of time and sensor frequency
time = 3600;
frequency = 200;

t = linspace(0,time,time*frequency)';

% Calls mainDHKF to create a fused sensor measurement
[sensordata] = mainDHKF(sigma, time, 1/frequency);

% Computes Allan Variance of the sensor
[Tallan,sigma] = allan(sensordata,frequency,100);

% Plotting Allan variance data on a log-log scale
figure(1)
loglog(Tallan,sigma)
grid on
title('Allan Variance')
xlabel('tau [s]')
ylabel('Allan Standard Deviation')
legend('Averaged')
