function pixel = degree2pixel(degree)

%%%613 眼动 显示器 屏幕大小360mm*270mm，分辨率1024*768，距离600mm
% L = tan(theta * pi/180)*74*1024/40;
%%%606 眼动 三菱显示器 屏幕大小400mm*300mm，分辨率2048*1536，距离670mm
%%%606 8w 显示器 屏幕宽度80cm，分辨率1920*1080，距离700mm
%%%501a 显示器 屏幕宽度 36.5cm 分辨率1024*768，距离680mm
%7cpd至少要求59.5cm 8cpd至少要求68cm

% dis2Scr = 80; % 人离屏幕的距离 cm
% pixelScr = 1920; % 屏幕长度的像素 pixels
% % lengthScr = 36; % 屏幕长度 cm
% lengthScr = 70; % 屏幕长度 cm

dis2Scr = 68; % 人离屏幕的距离 cm
pixelScr = 1024; % 屏幕长度的像素 pixels
lengthScr = 36.5; % 屏幕长度 cm

pixel = tan(degree*pi/180)*dis2Scr*pixelScr/lengthScr;

end