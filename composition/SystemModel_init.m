clear;clear mex;
% Change to the directory containing the model
cd(fileparts(which('GroundGenProject.prj')))
% Add all subdirectories to the path
addpath(genpath(pwd));

if exist('out.mat','file')==2
    delete out.mat
end

if exist('OCKModel.slxc','file')==2
    delete OCKModel.slxc
end


% Initialize Classes
initializeClasses
% Initialize Plant
plant_init
% Initialize Controller
controller_init
% Initialize Environment
environment_init