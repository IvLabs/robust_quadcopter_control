function [ u ] = pd_controller(~, s, s_des, params)
%PD_CONTROLLER  PD controller for the height
%
%   s: 2x1 vector containing the current state [z; v_z]
%   s_des: 2x1 vector containing desired state [z; v_z]
%   params: robot parameters
e = s_des(1)-s(1);
edot = -1*s(2);
kp = 120;
kv = 17;
u = params.mass*(kp*e+kv*edot+params.gravity);
    


% FILL IN YOUR CODE HERE


end

