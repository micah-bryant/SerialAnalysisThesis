function readSerialdata(src,~)
% Function that is called when terminator is read in Serial
%   Function will 
%       readline
%       allocate data to analyze in running average
%       perform comparison
%       if threshold for comparison is met then it will run localization
% Input:
%   Serial Object containing
%       Serial Port
%       Serial Terminator set to CR
%       Serial User Data containing struct that holds the following info
%           Sensor Value Matrix (10x5)
%           Index to access Sensor Value Matrix
%           Boolean saying if a buffer has been processed

    strData = readline(src);
    if (src.UserData.bufferAcquired)
        storeSerialData(src, strData);
        
        %check number of bytes after storing is completed and store the
        %buffer before continuing if need this to be faster
        
        src.UserData.averageCurvature = resistance2curv(src.UserData.averageValues);
        
        src.UserData.contactRegistered = runComparison(src.UserData.averageCurvature);
        
        if (src.UserData.readsAfterOpt >= 10)
            %if comparison returns true boolean then run optimization
            if (src.UserData.contactRegistered)
                src.UserData.predictedContact = runOpt(src.UserData.averageCurvature,20);
                plotSim(src.UserData.predictedContact);
                src.UserData.readsAfterOpt = 0;
                src.UserData.times(src.UserData.valueIndex) = toc;
            end
        else
            src.UserData.readsAfterOpt = src.UserData.readsAfterOpt + 1;
        end
        
        src.UserData.bufferAcquired = false;
        %src.UserData.times(src.UserData.valueIndex) = toc;
        
        flush(src);
    else
        src.UserData.bufferAcquired = true;
    end
end