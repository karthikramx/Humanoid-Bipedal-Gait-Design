function [f00,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13] = fk_test(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
%UNTITLED2 Summary of this function goes here
%t1
%   Detailed explanation goes here
p2=17.5*0.001;      % Translation in hip roll joint y axis
p3=64.727*0.001;    % Translation in hip roll joint z axis 
p4=63.997*0.001;    % Translation in hip pitch joint x axis
p5=0*0.001;         % Translation in hip pitch joint y axis 
p6=-5.376*0.001;    % Translation in hip pitch joint z axis 
p7=75.936*0.001;    % Translation in knee pitch joint x axis 
p8=56.74*0.001;     % Translation in foot pitch joint x axis 
p9=42.304*0.001;    % Translation in foot roll joint x axis 
p11=5.611*0.001;    % Translation in foot roll joint z axis 
p12=37.2*0.001;     %Translation in end effector x-axis 
p13= 23*0.001;      %Translation in end effector y-axis 
K1=0;     %Translation in knee pitch to ankle pitch along y-axis
K2=19.131*0.001;    %Translation in end effector along z-axis
p2r=-17.5*0.001;
p13r=-23*0.001;
K1r=-0.181*0.001;

% FORWARD KINEMATICS
f00=TransMatrix(0,0,0,0,0,0);
[R_zyx] = TransMatrix( 0 , sym(pi/2) , 0, 0, p2, p3 ); %#ok<*ASGLU> %com to hip roll
f0l=R_zyx;
[R_zyx] = TransMatrix( sym(-pi/2) , 0 , t1, p4,p5,p6 ); %hip roll to hip pitch
f1l=f0l*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t2, p7,0,0 ); %t2=t2+0.191 %hip pitch to knee pitch
f2l=f1l*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t3, p8,K1,0 ); %t3=t3-0.404 %knee pitct to ankle pitch
f3l=f2l*R_zyx;
[R_zyx] = TransMatrix( sym(pi/2) , 0 , t4, p9,0,p11 );  %t4=t4+0.211 %ankle pitch to ankle roll
f4l=f3l*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t5, p12,p13,K2 ); %ankle roll to foot plate center 
f5l=f4l*R_zyx;
[R_zyx] = TransMatrix( 0 , sym(-pi/2) , 0, 0,0,0 ); %foot plate in com frame
f6fl=R_zyx;
f_end=f5l*R_zyx;
Pl=f_end;

[R_zyx] = TransMatrix( 0 , sym(pi/2) , 0, 0, p2r, p3 ); %#ok<*ASGLU> %com to hip roll
f0r=R_zyx;
[R_zyx] = TransMatrix( sym(-pi/2) , 0 , t6, p4,p5,p6 ); %hip roll to hip pitch
f1r=f0r*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t7, p7,0,0 ); %t2=t2+0.191 %hip pitch to knee pitch
f2r=f1r*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t8, p8,K1r,0 ); %t3=t3-0.404 %knee pitct to ankle pitch
f3r=f2r*R_zyx;
[R_zyx] = TransMatrix( sym(pi/2) , 0 , t9, p9,0,-1*p11 );  %t4=t4+0.211 %ankle pitch to ankle roll
f4r=f3r*R_zyx;
[R_zyx] = TransMatrix( 0 , 0 , t10, p12,p13r,K2 ); %ankle roll to foot plate center 
f5r=f4r*R_zyx;
[R_zyx] = TransMatrix( 0 , sym(-pi/2) , 0, 0,0,0 ); %foot plate in com frame
f6fr=R_zyx;
f_end=f5r*R_zyx;
Pr=f_end;

% x=vpa(P(1,4),2); 
% y=vpa(P(2,4),2); 
% z=vpa(P(3,4),2); 
f0=vpa(f0l,4);     %#ok<*ASGLU> %com to hip roll
f1=vpa(f1l,4);     %hip roll to hip pitch
f2=vpa(f2l,4);     %t2=t2+0.191 %hip pitch to knee pitch
f3=vpa(f3l,4);     %t3=t3-0.404 %knee pitct to ankle pitch
f4=vpa(f4l,4);     %t4=t4+0.211 %ankle pitch to ankle roll
f5=vpa(f5l,4);     %ankle roll to foot plate center 
f6=vpa(f6fl,4);      %foot plate in com frame
f7=vpa(f0r,4);     %#ok<*ASGLU> %com to hip roll
f8=vpa(f1r,4);     %hip roll to hip pitch
f9=vpa(f2r,4);     %t2=t2+0.191 %hip pitch to knee pitch
f10=vpa(f3r,4);    %t3=t3-0.404 %knee pitct to ankle pitch
f11=vpa(f4r,4);    %t4=t4+0.211 %ankle pitch to ankle roll
f12=vpa(f5r,4);    %ankle roll to foot plate center 
f13=vpa(f6fr,4);     %foot plate in com frame


end

