function [R_zyx] = TransMatrix( X_angle ,Y_angle, Z_angle, X_trans, Y_trans, Z_trans )

% theta=Z_angle;

R_x=[1,            0,           0  , 0;
     0, cos(X_angle), -sin(X_angle), 0;
     0, sin(X_angle),  cos(X_angle), 0;
     0,          0  ,      0       , 1];

R_y=[cos(Y_angle),  0,  sin(Y_angle), 0;
     0           ,  1,             0, 0;
    -sin(Y_angle),  0, cos(Y_angle) , 0;
        0        ,  0,          0   , 1];

R_z=[cos(Z_angle), -sin(Z_angle), 0,    0;
     sin(Z_angle), cos(Z_angle),  0,    0;
     0         ,     0     ,  1,    0;
     0         ,     0     ,  0,    1];

 
T=[1,0,0,X_trans;
   0,1,0,Y_trans;
   0,0,1,Z_trans;
   0,0,0,1];

R_zyx=R_z*T*R_y*R_x;


end