function [f2,Re] = f_cole(u,rho,ID,T)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    miu=0.00116-(9.37E-6)*T+(1.9E-8)*T*T;
    epsod=0.05/(1000*ID);
    Re=(rho*u*ID)/miu;
    f2=0.01;
    f1=0;
    
    while (f2-f1)^2>1E-12
        f1=f2;
        f2=(2*log10((epsod/3.7)+(2.5/(Re*sqrt(f1)))))^-2;
    end
    if Re<2300
        f2=64/Re;
    end
end

