%% 手动设置栅格地图
Grid_size=20;%设置地图范围
Grid_Length=1;%每格边长
Grid_map=ones(Grid_size,Grid_size);%初始化地图（白色）
imshow(Grid_map,'InitialMagnification','fit')
[Grid_x,Grid_y] = size(Grid_map);
%% 地图生成
x = 0.5:Grid_Length:Grid_y+0.5;
y = 0.5:Grid_Length:Grid_x+0.5;
M = meshgrid(x,y);%生成网格矩阵
N = meshgrid(y,x);
hold on
plot(x,N,'b');   % 画出水平横线
plot(M,y,'b');   % 画出垂直竖线
pause(0.5);

Slect_Grid=msgbox('左键定义障碍栅格，右键定义结束');
uiwait(Slect_Grid,10);
if ishandle(Slect_Grid) == 1
    delete(Slect_Grid);
end

iter = 1;
while iter == 1
    [Barrier_x,Barrier_y,iter] = ginput(1);
    Barrier_x=floor(Barrier_x+0.5);
    Barrier_y=floor(Barrier_y+0.5);
    Grid_map(Barrier_y,Barrier_x)=0;    % 设置障碍物（黑色）
    imshow(Grid_map,'InitialMagnification','fit')
    plot(x,N,'b');          % 画出水平横线
    plot(M,y,'b');          % 画出垂直竖线
end
hold off
%% 保存地图图片，保存地图矩阵
figure
imshow(Grid_map,'InitialMagnification','fit') % 画出最终栅格图
save('Grid_map.mat','Grid_map');              % 存储栅格地图矩阵