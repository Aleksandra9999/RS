function [ Jt ] = Jt(Tbase,Ttool,q,t,l)

T0 = FK(Tbase,Ttool,q,t,l);
T0(1:3,4) = [0;0;0];
T0 = T0';

Td = Tbase*Rz(q(1))*Rzd(t(1))*Tz(l(1))*Tz(q(2))*Tz(t(2))*Ty(l(2))*Ty(q(3))*Ty(t(3))*Ttool*T0;
J1 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td = Tbase*Rz(q(1))*Rz(t(1))*Tz(l(1))*Tz(q(2))*Tzd(t(2))*Ty(l(2))*Ty(q(3))*Ty(t(3))*Ttool*T0;
J2 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td = Tbase*Rz(q(1))*Rz(t(1))*Tz(l(1))*Tz(q(2))*Tz(t(2))*Ty(l(2))*Ty(q(3))*Tyd(t(3))*Ttool*T0;
J3 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Jt = [J1 J2 J3] ;
end
