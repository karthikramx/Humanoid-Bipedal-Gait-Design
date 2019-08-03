function [ output_args ] = PLOT_5_DOF_test(f1,f2,f3,f4,f5)
%3D plot Nino T3.1 

scale =1;
c ='k';

view(52,52);
%plotting all links
plot3([f1(1,4),f2(1,4)],[f1(2,4),f2(2,4)],[f1(3,4),f2(3,4)],c,'linewidth',4);
% hold on;
plot3([f2(1,4),f3(1,4)],[f2(2,4),f3(2,4)],[f2(3,4),f3(3,4)],c,'linewidth',4);
plot3([f3(1,4),f4(1,4)],[f3(2,4),f4(2,4)],[f3(3,4),f4(3,4)],c,'linewidth',4);
plot3([f4(1,4),f5(1,4)],[f4(2,4),f5(2,4)],[f4(3,4),f5(3,4)],c,'linewidth',4);

%labeling all axes
xlabel('x');
ylabel('y');
zlabel('z');


%plotting base frame
plot3([-3,3],[0,0],[0,0],'k','linewidth',0.5);
plot3([0,0],[-3,3],[0,0],'k','linewidth',0.5);
plot3([0,0],[0,0],[0,7],'k','linewidth',0.5);

%plotting frames at all joints



p1 = f1(1:3,4);
r1 = f1(1:3,1:3);

p2 = f2(1:3,4);
r2 = f2(1:3,1:3);

p3 = f3(1:3,4);
r3 = f3(1:3,1:3);

p4 = f4(1:3,4);
r4 = f4(1:3,1:3);

p5 = f5(1:3,4);
r5 = f5(1:3,1:3);

 axis equal;
 arrow3([0,0,0],[5,0,0],'r',0.7);
 arrow3([0,0,0],[0,5,0],'g',0.7);
 arrow3([0,0,0],[0,0,5],'b',0.7);
 a=0.4;

 
 arrow3(p1.', scale*r1(1:3,1).'+p1.', 'r',a);
 arrow3(p1.', scale*r1(1:3,2).'+p1.', 'g',a);
 arrow3(p1.', scale*r1(1:3,3).'+p1.', 'b',a);
 
 arrow3(p2.', scale*r2(1:3,1).'+p2.', 'r',a);
 arrow3(p2.', scale*r2(1:3,2).'+p2.', 'g',a);
 arrow3(p2.', scale*r2(1:3,3).'+p2.', 'b',a);
 
 arrow3(p3.', scale*r3(1:3,1).'+p3.', 'r',a);
 arrow3(p3.', scale*r3(1:3,2).'+p3.', 'g',a);
 arrow3(p3.', scale*r3(1:3,3).'+p3.', 'b',a);
 
 arrow3(p4.', scale*r4(1:3,1).'+p4.', 'r',a);
 arrow3(p4.', scale*r4(1:3,2).'+p4.', 'g',a);
 arrow3(p4.', scale*r4(1:3,3).'+p4.', 'b',a);
 
 arrow3(p5.', scale*r5(1:3,1).'+p5.', 'r',a);
 arrow3(p5.', scale*r5(1:3,2).'+p5.', 'g',a);
 arrow3(p5.', scale*r5(1:3,3).'+p5.', 'b',a);
 

  
%  hold off;
 

end

