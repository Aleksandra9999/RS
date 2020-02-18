function [Q] = HOWTO(x,y,z,l,dm)
l1 = l(1);
l2 = l(2);

d10 = z;

q12 = acos((x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2));
q11 = -atan2(l2*sin(q12), l1+l2*cos(q12)) + atan2(y,x); % elbow down
q13 = -q12 - q11;



x2 = x;
y2 = y;
z2 = -dm + z;

d20 = y2;

q22 = acos((z2^2 + x2^2 - l1^2 - l2^2)/(2*l1*l2));
q21 = -atan2(l2*sin(q22), l1+l2*cos(q22)) + atan2(x2,z2);
q23 = -q22 - q21;



x3 = x;
y3 = -dm+y;
z3 = z;

d30 = x3;

q32 = acos((y3^2 + z3^2 - l1^2 - l2^2)/(2*l1*l2));
q31 = -atan2(l2*sin(q32), l1+l2*cos(q32)) + atan2(z3,y3);
q33 = -q31 - q32;

d0 = [d10; d20; d30];
q1 = [q11; q21; q31];
q2 = [q12; q22; q32];
q3 = [q13; q23; q33];

Q =[d0,q1,q2,q3];
end