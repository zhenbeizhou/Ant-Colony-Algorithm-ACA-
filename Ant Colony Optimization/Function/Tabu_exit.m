function [Tabu] = Tabu_exit(Tabu,Table,Eta_ij,Ant,city,city_number,Tau,Alpha,Beta)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
for ii=1:Ant 
        for jj=2:city
            allow_index=~ismember(city_number,Tabu(ii,1:(jj-1)));
            allow=city_number(allow_index);
            P_ij_k=allow;
            %---------%概率选择下一个城市
            for kk=1:size(allow,2)
                P_ij_k(kk)=Tau(Tabu(ii,jj-1),allow(kk))^Alpha*Eta_ij(Tabu(ii,jj-1),allow(kk))^Beta;
            end
            P_ij_k=P_ij_k/sum(P_ij_k);
            Pc=cumsum(P_ij_k);
            if jj<city
                target_index=find(Pc>=rand);
                target=allow(target_index(1));
                Table(ii,jj)=target;
                Tabu(ii,jj)=Table(ii,jj);
            else
                allow_end=~ismember(city_number,Tabu(ii,1:(jj-1)));
                allow_end=city_number(allow_index);
                Table(ii,jj)=allow_end;
                Tabu(ii,jj)=Table(ii,jj);
            end
        end
end
end


