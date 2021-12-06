m = 0.18;
g = 9.81;
Ix = 0.00025;
Iy = 0.000432;
Iz = 0.0003738;
d = 0.086;
kftx = 0.1;
kfty = 0.1;
kftz = 0.1;
kfax = 0.01;
kfay = 0.01;
kfaz = 0.01;
jr = 0.0025;

A = zeros(12);
B = zeros(12,4);
v = [1,1,1,1,1,1];
A = diag(v,6);
A(8,4)= -g;
A(7,5)= g;
A(7,7)= -kftx/m;
A(8,8)= -kfty/m;
A(9,9)= -kftz/m;
B(9,1)= 1/m;
B(10,2)= d/Ix;
B(11,3)= d/Iy;
B(12,4)= d/Iz;
Q = zeros(12);
v1 = [100,100,1000,0.01,0.01,0.1,10,10,10,0.01,0.01,0.1];
Q = diag(v1);
R = zeros(4);
v2 = [1,1,1,1];
R = diag(v2);
[K,S,e] = lqr(A,B,Q,R);


waypoints0 = [0    0   0;
             1    1   1;    
            2    0   2;
            3    -1  1;
            4    0   0];
t1 = 8;
t2 = 8;
t3 = 8;
t4 = 8;
s0 = 0;
s1 = s0+t1;
s2 = s1+t2;
s3 = s2+t3;
s4 = s3+t4;
matrixA = @Amatrix;
matrixB = @Bmatrix;
coefficientvalue = @eqnsolver;
xwaypoint = [waypoints0(1);waypoints0(2);waypoints0(2);waypoints0(3);waypoints0(3);waypoints0(4);waypoints0(4);waypoints0(5)];
ywaypoint = [waypoints0(6);waypoints0(7);waypoints0(7);waypoints0(8);waypoints0(8);waypoints0(9);waypoints0(9);waypoints0(10)];
zwaypoint = [waypoints0(11);waypoints0(12);waypoints0(12);waypoints0(13);waypoints0(13);waypoints0(14);waypoints0(14);waypoints0(15)];
X = coefficientvalue(t1,t2,t3,t4,xwaypoint);
Y = coefficientvalue(t1,t2,t3,t4,ywaypoint);
Z = coefficientvalue(t1,t2,t3,t4,zwaypoint);
XPOS = [0];
YPOS = [0];
ZPOS = [0];
XVEL = [0];
YVEL = [0];
ZVEL = [0];
for t = 0.001:0.001:32
    if t < s1
        s = s0;
        X1 = [X(1:8)];
        Y1 = [Y(1:8)];
        Z1 = [Z(1:8)];
    elseif t < s2
        s = s1;
        X1 = [X(9:16)];
        Y1 = [Y(9:16)];
        Z1 = [Z(9:16)];
    elseif t < s3
        s = s2;
        X1 = [X(17:24)];
        Y1 = [Y(17:24)];
        Z1 = [Z(17:24)];
    else
        s = s3;
        X1 = [X(25:32)];
        Y1 = [Y(25:32)];
        Z1 = [Z(25:32)];        
    end
    S = [1,(t-s),(t-s)^2,(t-s)^3,(t-s)^4,(t-s)^5,(t-s)^6,(t-s)^7];
    Sdot = [0,1,2*(t-s),3*(t-s)^2,4*(t-s)^3,5*(t-s)^4,6*(t-s)^5,7*(t-s)^6];
    Sddot = [0,0,2,6*(t-s),12*(t-s)^2,20*(t-s)^3,30*(t-s)^4,42*(t-s)^5];
    if t < s4
        xpos = S*X1;
        ypos = S*Y1;
        zpos = S*Z1;
        xvel = Sdot*X1;
        yvel = Sdot*Y1;
        zvel = Sdot*Z1;
        xacc = Sddot*X1;
        yacc = Sddot*Y1;
        zacc = Sddot*Z1;
    else
        xpos = waypoints0(5);
        ypos = waypoints0(10);
        zpos = waypoints0(15);
        xvel = 0;
        yvel = 0;
        zvel = 0;
        xacc = 0;
        yacc = 0;
        zacc = 0;
    end
    XPOS(end+1) = xpos;
    YPOS(end+1) = ypos;
    ZPOS(end+1) = zpos;
    XVEL(end+1) = xvel;
    YVEL(end+1) = yvel;
    ZVEL(end+1) = zvel;
    desired_state.pos = [xpos;ypos;zpos];
    desired_state.vel = [xvel;yvel;zvel];
    desired_state.acc = [xacc;yacc;zacc];
    desired_state.yaw = 0;
    desired_state.yawdot = 0;
end
time = [0:0.001:32]';
XPOS = XPOS';
YPOS = YPOS';
ZPOS = ZPOS';
XVEL = XVEL';
YVEL = YVEL';
ZVEL = ZVEL';
simin = [time,XPOS];
simin1 = [time,YPOS];
simin2 = [time,ZPOS];
simin3 = [time,XVEL];
simin4 = [time,YVEL];
simin5 = [time,ZVEL];
