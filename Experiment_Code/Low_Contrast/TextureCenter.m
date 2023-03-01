function imageMatrix = TextureCenter(size,angle,contrast,sf,phase)


global inc background white 
% screenNumber=max(Screen('Screens'));
% white=WhiteIndex(screenNumber);
% black=BlackIndex(screenNumber);
% grey=round((white+black)/2);
% if grey == white
%     grey=white / 2;
% end
% inc = abs(white-grey);
% background=grey;

% spatialFrequency = cyclePerDegree / pixelPerDegree;% How many periods/cycles are there in a pixel?
% radiansPerPixel = spatialFrequency * (2 * pi); % = (periods per pixel) * (2 pi radians per period)


[x,y] = meshgrid(-size:size,-size:size);                                    % 形成一个正方形的栅格

a1=cos(angle*pi/180)*2*pi*sf;                               % 改变栅格的朝向 
b1=sin(angle*pi/180)*2*pi*sf;
% phase = rand(1)*2*pi;
gratingMatrix = sin(a1*x+b1*y+phase);                                       % 将栅格分布正弦化,相位随机

cpdboundary = round(degree2pixel(1));  % 余弦模糊的周期是1度 33pixels
maskMatrix1 = cos(2*pi/cpdboundary*(size-sqrt(x.^2+y.^2))+pi)/2+1/2;
maskMatrix2 = sign(sign((size).^2-x.^2-y.^2)+1);
maskMatrix3 = sign(sign(-(size-cpdboundary/2).^2+x.^2+y.^2)+1);
maskMatrix4 = sign(sign((size-cpdboundary/2).^2-x.^2-y.^2)+1);
maskMatrix = min(maskMatrix1.*maskMatrix2.*maskMatrix3+maskMatrix4,1);
% maskMatrix = maskMatrix1.*maskMatrix2.*maskMatrix3+maskMatrix4;

imageMatrix = background+inc*gratingMatrix.*contrast.*maskMatrix;

circle = white.*(x.^2 + y.^2 <= (size)^2+1);
imageMatrix(:,:,2) = 0;
imageMatrix(1:2*size+1,1:2*size+1,2) = circle;

end
