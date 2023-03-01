# Attention-modulates-early-visual-processing-the-association-between-subjective-contrast-perception

The repository contains the code used for conducting the experiments and behavioral data of all valid participants in the study. The EEG data is too large to upload:(. so if you need, please contact the author Yong-chun Cai:). Email: yccai@
zju.edu.cn

The following is the explanation for behavioral data in two experiment:

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
