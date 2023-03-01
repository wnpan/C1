%%zlf ZJU
%%2015-12-03
%%staircase procedure测阈值
%%strengthmatrix,刺激强度矩阵
%%responsematrix，反应矩阵 0=different,1=same
%%minstrength，最小刺激
%%maxstrength，最长刺激 根据最小刺激和最大刺激强度 确定步长大小=刺激差别的1/10(单位log，即程序自动以log方式调节刺激强度)
%%initialstrength，刺激强度初始值

function [stimulusstrength,stepdir]=equalitystair(strengthmatrix,responsematrix,dirmatrix,minstrength,maxstrength,initialstrength)
%

% strengthmatrix=tempstrength;
% responsematrix=tempresponse;
% minstrength=0.01;
% maxstrength=0.08;
% initialstrength=0.08;



step=abs(log(maxstrength*100)-log(minstrength*100))/10;

index=length(find(strengthmatrix~=0));                                      %当前的trial序号（即最后一个强度不为0的trial）

if index == 0                                                                 %第一个trial
    stimulusstrength=initialstrength;
    if initialstrength==maxstrength
        stepdir=-1;                                                         %第二个trial降低
        
    elseif initialstrength==minstrength
        stepdir=1;                                                          %第二个trial增高
    end  
    
elseif index == 1;
     stepdir=dirmatrix(index);                                              %第二个trial的变化方向
     stimulusstrength=exp(log(strengthmatrix(index)*100)+stepdir*step)/100; %第二个trial的强度 
    
else
    if responsematrix(index)==-1 && responsematrix(index-1)==1              %选择由same变为different，曲线方向反转
        stepsign=-1;
    else
        stepsign=1;                                                         %曲线方向不变（连续两次判断为same-same; different-different;different-same)
    end
    
    if round(strengthmatrix(index)*100)== round(maxstrength*100) || ...
        round(strengthmatrix(index)*100)==round(minstrength*100)
        stepsign=-1;                                                        %无论什么选择，达到极限值时，曲线方向反转
    end
    
    stepdir=dirmatrix(index)*stepsign;                                      %下一个trial的变化方向
    stimulusstrength=exp(log(strengthmatrix(index)*100)+stepdir*step)/100; %下一个trial的强度 
    
end

end