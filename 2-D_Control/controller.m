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

kdy = 4.48;
kpy = 56;
kdz = 6.09;
kpz = 84;
kdphi = 6.5;
kpphi = 40;

phic = -(des_state.acc(1)+kdy*(des_state.vel(1)-state.vel(1))+kpy*(des_state.pos(1)-state.pos(1)))/params.gravity;
phic_dot = ((kdy*kdy-kpy)*(des_state.vel(1)-state.vel(1))+kdy*kpy*(des_state.pos(1)-state.pos(1)))/params.gravity;

u1 = params.mass*(params.gravity+des_state.acc(2)+kdz*(des_state.vel(2)-state.vel(2))+kpz*(des_state.pos(2)-state.pos(2)));
u2 = kpphi*(phic-state.rot)+kdphi*(phic_dot-state.omega);


% FILL IN YOUR CODE HERE

end

