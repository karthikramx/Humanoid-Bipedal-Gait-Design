function [crc] = check_sum(ID,L,pos_vel_sum,MID)
%THIS FUNCTION CALCULATES THE CHECKSUM
%([ID] broadcasting ID 254)
%([L] length of packets)
%([N] number of motors)
%([pos_vec] position vector)
%([vel_vec] velocity vector)

crc=ID+L+131+30+4+pos_vel_sum+MID;
crc=255-bitand(crc,255);
end

