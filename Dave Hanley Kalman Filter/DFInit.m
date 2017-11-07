function [ A, vtd , R] = DFInit(sigma, dt)
% This function initializes the dynamic model 
%
%   Outputs: A = dynamic model matrix for homogenous equation
%            R = dynamic model uncertainty covariance matrix
%            vdt = Angle Random Walk noise matrix

n = size(sigma,1);
A = zeros(n+1);
vtd = zeros(n+1,1);
R = eye(n+1);


for i = 2:n+1
    A(i,i) = 1;
    vtd(i) = sigma(i-1,1)*sqrt(dt);
    R(i,i) = (sigma(i-1,1)*sqrt(dt))^.2;
end

end