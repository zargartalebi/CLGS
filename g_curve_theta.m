function [g] = g_curve_theta(i,L1,L2,R,theta)
%g_curve_theta Summary of this function goes here
%   %%%%%%%%%%%%%%%%%%%%%%
%   L2 is the length of lateral
%   L1 is the height of vertical section
%   R is the curvature of curve
%   theta is the angle between vertical line and lateral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    N=2*L1+2*L2+2*theta*R;
    L=N;%total length of loop
    if i<L1 %g in vertical down
        g=9.81;
    elseif i>L1-1 && i<L1+(theta)*R%g in curvature down
        beta=((i-L1+1)/R);
        g=9.81*cos(beta);
    elseif i>L1+theta*R-1 && i<L1+L2+theta*R%g in lateral down
        g=9.81*cos(theta);
    elseif i>L1+L2+theta*R-1 && i<L1+2*L2+theta*R%g in lateral up
        g=-9.81*cos(theta);
    elseif i>L1+2*L2+theta*R-1 && i<L1+2*L2+2*theta*R%g in curvature up 
        beta=(i-(L1+2*L2+0.5*pi*R-1))/(R);
        g=-9.81*sin(beta);
    elseif i>L1+2*L2+2*theta*R-1%g in vertical up
        g=-9.81;
     end
end

