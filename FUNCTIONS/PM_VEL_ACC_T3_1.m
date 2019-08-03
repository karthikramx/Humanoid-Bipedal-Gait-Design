function [PM_VEL,PM_ACC] = PM_VEL_ACC_T3_1(PM3D,samples)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

PM_VEL(:,:,1) = zeros(12,4);

for i=1:1:samples-1
 PM_VEL(:,:,i+1)=PM3D(:,:,i)-PM3D(:,:,i+1);
end

PM_ACC(:,:,1) = zeros(12,4);

for i=1:1:samples-1
 PM_ACC(:,:,i+1)=PM_VEL(:,:,i)-PM_VEL(:,:,i+1);
end


end

