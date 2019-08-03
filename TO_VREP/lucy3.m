clear all;
load('stopsyncpackets.mat');
osc2
generateHex
DIP=25;
COM_POS=[0 0 0];

hamp=pi/4;
k=60;
N=2;
n=1;




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
    
    %imu handle
    [returnCode,imuHandle]=vrep.simxGetObjectHandle(clientID,'imu1',vrep.simx_opmode_blocking);
    
    %imu init pos
    [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_blocking);
    disp(initPos*180/pi);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %pvecDIP
    for i=1:k/2
    disp('Press a key to step the simulation!');
    pause;
    vrep.simxPauseCommunication(clientID,1);
        
    [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_oneshot);
    disp(initPos*180/pi);
        
    dipa=double(double(DIP)*double(i*2/k));
    [T1] = AIK_T3_1(0,0,0,90,1,dipa);
    [T2] = AIK_T3_1(0,0,0,90,1,dipa);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=0;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecDIP{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];
        
        
        for j=1:16
            vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pvecDIP{i}(j),vrep.simx_opmode_oneshot);
        end
      
    vrep.simxPauseCommunication(clientID,0);
    vrep.simxSynchronousTrigger(clientID);
     
    end
    
    
%pvecBoff
    for i=1:k/2
        
    disp('Press a key to step the simulation!');
    pause;
    vrep.simxPauseCommunication(clientID,1);
      
    [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_oneshot);
    disp(initPos*180/pi);
            
    [T1] = AIK_T3_1(0,0,0,90,1,DIP);
    [T2] = AIK_T3_1(0,0,0,90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    pos_vec=int16(pos_vec);
    
    boff=50.0;
    boffa=boff*(i*2/k);
    pos_vec(7)=pos_vec(7)+boffa;
    pos_vec(8)=pos_vec(8)-boffa;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecBoff{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];
    
        
      
        for j=1:16
            vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pvecBoff{i}(j),vrep.simx_opmode_oneshot);
        end
 
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    
    
%pvecStart      
    for i=1:3*k/4
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1); 
        [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_oneshot);
     disp(initPos*180/pi);
        
   if(i<k/4)
        [T1] = AIK_T3_1(0,0.8*trajtoty(1,i+k/2),0,90,1,DIP)
        [T2] = AIK_T3_1(0,0.8*trajtoty2(1,i+k/2),0,90,1,DIP)
    elseif(i>=k/4 && i<k/2)
        [T1] = AIK_T3_1(0,1*trajtoty(1,3*k/4),trajtotz(1,i+k/4),90,1,DIP)
        [T2] = AIK_T3_1(0,1*trajtoty2(1,3*k/4),trajtotz2(1,i+k/4),90,1,DIP)
    elseif(i>=k/2 && i<3*k/4)
        [T1] = AIK_T3_1(trajtotx(1,i+k/4),trajtoty(1,i+k/4),trajtotz(1,i+k/4),90,1,DIP)
        [T2] = AIK_T3_1(trajtotx2(1,i+k/4),trajtoty2(1,i+k/4),trajtotz2(1,i+k/4),90,1,DIP)
    end
    
    
    TL=T1;
    TR=T2;
    
    
    pos_vec_prev=pos_vec;
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);%pos_vec_prev
    pos_vec=int16(pos_vec);
    
    boff=50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecStart{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];
    
    
        for j=1:16
            vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pvecStart{i}(j),vrep.simx_opmode_oneshot);
        end
           
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    
    %pvec
    
    
    
    % Now step a few t  imes:
    for q=1:N
        for i=1:k
    q
    i
    disp('Press a key to step the simulation!');
    pause;
    vrep.simxPauseCommunication(clientID,1);
    
    [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_oneshot);
    disp(initPos*180/pi);        
   % -initPos(2)*(180/pi)
   
    [T1] = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
    [T2] = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    TL=T1;
    TR=T2;
    JD(i,:)=T1(1,:);
    
    
    [pos_vec,vel_vec] = MOTOR_DATA_T3_1(TL,TR);
    
    pos_vec=int16(pos_vec);
    
    boff=50; 
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    m11=hamp*sind((i*360.0/k)+180);
    m12=hamp*sind((i*360.0/k));
    pvec{i}=[pos_vec,pi/2+m11,pi/2+m12,pi/2,pi/2,0,0];
    
         
            for j=1:16
                vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pvec{i}(j),vrep.simx_opmode_oneshot);
            end
                  
            vrep.simxPauseCommunication(clientID,0);
            vrep.simxSynchronousTrigger(clientID);
        end
    end
    
    
    
    %pec_vec_stop
    
    for i=1:k/2
        
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxPauseCommunication(clientID,1);
        
        [returnCode,initPos]=vrep.simxGetObjectOrientation(clientID,imuHandle,-1,vrep.simx_opmode_oneshot);
      disp(initPos*180/pi);
        
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
    
    boff=50;
    pos_vec(7)=pos_vec(7)+boff;
    pos_vec(8)=pos_vec(8)-boff;
    pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
    pvecStop{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];
        
        for j=1:16
            vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pvecStop{i}(j),vrep.simx_opmode_oneshot);
        end
             
        vrep.simxPauseCommunication(clientID,0);
        vrep.simxSynchronousTrigger(clientID);
    end
    
    
    
    for i=1:k
        disp('Press a key to step the simulation!');
        pause;
        vrep.simxSynchronousTrigger(clientID);
    end
    
    % stop the simulation:
    [returnCode,finPos]=vrep.simxGetObjectPosition(clientID,imuHandle,-1,vrep.simx_opmode_blocking);
    disp(finPos);
    distY=finPos(2)-initPos(2)
    vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
    
    % Now close the connection to V-REP:
    vrep.simxFinish(clientID);
else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

disp('Program ended');






