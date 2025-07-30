function [ID,OD] = diameter(i,L1,L2,R,theta)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    N=2*L1+2*L2+2*R*theta;
    L=N;
    if i<L1+theta*R
         ID=0.216;
         OD=ID+0.028;
    elseif i>L1+theta*R-1 && i<L1+theta*R+2*L2
         ID=0.216;
         OD=ID;
    elseif i>L1+2*L2+theta*R-1
         ID=0.216;
         OD=ID;
     end
end
