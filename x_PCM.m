function [x] = x_PCM(T,P,Tm,dtm_dp,mushy)
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here
    P=P/1000000;
    x=(0.5*(1+erf((T-dtm_dp*P-Tm)/(0.5*mushy))));
end

