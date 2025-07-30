clear;
Geo_Fluid='Water';
k_rock=2.5; %Solid thermal conductivity (W m-1 K-1)
rho_rock=2663; %Solid density (kg m-3)
cp_rock=1112;%Solid specific heat capacity (J kg-1 K-1)
T_In=80; %Inlet temperature in geo-loop (C)
L1=3000; %Length of vertical section of geo-loop (m) 
L2=3000; %Length of horizontal section of geo-loop (laterals) (m) 
R=0; 
P_In=15;%Inlet pressure in geo-loop (Mpa)
theta=90*(pi/180); %Angle of letrals with respect to vertical axis
Geo_Mass_Flow= 80;%Mass flowrate in geo-loop (Kg/s)
lateral=12; %Number of laterals in geo-loop


%%%Time
time=5; %Geo-loop profuction year
alpha=0.03;% Thermal gradient in the rock (C/m)
T_surf=10; %Surface temperature of the rock (C)

ii=0;
for L2=1000:1000:15000
    ii=ii+1
    [Q_Out,T_Out,P_Out, W_Pump]= MODEL_loop2(L1,L2,R,theta,T_In,P_In,Geo_Mass_Flow,lateral,T_surf,alpha,time,k_rock,cp_rock,rho_rock)

end
