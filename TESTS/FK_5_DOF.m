function [f1,f2,f3,f4,f5] = FK_5_DOF(t1,t2,t3,t4,t5,mode)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    

if(mode==1)                            % for ik to perform foot to com mode 1
f1=T(0,0,0)*RX(-t1);
f2=f1*T(0,0,1)*RY(90*(pi/180))*RY(-t2);
f3=f2*T(0,0,1)*RY(-t3);
f4=f3*T(0,0,1)*RY(-t4);
f5=f4*T(0,0,1)*RX(-t5);
end

if(mode==2)                              %for ik to perform from com to feet mode 2
f5=T(0,0,3.5)*RX(-t1);
f4=f5*T(0,0,-1)*RY(90*(pi/180))*RY(-t2);
f3=f4*T(0,0,-1)*RY(-t3);
f2=f3*T(0,0,-1)*RY(-t4);
f1=f2*T(0,0,-1)*RX(-t5);
end

end

