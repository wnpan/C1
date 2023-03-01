function buildmatrix(subjectid)
%% buildmatrix for Pre-Post grating experiment

% last edit on 2022/03/01 by pwn; renew the help note
% 20191111 by pwn 增加了try命令防止覆盖

% column01 sequence number

% column02 trial type 
% 1～8：480tirals simultaneous-target trials left&right2*dir2*cue2 || 
% 9～16 480tirals sequential-target trials left&right2*dir2*cue2 ||
% 17～24：240tirals target-delayed trials left&right2*dir2*cue2 || 
% 25～32 240tirals target-omitted trials

% column03 cue location [-1=left 1=right]

% column04 ref location [-1=left 1=right]

% column05 test location [-1=left 1=right]

% column06 reference_contrast(ref_con,%) [60]

% column07 task_type [1=simultaneous-target trials 2=sequential-target trials 3=target-delayed trials 4=target-omitted trials]

% column08 ITI (interval between trials) 1200ms～1800ms

% column09 test contrast(%)

% column10 test contrast(log)

% column11 response [1=same, -1=different]

% column12 RT

% column13 initial direction

% column14 next step direction

% column15 staircase_bottom(sta_bot,%) [29.2038]

% column16 staircase_top(sta_top,%) [96.9601]

% column17 trigger_code = ref location [1=left 2=right] + cue location [1=left
% 2=right] + task_type [1:4]
try
    filename = ['data/',subjectid,'_paramatrix'];
    load(filename);
    disp('the file already exist!')
catch
    %% parameter setting
    col = 17;
    
    des_cue = [-1 1];
    des_ref = [-1 1];
    ref_con = [60];
    dir = [-1 1];
    task_type = [1 2 3 4];
    
%     sta_bot = [6.7396 13.9992 29.2038];
%     sta_top = [49.7993 64.2897 96.9601];
    sta_bot = [29.2038];
    sta_top = [96.9601];
    
    %% randomize
    [x1,x2,x3,x4,x5] = ndgrid(des_cue,des_ref,ref_con,dir,task_type);                     % a matrix of randomized parameters
    combinedpara = [x1(:),x2(:),x3(:),x4(:),x5(:)];                                   % combined together
    
    paramatrix = zeros(length(combinedpara(:,1)),col);
    paramatrix(:,3) = combinedpara(:,1);%curve_condition 
    paramatrix(:,4) = combinedpara(:,2);%ref location
    paramatrix(:,5) = -combinedpara(:,2);%test location
    paramatrix(:,6) = combinedpara(:,3);%ref_con
    paramatrix(:,13) = combinedpara(:,4);%initial direction
    paramatrix(:,7) = combinedpara(:,5);%task_type
    
    paramatrix(:,2) = 1:length(paramatrix(:,1));%trial type
    
    for i =1:length(paramatrix(:,1))
        for j =1:length(ref_con)
            if paramatrix(i,6) == ref_con(j)
                paramatrix(i,15) = sta_bot(j);%staircase_bottom(sta_bot,%) 
                paramatrix(i,16) = sta_top(j);%staircase_top(sta_top,%) 
            end
        end
        paramatrix(i,8) = round(rand(1)*600)+1200;
    end
    
    paramatrix_12 = repmat(paramatrix(1:16,:),2,1);
    paramatrix_34 = repmat(paramatrix(17:32,:),1,1);
    paramatrix = [paramatrix_12;paramatrix_34];
    
    type_num = 30;
    paramatrix = repmat(paramatrix,type_num,1);
    
    for i = 1:3 %进行三次乱序
        matrix = paramatrix;
        length0 = length(paramatrix);
        randIndex = randperm(length0);
        for r = 1:length0
            paramatrix(r,:) = matrix(randIndex(r),:);
        end
    end
    
%     paramatrix = sortrows(paramatrix,[7]);%block设计
%     block_sum = length0/length(SF);%每个block的trials
%     randIndex = randperm(length(SF));
%     matrix = paramatrix;
%     for r = 1:length(SF)
%         paramatrix(((r-1)*block_sum+1):r*block_sum,:) = matrix(((randIndex(r)-1)*block_sum+1):randIndex(r)*block_sum,:);
%     end
    
    paramatrix(:,1) = 1:length(paramatrix(:,1));
    
    paramatrix(:,17) = (paramatrix(:,4)+3)./2.*100+(paramatrix(:,3)+3)./2.*10+paramatrix(:,7);%trigger1

    
    %% save
    filename = ['data/',subjectid,'_paramatrix'];
    save(filename,'paramatrix');
    clear
end
end

