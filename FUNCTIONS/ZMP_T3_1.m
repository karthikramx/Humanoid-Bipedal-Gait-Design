function [ZMP_X,ZMP_Y] = ZMP_T3_1(PM,PMX,PM_ACC,samples)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ZMP_X(1,:)=zeros(1,samples);
ZMP_Y(1,:)=zeros(1,samples);
for n=1:1:samples
   sumx(:,1)=PM(1:11,4).*PM_ACC(1:11,3,n);
   d=(sum(sumx))/((1600)*(-9.8))*100;
   ZMP_X(1,n)=(PMX(12,1,n))/(1+d);
   ZMP_Y(1,n)=(PMX(12,2,n))/(1+d);
end

end

