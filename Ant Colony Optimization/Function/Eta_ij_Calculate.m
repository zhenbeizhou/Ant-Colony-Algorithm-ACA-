function [Eta_ij,d_ij] = Eta_ij_Calculate(city,city_x,city_y,d_ij)
for ii=1:city
    for jj=city:-1:1
        if ii==jj
            d_ij(ii,jj)=0;
        else
            d_ij(ii,jj)=(city_x(1,ii)-city_x(1,jj))*(city_x(1,ii)-city_x(1,jj))...
                      +(city_y(1,ii)-city_y(1,jj))*(city_y(1,ii)-city_y(1,jj));
    
        end
    end
end
d_ij=sqrt(d_ij);
d_index=find(d_ij==0);
d_ij(d_index)=1e-4;%防止分母为零
Eta_ij=1./d_ij;%启发函数
end

