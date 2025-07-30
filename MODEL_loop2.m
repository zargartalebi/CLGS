function [Q_Out,T_Out,P_Out, W_Pump]= MODEL_loop2(L1,L2,R,theta,T_In,P_In,Geo_Mass_Flow,lateral,T_surf,alpha,time,k_rock,cp_rock,rho_rock)
    N=2*L1+2*L2+2*R*theta;
    dtm_dp=0;
    m=Geo_Mass_Flow;

%     Pr=7;
%     k_f=0.6;
Geo_Pump_Eff=0.75; %Pump Efficiency

dp_HX_Geo = 50e3; % Pressure drop in HX for geo fluid
    Q=0;
    thermos=0;
    friction=0;
    T_fluid(1)=T_In;
    P_fluid(1)=P_In*1E6;
    
    for i = 1:N
        p=P_fluid(i)*1E-6;
        T=T_fluid(i)+273.15;
        %rho_w=0.000010335053319*T^3-0.013395065634452*T^2+4.969288832655160*T+432.257114008512;
%         T_fluid(i)
%         P_fluid(i)
        rho_w=1009-0.233*T_fluid(i)+0.0578*p-2.62E-3*T_fluid(i)*T_fluid(i)+4.04E-4*p*p+4.25E-3*p*T_fluid(i);
       
        rho=refpropm('D','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%((fraction/rho_PCM)+((1-fraction)/rho_w))^-1;
%         T_fluid(i)
%         P_fluid(i)
        kf= refpropm('D','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%-0.869083936+0.00894880345*T^1-1.58366345E-5*T^2+7.97543259E-9*T^3;
         if i==1
            rho_in=rho;
         elseif i==N-1
             rho_out=rho;
         end
        %%%%Enthalpy derivatives for water:
        dhdT_w=4502-2.55*P_fluid(i)*1E-6;
        dhdP_w=(935-2.55*T_fluid(i))*1E-6;

   

        %%%%Implementation of mixture model:
        dhdT=refpropm('(','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%fraction*dhdT_PCM+(1-fraction)*dhdT_w;
        dhdP=refpropm('*','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water')/1e3;%fraction*dhdP_PCM+(1-fraction)*dhdP_w;
        cp=refpropm('C','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%dhdT;
        k=refpropm('V','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');
        nuu=k/rho_w;
        alph=kf/(rho*cp);
        Pr=refpropm('^','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%nuu/alph;
        
        [ID,OD]= diameter(i,L1,L2,R,theta);
        u=velocity(i,m,ID,rho,L1,L2,R,theta,lateral);
        
        [f,Re(i)]=f_power(u,rho,ID,k,1);
        nu=nusselt(f,Re(i),Pr);
        h_fluid=refpropm('H','T', T_fluid(i)+273.15,'P',P_fluid(i)/1e3,'water');%h_f_curved(nu,kf,ID,i,L1,L2,R,theta,lateral);
        h=((1/h_rock_curved(time,i,L1,L2,R,theta,lateral,OD,k_rock,cp_rock,rho_rock))+(1/h_fluid))^-1;
        
        %%%% q is heat coming from rock to each element (unit=Watts)
        %%%% w is work of gravity to each element (unit=W)
        q=h*(Trock_curve_theta(i,T_surf,alpha,L1,L2,R,theta)- T_fluid(i));
        w=-m*g_curve_theta(i,L1,L2,R,theta);
        
        %%%% pressuer/temperature change in each element (unit of p=Pa ,
        %%%% unit of T=C)
        dP=rho*g_curve_theta(i,L1,L2,R,theta)-f*(0.5/ID)*rho*(u^2);
        dT=((q-w-m*dhdP*dP)/(m*dhdT));
        
        thermos=thermos+rho*g_curve_theta(i,L1,L2,R,theta);
        friction=friction+f*(0.5/ID)*rho*(u^2);
        
        P_fluid(i+1)=P_fluid(i)+dP;
        T_fluid(i+1)=T_fluid(i)+dT;
        Q=Q+(q-w);
    end 
    P_Out=P_fluid(N-1);
    T_Out=T_fluid(N-1);
    
    Q_Out=Q*1E-6;
    W_Pump=(P_fluid(1)-P_fluid(N-1)+dp_HX_Geo)*Geo_Mass_Flow/((rho_out+rho_in)/2)/Geo_Pump_Eff/1e6; %MW Pump Needed to pump the fluid
    
end

