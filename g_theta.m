function [g] = g_theta(i,L1,L2,theta)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    N=2*L1+2*L2;
    L=N;
    if i<L1
        g=9.81;
    elseif i>L1-1 && i<L1+L2
        g=9.81*cos(theta);
    elseif i>L1+L2-1 && i<L1+2*L2
        g=-9.81*cos(theta);
    elseif i>L1+2*L2-1
        g=-9.81;
     end
end
