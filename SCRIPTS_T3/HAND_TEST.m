clear all;
DISP_FRAMES=0;
sig=1;
DIP=0;
COM_POS=[0 0 0];
NY=0
NP=0
gamma=0:0.1:2*pi;

x=zeros(1,length(gamma))+150;
y=45*cos(gamma)+59.34+33;
z=45*sin(gamma)+289-64+142.241;

x0=zeros(1,length(gamma))+150;
y0=45*cos(gamma);
z0=45*sin(gamma);

l1=90.54;
l2=96.70;

for i=1:length(gamma)

[t1,t2,t3] = hand_ik_test(x0(i),y0(i),z0(i),l1,l2,sig);

RH=[0 0 0];
LH=[t1 t2 t3];
RL=[0 0 0 0 0];
LL=[0 0 0 0 0];

[f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);

plot3(x,y,z);
hold on;
PLOT_T3_1(f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre,DISP_FRAMES)
pause(0.001);
hold off;

end

