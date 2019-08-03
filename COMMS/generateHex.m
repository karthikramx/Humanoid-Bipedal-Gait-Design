global hexH hexL
hexH=zeros(1,4096);
hexL=zeros(1,4096);
for i=1:4096
    hexV=dec2hex(i);
    if(size(hexV,2)==4)
        hexH(i)=hex2dec(hexV(1:2));
        hexL(i)=hex2dec(hexV(3:4));
    elseif(size(hexV,2)==3)
        hexH(i)=hex2dec(hexV(1));
        hexL(i)=hex2dec(hexV(2:3));
    elseif(size(hexV,2)==2)
        hexH(i)=0;
        hexL(i)=hex2dec(hexV(1:2));
    else
        hexH(i)=0;
        hexL(i)=hex2dec(hexV(1));
    end
end
