function plotSim(contact, C, L)
%Will plot simulated shape of vine when given contact locations
%Inputs:
%   1D array contact contact location and force
%   predicted curvature from kinematic model
%   length of the Vine

if nargin < 2, C = 0; end
if nargin < 3, L = 530; end

vinePoints = 0:(L/100):L;

EB_shape = EB_calcShape(vinePoints, contact, C);

plot(vinePoints,EB_shape)
drawnow

end

