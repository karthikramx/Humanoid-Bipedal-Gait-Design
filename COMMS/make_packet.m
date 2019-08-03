function [sync_packet] = make_packet(pos_vec,vel_vec)
%THIS FUNCTION GENERATES OF THE SYNCWRITE PACKET
%([pos_vec] position vector of the motors)
%([vel_vec] velocity vector of the motors)
%([following is the sync write packet structure])
%([255 255 254 L(length) sync_instruction(131) starting_reg(30) N(number of motors) P1 to PN CRC])

s=size(pos_vec);
N=s(1,2);       %number of motors
[plb,phb,vlb,vhb]=low_high_byte(pos_vec,vel_vec,N); %function to generates low and high byte of pos and vel
pos_vel_sum=sum(plb)+sum(phb)+sum(vlb)+sum(vhb);    
ID=254;
L=((5)*N)+4;
MID=15;
[crc] = check_sum(ID,L,pos_vel_sum,MID); %function call to generate checksum
sync_p=[255,255,ID,L,131,30,4,1,plb(1,1),phb(1,1),vlb(1,1),vhb(1,1),2,plb(1,2),phb(1,2),vlb(1,2),vhb(1,2),3,plb(1,3),phb(1,3),vlb(1,3),vhb(1,3),4,plb(1,4),phb(1,4),vlb(1,4),vhb(1,4),5,plb(1,5),phb(1,5),vlb(1,5),vhb(1,5),crc];
sync_packet=uint8(sync_p);
end

