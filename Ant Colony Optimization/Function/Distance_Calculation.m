function [Distance] = Distance_Calculation(Ant,city_x,city_y,city,Tabu)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
for ii=1:Ant
    for jj=1:city-1
         dis(ii,jj)=(city_x(1,Tabu(ii,jj))-city_x(1,Tabu(ii,jj+1)))*(city_x(1,Tabu(ii,jj))-city_x(1,Tabu(ii,jj+1)))+...
                    (city_y(1,Tabu(ii,jj))-city_y(1,Tabu(ii,jj+1)))*(city_y(1,Tabu(ii,jj))-city_y(1,Tabu(ii,jj+1)));
    end
         dis(ii,city)=(city_x(1,Tabu(ii,end))-city_x(1,Tabu(ii,1)))*(city_x(1,Tabu(ii,end))-city_x(1,Tabu(ii,1)))+...
                      (city_y(1,Tabu(ii,end))-city_y(1,Tabu(ii,1)))*(city_y(1,Tabu(ii,end))-city_y(1,Tabu(ii,1)));
    Distance(ii,1)=sum(sqrt(dis(ii,:)));
end
end

