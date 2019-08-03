function [T] = HAND_IK_T3_1(x,y,z,sig)
%HAND INVERSE KINEMATICS OF NINO VERSION : T 3.1
% INPUT arguments x,y,z (position effector positions from trajectory generator)
% OUTPUT t1,t2,t3 (hand joint angles)


l1=90.54;  %length of arms
l2=96.70;

t1=-1*(atan2(z,x)-1.5708);

z=sqrt((z^2)+(x^2));
cost2=((z^2)+(y^2)-(l1^2)-(l2^2))/(2*l1*l2);
t3=atan2(sig*(sqrt((1-(cost2)^2))),cost2);

k1=l1+(l2*cos(t3));
k2=l2*sin(t3);

t2=atan2(z,y)-atan2(k2,k1);

t2=t2+1.5708;

t1=1*(t1-3.1416);
t2=1*(t2-3.1416);

T=[t1,t2,t3];
end

