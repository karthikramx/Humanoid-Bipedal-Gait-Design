%TEST0 different iks for both legs
%close all;
pause(1);
clear all;
osc2
generateHex
DIP=20;
COM_POS=[0 0 0];

s=serial('COM28');
set(s,'baudrate',57600);
fopen(s)

k=80;
for n=1:1
for i=1:1:k
  
 plot3(trajtotx2(1,:),trajtoty2(1,:)-42.5,trajtotz2(1,:),'o');
 hold on;
 plot3(trajtotx(1,:),trajtoty(1,:)+42.5,trajtotz(1,:),'o');
 [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
 [T2] = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
 JD(i,:)=T1(1,:);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COM trajecotory
x=trajbavgx(i)+(79*(n-1));
y=-5*trajby(i);
if(i<=40)
 z=-1*cos(T1(1,1)*5)*trajtotz(i);
else
 z=-1*cos(T1(1,1)*5)*trajtotz2(i);
end
COM_POS=[x y z];  
%COM_POS=[0 0 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% use to disable one leg
LL=T1;   
RL=T2;

%hand motor positions
LH=[0 0 0];
RH=[0 0 0];

%Forward Kinematics
[f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,DIP,COM_POS);

%PLOTTING T3_1
%PLOT_T3_1(f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre,0);

%POINT MASS MODEL
PM=POINT_MASS_T3_1(f00,f01,f2,f3,f4,f5,f7,f8,f9,f10,fle,fre);

hold off;

%STORE ALL POINT MASS MODELS
PMX(:,:,i)=PM;

%STORE POSITIONS OF FEET
FOOT_POS_R(:,:,i)=fre;
FOOT_POS_L(:,:,i)=fle;

pause(0.001);  %comms delay

[pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
pos_vec=int16(pos_vec);
[sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);

fwrite(s,sync_packet);

end
end
% samples=k;
% [PM_VEL,PM_ACC] = PM_VEL_ACC_T3_1(PMX,samples);      %velocity and acceleration
% 
% H(:,:,:)=cross(PMX(1:11,1:3,:),PMX(1:11,1:3,:).*PM_VEL(1:11,1:3,:));
% H_VEL = H_DIFF(H,samples);
% 
% %[PM_VEL,PM_ACC,H_VEL] = PM_VEL_ACC_T3_1(PMX,H,samples);
% %[ZMP_X,ZMP_Y] = ZMP_T3_1(PM,PMX,PM_ACC,samples);
% %[ZMP_X,ZMP_Y] = ZMP2_T3_1(PMX,PM_VEL,PM_ACC,H_VEL,samples);
% 
% [ZMP_X,ZMP_Y] = ZMP_T3_1(PM,PMX,PM_ACC,samples);
% ZMP_Z(1,:)=zeros(1,samples);
% 
% %hold on;
% %scatter3(ZMP_X,ZMP_Y,ZMP_Z)
% % view([-90,90]);
% 
% % for i=1:samples
% %  ZMP_PLOT_T3_1(ZMP_X(i),ZMP_Y(i),ZMP_Z(i),FOOT_POS_L(:,:,i),FOOT_POS_R(:,:,i));
% %  pause(0.1);
% % end
% 
% %JOINT_DATA_T3_1(JD,samples)
% %fclose(s);