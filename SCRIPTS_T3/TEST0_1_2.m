%TEST0 different iks for both legs
load('initialsyncpacket.mat')
osc2_1_2
generateHex
DIP=15;
s=serial('COM5');
set(s,'baudrate',57600);
fopen(s);
fwrite(s,ini_sync_packet);
pause(0.1);
k=60;
for n=1:9
for i=1:1:k
plot3(trajtotx2(1,:),trajtoty2(1,:)-42.5,trajtotz2(1,:),'o');
hold on;
plot3(trajtotx(1,:),trajtoty(1,:)+42.5,trajtotz(1,:),'o');
 [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
 [T2] = AIK_T3_1(trajtotx2(1,i)+1,trajtoty2(1,i)+1,trajtotz2(1,i)+1,90,1,DIP);

% use to disable one leg
TL=T1;   
TR=T2;%T2
% [f00,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,fle,fre] = FK_T3_1(TL,TR,DIP);
% PLOT_T3_1(f00,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,fle,fre);
hold off;

%pause(0.01);  %comms delay

[pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
pos_vec=int16(pos_vec);
[sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);

 fwrite(s,sync_packet);
%pause(0.01);
end
end

 fclose(s);