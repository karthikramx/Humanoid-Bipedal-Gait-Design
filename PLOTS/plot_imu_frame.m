function [] = plot_imu_frame(yaw,pitch,roll)
%plot_imu_frame decouples the rotation matrix from the homogenous
%transformation matrix and plot the frame orientation in 3D space
view([-85,34]);
yaw=yaw*(pi/180);
pitch=pitch*(pi/180);
roll=roll*(pi/180);

R=RX(roll)*RY(pitch);

%decoupling the rotation martrix
R=R(1:3,1:3);
Rx=R(:,1);
Ry=R(:,2);
Rz=R(:,3);

plot3([-5,5],[0,0],[0,0],'k','linewidth',0.5);
 hold on;
plot3([0,0],[-5,5],[0,0],'k','linewidth',0.5);
plot3([0,0],[0,0],[-5,5],'k','linewidth',0.5);

axis equal;

plot3([0,2.5*Rx(1)],[0,2.5*Rx(2)],[0,2.5*Rx(3)],'r','linewidth',5);
plot3([0,2.5*Ry(1)],[0,2.5*Ry(2)],[0,2.5*Ry(3)],'g','linewidth',5);
plot3([0,2.5*Rz(1)],[0,2.5*Rz(2)],[0,2.5*Rz(3)],'b','linewidth',5);

pause(0.001);

hold off;

end

