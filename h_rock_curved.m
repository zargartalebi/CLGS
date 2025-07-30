function [h] = h_rock_curved(time,i,L1,L2,R,theta,lateral,OD,k_rock,cp_rock,rho_rock)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    D=OD;
    kRock_vertical=k_rock;
    rhoRock=rho_rock;
    CpRock=cp_rock;
    N=2*L1+2*L2+2*theta*R;
    L=N;
    
    Reff=(0.5*D)+1.683*((time*365.25*86400*(kRock_vertical/(rhoRock*CpRock)))^0.5);
    Rt=(log(Reff/(0.5*D))/(2*3.1415*kRock_vertical));
    %Rt=0.33
    if i<L1 %h in vertical down
        h=1/Rt;
    elseif i>L1-1 && i<L1+(theta)*R%h in curvature down
        
        h=1/Rt;
    elseif i>L1+theta*R-1 && i<L1+L2+theta*R%h in lateral down
        h=lateral/Rt;
    elseif i>L1+L2+theta*R-1 && i<L1+2*L2+theta*R%h in lateral up
        h=lateral/Rt;
    elseif i>L1+2*L2+theta*R-1 && i<L1+2*L2+2*theta*R%h in curvature up 
        h=1/Rt;
    elseif i>L1+2*L2+2*theta*R-1%h in vertical up
        h=1/Rt;
     end
end

