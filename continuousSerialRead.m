%%
clc; clear all;
addpath('Optimization Functions');

%initalize constants
numSensors = 5;
sizeRunningAverage = 10;

% setup Serial Port
s = createSerialObject(numSensors,sizeRunningAverage,'/dev/tty.usbmodem14101',19200);

%setup Call Back function
configureCallback(s,'Terminator',@readSerialdata);

s.UserData.times = zeros(10,1);
tic
%%
configureCallback(s,'off');
%%
s.UserData.times = sort(s.UserData.times);
for i = 1:9
    s.UserData.times(11-i) = s.UserData.times(11-i)-s.UserData.times(10-i);
end
s.UserData.times(1) = 0;
disp(mean(s.UserData.times(2:end)))
%%
testData = [0.00110788644792365 0.000599716019119188 0.000307935748140672 7.27876935998191e-05 6.24375500912283e-05];
