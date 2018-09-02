% Script to initialize controller

% Initialize variants
defaultController = 3;
variants = {'ReelOut','ReelInOut','SmoothTransition'};
% Create variant control variable in the workspace
evalin('base',sprintf('VCController=%d;',defaultController))
for ii = 1:length(variants)
    evalin('base',sprintf('variant%s=Simulink.Variant(''VCController==%d'');',variants{ii},ii))
end
clearvars defaultController variants ii 

% Initialize busses
initializeFeedbackBus
initializeCommandsBus
initializePerformanceIndex
updateLaw_init