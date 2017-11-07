function [ xdot ] = DFH(x, dt,A, vtd)
% This function calculates the dynamic model 
%
%   Outputs: x = state space dynamic matrix


%Uses a random variable to create the Angle Random Walk noise
for i = 2:length(vtd)-1
    vtd(i) = vtd(i)*randn(1);
end

xdot = A*x+vtd;

end