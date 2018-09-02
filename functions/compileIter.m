function iter = compileIter(tsc,logsout)
iter = [];
if ~isempty(logsout)
    signalNames = unique(logsout.getElementNames); % Filter out duplicates
    signalNames = signalNames(~cellfun(@isempty,signalNames)); % Filter out empty names
    for ii = 1:length(signalNames)
        tEnd = logsout.getElement(signalNames{ii}).Values.Time(end);
        if tEnd ~= tsc.Time(end)
            eval(sprintf('iter.%s = logsout.getElement(''%s'').Values;',signalNames{ii},signalNames{ii}))
        end
    end
end
end