function [g] = g_h(i,L1,L2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    N=2*L1+2*L2;
    L=N;
    if i<L1
        g=9.81;
    elseif i>L1-1 && i<L1+2*L2
        g=0;
    elseif i>L1+2*L2-1
        g=-9.81;
     end
end

