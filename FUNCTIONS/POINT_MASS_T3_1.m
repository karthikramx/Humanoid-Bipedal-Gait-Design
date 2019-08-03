function [PM] = POINT_MASS_T3_1(f00,f01,f2,f3,f4,f5,f7,f8,f9,f10,fle,fre)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%POINT MASSES FOR LEFT LEG
PM(1,:)=[f2(1,4) f2(2,4)+10 f2(3,4) 80];
PM(2,:)=[f3(1,4) f3(2,4)+10 f3(3,4) 80];
PM(3,:)=[f4(1,4) f4(2,4)+10 f4(3,4) 80];
PM(4,:)=[f5(1,4) f5(2,4)+10 f5(3,4) 80];
PM(5,:)=[fle(1,4) fle(2,4) fle(3,4)+15 170];

%POINT MASSES FOR RIGHT LEG
PM(6,:)=[f7(1,4) f7(2,4)-10 f7(3,4) 80];
PM(7,:)=[f8(1,4) f8(2,4)-10 f8(3,4) 80];
PM(8,:)=[f9(1,4) f9(2,4)-10 f9(3,4) 80];
PM(9,:)=[f10(1,4) f10(2,4)-10 f10(3,4) 80];
PM(10,:)=[fre(1,4) fre(2,4) fre(3,4)+15 170];

%POINT MASS FOR UPPER BODY
PM(11,:)=[f01(1,4) f01(2,4) f01(3,4)-50 600];

%COM
PM(12,:)=[f00(1,4) f00(2,4) f00(3,4)-50 1600];

end

