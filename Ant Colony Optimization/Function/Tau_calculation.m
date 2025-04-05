function [Tau] = Tau_calculation(Ant,city,Delt_Tau,Tabu,Q,Distance,Rho,Tau)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
for ii=1:Ant
    for jj=1:city-1
        Delt_Tau(Tabu(ii,jj),Tabu(ii,jj+1))=Delt_Tau(Tabu(ii,jj),Tabu(ii,jj+1))+Q/Distance(ii,1);
    end
        Delt_Tau(Tabu(ii,city),Tabu(ii,1))=Delt_Tau(Tabu(ii,city),Tabu(ii,1))+Q/Distance(ii,1);
end
Tau=(1-Rho).*Tau+Delt_Tau;
end

