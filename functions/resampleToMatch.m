function [tscOut,tsOut] = resampleToMatch(tscIn,tsIn)
tscOut = tscIn;
tsOut  = tsIn;

% If either input is empty, return
if isempty(tscIn) || isempty(tsIn)
    return
end

% Check if the two vectors are different in length, or elementwise
% This is evaluated left to right, if the first condition is true, the
% second does not get evaluated
if length(tscIn.Time) ~= length(tsIn.Time) || any(tscIn.Time~=tsIn.Time)
    
    if tscIn.Time(end)>=tsIn.Time(end)
        [t,data] = interpMultiDimm(tscIn.Time,tsIn.Time,tsIn.Data,ndims(tsIn.Data));
        tsOut = changeTimeseriesTimeVector(tsOut,t,data);
        tsOut.data = data;

        

    else
        error('Error: Timeseries collection time data is shorter than\n  individual timeseries time data.\n Should never get here')
    end
    
    
end

