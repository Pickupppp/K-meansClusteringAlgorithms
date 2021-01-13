function [centroid,class] = Kmedoids(data,k,iteration)
%KMEDOIDS Kmedoids�㷨
%
% ����:
%   data: ����������ݼ� (n * p ����)
%   k: ��ʼ������������
%   iteration: ����������
%
% ����ֵ:
%   centroid: ������ľ�������
%   class: ���ݼ�����

% ���ѡ��k��������Ϊ��ʼ��������
number = size(data,1);
centroid = data(randperm(number,k)',:);

% ��¼������k���������ĵ�ŷʽ����
distance = zeros(number,k);

% ��¼������
class = zeros(number,1);

% ���е���
for i =1:iteration
    tempClass = class;
    
    % �������ݺ;������ĵľ���
    for m = 1:number
        for n = 1:k
            distance(m,n) = sqrt((data(m,:) - centroid(n,:)) * (data(m,:) - centroid(n,:))');
        end
    end
    
    % ������������Ӧ��
    [~,class] = min(distance,[],2);
    
    % ���¼����������
    for j = 1 : k
        % ÿһ�ص�����
        clusterData = data(class(:,1)==j,:);
        tempDistance = zeros(size(clusterData,1));
        for m = 1:size(clusterData,1)
            for n = 1:size(clusterData,1)
                tempDistance(m,n) = (clusterData(m,:) - clusterData(m,:)) * (clusterData(m,:) - clusterData(m,:))';
            end
        end
        tempDistance = sum(tempDistance,2);
        [~,index] = min(tempDistance,[],1);
        centroid(j,:) = clusterData(index,:);
    end
    
    % ��ʾ
    fprintf('---- %ith iteration completed ----\n',i);
    
    % �������Ĳ�����ֹͣ����
    if(class == tempClass)
        fprintf('**** Clustering over after %i iterations ****\n',i);
        break;
    end
end
end

