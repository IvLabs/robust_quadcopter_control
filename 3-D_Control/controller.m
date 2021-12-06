function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yawdot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% =================== Your code goes here ===================
kpx = 16;
kdx = 2.5;
kpy = 16;
kdy = 2.5;
kpz = 20;
kdz = 4.5;
kpphi = 50;
kdphi = 1.9;
kptheta = 60;
kdtheta = 1.95;
kppsi = 1;
kdpsi =0;
% Thrust
xcddot = des_state.acc(1)+kdx*(des_state.vel(1)-state.vel(1))+kpx*(des_state.pos(1)-state.pos(1));
ycddot = des_state.acc(2)+kdy*(des_state.vel(2)-state.vel(2))+kpy*(des_state.pos(2)-state.pos(2));
F = params.mass*(params.gravity+des_state.acc(3)+kdz*(des_state.vel(3)-state.vel(3))+kpz*(des_state.pos(3)-state.pos(3)));

% Moment
phic = (xcddot*sin(des_state.yaw)-ycddot*cos(des_state.yaw))/params.gravity;
thetac = (xcddot*cos(des_state.yaw)+ycddot*sin(des_state.yaw))/params.gravity;

M = [kpphi*(phic-state.rot(1))-kdphi*state.omega(1);kptheta*(thetac-state.rot(2))-kdtheta*state.omega(2);kppsi*(des_state.yaw-state.rot(3))+kdpsi*(des_state.yawdot-state.omega(3))];

% =================== Your code ends here ===================

end
