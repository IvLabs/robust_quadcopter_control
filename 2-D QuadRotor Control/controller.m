function [ u1, u2 ] = controller(~, state, des_state, params)
%CONTROLLER  Controller for the planar quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [y; z], state.vel = [y_dot; z_dot], state.rot = [phi],
%   state.omega = [phi_dot]
%
%   des_state: The desired states are:
%   des_state.pos = [y; z], des_state.vel = [y_dot; z_dot], des_state.acc =
%   [y_ddot; z_ddot]
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls

u1 = 0;
u2 = 0;

% FILL IN YOUR CODE HERE

g = params.gravity;
m = params.mass;
Ixx = params.Ixx;
minF = params.minF;
maxF = params.maxF;

yz = state.pos;
yz_dot = state.vel;
phi = state.rot;
phi_dot = state.omega;

yzd = des_state.pos;
yzd_dot = des_state.vel;
yzd_ddot = des_state.acc;

kpz = 80;
kvz = 20;

kpy = 20;
kvy = 5;

kp_phi = 1000;
kv_phi = 10;

u1 = m*(g + yzd_ddot(2) + kvz*(yzd_dot(2)-yz_dot(2)) + kpz*(yzd(2)-yz(2)));

phic_dot = 0;
phic_ddot = 0;
phic = (-1.0/g)*(yzd_ddot(1) + kvy*(yzd_dot(1)-yz_dot(1)) + kpy*(yzd(1)-yz(1)));

u2 = Ixx*(phic_ddot + kv_phi*(phic_dot-phi_dot) + kp_phi*(phic-phi));

if(u1>maxF) 
    u1 = maxF; 
end
if(u1<minF) 
    u1 = minF; 
end


end

