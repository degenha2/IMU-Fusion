function [ x_hat,Pnext ] = KalmanFilter( x, P, z, A, C, R, Q )
%KALMAN Implements discrete time Kalman Filter 
%   Inputs:  x = state at time step t-1
%            P = covariance of state at time step t-1
%            z = measurement at time step t
%            A = dynamic model matrix for homogenous equation 
%            C = output model matrix
%            R = dynamic model uncertainty covariance matrix
%            Q = sensor model uncertainty covariance matrix
%   Outputs: x_hat = state estimate at time step t
%            Pnext = covariance of state estimate at time step t
%   Written by: Dave Hanley (1/4/2015)

% Prediction
xbar = A*x;
Pbar = A*P*A' + R;

% Correction
K = Pbar*C'/(C*Pbar*C'+Q); % Kalman Gain
x_hat = xbar + K*(z - C*xbar);
I = eye(size(K*C));
Pnext = (I-K*C)*Pbar;
end