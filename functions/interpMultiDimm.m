function [tNew,dataNew] = interpMultiDimm(tNew,tOld,data,numDimms)

% Breakpoints are set for cases I haven't dealt with yet.

switch numDimms
    case 1 % 1 dimensional data
        error('No code for this case yet.')
    case 2
        if size(data,1) == 1
            dataNew = (data'*ones([length(tNew),1])')'; % Basically just a special case of repmat, but this is much faster
        else
            % check if the data provided is double or single, as required
            % by interp1, if not, convert to that class
            if isa(data,'logical')
            end
            if ~isa(data,'double') && ~isa(data,'single')
                reconvertDataType = class(data);
                data = double(data);
            end
            try
            dataNew = interp1(tOld,data,tNew,'previous');
            catch
            end
            % This only interpolates between points, we need to append data
            % to the end to reflect that the value is "held" until the end
            % of simulation
            logdataNew(find(tNew == tOld(end)):end) = dataNew(tNew == tOld(end));
            if exist('reconvertDataType','var')
                if strcmp(reconvertDataType,'logical')
                    dataNew(isnan(dataNew))=0;
                end
                eval(sprintf('dataNew = %s(dataNew);',reconvertDataType))
                
            end
        end
        
    case 3 % 3D Data: Matrix or vector signal
        dataNew = zeros([size(data,1) size(data,2) length(tNew)]);
        for ii = 1:size(data,1)
            for jj = 1:size(data,2)
                dataNewPart = interp1(tOld,squeeze(data(ii,jj,:)),tNew,'previous'); % Interpolate
                dataNewPart(find(tNew == tOld(end)):end) = dataNewPart(tNew == tOld(end)); % Overwrite traling NaNs from interp
                dataNew(ii,jj,:) = dataNewPart; % Store into output matrix
            end
        end
    otherwise
        error('No code for this case yet.')
end


end