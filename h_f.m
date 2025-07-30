function [h2] = h_f(nu,k_f,ID,i,L1,L2,lateral)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here
    h=nu*(k_f/ID)*(3.1415*ID);
    if i<L1
        h2=h;
    elseif i>L1-1 && i<L1+2*L2
        h2=lateral*h;
    elseif i>L1+2*L2-1
        h2=h;
    end 
end

