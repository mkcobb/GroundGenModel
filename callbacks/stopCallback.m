if ~exist('logsout','var') % if logsout is missing in the workspace
    if exist('tmp_raccel_logsout','var')
        logsout = tmp_raccel_logsout;
    else
        if exist('out.mat','file')==2
            if sm.verbose
                fprintf('\nUnable to locate logsout in workspace.  Loading out.mat from file.\n')
            end
            load(fullfile(pwd,'out.mat'))
            if ~exist('logsout','var') && exist('tmp_raccel_logsout','var')
                if sm.verbose
                    fprintf('\nFile out.mat does not contain logsout variable, creating logsout from tmp_raccel_logsout variable.\n')
                end
                logsout = tmp_raccel_logsout;
                clearvars tmp_raccel_logsout
            end
        else
            if sm.verbose
                fprintf('\nUnable to locate logsout.  Exiting stopCallback.\n')
            end
            return
        end
    end
end

if sm.verbose
    fprintf('\nParsing simulation output.\n')
end

clearvars tsc
logsoutClean = cleanLogsout(logsout);
tsc     = compileTSC(logsoutClean);

if sm.verbose
    readoutFaults(tsc)
end

% Save data
if sm.saveOnOff
    fileName = sm.saveFile;
    if sm.verbose
        fprintf('\nSaving smulation data: %s\n',fileName)
    end
    save([sm.savePath fileName],'tsc','sm','plant','env','faults','ctrl','-v7.3')
end

if sm.verbose
    fprintf('Complete\n')
    if sm.soundOnOff == 1
        load train
        sound(y,Fs)
    end
end



