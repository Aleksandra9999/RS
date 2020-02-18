function [k] = k_cylinder(E, G, l, S, Iy, Iz)

J = Iy + Iz;
k = [E*S/l,           0,           0,     0,           0,          0;
         0, 12*E*Iz/l^3,           0,     0,           0, 6*E*Iy/l^2;
         0,           0, 12*E*Iy/l^3,     0, -6*E*Iy/l^2,          0;
         0,           0,           0, G*J/l,           0,          0;
         0,           0, -6*E*Iy/l^2,     0,    4*E*Iy/l,          0;
         0,  6*E*Iy/l^2,           0,     0,           0,  4*E*Iz/l];

end