addpath('data');
addpath('src');
addpath('tool');

% ������һ�����ݼ�
% data = [0 0; 1 1; 1 0; 0 1; 10 10; 11 10; 10 11; 11 11];
% [cen,class] = Kmeans(data,2,5);
% PlotData(data,class,cen);

%% ��ά���ݲ���
% �������� ��ԭʼ��������
load watermelon.mat;
[cen,class] = Kmeans(watermelon,3,10);
PlotData(watermelon,class,cen);

% ���ɵ����� ��һ��Ϊԭʼ����
load fivecluster.mat;
class = fivecluster(:,1);
fivecluster = fivecluster(:,(2:3));
PlotData(fivecluster,class);
[cen,class] = Kmeans(fivecluster,5,20);
PlotData(fivecluster,class,cen);



%% ��ά���ݲ���
% haberman 3ά
% load haberman.mat;
% [cen,class] = Kmeans(haberman(:,1:3),2,20);
% PlotData(haberman(:,1:3),class,cen);