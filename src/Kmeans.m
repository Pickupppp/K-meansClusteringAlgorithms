function [centroid,class] = Kmeans(data,k,iteration)
% Kmeans 聚类算法
%
% 参数:
%   data: 待聚类的数据集 (n * p 矩阵)
%   k: 初始聚类中心数量
%   iteration: 最大迭代次数
%
% 返回值:
%   centroid: 收敛后的聚类中心
%   class: 数据集分类

% 随机选择k个样本作为初始聚类中心
number = size(data,1);
centroid = data(randperm(number,k)',:);

% 记录样本到k个聚类中心的欧式距离
distance = zeros(number,k);

% 记录分类结果
class = zeros(number,1);

for i =1:iteration
    tempClass = class;
    
    % 计算数据和聚类中心的距离
    for m = 1:number
        for n = 1:k
            distance(m,n) = sqrt((data(m,:) - centroid(n,:)) * (data(m,:) - centroid(n,:))');
        end
    end
    
    % 分配样本到对应类
    [~,class] = min(distance,[],2);
    
    % 重新计算聚类中心
    for j = 1 : k
        centroid(j,:) = mean(data(class(:,1)==j,:));
    end
    
    % 显示
    fprintf('---- %ith iteration completed ----\n',i);
    
    % 聚类中心不变则停止迭代
    if(class == tempClass)
        fprintf('**** Clustering over after %i iterations ****\n',i);
        break;
    end
end
end

