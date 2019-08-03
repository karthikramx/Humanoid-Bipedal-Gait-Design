
clear all;
%load('stopsyncpackets.mat');
osc2 %oscillator values, trajectories
generateHex %communication, for hexadecimal conversion
DIP=30; %initially dipping below for workspace manipulation (mm)
COM_POS=[0 0 0];
boffset=80; %tilt in front wrt 4096 in roll



hamp=60; %sinusoidal hand amplitude wrt 1024
k=60;% nSamples
N=3; %number of steps
n=1;

% STEP 1 DIP NINO
for i=1:1:k/2
    dipa=double(double(DIP)*double(i*2/k));
    [T1] = AIK_T3_1(0,0,0,90,1,dipa);
    [T2] = AIK_T3_1(0,0,0,90,1,dipa);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=50; %body offset out of 4096 pitch
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    %pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecDIP{i}=[pos_vec,810,205,810,205,512,512];
    
end

%STEP 2 bend forward
for i=1:1:k/2
    
    [T1] = AIK_T3_1(0,0,0,90,1,DIP);
    [T2] = AIK_T3_1(0,0,0,90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=boffset;
    boffa=boff*(i*2/k)+50;     
    pos_vec(7)=pos_vec(7)+boffa;
    pos_vec(8)=pos_vec(8)-boffa;
    
    %pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecBoff{i}=[pos_vec,810,205,810,205,512,512];
    
end

%STEP 3 take first half step
for i=1:1:3*(k/4)
 
    if(i<k/4)
        [T1] = AIK_T3_1(0,0.8*trajtoty(1,i+k/2),0,90,1,DIP);
        [T2] = AIK_T3_1(0,0.8*trajtoty2(1,i+k/2),0,90,1,DIP);
    elseif(i>=k/4 && i<k/2)
        [T1] = AIK_T3_1(0,1*trajtoty(1,3*k/4),trajtotz(1,i+k/4),90,1,DIP);
        [T2] = AIK_T3_1(0,1*trajtoty2(1,3*k/4),trajtotz2(1,i+k/4),90,1,DIP);
    elseif(i>=k/2 && i<3*k/4)
        [T1] = AIK_T3_1(trajtotx(1,i+k/4),trajtoty(1,i+k/4),trajtotz(1,i+k/4),90,1,DIP);
        [T2] = AIK_T3_1(trajtotx2(1,i+k/4),trajtoty2(1,i+k/4),trajtotz2(1,i+k/4),90,1,DIP);
    end
    
    
    TL=T1;
    TR=T2;
    
    
    pos_vec_prev=pos_vec;
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);%pos_vec_prev
    pos_vec=int16(pos_vec);
    
    boff=boffset+50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    %pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecStart{i}=[pos_vec,810,205,810,205,512,512];
    
end

%STEP 4 full walk cycle
for i=1:1:k
    
    [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
    [T2] = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
   
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=boffset+50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    %pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    m11=hamp*sind((i*360.0/k)+180); 
    m12=-hamp*sind((i*360.0/k));
% m11=0;
% m12=0;
    pvec{i}=[pos_vec,810+m11,205+m12,810,205,512,512];
    
end

%STEP 5 stop walk cycle
for i=1:1:k/2
    
    if(i<=k/4)
        [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
        [T2] = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    elseif(i>=k/4)
        [T1] = AIK_T3_1(0,trajtoty(1,i),trajtotz(1,i),90,1,DIP);
        [T2] = AIK_T3_1(0,trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    end
    
    TL=T1;
    TR=T2;
    
    pos_vec_prev=pos_vec;
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);%pos_vec_prev
    pos_vec=int16(pos_vec);
    
    boff=boffset+50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    %pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecStop{i}=[pos_vec,810,205,810,205,512,512];
    
end

%WRITE ALL STEPS ON COM PORT
s=serial('COM29');
set(s,'baudrate',222222);
fopen(s);

%DIP 
for i=1:k/2
    tic
    pos_vec=pvecDIP{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
    pause(0.01);
    fwrite(s,sync_packet);
    toc
end

%BEND
for i=1:k/2
    tic
    pos_vec=pvecBoff{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
pause(0.01);
    fwrite(s,sync_packet);
    toc
end

%FIRST HALF STEP
for i=1:3*(k/4)
    tic
    pos_vec=pvecStart{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);    
  pause(0.01);
    fwrite(s,sync_packet);
    toc
end


%N is the total number of steps, full walk cycle
for q=1:N
    tic
    for i=1:k
        pos_vec=pvec{i}(1:12);
        [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
       pause(0.01);
        fwrite(s,sync_packet);
    end
    toc
end

%STOP CYCLE
for i=1:k/2
    tic
    pos_vec=pvecStop{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
   pause(0.01);
    fwrite(s,sync_packet);
    toc
end


%BEND UPRIGHT
for i=k/2:-1:1
    tic
    pos_vec=pvecBoff{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
    pause(0.01);
    fwrite(s,sync_packet);
    toc
end

%KILL DIP
for i=k/2:-1:1
    tic
    pos_vec=pvecDIP{i}(1:12);
    [sync_packet] = PACKETS_T3_1(pos_vec,vel_vec);
    pause(0.01);
    fwrite(s,sync_packet);
    toc
end


pause(2);
fclose(s);





