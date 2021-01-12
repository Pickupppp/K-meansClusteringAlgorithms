addpath('data');
addpath('src');
addpath('tool');

% 随便测试一个数据集
% data = [0 0; 1 1; 1 0; 0 1; 10 10; 11 10; 10 11; 11 11];
% [cen,class] = Kmeans(data,2,5);
% PlotData(data,class,cen);

%% 二维数据测试
% 西瓜数据 无原始分类数据
load watermelon.mat;
[cen,class] = Kmeans(watermelon,3,10);
PlotData(watermelon,class,cen);

% 生成的数据 第一列为原始分类
load fivecluster.mat;
class = fivecluster(:,1);
fivecluster = fivecluster(:,(2:3));
PlotData(fivecluster,class);
[cen,class] = Kmeans(fivecluster,5,20);
PlotData(fivecluster,class,cen);



%% 三维数据测试
% haberman 3维
% load haberman.mat;
% [cen,class] = Kmeans(haberman(:,1:3),2,20);
% PlotData(haberman(:,1:3),class,cen);