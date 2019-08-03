   function [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR)
%UNTITLED Summary of this function goes here
%Detailed explanation goes here

TR(1,1)=7*TR(1,1);
TR(1,5)=7*TR(1,5);
TL(1,1)=7*TL(1,1);
TL(1,5)=7*TL(1,5);

direction_left=[-1,-1,-1,-1,-1];
direction_right=[-1,1,1,1,-1];

TL=TL.*direction_left;
TR=TR.*direction_right;

T=[TL(1,1),TR(1,1),TL(1,2),TR(1,2),TL(1,3),TR(1,3),TL(1,4),TR(1,4),TL(1,5),TR(1,5)];

pos_vec=(T+pi)*(180.0/pi)*(4096.0/360.0);
pos_vec=int16(pos_vec);
 pos_vec(1,9)=pos_vec(1,9)-256;
 pos_vec(1,10)=pos_vec(1,10)+256;
v=600;
%vel_vec=[v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v];
vel_vec=[v,v,v,v,v,v,v,v,v,v,v,v];

end

