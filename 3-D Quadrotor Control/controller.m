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
% Variable Innitiation
m = params.mass;
Ixx  = params.I;
g    = params.gravity;
Lf   = params.arm_length;
minF = params.minF;
maxF = params.maxF;

pos   = state.pos;
vel   = state.vel;
rot   = state.rot;
omega = state.omega;

des_pos = des_state.pos;
des_vel = des_state.vel;
des_acc = des_state.acc;
yaw     = des_state.yaw;
yaw_dot = des_state.yawdot;

% Thrust Tuning parameters
Kp1 = [50;50;50];
Kd1 = [10;10;10];

% Thrust
acc_c = des_acc + Kp1.*(des_pos - pos) + Kd1.*(des_vel - vel);
F = m*(g + acc_c(3));

% Moment Tuning Parameters
M = zeros(3,1);
Kp2 = [50;50;50];
Kd2 = [2;2;2];

% Moment
des_phi   = (1.0/g)*(acc_c(1)*sin(yaw) - acc_c(2)*cos(yaw));
des_theta = (1.0/g)*(acc_c(1)*cos(yaw) + acc_c(2)*sin(yaw));

des_rot   = [des_phi; des_theta; yaw];
des_omega = [0;0;yaw_dot];

M = Kp2.*(des_rot - rot) + Kd2.*(des_omega - omega);

% =================== Your code ends here ===================

end
