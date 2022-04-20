function contactRegistered = runComparison(curvatureValues,C)
%function to compare if the curvature readings from 2 sensors closest to the
%base are beyond empirically determined threshold
%Inputs:
%   Serial port object that must contain
%       User Datastruct with curvature readings stored in averageValues
%       Predicted curvature from kinematic model
%Outputs
%   Boolean
%       true if threshold is exceeded, false otherwise

if nargin < 2, C = 0; end

threshold = 0.0005;
contactRegistered = false;

if (abs(mean(curvatureValues(2:3)) - C) > threshold)
    contactRegistered = true;
end

end