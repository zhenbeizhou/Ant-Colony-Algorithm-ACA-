function [Tabu,Table] = Ant_star(Ant,city,Tabu)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
Table=zeros(Ant,city);
for ii=1:Ant
    Tabu(ii,1)=randi([1,city]);%初始时刻蚂蚁随机分配节点
end
Table(:,1)=Tabu(:,1);
end

