%% Set up environmental (flow speed) variants
defaultEnvironment = 1;
variants = {'Constant'};
% Create variant control variable in the workspace
evalin('base',sprintf('VCEnvironment=%d;',defaultEnvironment))
for ii = 1:length(variants)
    evalin('base',sprintf('variant%s=Simulink.Variant(''VCEnvironment==%d'');',variants{ii},ii))
end
clearvars defaultEnvironment variants ii