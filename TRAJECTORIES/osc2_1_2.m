clear trajtotx trajtoty trajtotz trajtotx2 trajtoty2 trajtotz2 trajmx trajmy trajmz trajbx trajby trajbz

T=1.0;
nSamples=60+1;
r=0.35*T/4;
A_move=[15,0.0,20.0];
A_bal=[5.0,7.0,10.0];
w_bal=2*pi/T;
w_move=2*pi/T;
cA=cos(w_move*r);
cC=sin(w_move*r);
del_move=[0.0, 0.0, pi/2];
del_move_n=round(del_move*nSamples/(2*pi));
del_bal=[pi/2, pi/2, pi/2];
del_bal_n=round(del_bal*nSamples/(2*pi));
tt=0;
t=0;
osc_bal=A_bal;
osc_move=A_move;
osc_total=osc_move+osc_bal;

q=1;
tic
% while(toc<3*T)
for tt=0:T/(nSamples-1):T-T/(nSamples-1)
    tp=t;
    %     tt=toc;
    %     t=mod(tt,T);
    t=tt;
   
    osc_bal=A_bal*cos(w_bal*t);
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
    osc_total=osc_move+osc_bal;
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
trajbx=rightRotate(trajbx,del_bal_n(1));
trajby=rightRotate(trajby,del_bal_n(2));
trajbz=rightRotate(trajbz,del_bal_n(3));

trajtotx=trajmx+trajbx;
trajtoty=trajmy+trajby;
trajtotz=trajmz+trajbz;
trajtotx2=rightRotate(trajtotx,round((nSamples-1)*(pi)/(2*pi)));
trajtoty2=-rightRotate(trajtoty,round((nSamples-1)*(pi)/(2*pi)));
trajtotz2=rightRotate(trajtotz,round((nSamples-1)*(pi)/(2*pi)));
% 
% trajtotx(q)=trajtotx(1);
% trajtoty(q)=trajtoty(1);
% trajtotz(q)=trajtotz(1);
% 
% trajtotx2(q)=trajtotx2(1);
% trajtoty2(q)=trajtoty2(1);
% trajtotz2(q)=trajtotz2(1);

% % figure;
% % plot([1:q],trajmz(1:q));
% % hold on
% % plot([1:q],trajbz(1:q));
% % hold on
% % plot([1:q],trajmz(1:q)+trajbz(1:q),'black');
% % traj={trajmx+trajbx,trajmy+trajby,trajmz+trajbz};

trajtotx=fliplr(trajtotx);
trajtoty=fliplr(trajtoty)+2;
trajtotz=fliplr(trajtotz);
trajtotx2=fliplr(trajtotx2);
trajtoty2=fliplr(trajtoty2)-2;
trajtotz2=fliplr(trajtotz2);


% % plot3(trajtotx2,trajtoty2,trajtotz2);
% % hold on
% % plot3(trajtotx2,trajtoty2,trajtotz2,'.');




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


figure;
plot([1:nSamples-1],trajmz(1:nSamples-1),'r');
hold on
plot([1:nSamples-1],trajbz(1:nSamples-1),'b');
hold on
% plot([1:nSamples-1],trajtotz(1:nSamples-1),'black');
% hold on