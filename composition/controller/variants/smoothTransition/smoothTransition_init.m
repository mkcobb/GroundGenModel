% Code to initialize an instance of the appropriate controller class
files = dir(fullfile(fileparts(which(mfilename)),'*Class.m')); % Get all the files in the directory where this script it
className = strrep(files(1).name(1:end),'.m','');
instName = eval(sprintf('%s.defaultInstanceName',className));
evalin('base',sprintf('%s = %s;',instName,className))
clearvars files className instName
