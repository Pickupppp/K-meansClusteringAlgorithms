function PlotData(data,label, varargin)
%PLOTDATA 绘制散点图，并将不同类的点用不同颜色表示
%   每个数据特征最多为三维
%
% 参数:
%   data: 待绘制的数据集
%   label: 数据对应分类
%   varargin: 可选参数，为空表示没有聚类中心
%
% 返回值:
%   无返回值

% 获取参数信息: 特征维度、聚类个数
k = max(label);
p = size(data,2);

% 超过三维无法绘制
if(p > 3)
    error('数据特征超过三维')
elseif(p < 2)
    error('数据特征不足')
end

% 判断有无聚类中心输入
if(~isempty(varargin))
    isc = 1;
    centroid = varargin{1, 1};
else
    isc = 0;
end

figure();
% 绘制数据散点和对应中心
if( p == 2 )
    for i = 1:k
        rgb = [rand,rand,rand];
        % 绘制数据
        x = data(label == i,1);
        y = data(label == i,2);
        scatter(x,y,50,rgb,'filled','DisplayName',strcat('Class-',num2str(i)));
        hold on
        % 绘制聚类中心 有聚类中心输入才绘制
        if(isc == 1)
            scatter(centroid(i,1), centroid(i,2), 150,rgb,'d','filled', 'DisplayName', strcat('Centroid-',num2str(i)));
        end
        % 绘制包络线
        m = convhull(x,y);
        plot(x(m),y(m),'Color', rgb, 'LineStyle', '-');
    end
elseif( p == 3)
    for i = 1:k
        rgb = [rand,rand,rand];
        scatter3(data(label ==i,1),data(label ==i,2),data(label ==i,3),50,rgb,'filled','DisplayName',strcat('Class-',num2str(i)));
        hold on;
        % 绘制聚类中心 有聚类中心输入才绘制
        if(isc == 1)
            scatter3(centroid(i,1), centroid(i,2),centroid(i,3), 150,rgb,'d','filled', 'DisplayName', strcat('Centroid-',num2str(i)));
        end
    end
end

% Legend
% if(k < 5)
%     legend('show');
% end
end

