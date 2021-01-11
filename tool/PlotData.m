function PlotData(data,label, centroid)
%PLOTDATA ����ɢ��ͼ��������ͬ��ĵ��ò�ͬ��ɫ��ʾ
%   ÿ�������������Ϊ��ά
%
% ����:
%   data: �����Ƶ����ݼ�
%   label: ���ݶ�Ӧ����
%   centroid: ÿ���������
%
% ����ֵ:
%   �޷���ֵ

% ��ȡ������Ϣ: ����ά�ȡ��������
k = max(label);
p = size(data,2);

% ������ά�޷�����
if(p > 3)
    error('��������������ά')
elseif(p < 2)
    error('������������')
end

figure();
% ��������ɢ��Ͷ�Ӧ����
if( p == 2 )
    for i = 1:k
        rgb = [rand,rand,rand];
        % ��������
        x = data(label == i,1);
        y = data(label == i,2);
        scatter(x,y,50,rgb,'filled','DisplayName',strcat('Class-',num2str(i)));
        hold on
        % ���ƾ�������
        scatter(centroid(i,1), centroid(i,2), 150,rgb,'d','filled', 'DisplayName', strcat('Centroid-',num2str(i)));
        % ���ư�����
        m = convhull(x,y);
        plot(x(m),y(m),'Color', rgb, 'LineStyle', '-');
    end
elseif( p == 3)
    for i = 1:k
        rgb = [rand,rand,rand];
        scatter3(data(label ==i,1),data(label ==i,2),data(label ==i,3),rgb,'filled','DisplayName',strcat('Class-',num2str(i)));
        hold on;
        % ���ƾ�������
        scatter(centroid(i,1), centroid(i,2), 150,rgb,'d','filled', 'DisplayName', strcat('Centroid-',num2str(i)));
    end
end

% Legend
if(k < 5)
    legend('show');
end
end

