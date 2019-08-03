clear trajtotx trajtoty trajtotz trajtotx2 trajtoty2 trajtotz2 trajmx trajmy trajmz trajbx trajby trajbz

T=1.0; %FUCK THIS
nSamples=60+1; %controls our time
r=0.35*T/4; % DSP
% A_move=[30,0.0,25.0]; %WALK
% A_bal=[0.0,6.0,10.0];
% A_move=[25,0.0,35.0]; %WALK without hands
% A_bal=[0.0,4.2,15.0];
% A_move=[0,0.0,0.0]; %STAND STRAIGHT with DIP
% A_bal=[0.0,0.0,0.0];
% A_move=[25,0.0,35.0]; %WALK with hands
% A_bal=[0.0,3.0,15.0];

A_move=[30,0.0,35.0]; %WALK with hands % Amplitude of movement oscillator of feet
A_bal=[0.0,4,10.0]; % amplitude balance oscilltor % y is multiplied by 7 in packets

w_bal=2*pi/T; %angular velocity
w_move=2*pi/T; %angular velocity

cA=cos(w_move*r); %compensate for DSP
cC=sin(w_move*r); %compensate for DSP

del_move=[0.0, 0.0, pi/2]; %phase shift
del_move_n=round(del_move*nSamples/(2*pi)); %phase shift in terms of sample number
del_bal=[pi/2, pi/2, pi/2]; %phase shift of balance
del_bal_n=round(del_bal*nSamples/(2*pi));%in terms of sample number

tt=0;
t=0;
osc_bal=A_bal;
osc_move=A_move;
osc_total=osc_move+osc_bal;

q=1;
tic

%while(toc<3*T)
for tt=0:T/(nSamples-1):T-T/(nSamples-1)
    tp=t;
    t=tt;
    
    osc_bal=A_bal*cos(w_bal*t); %cos function multiplied with amplitudes
    osc_move_p=osc_move;
    
    if(t>=0 && t<r)
        osc_move(1)=A_move(1);
        osc_move(3)=0;
        
    elseif(t>=r && t<(T/2)-r)
        osc_move(1)=(A_move(1)/cA)*cos(w_move*t);
        osc_move(3)=(A_move(3))*sin(w_move*(t-r)*T/(T-4*r));
        
    elseif(t>=(T/2)-r && t<(T/2)+r)
        osc_move(1)=-A_move(1);
        osc_move(3)=0;
               
    elseif(t>=(T/2)+r && t<T-r)
        osc_move(1)=(A_move(1)/cA)*cos(w_move*t);
        osc_move(3)=0;
        
    elseif(t>=T-r && t<T)
        osc_move=A_move;
        osc_move(3)=0;
    end
        
    osc_move(2)=0;
    if(osc_move(3)<0)
        osc_move(3)=0;
    end
    osc_total_p=osc_total;
    osc_total=osc_move+osc_bal; %superimposition
    
    %         figure(fig);
    %         k=1;
    %         plot([tp,t],[osc_move_p(k) osc_move(k)],'b');
    %         hold on
    %         plot([tp,t],[osc_bal_p(k) osc_bal(k)],'r');
    %         hold on
    %         plot([tp,t],[osc_total_p(k) osc_total(k)],'black');
    %         hold on
    %         drawnow;
    % plot3([osc_move_p(1) osc_move(1)],[osc_move_p(2) osc_move(2)],[osc_total_p(3) osc_move(3)]);
    % hold on
    % drawnow;
    
    trajmx(q)=osc_move(1);
    trajmy(q)=osc_move(2);
    trajmz(q)=osc_move(3);
    trajbx(q)=osc_bal(1);
    trajby(q)=osc_bal(2);
    trajbz(q)=osc_bal(3);
    q=q+1;

end


%trajmz=rightRotate(trajmz,del_move_n(3));
trajbx=rightRotate(trajbx,del_bal_n(1)); %phase shift of balance oscillators
trajby=rightRotate(trajby,del_bal_n(2)); 
trajbz=rightRotate(trajbz,del_bal_n(3));

trajtotx=trajmx+trajbx; %superimposition
trajtoty=trajmy+trajby;
trajtotz=trajmz+trajbz;
trajtotx2=rightRotate(trajtotx,round((nSamples-1)*(pi)/(2*pi)));
trajtoty2=-rightRotate(trajtoty,round((nSamples-1)*(pi)/(2*pi)));
trajtotz2=rightRotate(trajtotz,round((nSamples-1)*(pi)/(2*pi)));

% trajtotx(q)=trajtotx(1);
% trajtoty(q)=trajtoty(1);
% trajtotz(q)=trajtotz(1);
%
% trajtotx2(q)=trajtotx2(1);
% trajtoty2(q)=trajtoty2(1);
% trajtotz2(q)=trajtotz2(1);

% figure;
% plot([1:q],trajmz(1:q));
% hold on
% plot([1:q],trajbz(1:q));
% hold on
% plot([1:q],trajmz(1:q)+trajbz(1:q),'black');
% traj={trajmx+trajbx,trajmy+trajby,trajmz+trajbz};

trajtotx=1*fliplr(trajtotx); %fliplr to make robot go front or back
trajtoty=fliplr(trajtoty)+0; %+2
trajtotz=fliplr(trajtotz);
trajtotx2=1*fliplr(trajtotx2);
trajtoty2=fliplr(trajtoty2)-0; %-2
trajtotz2=fliplr(trajtotz2);

trajbx=fliplr(trajbx);
trajby=fliplr(trajby);
trajbz=fliplr(trajbz);

% trajbavgx(1:47)=trajtotx2(1:47)+20;
% trajbavgx(48:80)=trajtotx2(47)+abs(trajtotx(48))+trajtotx(48:80)+20;

% trajtotx(:)=20;
% %trajtoty(:)=2;
% trajtotz(:)=0;

% plot3(trajtotx2,trajtoty2,trajtotz2);
% hold on
% plot3(trajtotx2,trajtoty2,trajtotz2,'.');

% plot3(trajtotx(1:6),trajtoty(1:6),trajtotz(1:6));
% hold on
% plot3(trajtotx,trajtoty,trajtotz,'.');

% plot3(trajtotx2(1:5),trajtoty2(1:5),trajtotz2(1:5));
% hold on
% plot3(trajtotx2,trajtoty2,trajtotz2,'.');
% hold on
% xlabel('X AXIS','FontSize',20);
% ylabel('Y AXIS','FontSize',20);
% zlabel('Z AXIS','FontSize',20);

% figure;
% plot([1:nSamples-1],trajtoty(1:nSamples-1),'r');
% hold on
%  plot([1:nSamples-1],trajtoty2(1:nSamples-1),'b');
% % hold on
% % plot([1:nSamples-1],trajtotz(1:nSamples-1),'black');
% % hold on
% plot([1:nSamples-1],trajbavgx(1:nSamples-1),'black');
% hold on