clear;clc;
addpath('data');
addpath('src');
addpath('tool');

% ������һ�����ݼ�
% data = [0 0; 1 1; 1 0; 0 1; 10 10; 11 10; 10 11; 11 11];
% [cen,class] = Kmeans(data,2,5);
% PlotData(data,class,cen);

%% ��ά���ݲ���
% �������� ��ԭʼ��������
% load watermelon.mat;
% [cen1,class1] = Kmeans(watermelon,3,10); % Kmeans����
% PlotData(watermelon,class1,cen1);
% 
% [cen2,class2] = Kmeanspp(watermelon,3,10); % Kmeans++����
% PlotData(watermelon,class2,cen2);

% ���ɵ����� ��һ��Ϊԭʼ����
load fivecluster.mat;
class = fivecluster(:,1);
fivecluster = fivecluster(:,(2:3));
PlotData(fivecluster,class);

[cen3,class3] = Kmeans(fivecluster,5,20);
PlotData(fivecluster,class3,cen3);

[cen4,class4] = Kmeanspp(fivecluster,5,20);
PlotData(fivecluster,class4,cen4);

[cen5,class5] = Kmedoids(fivecluster,5,20);
PlotData(fivecluster,class5,cen5);

% ������ݼ�
% load toy.mat;
% class = toy(:,3);
% toy = toy(:,(1:2));
% PlotData(toy,class);
% 
% [cen5,class5] = Kmeans(toy,3,20);
% PlotData(toy,class5,cen5);
% 
% [cen6,class6] = Kmeanspp(toy,3,20);
% PlotData(toy,class6,cen6);

%% ��ά���ݲ���
% haberman 3ά
% load haberman.mat;
% [cen,class] = Kmeans(haberman(:,1:3),2,20);
% PlotData(haberman(:,1:3),class,cen);