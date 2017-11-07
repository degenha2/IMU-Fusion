function [ y ] = OFH(x, dt,C, wtd)
% This function calculates the output model 
%
%   Outputs: y = state space output matrix


%Uses a random variable to create the Rate Random Walk noise
for i = 1:length(wtd)
    wtd(i) = wtd(i)*randn(1);
end

y = C*x+wtd;

end