function testCallback(src,~)

strData = readline(src);
%src.UserData.valueIndex = 5;
src.UserData.sensorValues(src.UserData.valueIndex,:) = strClean(strData);
%increment index to use for next input
src.UserData.valueIndex = src.UserData.valueIndex + 1;

%if index exceeds number of values to store then go back to first
%index
if (src.UserData.valueIndex > length(src.UserData.sensorValues(:,1)))
    src.UserData.valueIndex = 1;
end

end