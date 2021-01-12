function [centroid,class] = Kmeanspp(data,k,iteration)
%KMEANSPP Kmeans++
%
% 参数:
%   data: 待聚类的数据集 (n * p 矩阵)
%   k: 初始聚类中心数量
%   iteration: 最大迭代次数
%
% 返回值:
%   centroid: 收敛后的聚类中心
%   class: 数据集分类

% 随机选择第一个聚类中心
number = size(data,1);
centroid = data(randperm(number,1)',:);

% 计算剩余k-1个聚类中心
for i = 1:k-1
    % 记录与前i个聚类中心的距离
    distance = zeros(number,i);
    for j = 1:number
        for p = 1:size(distance,2)
            distance(j,p) = sum((data(j,:)-centroid(p,:)) .^ 2);
        end
    end
    
    % 轮盘法选择下一个聚类中心
    index = Roulettemethod(distance);
    centroid(i+1,:) = data(index,:);
    
    % 清除距离变量，防止影响下一次操作
    clear distance;
end

% 找出k个初始聚类中心，之后使用kmeans聚类
% 调用函数会有额外开销，为了结果精确再写一遍

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

function [index] = Roulettemethod(distance)

% 找每个样本到聚类中心的距离，多个距离按最近计算
minDistance = min(distance,[],2);

% 计算概率
minDistance = minDistance ./ sum(minDistance);

% 构造轮盘
roulette = zeros(size(minDistance,1),1);
for i = 1:size(minDistance,1)
    roulette(i,1) = sum(minDistance(1:i,:));
end

% 生成随机数
randIndex = rand();

% 判断随机数落入轮盘区间
for i = 1:size(roulette,1)
    if(i == 1)
        if(randIndex <= roulette(1))
            index = 1;
            break;
        end
    else
        if(randIndex <= roulette(i) && randIndex > roulette(i - 1))
            index = i;
            break;
        end
    end
end
end

