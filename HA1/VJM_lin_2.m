function [Kc] = VJM_lin_2(Tbase,Ttool,d,q,t,l)

k0 = 1e6; 

E = 70e9;
G = 25.5e9;
d = 50e-3;

S = pi*d^2/4;
Iy = pi*d^4/64;
Iz = pi*d^4/64;

k1 = k_cylinder(E, G, l(1), S, Iy, Iz);
k2 = k_cylinder(E, G, l(2), S, Iy, Iz);

Kt = [        k0  zeros(1,12)
      zeros(6,1) k1 zeros(6,6)
      zeros(6,1) zeros(6,6) k2];


Jq=Jq_2(Tbase,Ttool,d,q,t,l);
Jt=Jt_2(Tbase,Ttool,d,q,t,l);

Kc0=inv(Jt*inv(Kt)*Jt');

Kc = Kc0 - Kc0*Jq*inv(Jq'*Kc0*Jq)*Jq'*Kc0;
end