function [ desired_state ] = traj_generator(t, state, waypoints)

persistent waypoints0 traj_time d0
if nargin > 2
    
    waypoints0 = waypoints';

else
    
    t1 = 3;
    t2 = 2;
    t3 = 2;
    t4 = 3;
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
    if t < s1
        s = s0;
        X = [X(1:8)];
        Y = [Y(1:8)];
        Z = [Z(1:8)];
    elseif t < s2
        s = s1;
        X = [X(9:16)];
        Y = [Y(9:16)];
        Z = [Z(9:16)];
    elseif t < s3
        s = s2;
        X = [X(17:24)];
        Y = [Y(17:24)];
        Z = [Z(17:24)];
    else 
        s = s3;
        X = [X(25:32)];
        Y = [Y(25:32)];
        Z = [Z(25:32)];        
    end
    S = [1,(t-s),(t-s)^2,(t-s)^3,(t-s)^4,(t-s)^5,(t-s)^6,(t-s)^7];
    Sdot = [0,1,2*(t-s),3*(t-s)^2,4*(t-s)^3,5*(t-s)^4,6*(t-s)^5,7*(t-s)^6];
    Sddot = [0,0,2,6*(t-s),12*(t-s)^2,20*(t-s)^3,30*(t-s)^4,42*(t-s)^5];
    if t < s4
        xpos = S*X;
        ypos = S*Y;
        zpos = S*Z;
        xvel = Sdot*X;
        yvel = Sdot*Y;
        zvel = Sdot*Z;
        xacc = Sddot*X;
        yacc = Sddot*Y;
        zacc = Sddot*Z;
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
    desired_state.pos = [xpos;ypos;zpos];
    desired_state.vel = [xvel;yvel;zvel];
    desired_state.acc = [xacc;yacc;zacc];
    desired_state.yaw = 0;
    desired_state.yawdot = 0;
    
end
end

