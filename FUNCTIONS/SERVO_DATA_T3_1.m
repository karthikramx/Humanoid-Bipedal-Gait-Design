function [pos_vec,vel_vec] = SERVO_DATA_T3_1(LL,RL,LH,RH)
%THIS FUNCTION CONVERTS IK RADIAN JOINT DATA TO AX/MX SERVO DATA
%LL-left leg LH-left hand RL-right leg RH-right hand 

direction_left_leg=[-1,-1,-1,-1,-1];
direction_right_leg=[-1,1,1,1,-1];
direction_left_hand=[1,-1,-1];
direction_right_hand=[-1,-1,-1];

LL=LL.*direction_left_leg;
RL=RL.*direction_right_leg;

LH=LH.*direction_left_hand;
RH=RH.*direction_right_hand;

%LEG VECTOR
TL=[LL(1,1),RL(1,1),LL(1,2),RL(1,2),LL(1,3),RL(1,3),LL(1,4),RL(1,4),LL(1,5),RL(1,5)];

pos_vec_LEGS=(TL+pi)*(180.0/pi)*(4096.0/360.0);

%HAND VECTOR
offset=[206 512 820]*(((300)*(pi/180))/1023);
TH=[LH(1,1)+offset(3),RH(1,1)+offset(1),LH(1,2)+offset(3),RH(1,2)+offset(1),LH(1,3)+offset(2),RH(1,3)+offset(2)];

pos_vec_HANDS=int16((TH)*(180/pi)*(1023/300));

pos_vec=[pos_vec_LEGS,pos_vec_HANDS];
v=700;
vel_vec=[v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v];

end
