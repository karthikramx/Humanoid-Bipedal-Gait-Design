function [T] = IK_T3_1(x,y,z,phi,sig,DIP)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

l1=90;     % previous 75
l2=56.5;
l3=42.3;
z=(290-DIP)-37.2-z;

t1=atan2(y,z);
t5=-t1;

z=z+(sqrt(((z)^2)+((y)^2))-(z)-64);

x1 = x-l3*cos((phi*pi)/180);
z1 = z-l3*sin((phi*pi)/180);

z2 =  -(z1)/sqrt((x1^2)+(z1^2));
x2 =  -(x1)/sqrt((x1^2)+(z1^2));


t2 = atan2(z2,x2)+ sig*acos(-((x1^2)+(z1^2)+(l1^2)-(l2^2))/((2*l1)*(sqrt((x1^2)+(z1^2)))));

z3 = (z1-l1*sin(t2))/l2;
x3 = (x1-l1*cos(t2))/l2;

t3 = atan2(z3,x3)-t2;

t4 =(phi*(pi/180))-(t2+t3);
T=[t1,t4,t3,t2,t5];

end



