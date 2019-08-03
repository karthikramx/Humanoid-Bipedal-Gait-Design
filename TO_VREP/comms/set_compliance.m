function [c_packet] = set_compliance(C)
%THIS FUNCTION SETS COMPLIANCE OF RAV2

c_sum=5*(2*C);
crc=254+19+131+28+2+c_sum+15;
crc=255-bitand(crc,255);
c_packet=[255,255,254,19,131,28,2,1,C,C,2,C,C,3,C,C,4,C,C,5,C,C,crc]

end

