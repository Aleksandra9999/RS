function [Q] = inv_kin(x,y,z,l)
Q =[atan2(x, y), z - l(1), sqrt(x*x + y*y) - l(2)];
end
