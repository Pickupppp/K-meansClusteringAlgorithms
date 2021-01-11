function [centroid,class] = Kmeans(data,k,iteration)
% Kmeans �����㷨
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
        centroid(j,:) = mean(data(class(:,1)==j,:));
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

