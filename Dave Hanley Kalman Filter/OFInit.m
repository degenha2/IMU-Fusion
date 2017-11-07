function [ C, wtd, Q] = OFInit(sigma, dt)
% This function initializes the output model 
%
%   Outputs: C = output model matrix
%            Q = sensor model uncertainty covariance matrix
%            wdt = Rate Random Walk noise matrix

n = size(sigma,1);
C = zeros(n,n+1);
wtd = zeros(n,1);
Q = eye(n);

for i = 1:n
    C(i,1) = 1;
    C(i,i+1) = 1;
    wtd(i) = sigma(i,2)/sqrt(dt);
    Q(i,i) = (sigma(i,2)/sqrt(dt)).^2;
end

end