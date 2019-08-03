function [pos_lb,pos_hb,vel_lb,vel_hb] = low_high_byte(pos_vec,vel_vec,NumberOfMotors)
%THIS FUNCTION GENERATES LOW BYTE AND HIGH BYTE
% ([pos_vec] position vecotr)
% ([vel_vec] velocity vector)
% ([Number of motors])
% ([pos_lb] position lower byte)
% ([pos_hb] position higher byte)
% ([vel_lb] velocity lower byte)
% ([vel_hb] velocity higher byte)
global hexL
global hexH

for i=1:NumberOfMotors
    if(pos_vec(1,i)~=0)
        pos_lb(1,i) = hexL(pos_vec(1,i));
        pos_hb(1,i) = hexH(pos_vec(1,i));
        vel_lb(1,i) = hexL(vel_vec(1,i));
        vel_hb(1,i) = hexH(vel_vec(1,i));
    else
%     if(pos_vec(1,i)~=0)
%         pos_lb(1,i) = uint16(mod((pos_vec(1,i)),256));
%         pos_hb(1,i) = uint16(floor(double(pos_vec(1,i))/256.0));
%         vel_lb(1,i) = uint16(mod((vel_vec(1,i)),256));
%         vel_hb(1,i) = uint16(floor(double(vel_vec(1,i))/256.0));
%     else
        pos_lb(1,i) = 0;
        pos_hb(1,i) = 0;
        vel_lb(1,i) = 0;
        vel_hb(1,i) = 0;
    end
    
end


% for i=1:NumberOfMotors
%     pos_lb(1,i) = (bitand(pos_vec(1,i),255));
%     pos_hb(1,i) = (bitand(int16(pos_vec(1,i)),65280));
%     vel_lb(1,i) = (bitand(vel_vec(1,i),255));
%     vel_hb(1,i) = (bitand(int16(vel_vec(1,i)),65280));
% end

