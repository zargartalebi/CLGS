function [u] = velo(m,ID,rho,i,L1,L2,lateral)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    if i<L1
        u=m/(0.25*3.1415*ID*ID*rho);
    elseif i>L1-1 && i<L1+2*L2
        u=m/(0.25*3.1415*ID*ID*rho*lateral);
    elseif i>L1+2*L2-1
        u=m/(0.25*3.1415*ID*ID*rho);
     end
end

