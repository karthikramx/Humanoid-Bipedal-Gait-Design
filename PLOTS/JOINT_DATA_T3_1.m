function [ output_args ] = JOINT_DATA_T3_1(JD,samples)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fig=figure;
JD=JD*(180/pi);
% JD(1,1)=JD(1,1)*7;
% JD(1,5)=JD(1,5)*7;
% axis equal
axis([0,81,-100,120])
hold on;

    plot(1:80,JD(1:80,1)*7,'k');
    plot(1:80,JD(1:80,2),'c');
    plot(1:80,JD(1:80,3),'r');
    plot(1:80,JD(1:80,4),'g');
    plot(1:80,JD(1:80,5)*7,'b');

end

