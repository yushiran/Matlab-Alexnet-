function [ ] = photoresize( readdir )
% 图像预处理函数
% 输入参数：readdir  需要处理图像所在目录(要求只有图像文件，格式无所谓)
 
% 写入图像的格式
writetype = 'jpg';
% 写入图像的目录
writedir = ["F:\test\yellow"];
% 大小改变因子
resizefactor = [227 227];

% 创建改大小之后图像目录，如果目录已经存在会报警告，但是不影响使用
mkdir(writedir);
% 读取目录内所有所有图像目录信息
imnames = dir(readdir);
% 去掉目录信息中的无用项( .和 .. )
imnames(1:2)=[];
% 统计图像个数
imcnt=length(imnames);

% 针对每一个图像
for imidx = 1:1:imcnt
    % 读入图像
    imtemp = imread(fullfile(readdir,imnames(imidx).name));
%调整图像RGB通道数量，若不为3，则改为3
if numel(size(imtemp)) ~= 3
   imtemp = cat(3,imtemp,imtemp,imtemp);% 用于将图片改为3通道
end
    % 改变图像大小
     imtemp = imresize(imtemp,resizefactor);
    % 按照需要格式写入图像
    imwrite(imtemp,fullfile(writedir,[imnames(imidx).name(1:end-3),writetype]));
end
 
end
