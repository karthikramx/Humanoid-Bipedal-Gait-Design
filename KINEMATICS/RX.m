function [R_x] = RX(X_angle)
%ROTATION ABOUT X AXIS

R_x=[1,            0,           0  , 0;
     0, cos(X_angle), -sin(X_angle), 0;
     0, sin(X_angle),  cos(X_angle), 0;
     0,          0  ,      0       , 1];

end

