generateHex
DIP=20;
x=10;
y=10;
z=10;
phi=90;
sig=1;
[T] = AIK_T3_1(x,y,z,phi,sig,DIP)

TL=T;
TR=T;
%[f00,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,fle,fre] = FK_T3_1(TL,TR,DIP);
%PLOT_T3_1(f00,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,fle,fre);
[pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
 %[sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
% 
% pos_vec
% pause(1);
% s=serial('COM28');
% set(s,'baudrate',57600);
% fopen(s);
% pause(2)
% fwrite(s,sync_packet);
% pause(2);
% fclose(s);
