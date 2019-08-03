
clear all;
load('stopsyncpackets.mat');
osc2
generateHex
DIP=20;
COM_POS=[0 0 0];


k=60;
N=6;
n=1;


for i=1:1:k
    dipa=double(double(DIP)*double(i/k));
    [T1] = AIK_T3_1(0,0,0,90,1,dipa);
    [T2] = AIK_T3_1(0,0,0,90,1,dipa);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    
%     x=trajbavgx(i)+(79*(n-1));
%     y=-5*trajby(i);
%     if(i<=40)
%         z=-1*cos(T1(1,1)*5)*trajtotz(i);
%     else
%         z=-1*cos(T1(1,1)*5)*trajtotz2(i);
%     end
%     COM_POS=[x y z];
    
    
    % use to disable one leg
    LL=T1;
    RL=T2;
    
    %hand motor positions
    LH=[0 0 0];
    RH=[0 0 0];
    
    %Forward Kinematics
    [f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,DIP,COM_POS);
    
    
    
    %STORE POSITIONS OF FEET
    FOOT_POS_R(:,:,i)=fre;
    FOOT_POS_L(:,:,i)=fle;
    
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=0;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecDIP{i}=pos_vec;
    
end


for i=1:1:k
    
    [T1] = AIK_T3_1(0,0,0,90,1,DIP);
    [T2] = AIK_T3_1(0,0,0,90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    
%     x=trajbavgx(i)+(79*(n-1));
%     y=-5*trajby(i);
%     if(i<=40)
%         z=-1*cos(T1(1,1)*5)*trajtotz(i);
%     else
%         z=-1*cos(T1(1,1)*5)*trajtotz2(i);
%     end
%     COM_POS=[x y z];
    
    
    % use to disable one leg
    LL=T1;
    RL=T2;
    
    %hand motor positions
    LH=[0 0 0];
    RH=[0 0 0];
    
    %Forward Kinematics
    [f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,DIP,COM_POS);
    
    
    
    %STORE POSITIONS OF FEET
    FOOT_POS_R(:,:,i)=fre;
    FOOT_POS_L(:,:,i)=fle;
    
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=50.0;
    boffa=boff*(i/k);
    pos_vec(7)=pos_vec(7)+boffa;
    pos_vec(8)=pos_vec(8)-boffa;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecBoff{i}=pos_vec;
    
end


for i=1:1:k
    
    [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
    [T2] = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    
%     x=trajbavgx(i)+(79*(n-1));
%     y=-5*trajby(i);
%     if(i<=40)
%         z=-1*cos(T1(1,1)*5)*trajtotz(i);
%     else
%         z=-1*cos(T1(1,1)*5)*trajtotz2(i);
%     end
%     COM_POS=[x y z];
    
    
    % use to disable one leg
    LL=T1;
    RL=T2;
    
    %hand motor positions
    LH=[0 0 0];
    RH=[0 0 0];
    
    %Forward Kinematics
    [f00,f01,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,fle,fre] = FK_T3_1(LL,RL,LH,RH,DIP,COM_POS);
    
    
    
    %STORE POSITIONS OF FEET
    FOOT_POS_R(:,:,i)=fre;
    FOOT_POS_L(:,:,i)=fle;
    
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvec{i}=pos_vec;
    
end

for i=1:1:k/2
    
    [T1] = AIK_T3_1(trajtotx_stop(1,i),trajtoty_stop(1,i),trajtotz_stop(1,i),90,1,DIP);
    [T2] = AIK_T3_1(trajtotx2_stop(1,i)+1,trajtoty2_stop(1,i)+1,trajtotz2_stop(1,i)+1,90,1,DIP);
    
    
    TL=T1;
    TR=T2;
    
    
    pos_vec_prev=pos_vec;
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);%pos_vec_prev
    pos_vec=int16(pos_vec);
    
    boff=50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecs{i}=pos_vec;
    
end


disp('Program started');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
dmt=[1,1,-1,1,-1,1,-1,1,1,1,1,1,-1,1,1,1];

if (clientID>-1)
    disp('Connected to remote API server');
    
    % enable the synchronous mode on the client:
    vrep.simxSynchronous(clientID,true);
    
    % start the simulation:
    vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
    
    %getting joint handles
    for i=1:16
        [returnCode,jointHandles(i)]=vrep.simxGetObjectHandle(clientID,['R_Joint',num2str(i)],vrep.simx_opmode_blocking);
    end
    
    for i=1:k
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1);
        for j=1:10
        vrep.simxSetJointPosition(clientID,jointHandles(j),dmt(j)*pvecDIP{i}(j),vrep.simx_opmode_oneshot);
        end
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    
     for i=1:k
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1);
        for j=1:10
        vrep.simxSetJointPosition(clientID,jointHandles(j),dmt(j)*pvecBoff{i}(j),vrep.simx_opmode_oneshot);
        end
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
        
    
    % Now step a few t  imes:
    for q=1:N                      
    for i=1:k
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1);
        for j=1:10
        vrep.simxSetJointPosition(clientID,jointHandles(j),dmt(j)*pvec{i}(j),vrep.simx_opmode_oneshot);
        end
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    end
    
    for i=1:k/2
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1);
        for j=1:10
            vrep.simxSetJointPosition(clientID,jointHandles(j),dmt(j)*pvecs{i}(j),vrep.simx_opmode_oneshot);
        end
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    % stop the simulation:  
    vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
    
    % Now close the connection to V-REP:
    vrep.simxFinish(clientID);
else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

disp('Program ended');




