function pixel = degree2pixel(degree)

%%%613 �۶� ��ʾ�� ��Ļ��С360mm*270mm���ֱ���1024*768������600mm
% L = tan(theta * pi/180)*74*1024/40;
%%%606 �۶� ������ʾ�� ��Ļ��С400mm*300mm���ֱ���2048*1536������670mm
%%%606 8w ��ʾ�� ��Ļ����80cm���ֱ���1920*1080������700mm
%%%501a ��ʾ�� ��Ļ���� 36.5cm �ֱ���1024*768������680mm
%7cpd����Ҫ��59.5cm 8cpd����Ҫ��68cm

% dis2Scr = 80; % ������Ļ�ľ��� cm
% pixelScr = 1920; % ��Ļ���ȵ����� pixels
% % lengthScr = 36; % ��Ļ���� cm
% lengthScr = 70; % ��Ļ���� cm

dis2Scr = 68; % ������Ļ�ľ��� cm
pixelScr = 1024; % ��Ļ���ȵ����� pixels
lengthScr = 36.5; % ��Ļ���� cm

pixel = tan(degree*pi/180)*dis2Scr*pixelScr/lengthScr;

end