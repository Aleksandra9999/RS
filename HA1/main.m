 close all
 clear all
 
F = [0;0;100;0;0;0];

l = [0.2, 0.3];

x=0.25;
y=0.25;
z=0.25;

Tbase1 = eye(4);
Ttool1 = eye(4);

Tbase2 = Tz(0.5);
Ttool2 = eye(4);

Tbase3 = Ty(0.5);
Ttool3 = eye(4);

temp = HOWTO(x,y,z,l,0.5);

t = zeros(1,13);

d = [temp(1,1), temp(2,1), temp(3,1)];

q1 = [temp(1,2), temp(1,3), temp(1,4)];
FK_1(Tbase1,Ttool1,d(1),q1,t,l);
VJM_lin_1(Tbase1,Ttool1,d(1),q1,t,l);

q2 = [temp(2,2), temp(2,3), temp(2,4)];
FK_2(Tbase2,Ttool2,d(2),q2,t,l);
VJM_lin_2(Tbase2,Ttool2,d(2),q2,t,l);

q3 = [temp(3,2), temp(3,3), temp(3,4)];
FK_3(Tbase3,Ttool3,d(3),q3,t,l);
VJM_lin_3(Tbase3,Ttool3,d(3),q3,t,l);

K1 = VJM_lin_1(Tbase1,Ttool1,d(1),q1,t,l);
K2 = VJM_lin_2(Tbase2,Ttool2,d(2),q2,t,l);
K3 = VJM_lin_3(Tbase3,Ttool3,d(3),q3,t,l);
Kc = K1 + K2 + K3;

xyz = showDef_lin(F,l,0.5);
size(xyz)

%%
[x1,y1,z1] = meshgrid(1:21,1:21,1:21);
length(x1(:))
figure

scatter3(x1(:),y1(:),z1(:),3,xyz(:));   
xlabel('x')
ylabel('y')
zlabel('z')

cb = colorbar;                                  
cb.Label.String = 'Deflection';