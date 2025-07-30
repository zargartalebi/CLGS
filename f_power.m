function [f,ReN] = f_power(u,rho,ID,K,n)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    gamma=K*(8^(n-1));
    ReN=(ID^n)*(u^(2-n))*(rho/gamma);
    a=(log10(n)+3.93)/50;
    b=(1.75-log10(n))/7;
    flam=16/ReN;
    fturb=0.0014+0.125/(ReN^0.32);
    fturb=a/(ReN^b);
    ftrans=16*(ReN/((3470-1370*n)^2));
    fint=((ftrans^-8)+(fturb^-8))^(-1/8);
    f=((fint^12)+(flam^12))^(1/12);
    f=4*f;
end

