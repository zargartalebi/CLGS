function [y] = T_rock(i,T_surf,alpha,L1,L2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if i<L1
        y=T_surf+alpha*i;
    elseif i>L1-1 && i<L1+2*L2
        y=T_surf+alpha*L1;
    elseif i>L1+2*L2-1
        y=T_surf+alpha*L1-alpha*(i-L1-2*L2);
      end 
end

