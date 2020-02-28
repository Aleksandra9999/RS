function [T]=fk(Tbase,Ttool,q,t,l)
    T = Tbase*Rz(q(1))*Rz(t(1))*Tz(l(1))*Tz(q(2))*Tz(t(2))*Ty(l(2))*Ty(q(3))*Ty(t(3))*Ttool;
end