% Code to initialize an instance of the appropriate controller class
files = dir(fileparts(which(mfilename))); % Get all the files in the directory where this script it
files = files(contains({files.name},'Class')); % Get the one that starts with an @ (indicates classdef)
className = strrep(files(1).name(1:end),'.m','');
instName = eval(sprintf('%s.defaultInstanceName',className));
evalin('base',sprintf('%s = %s;',instName,className))
clearvars files className instName