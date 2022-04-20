function contact = runOpt(curvature,maxIter, C)
%Function to run optimization on curvature values from sensors
%Inputs:
%   1D array of curvature values
%   maximum number of iterations to perform localizations
%   curvature from kinematic model
%Outputs:
%   predicated contact location

if nargin < 3, C = 0; end

%robot constants
x_sensor = [0, 103.093, 203.861, 303.752, 403.845];
L = 530; %in this test we are going to use the fully everted robot

%optimization constants
A_iter = 0;
a = L;
a0 = a;
a_prev = 0;

curvature = curvature';%requires curvature to be a 1D column rather than a 1D row

for i = 1:maxIter
    A_iter = find_contactF(x_sensor, A_iter, a, curvature, L);
    a = find_contacta(x_sensor, A_iter, a0, curvature, L);
    
    if abs(a_prev-a) < 5
        break
    end
    a_prev = a;
end

contact = [a, A_iter];
end