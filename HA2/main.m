close all
clear all

exp = 30

l1 = 1
l2 = 1
q = zeros(exp, 3)

t = zeros(1, 3)

Tbase = eye(4)
Ttool = eye(4)

W = [900, 900, 900, 900, 900, 900]'

phi = 0

K1 = 1 / 1000000
K2 = 1 / 2000000
K3 = 1 / 500000

K = [K1, K2, K3]'

traj = zeros(exp, 3)

not_calibrated = zeros(exp, 3)

calibrated = zeros(exp, 3)


A = zeros(6, 3)

B = zeros(3, 3)

C = zeros(3, 1)


for i = 1:exp
    q(i, :) = [phi, 0.19, 0.23]
    
    newl1 = l1 + 0.19
    newl2 = l2 + 0.23
    
    traj(i, :) = [newl2*cos(phi), newl2*sin(phi), newl1]
    phi = phi + 2*pi/exp
end


JT = Jt(Tbase, Ttool, q, t, [l1, l2])

for i = 1:exp
    B = B + A' * A
    C = C + A' * A * K
    for m = 1:3
        A(:,m) = JT(:,m)*(JT(:,m)')*W
    end
end
    
B = B + A' * A
C = C + A' * A * K

newK = inv(B) * C

a = 0
b = 0
c = 0

for i = 1:exp
    dt = A * K + 0.0001*rand(6, 1)
    a = dt(1) + traj(i,1)
    b = dt(2) + traj(i,2)
    c = dt(3) + traj(i,3)
    not_calibrated(i,:) = [a, b, c]
    
    newdt = A * newK + 0.0001*rand(6, 1)
    a = newdt(1) + traj(i,1)
    b = newdt(2) + traj(i,2)
    c = newdt(3) + traj(i,3)
    calibrated(i,:) = [a - dt(1), b - dt(2), c - dt(3)]
end 

traj = cat(1, traj(:,:), traj(1, :))
calibrated = cat(1, calibrated(:,:), calibrated(1, :))
not_calibrated = cat(1, not_calibrated(:,:), not_calibrated(1, :))

plot3(traj(:,1),traj(:,2),traj(:,3), 'o--')
hold on
grid on

plot3(calibrated(:,1),calibrated(:,2),calibrated(:,3), 'o--')
hold on
grid on

plot3(not_calibrated(:,1),not_calibrated(:,2),not_calibrated(:,3), 'o--')
legend('target trajectory', 'with calibration', 'without calibration')
