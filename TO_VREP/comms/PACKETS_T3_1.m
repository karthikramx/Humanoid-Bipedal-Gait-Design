
function [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec)
%THIS FUNCTION GENERATES OF THE SYNCWRITE PACKET
%([pos_vec] position vector of the motors)
%([vel_vec] velocity vector of the motors)
%([following is the sync write packet structure])
%([255 255 254 L(length) sync_instruction(131) starting_reg(30) N(number of motors) P1 to PN CRC])
boff=100;

s=size(pos_vec);
N=s(1,2);       %number of motors
%pos_vec(7)=pos_vec(7)+boff;
%pos_vec(8)=pos_vec(8)-boff;
[plb,phb,vlb,vhb]=low_high_byte(pos_vec,vel_vec,N); %function to generates low and high byte of pos and vel
pos_vel_sum=sum(plb)+sum(phb)+sum(vlb)+sum(vhb);    
ID=254;
L=((5)*N)+4;
MID=78;%136
[crc] = check_sum(ID,L,pos_vel_sum,MID); %function call to generate checksum
%sync_p=[255,255,ID,L,131,30,4,1,plb(1,1),phb(1,1),vlb(1,1),vhb(1,1),2,plb(1,2),phb(1,2),vlb(1,2),vhb(1,2),3,plb(1,3),phb(1,3),vlb(1,3),vhb(1,3),4,plb(1,4),phb(1,4),vlb(1,4),vhb(1,4),5,plb(1,5),phb(1,5),vlb(1,5),vhb(1,5),6,plb(1,6),phb(1,6),vlb(1,6),vhb(1,6),7,plb(1,7),phb(1,7),vlb(1,7),vhb(1,7),8,plb(1,8),phb(1,8),vlb(1,8),vhb(1,8),9,plb(1,9),phb(1,9),vlb(1,9),vhb(1,9),10,plb(1,10),phb(1,10),vlb(1,10),vhb(1,10),11,plb(1,11),phb(1,11),vlb(1,11),vhb(1,11),12,plb(1,12),phb(1,12),vlb(1,12),vhb(1,12),13,plb(1,13),phb(1,13),vlb(1,13),vhb(1,13),14,plb(1,14),phb(1,14),vlb(1,14),vhb(1,14),15,plb(1,15),phb(1,15),vlb(1,15),vhb(1,15),16,plb(1,16),phb(1,16),vlb(1,16),vhb(1,16),crc];
sync_p=[255,255,ID,L,131,30,4,1,plb(1,1),phb(1,1),vlb(1,1),vhb(1,1),2,plb(1,2),phb(1,2),vlb(1,2),vhb(1,2),3,plb(1,3),phb(1,3),vlb(1,3),vhb(1,3),4,plb(1,4),phb(1,4),vlb(1,4),vhb(1,4),5,plb(1,5),phb(1,5),vlb(1,5),vhb(1,5),6,plb(1,6),phb(1,6),vlb(1,6),vhb(1,6),7,plb(1,7),phb(1,7),vlb(1,7),vhb(1,7),8,plb(1,8),phb(1,8),vlb(1,8),vhb(1,8),9,plb(1,9),phb(1,9),vlb(1,9),vhb(1,9),10,plb(1,10),phb(1,10),vlb(1,10),vhb(1,10),11,plb(1,11),phb(1,11),vlb(1,11),vhb(1,11),12,plb(1,12),phb(1,12),vlb(1,12),vhb(1,12),crc];
sync_packet=uint8(sync_p);
end

