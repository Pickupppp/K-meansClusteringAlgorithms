function [centroid,class] = Kmeanspp(data,k,iteration)
%KMEANSPP Kmeans++
%
% ����:
%   data: ����������ݼ� (n * p ����)
%   k: ��ʼ������������
%   iteration: ����������
%
% ����ֵ:
%   centroid: ������ľ�������
%   class: ���ݼ�����

% ���ѡ���һ����������
number = size(data,1);
centroid = data(randperm(number,1)',:);

% ����ʣ��k-1����������
for i = 1:k-1
    % ��¼��ǰi���������ĵľ���
    distance = zeros(number,i);
    for j = 1:number
        for p = 1:size(distance,2)
            distance(j,p) = sum((data(j,:)-centroid(p,:)) .^ 2);
        end
    end
    
    % ���̷�ѡ����һ����������
    index = Roulettemethod(distance);
    centroid(i+1,:) = data(index,:);
    
    % ��������������ֹӰ����һ�β���
    clear distance;
end

% �ҳ�k����ʼ�������ģ�֮��ʹ��kmeans����
% ���ú������ж��⿪����Ϊ�˽����ȷ��дһ��

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

function [index] = Roulettemethod(distance)

% ��ÿ���������������ĵľ��룬������밴�������
minDistance = min(distance,[],2);

% �������
minDistance = minDistance ./ sum(minDistance);

% ��������
roulette = zeros(size(minDistance,1),1);
for i = 1:size(minDistance,1)
    roulette(i,1) = sum(minDistance(1:i,:));
end

% ���������
randIndex = rand();

% �ж������������������
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

