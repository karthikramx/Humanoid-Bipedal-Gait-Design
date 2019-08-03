function [f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,DIP,COM_POS)

%Forward Kinematics Nino T3.1
%COM at origin
%All with wrt right hand rule
%INPUT  [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10] motor angles in radians
%OUTPUT [f_com,f1_j9,f2_j7,f3_j5,f4_j3,f5_j1,f_l_eef,f6_j10,f7_j8,f8_j6,f9_j4,f10_j2,f_r_eef] joint frames
%rotation : CW:+ve CCW:-ve

l=(pi/2);

%left leg angles
t1=LL(1,1)*5;
t2=LL(1,2);
t3=LL(1,3);
t4=LL(1,4);
t5=LL(1,5)*5;

%right leg angles
t6=RL(1,1)*5;
t7=RL(1,2);
t8=RL(1,3);
t9=RL(1,4);
t10=RL(1,5)*5;

%left hand angles
t11=LH(1,1);
t12=LH(1,2);
t13=LH(1,3);

%right hand angles
t14=RH(1,1);
t15=RH(1,2);
t16=RH(1,3);

%left leg parameters
f0_f1_y=17.5;
f0_f1_z=64;
f1_f2_z=-64;
f2_f3_z=-72;               % previous -75 ,90
f3_f4_z=-72;             % previous -56.5
f4_f5_z=-43;             % previous -42.3 
f5_eef_y=25;
f5_eef_z=-38;

%right leg parameters
f0_f6_y=-17.5;
f9_eef_y=-25;
f_com=T(COM_POS(1,1),COM_POS(1,2),(226-DIP)+(COM_POS(1,3)))*RX(0)*RY(0)*RZ(0);       %Position & orientation of COM  com@211.45 dip:30 %previous 211

f1_j9=f_com*T(0,f0_f1_y,f0_f1_z)*RX(t1);                 %COM to left hip roll
f2_j7=f1_j9*T(0,0,f1_f2_z)*RY(t2);                       %left hip roll to hip pitch
f3_j5=f2_j7*T(0,0,f2_f3_z)*RY(t3);                       %left hip pitch to knee pitch
f4_j3=f3_j5*T(0,0,f3_f4_z)*RY(t4);                       %leftknee pitch to ankle pitch
f5_j1=f4_j3*T(0,0,f4_f5_z)*RX(t5);                       %left ankle pitch to ankle roll
f_l_eef=f5_j1*T(0,f5_eef_y,f5_eef_z);                    %left ankle roll to end effector


f6_j10=f_com*T(0,f0_f6_y,f0_f1_z)*RX(t6);                %COM to right hip roll
f7_j8=f6_j10*T(0,0,f1_f2_z)*RY(t7);                      %right hip roll to hip pitch
f8_j6=f7_j8*T(0,0,f2_f3_z)*RY(t8);                       %right hip pitch to knee pitch
f9_j4=f8_j6*T(0,0,f3_f4_z)*RY(t9);                       %right knee pitch to ankle pitch
f10_j2=f9_j4*T(0,0,f4_f5_z)*RX(t10);                     %right ankle pitch to ankle roll
f_r_eef=f10_j2*T(0,f9_eef_y,f5_eef_z);                   %right ankle roll to end effector

f_chest=f_com*T(0,0,138.257);                            %position of chest

f11=f_chest*T(0,59.34,0)*RY(t11);                        %left chest to neck
f12=f11*T(0,0,-32)*RX(t12);                              %left neck to shoulder 
f13=f12*T(0,0,-81.5)*RX(t13);                            %left shoulder to elbow
f14=f13*T(0,0,-38.5);                                    %left elbow to wrist


f15=f_chest*T(0,-59.34,0)*RY(t14);                       %right chest to neck
f16=f15*T(0,0,-32)*RX(t15);                              %right neck to shoulder 
f17=f16*T(0,0,-81.5)*RX(t16);                            %right shoulder to elbow
f18=f17*T(0,0,-38.5);                                    %right elbow to wrist


% renaming frames because i realized the names suck
f00=f_com;
f1=f1_j9;
f2=f2_j7;
f3=f3_j5;
f4=f4_j3;
f5=f5_j1;
fle=f_l_eef;
f6=f6_j10;
f7=f7_j8;
f8=f8_j6;
f9=f9_j4;
f10=f10_j2;
fre=f_r_eef;
f01=f_chest;

%f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre;
end

