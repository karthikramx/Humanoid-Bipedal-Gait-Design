function [ output_args ] = PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,H)
%3D plot Nino T3.1 

scale =25;
c ='k';
%ax=axes('units','normalized','position',[0.37,0.15,0.8,0.8],'box','on','Parent',fig);

footl=fle*T(51,35,0);
fl1=footl*T(0,-70,0);
fl2=fl1*T(-120,0,0);
fl3=fl2*T(0,70,0);
fl4=fl3*T(120,0,0);

footr=fre*T(51,35,0);
fr1=footr*T(0,-70,0);
fr2=fr1*T(-120,0,0);
fr3=fr2*T(0,70,0);
fr4=fr3*T(120,0,0);

y=[0,13,25,34,40,43,40,34,25,13,0,-13,-25,-34,-40,-43,-40,-34,-25,-13,0];
z=[43,40,34,25,13,0,-13,-25,-34,-40,-43,-40,-34,-25,-13,0,13,25,34,40,43];
x=zeros(1,21);

%plotting all links
%left leg plot
plot3([f00(1,4),f1(1,4)],[f00(2,4),f1(2,4)],[f00(3,4),f1(3,4)],'c','linewidth',4);
if H==1
hold on; %to refresh the plot
end
plot3([f1(1,4),f2(1,4)],[f1(2,4),f2(2,4)],[f1(3,4),f2(3,4)],c,'linewidth',4);
plot3([f2(1,4),f3(1,4)],[f2(2,4),f3(2,4)],[f2(3,4),f3(3,4)],c,'linewidth',4);
plot3([f3(1,4),f4(1,4)],[f3(2,4),f4(2,4)],[f3(3,4),f4(3,4)],c,'linewidth',4);
plot3([f4(1,4),f5(1,4)],[f4(2,4),f5(2,4)],[f4(3,4),f5(3,4)],c,'linewidth',4);
plot3([f5(1,4),fle(1,4)],[f5(2,4),fle(2,4)],[f5(3,4),fle(3,4)],c,'linewidth',4);

%right leg plot
plot3([f00(1,4),f6(1,4)],[f00(2,4),f6(2,4)],[f00(3,4),f6(3,4)],'c','linewidth',4);
plot3([f6(1,4),f7(1,4)],[f6(2,4),f7(2,4)],[f6(3,4),f7(3,4)],c,'linewidth',4);
plot3([f7(1,4),f8(1,4)],[f7(2,4),f8(2,4)],[f7(3,4),f8(3,4)],c,'linewidth',4);
plot3([f8(1,4),f9(1,4)],[f8(2,4),f9(2,4)],[f8(3,4),f9(3,4)],c,'linewidth',4);
plot3([f9(1,4),f10(1,4)],[f9(2,4),f10(2,4)],[f9(3,4),f10(3,4)],c,'linewidth',4);
plot3([f10(1,4),fre(1,4)],[f10(2,4),fre(2,4)],[f10(3,4),fre(3,4)],c,'linewidth',4);

%com to chest plot
plot3([f00(1,4),f01(1,4)],[f00(2,4),f01(2,4)],[f00(3,4),f01(3,4)],c,'linewidth',4);

%left hand plot
plot3([f01(1,4),f11(1,4)],[f01(2,4),f11(2,4)],[f01(3,4),f11(3,4)],c,'linewidth',4);
plot3([f11(1,4),f12(1,4)],[f11(2,4),f12(2,4)],[f11(3,4),f12(3,4)],c,'linewidth',4);
plot3([f12(1,4),f13(1,4)],[f12(2,4),f13(2,4)],[f12(3,4),f13(3,4)],c,'linewidth',4);
plot3([f13(1,4),f14(1,4)],[f13(2,4),f14(2,4)],[f13(3,4),f14(3,4)],c,'linewidth',4);

%right hand plot
plot3([f01(1,4),f15(1,4)],[f01(2,4),f15(2,4)],[f01(3,4),f15(3,4)],c,'linewidth',4);
plot3([f15(1,4),f16(1,4)],[f15(2,4),f16(2,4)],[f15(3,4),f16(3,4)],c,'linewidth',4);
plot3([f16(1,4),f17(1,4)],[f16(2,4),f17(2,4)],[f16(3,4),f17(3,4)],c,'linewidth',4);
plot3([f17(1,4),f18(1,4)],[f17(2,4),f18(2,4)],[f17(3,4),f18(3,4)],c,'linewidth',4);

%neck plot/head
plot3([f01(1,4),f19(1,4)],[f01(2,4),f19(2,4)],[f01(3,4),f19(3,4)],c,'linewidth',4);
plot3([f19(1,4),f20(1,4)],[f19(2,4),f20(2,4)],[f19(3,4),f20(3,4)],c,'linewidth',4);
plot3([f20(1,4),f02(1,4)],[f20(2,4),f02(2,4)],[f20(3,4),f02(3,4)],c,'linewidth',4);

for i=1:length(z)
head(i,:)=(f02*[x(i) y(i) z(i) 1]')';
end

hx=head(:,1);
hy=head(:,2);
hz=head(:,3);
plot3(hx,hy,hz);
%plot3(hy,hx,hz);

%foot plots
plot3([footl(1,4),fl1(1,4)],[footl(2,4),fl1(2,4)],[footl(3,4),fl1(3,4)],c,'linewidth',4); 
plot3([fl1(1,4),fl2(1,4)],[fl1(2,4),fl2(2,4)],[fl1(3,4),fl2(3,4)],c,'linewidth',4);
plot3([fl2(1,4),fl3(1,4)],[fl2(2,4),fl3(2,4)],[fl2(3,4),fl3(3,4)],c,'linewidth',4);
plot3([fl3(1,4),fl4(1,4)],[fl3(2,4),fl4(2,4)],[fl3(3,4),fl4(3,4)],c,'linewidth',4);
plot3([footr(1,4),fr1(1,4)],[footr(2,4),fr1(2,4)],[footr(3,4),fr1(3,4)],c,'linewidth',4); 
plot3([fr1(1,4),fr2(1,4)],[fr1(2,4),fr2(2,4)],[fr1(3,4),fr2(3,4)],c,'linewidth',4);
plot3([fr2(1,4),fr3(1,4)],[fr2(2,4),fr3(2,4)],[fr2(3,4),fr3(3,4)],c,'linewidth',4);
plot3([fr3(1,4),fr4(1,4)],[fr3(2,4),fr4(2,4)],[fr3(3,4),fr4(3,4)],c,'linewidth',4);

%labeling all axes
xlabel('x');
ylabel('y');
zlabel('z');


%plotting base frame
plot3([-200,200],[0,0],[0,0],'k','linewidth',0.5);
plot3([0,0],[-200,200],[0,0],'k','linewidth',0.5);
plot3([0,0],[0,0],[-10,500],'k','linewidth',0.5);


 axis equal;
%  arrow3([0,0,0],[5,0,0],'r',0.7);
%  arrow3([0,0,0],[0,5,0],'g',0.7);
%  arrow3([0,0,0],[0,0,5],'b',0.7);

if DISP_FRAMES ==1

%plotting frames at all joints

p0 = f00(1:3,4);
r0 = f00(1:3,1:3);
p1 = f1(1:3,4);
r1 = f1(1:3,1:3);
p2 = f2(1:3,4);
r2 = f2(1:3,1:3);
p3 = f3(1:3,4);
r3 = f3(1:3,1:3);
p4 = f4(1:3,4);
r4 = f4(1:3,1:3);
p5 = f5(1:3,4);
r5 = f5(1:3,1:3);
p6 = f6(1:3,4);
r6 = f6(1:3,1:3);
p7 = f7(1:3,4);
r7 = f7(1:3,1:3);
p8 = f8(1:3,4);
r8 = f8(1:3,1:3);
p9 = f9(1:3,4);
r9 = f9(1:3,1:3);
p10 = f10(1:3,4);
r10 = f10(1:3,1:3);
p11 = f11(1:3,4);
r11 = f11(1:3,1:3);
p12 = f12(1:3,4);
r12 = f12(1:3,1:3);
p13 = f13(1:3,4);
r13 = f13(1:3,1:3);
p14 = f14(1:3,4);
r14 = f14(1:3,1:3);
p15 = f15(1:3,4);
r15 = f15(1:3,1:3);
p16 = f16(1:3,4);
r16 = f16(1:3,1:3);
p17 = f17(1:3,4);
r17 = f17(1:3,1:3);
p18 = f18(1:3,4);
r18 = f18(1:3,1:3);
pfl = fle(1:3,4);
rfl = fle(1:3,1:3);
pfr = fre(1:3,4);
rfr = fre(1:3,1:3);

p19 = f19(1:3,4);
r19 = f19(1:3,1:3);
p20 = f20(1:3,4);
r20 = f20(1:3,1:3);

 axis equal;
 arrow3([0,0,0],[5,0,0],'r',0.7);
 arrow3([0,0,0],[0,5,0],'g',0.7);
 arrow3([0,0,0],[0,0,5],'b',0.7);
 
 a=0.4;
 
 arrow3(p0.', scale*r0(1:3,1).'+p0.', 'r',a);
 arrow3(p0.', scale*r0(1:3,2).'+p0.', 'g',a);
 arrow3(p0.', scale*r0(1:3,3).'+p0.', 'b',a);
 
 arrow3(p1.', scale*r1(1:3,1).'+p1.', 'r',a);
 arrow3(p1.', scale*r1(1:3,2).'+p1.', 'g',a);
 arrow3(p1.', scale*r1(1:3,3).'+p1.', 'b',a);
 
 arrow3(p2.', scale*r2(1:3,1).'+p2.', 'r',a);
 arrow3(p2.', scale*r2(1:3,2).'+p2.', 'g',a);
 arrow3(p2.', scale*r2(1:3,3).'+p2.', 'b',a);
 
 arrow3(p3.', scale*r3(1:3,1).'+p3.', 'r',a);
 arrow3(p3.', scale*r3(1:3,2).'+p3.', 'g',a);
 arrow3(p3.', scale*r3(1:3,3).'+p3.', 'b',a);
 
 arrow3(p4.', scale*r4(1:3,1).'+p4.', 'r',a);
 arrow3(p4.', scale*r4(1:3,2).'+p4.', 'g',a);
 arrow3(p4.', scale*r4(1:3,3).'+p4.', 'b',a);
 
 arrow3(p5.', scale*r5(1:3,1).'+p5.', 'r',a);
 arrow3(p5.', scale*r5(1:3,2).'+p5.', 'g',a);
 arrow3(p5.', scale*r5(1:3,3).'+p5.', 'b',a);
 
 arrow3(p6.', scale*r6(1:3,1).'+p6.', 'r',a);
 arrow3(p6.', scale*r6(1:3,2).'+p6.', 'g',a);
 arrow3(p6.', scale*r6(1:3,3).'+p6.', 'b',a);
 
 arrow3(p7.', scale*r7(1:3,1).'+p7.', 'r',a);
 arrow3(p7.', scale*r7(1:3,2).'+p7.', 'g',a);
 arrow3(p7.', scale*r7(1:3,3).'+p7.', 'b',a);
 
 arrow3(p8.', scale*r8(1:3,1).'+p8.', 'r',a);
 arrow3(p8.', scale*r8(1:3,2).'+p8.', 'g',a);
 arrow3(p8.', scale*r8(1:3,3).'+p8.', 'b',a);
 
 arrow3(p9.', scale*r9(1:3,1).'+p9.', 'r',a);
 arrow3(p9.', scale*r9(1:3,2).'+p9.', 'g',a);
 arrow3(p9.', scale*r9(1:3,3).'+p9.', 'b',a);
 
 arrow3(p10.', scale*r10(1:3,1).'+p10.', 'r',a);
 arrow3(p10.', scale*r10(1:3,2).'+p10.', 'g',a);
 arrow3(p10.', scale*r10(1:3,3).'+p10.', 'b',a);
 
 arrow3(p11.', scale*r11(1:3,1).'+p11.', 'r',a);
 arrow3(p11.', scale*r11(1:3,2).'+p11.', 'g',a);
 arrow3(p11.', scale*r11(1:3,3).'+p11.', 'b',a);
 
 arrow3(p12.', scale*r12(1:3,1).'+p12.', 'r',a);
 arrow3(p12.', scale*r12(1:3,2).'+p12.', 'g',a);
 arrow3(p12.', scale*r12(1:3,3).'+p12.', 'b',a);
 
 arrow3(p13.', scale*r13(1:3,1).'+p13.', 'r',a);
 arrow3(p13.', scale*r13(1:3,2).'+p13.', 'g',a);
 arrow3(p13.', scale*r13(1:3,3).'+p13.', 'b',a);
 
 arrow3(p14.', scale*r14(1:3,1).'+p14.', 'r',a);
 arrow3(p14.', scale*r14(1:3,2).'+p14.', 'g',a);
 arrow3(p14.', scale*r14(1:3,3).'+p14.', 'b',a);
 
 arrow3(p15.', scale*r15(1:3,1).'+p15.', 'r',a);
 arrow3(p15.', scale*r15(1:3,2).'+p15.', 'g',a);
 arrow3(p15.', scale*r15(1:3,3).'+p15.', 'b',a);
 
 arrow3(p16.', scale*r16(1:3,1).'+p16.', 'r',a);
 arrow3(p16.', scale*r16(1:3,2).'+p16.', 'g',a);
 arrow3(p16.', scale*r16(1:3,3).'+p16.', 'b',a);
  
 arrow3(p17.', scale*r17(1:3,1).'+p17.', 'r',a);
 arrow3(p17.', scale*r17(1:3,2).'+p17.', 'g',a);
 arrow3(p17.', scale*r17(1:3,3).'+p17.', 'b',a);
  
 arrow3(p18.', scale*r18(1:3,1).'+p18.', 'r',a);
 arrow3(p18.', scale*r18(1:3,2).'+p18.', 'g',a);
 arrow3(p18.', scale*r18(1:3,3).'+p18.', 'b',a);
 
 arrow3(p19.', scale*r19(1:3,1).'+p19.', 'r',a);
 arrow3(p19.', scale*r19(1:3,2).'+p19.', 'g',a);
 arrow3(p19.', scale*r19(1:3,3).'+p19.', 'b',a);
 
 arrow3(p20.', scale*r20(1:3,1).'+p20.', 'r',a);
 arrow3(p20.', scale*r20(1:3,2).'+p20.', 'g',a);
 arrow3(p20.', scale*r20(1:3,3).'+p20.', 'b',a);
  
 arrow3(pfr.', scale*rfr(1:3,1).'+pfr.', 'r',a);
 arrow3(pfr.', scale*rfr(1:3,2).'+pfr.', 'g',a);
 arrow3(pfr.', scale*rfr(1:3,3).'+pfr.', 'b',a);
 
 arrow3(pfl.', scale*rfl(1:3,1).'+pfl.', 'r',a);
 arrow3(pfl.', scale*rfl(1:3,2).'+pfl.', 'g',a);
 arrow3(pfl.', scale*rfl(1:3,3).'+pfl.', 'b',a);

end
 view([70,36]);

 if H==1
 hold off;
 end

end

