function [ZMP_X,ZMP_Y] = ZMP3_T3_1(PM,PMX,PM_ACC,samples)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ZMP_X(1,:)=zeros(1,samples);
ZMP_Y(1,:)=zeros(1,samples);
for n=1:1:samples
%    sumx(:,1)=PM(1:11,4).*PM_ACC(1:11,3,n);
%    d=(sum(sumx))/((1600)*(-9.8))*100;
%    ZMP_X(1,n)=(PMX(12,1,n))/(1+d);
%    ZMP_Y(1,n)=(PMX(12,2,n))/(1+d);

P(:,:)=PM(1:11,4).*PM_ACC(1:11,3,n);
P_Z(:,1)=sum(P(:,1));

sumx(:,:)=(cross(PMX(1:11,1:3,n),PM_ACC(1:11,1:3,n)));
for i=1:11
sumx(i,:)=sumx(i,:)*PM(i,4);
end
H_Y=sum(sumx(1:11,2));
H_X=sum(sumx(1:11,1));

ZMP_X(1,n)=(1600*-0.98*PMX(12,1,n)-H_Y)/((1600*-0.98)+P_Z);
ZMP_Y(1,n)=(1600*-0.98*PMX(12,2,n)+H_X)/((1600*-0.98)+P_Z);


end

end

