clear
camera = webcam;
load('Alex_Public_32');
c=0;
while true

picture = camera.snapshot;

frame = picture;
frame = imresize(frame,[227,227]);

picture = im2double(picture(:,1+80:end-80,:));

picture = DoSomethingCrazy1(picture);

picture = imresize(picture,[227,227]);

label = classify(net,picture);

if label=='yellow'
    c=1;
end

if label=='red'
    c=2;
end

if label=='white'
    c=3;
end

image(picture);
title(char(label));
drawnow;
end

function ed = DoSomethingCrazy1(frame)
% 归一化彩色空间
gray = rgb2gray(frame);
mask = double(gray>0.05);
imsum = sqrt(sum(frame.^2,3));
ed = frame./imsum.*mask;
end