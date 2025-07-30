function [y] = Trock_curve_theta(i,T_surf,alpha,L1,L2,R,theta)
%Trock_curve_theta Summary of this function goes here
%%%%%%%%%%%%%%%%%%%%%
% T_surf is the temperature at the surface (C)
% alpha is the temperature gradient (C/m)
%   L2 is the length of lateral (m)
%   L1 is the height of vertical section (m)
%   R is the curvature of curve (m)
%   theta is the angle between vertical line and latera (radian)
%%%%%%%%%%%%%%%%%%%%%
    N=2*L1+2*L2+2*theta*R;
    L=N;%total length of loop
    if i<L1 %g in vertical down
        y=T_surf+alpha*i;
    elseif i>L1-1 && i<L1+(theta)*R%g in curvature down
        beta=((i-L1+1)/R);
        y=T_surf+alpha*L1+alpha*R*sin(beta);
    elseif i>L1+theta*R-1 && i<L1+L2+theta*R%g in lateral down
         y=T_surf+alpha*L1+alpha*R*sin(theta)+alpha*(i-(L1+theta*R-1))*cos(theta);
    elseif i>L1+L2+theta*R-1 && i<L1+2*L2+theta*R%g in lateral up
        y=T_surf+alpha*L1+alpha*R*sin(theta)+alpha*L2*cos(theta)-alpha*(i-(L1+L2+theta*R-1))*cos(theta);
    elseif i>L1+2*L2+theta*R-1 && i<L1+2*L2+2*theta*R%g in curvature up 
        beta=(i-(L1+2*L2+theta*R-1))/R;
        y=T_surf+alpha*L1+alpha*R*sin(theta-beta);
    elseif i>L1+2*L2+2*theta*R-1%g in vertical up
        y=T_surf+alpha*L1-alpha*(i-(L1+2*L2+2*theta*R-1));
     end
end