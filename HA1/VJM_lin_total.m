function [K] = VJM_lin_total(x,y,z,l,dm)

d=300e-3;

Tbase1 = eye(4);
Ttool1 = eye(4);

Tbase2 = Tz(dm);
Ttool2 = eye(4);

Tbase3 = Tx(dm);
Ttool3 = eye(4);

temp = HOWTO(x,y,z,l,dm);

d = [temp(1,1), temp(2,1), temp(3,1)];

t = zeros(1,13);

q1 = [temp(1,2), temp(1,3), temp(1,4)];
q2 = [temp(2,2), temp(2,3), temp(2,4)];
q3 = [temp(3,2), temp(3,3), temp(3,4)];

K1 = VJM_lin_1(Tbase1,Ttool1,d(1),q1,t,l);
K2 = VJM_lin_2(Tbase2,Ttool2,d(2),q2,t,l);
K3 = VJM_lin_3(Tbase3,Ttool3,d(3),q3,t,l);
K = K1 + K2 + K3;
end