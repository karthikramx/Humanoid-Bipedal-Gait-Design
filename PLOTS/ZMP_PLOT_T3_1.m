function [ output_args ] = ZMP_PLOT_T3_1(ZMP_X,ZMP_Y,ZMP_Z,fle,fre)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
axis equal;
c='k';
footl=fle*T(51,35,0);
fl1=footl*T(0,-70,0);
fl2=fl1*T(-120,0,0);
fl3=fl2*T(0,70,0);
fl4=fl3*T(120,0,0);


footr=fre*T(51,35,0);
fr1=footr*T(0,-70,0);
fr2=fr1*T(-120,0,0);
fr3=fr2*T(0,70,0);
fr4=fr3*T(120,0,0);
view([-90,90]);


%plotting base frame
plot3([-100,300],[0,0],[0,0],'k','linewidth',0.5);
hold on;
plot3([0,0],[-100,100],[0,0],'k','linewidth',0.5);
plot3([0,0],[0,0],[-10,400],'k','linewidth',0.5);

plot3([footl(1,4),fl1(1,4)],[footl(2,4),fl1(2,4)],[footl(3,4),fl1(3,4)],c,'linewidth',4); 
plot3([fl1(1,4),fl2(1,4)],[fl1(2,4),fl2(2,4)],[fl1(3,4),fl2(3,4)],c,'linewidth',4);
plot3([fl2(1,4),fl3(1,4)],[fl2(2,4),fl3(2,4)],[fl2(3,4),fl3(3,4)],c,'linewidth',4);
plot3([fl3(1,4),fl4(1,4)],[fl3(2,4),fl4(2,4)],[fl3(3,4),fl4(3,4)],c,'linewidth',4);
plot3([footr(1,4),fr1(1,4)],[footr(2,4),fr1(2,4)],[footr(3,4),fr1(3,4)],c,'linewidth',4); 
plot3([fr1(1,4),fr2(1,4)],[fr1(2,4),fr2(2,4)],[fr1(3,4),fr2(3,4)],c,'linewidth',4);
plot3([fr2(1,4),fr3(1,4)],[fr2(2,4),fr3(2,4)],[fr2(3,4),fr3(3,4)],c,'linewidth',4);
plot3([fr3(1,4),fr4(1,4)],[fr3(2,4),fr4(2,4)],[fr3(3,4),fr4(3,4)],c,'linewidth',4);
plot3(ZMP_X,ZMP_Y,ZMP_Z,'o');
axis equal;
hold off;
view([-90,90]);
end

