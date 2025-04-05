Step_all=200;%设置迭代数
Step=1;
Ant=5;%蚂蚁数量
Alpha=1;%信息启发因子
Beta=5;%期望启发因子
Rho=0.1;%信息素挥发因子
Q=1;%蚁周模型常系数
Length_best=zeros(Step_all,1);%各代最佳路径长度
Length_best_temp=zeros(Step_all,1);
Length_ave=zeros(Step_all,1);%各代最佳路径平均长度

city_Coordinate=[16.4700   96.1000
     16.4700   94.4400
     20.0900   92.5400
     22.3900   93.3700
     25.2300   97.2400
     22.0000   96.0500
     20.4700   97.0200
     17.2000   96.2900
     16.3000   97.3800
     14.0500   98.1200
     16.5300   97.3800
     21.5200   95.5900
     19.4100   97.1300
     20.0900   92.5500];
%[1 2; 1 1; 2 1; 2 2];
city_x=city_Coordinate(:,1)';%节点横坐标
city_y=city_Coordinate(:,2)';%节点纵坐标
city=size(city_x,2);%途径节点数
city_number=1:city;
Tau=ones(city,city);
Delt_Tau=zeros(city,city);
Route_best=zeros(Step_all,city);%各代最佳路径
d_ij=zeros(city,city);%

P_ij_k=[];%转移概率

Tabu=zeros(Ant,city);%第i只蚂蚁在第j个节点
Distance=zeros(Ant,1);