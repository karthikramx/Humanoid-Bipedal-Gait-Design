function [T] = AIK_T3_1(x,y,z,phi,sig,DIP)
%Analytical inverse kinematic solution
%   x,y,z,phi (end effector position and orientation)
%   DIP com z axis dip
x=-x;
%link lengths
l1=72;     % previous 75
l2=72;
l3=43;

%limiting solution space
z=(289-DIP)-38-z;

%roll angles
t1=atan2(y,z);
t5=-t1;

z=z+(sqrt(((z)^2)+((y)^2))-(z)-64);

x1 = x-l3*cos((phi*pi)/180);
z1 = z-l3*sin((phi*pi)/180);

z2 =  -(z1)/sqrt((x1^2)+(z1^2));
x2 =  -(x1)/sqrt((x1^2)+(z1^2));

%pitch angles
t2 = atan2(z2,x2)+ sig*acos(-((x1^2)+(z1^2)+(l1^2)-(l2^2))/((2*l1)*(sqrt((x1^2)+(z1^2)))));

z3 = (z1-l1*sin(t2))/l2;
x3 = (x1-l1*cos(t2))/l2;

t3 = mod(atan2(z3,x3),2*pi)-t2;

t4 =(phi*(pi/180))-(t2+t3);

T=[t1,t2-(90*(pi/180)),t3,t4,t5];

end

