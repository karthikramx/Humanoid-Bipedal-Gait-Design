
x=-1:0.1:1
y=sin(x)
for i=1:21
z(1,i)=3.5
end

for i=1:21
plot3(x,y,z)
hold on;
[t1,t2,t3,t4,t5] = IK_5_DOF(x(1,i),y(1,i),3.5,90,1,1)
[f1,f2,f3,f4,f5] = FK_5_DOF(t1,t2,t3,t4,t5,1)
PLOT_5_DOF_test(f1,f2,f3,f4,f5)
hold off;
pause(0.001);
end