function quad_state = simStateToQuadState(sim_state)
% simStateToQuadState Convert sim state to the 13 element quad state
% Quad state vector = [x, y, z, xd, yd, zd, qw, qx, qy, qz, p, q, r]
%   x: x position coordinate of quadrotor in inertial frame
%   y: y position coordinate of quadrotor in inertial frame
%   z: z position coordinate of quadrotor in inertial frame
%   xd: x component of quadrotor velocity in inertial frame
%   yd: y component of quadrotor velocity in inertial frame
%   zd: z component of quadrotor velocity in inertial frame
%   qw: constant component of current state quaternion
%   qx: x element in vector component of current state quaternion
%   qy: y element in vector component of current state quaternion
%   qz: z element in vector component of current state quaternion
%   p: current pitch rate (angular velocity) in inertial frame
%   q: current roll rate (angular velocity) in inertial frame
%   r: current yaw rate (angular velocity) in inertial frame

quad_state = zeros(13,1);
quad_state(1) = 0;
quad_state(2) = 0;
quad_state(3) = sim_state(1);
quad_state(4) = 0;
quad_state(5) = 0;
quad_state(6) = sim_state(2);
quad_state(7) = 1;
quad_state(8) = 0;
quad_state(9) = 0;
quad_state(10) = 0;
quad_state(11) = 0;
quad_state(12) = 0;
quad_state(13) = 0;

end
