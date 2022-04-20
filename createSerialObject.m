function serialObject = createSerialObject(numSensors, sizeAverage, portName, baudRate)
% Function to setup the serialObject to be used
% Inputs:
%   Number of Sensors to be analyzed
%   Size of the running average used
%   Name of the Serial Port (e.g. '/dev/tty.usbmodem14101' for mac)
%   baud rate of the serial port
% Output:
%   Serial Object that is properly setup with
%       struct containing
%           boolean if a buffer has been read
%           Array used for running average analysis
%           Index to store the next line from serial
%           Averages from the running average analysis
%           boolean if a contact is registered
%           number of values read since last optimization
%       Terminator configured

    serialObject = serialport(portName,baudRate);
    
    %creates struct to be stored in UserData
    serialObject.UserData = struct('bufferAcquired', false, 'sensorValues', zeros(sizeAverage,numSensors), 'valueIndex', 1);
    serialObject.UserData.averageValues = zeros(1,length(serialObject.UserData.sensorValues(1,:)));
    serialObject.UserData.averageCurvature = zeros(1,length(serialObject.UserData.sensorValues(1,:)));
    serialObject.UserData.contactRegistered = false;
    serialObject.UserData.predictedContact = [0 0];
    serialObject.UserData.readsAfterOpt = 0;
    
    %sets up terminator to be correct according to serial from arduino
    configureTerminator(serialObject,'CR');
end