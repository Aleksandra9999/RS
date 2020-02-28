function r = Rx(q)
r = [1,      0,       0, 0;
     0, cos(q), -sin(q), 0;
     0, sin(q),  cos(q), 0;
     0,      0,       0, 1];
end