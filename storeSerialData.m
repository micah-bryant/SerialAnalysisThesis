function storeSerialData(src, strData)
%function to store data in running average array and average array
%Inputs:
%   serial port object
%   string from readline

    src.UserData.sensorValues(src.UserData.valueIndex,:) = strClean(strData);

    %increment index to use for next input
    src.UserData.valueIndex = src.UserData.valueIndex + 1;

    %if index exceeds number of values to store then go back to first
    %index
    if (src.UserData.valueIndex > length(src.UserData.sensorValues(:,1)))
        src.UserData.valueIndex = 1;
    end
    
    src.UserData.averageValues = mean(src.UserData.sensorValues,1);
end