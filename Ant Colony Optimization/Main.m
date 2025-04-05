%% 置空工作区
close all;
clear;
clc;
%% 设置文件路径
File_1='\Function'; File_2='\Parameter'; 
pwd; CurrentFile=pwd;
addpath(strcat(CurrentFile,File_1));
addpath(strcat(CurrentFile,File_2));
%% 设置参数
Parameter;
%% 函数集
%----------------------%启发因子
[Eta_ij,d_ij] = Eta_ij_Calculate(city,city_x,city_y,d_ij);
%======================%主循环
while Step<=Step_all
%----------------------%随机初始化蚂蚁位置
[Tabu,Table] = Ant_star(Ant,city,Tabu);
%----------------------%蚂蚁走过的路线（禁忌表） 
[Tabu] = Tabu_exit(Tabu,Table,Eta_ij,Ant,city,city_number,Tau,Alpha,Beta);
%----------------------%计算路径长度
[Distance] = Distance_Calculation(Ant,city_x,city_y,city,Tabu);
%----------------------%记录信息
[Length_best,Route_best,Length_ave,Length_best_temp]=Information(Length_best_temp,Length_best,Distance,Tabu,Step,Ant,Route_best,Length_ave);
%----------------------%更新信息素
[Tau] = Tau_calculation(Ant,city,Delt_Tau,Tabu,Q,Distance,Rho,Tau);
%----------------------%迭代更新
Step=Step+1;
Tabu=zeros(Ant,city);
end
%======================%主循环结束
%----------------------%显示图像
figure
plot(Length_best(:,1));
figure
plot(city_x(1,:),city_y(1,:),'or');
hold on
plot(city_x(1,Route_best(end,:)),city_y(1,Route_best(end,:)));
hold on
plot([city_x(1,Route_best(end,end)),city_x(1,Route_best(end,1))],[city_y(1,Route_best(end,end)),city_y(1,Route_best(end,1))]);
hold off



