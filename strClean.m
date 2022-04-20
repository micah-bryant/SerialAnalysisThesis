function numArray = strClean(str)
%Input:     String Data Type containing numbers and commas only
%Output:    1D Array containing floats that were delimited by commas

str = strtrim(str);
cellData = textscan(str,'%f','Delimiter',',');
numArray = cell2mat(cellData);
end