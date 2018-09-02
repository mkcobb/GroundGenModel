function tsOut = changeTimeseriesTimeVector(tsIn,timeVec,data)

tsOut = timeseries(data,timeVec);


props = properties(tsIn);
props = props(~contains(props,'Time'));
props = props(~strcmp(props,'Data'));
props = props(~strcmp(props,'Length'));

for ii = 1:length(props)
    
   eval(sprintf('tsOut.%s = tsIn.%s;',props{ii},props{ii} ))
end



end