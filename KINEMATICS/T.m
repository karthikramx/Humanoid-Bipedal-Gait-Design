function [T] = T(X_trans,Y_trans,Z_trans)
%TRANSFORMATION MATRIX - TRANSLATION ABOUT X,Y,Z
%([X_trans] x translation)
%([Y_trans] y translation)
%([Z_trans] z translation)

T=[1,0,0,X_trans;
   0,1,0,Y_trans;
   0,0,1,Z_trans;
   0,0,0,1];

end

