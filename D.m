function [ID,OD] = D(i,L1,L2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
 N=2*L1+2*L2;
    L=N;
    if i<L1
        ID=0.216;
        OD=ID+0.028;
    elseif i>L1-1 && i<L1+2*L2
        ID=0.216;
        OD=ID;
    elseif i>L1+2*L2-1
        ID=0.216;
        OD=ID;
     end
end

