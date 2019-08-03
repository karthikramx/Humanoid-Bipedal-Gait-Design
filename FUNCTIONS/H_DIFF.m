function [H_VEL] = H_DIFF(H,samples)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


H_VEL(:,:) = zeros(11,3,1);

for i=1:1:samples-1
 H_VEL(:,:,i+1)=H(:,:,i)-H(:,:,i+1);
end

end

