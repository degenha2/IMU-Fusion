function [what] = mainDHKF(sigma, time, dt)
% mainDHKF is the main function which implements David Hanley's Discrete Time Kalman Filter 
%   Inputs:  sigma = Matrix containing sensor parameters, servers as a list
%                    of sensors to be used
%            time  = Duration of sensor test in seconds
%            dt    = Time interval i.e. sampling frequency
%   Outputs: sensordata = fused sensor measurments 
%   Written by: David Degenhardt (11/4/2017)

t = linspace(0,time,time/dt)';

% Dynamic model initialization
[ A, vtd, R] = DFInit(sigma, dt);
% Observer model initialization
[ C, wtd, Q ] = OFInit(sigma, dt);

% Initialize the state at zero
x0 = zeros(length(sigma)+1,1);

% Initialize the state at the first time step
xplus = DFH(x0, dt,A, vtd);

% Preallocate fused sensor measurement matrix
what = zeros(length(t),1);

P = R;
xhat = x0;

for i= 2:length(t)
    y = OFH(xplus, dt,C, wtd);
    [xhat,P] = KalmanFilter( xhat, P, y, A, C, R, Q );
    xplus = DFH(xplus, dt,A, vtd);
 
    what(i) = xhat(1);
end

end