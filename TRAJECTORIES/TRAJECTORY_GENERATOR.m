function [Tj] = TRAJECTORY_GENERATOR(M,steps,xc,yc,zc)
%UNTITLED2 Summary of this function goes here
%  
sz=size(M);
r=sz(1);
c=sz(2);
for(j=1:1:r-1)
    for(k=1:1:(steps))
% Tj((k+1)+((j-1)*steps),1)=M(j,1)-((M(j,1)-M(j+1,1))*sin(pi/2*(k/steps)));
% Tj((k+1)+((j-1)*steps),2)=M(j,2)-((M(j,2)-M(j+1,2))*sin(pi/2*(k/steps)));
% Tj((k+1)+((j-1)*steps),3)=M(j,3)-((M(j,3)-M(j+1,3))*sin(pi/2*(k/steps)));
 Tj((k+1)+((j-1)*steps),1)=M(j,1)-((M(j,1)-M(j+1,1))*(k/steps));
 Tj((k+1)+((j-1)*steps),2)=M(j,2)-((M(j,2)-M(j+1,2))*(k/steps));
 Tj((k+1)+((j-1)*steps),3)=M(j,3)-((M(j,3)-M(j+1,3))*(k/steps));
    end 
end

Tj(1,1)=M(1,1);
Tj(1,2)=M(1,2);
Tj(1,3)=M(1,3);

Tj(:,1)=Tj(:,1)+xc;
Tj(:,2)=Tj(:,2)+yc;
Tj(:,3)=Tj(:,3)+zc;
end

