function [nu] = nusselt(f,Re,Pr)
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here
    nu=((f/8)*(Re-1000)*Pr)/(1+12.7*(Pr^0.666-1)*(f/8)^0.5);
    if Re<3000
        nu=4.36;
end

