function a = rightRotate(a,r)


nValues=size(a,2);
temp=zeros(1,r);
j=r;
for i=nValues:-1:nValues-r+1
    temp(j)=a(i);
    j=j-1;
end


for k=1:r
for i=nValues-r+k:-1:1+k
    a(i)=a(i-1);
end
end

for i=1:r
    a(i)=temp(i);
end


end