function sensorData = resistance2curv(sensorData)
%Function to convert resistance to curvature by multiplying by the constant
%of proportionality
%Inputs:
%   1D vector of sensor values in kOhms
%Outputs:
%   1D vector of sensor values in 1/mm


%ratios to use for testing
    conversionRatios = [0.001
        0.001
        0.001
        0.001
        0.001];

%     conversionRatios = [0.000144491564237344
%         0.00237671691491693
%         0.000385543805070061
%         0.000770813905653599
%         0.000828227720873463
%         -0.000899920490676613
%         -0.0011742041900616
%         -0.00119946913087267
%         -0.000673806065708131
%         -0.000716535984342138];
    
    sensorData = conversionRatios'.*sensorData;
end