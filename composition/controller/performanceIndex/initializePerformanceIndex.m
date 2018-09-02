% Initialize variants
defaultPerformanceIndex = 1;
variants = {'MeanEnergy'};
% Create variant control variable in the workspace
evalin('base',sprintf('VCPerformanceIndex=%d;',defaultPerformanceIndex))
for ii = 1:length(variants)
    evalin('base',sprintf('variant%s=Simulink.Variant(''VCPerformanceIndex==%d'');',variants{ii},ii))
end
clearvars defaultPerformanceIndex variants ii 
